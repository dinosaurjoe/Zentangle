class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :bio, :text
    add_column :users, :portfolio_url, :string
    add_column :users, :skills, :string
    add_column :users, :profile_picture, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end
end
