class DontReqCrn < ActiveRecord::Migration[5.0]
  def change
    remove_index :sections, column: [:crn]
    change_column_null :sections, :crn, true
  end
end
