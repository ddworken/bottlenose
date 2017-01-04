class RenameSections < ActiveRecord::Migration[5.0]
  def change
    rename_table :course_sections, :sections
  end
end
