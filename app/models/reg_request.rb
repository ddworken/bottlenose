class RegRequest < ApplicationRecord
  enum role: [:student, :grader, :assistant, :professor]

  validates_presence_of :course_id, :user_id, :section_id

  belongs_to :course
  belongs_to :user
  belongs_to :section

  validates :user_id, :uniqueness => { :scope => :course_id }

  delegate :name, :email, to: :user
end
