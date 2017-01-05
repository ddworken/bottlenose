class FixTextVsString < ActiveRecord::Migration[5.0]
  def change
    change_column :graders, :params, :text
    rename_table :subs_for_gradings, :used_subs
    change_column :users, :first_name, :string
    change_column :users, :last_name, :string
    change_column :users, :nickname, :string
  end
end
