class Section < ApplicationRecord
  belongs_to :course
  belongs_to :instructor, :class_name => "User", :foreign_key => "instructor_id", :primary_key => "id"
  delegate :term, to: :course

  #validates :crn, presence: true, uniqueness: true # TODO: scope it per term?
  validates :instructor, presence: true
  #validates :meeting_time, length: { minimum: 3 }
 
  after_save do
    Registration.find_or_create_by(
      course_id: course.id, 
      user_id: instructor.id,
      section_id: id,
      show_in_lists: false,
      role: Registration::roles["professor"],
    )
  end

  def to_s
    if self.meeting_time.to_s != ""
      "#{self.crn || '??'} : #{self.instructor.last_name} at #{self.meeting_time}"
    else
      "#{self.crn || '??'} : #{self.instructor.last_name}"
    end
  end

  def instructor=(inst)
    if inst.class == String
      self.instructor_id = User.find_by_username(inst).id
    else
      self.instructor_id = inst.id
    end
  end
end
