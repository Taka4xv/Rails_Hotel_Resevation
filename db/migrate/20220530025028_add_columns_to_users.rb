class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :user_name, :string
    add_column :users, :introduction, :string
    add_column :users, :avatar_url, :string
  end
end
