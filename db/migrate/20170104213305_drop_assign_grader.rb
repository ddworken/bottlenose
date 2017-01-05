class DropAssignGrader < ActiveRecord::Migration[5.0]
  def change
    drop_table :assignment_graders
    add_column :graders, :assignment_id, :integer, null: false
  end
end
