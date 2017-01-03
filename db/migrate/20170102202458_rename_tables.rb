class RenameTables < ActiveRecord::Migration
  def change
    rename_table :graders, :grades
    rename_table :grader_configs, :graders

    rename_column :assignment_graders, :grader_config_id, :grader_id
    rename_column :grades, :grader_config_id, :grader_id
    rename_column :inline_comments, :grader_id, :grade_id
  end
end
