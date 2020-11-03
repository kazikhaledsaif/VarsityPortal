class AddAdminToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean ,default: false
    add_column :users, :first_name, :string, null: true, default: ""
    add_column :users, :last_name, :string, null: true, default: ""
    add_column :users, :roll, :string, null: true, default: ""
  end
end
