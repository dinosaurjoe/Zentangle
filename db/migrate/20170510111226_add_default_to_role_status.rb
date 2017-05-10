class AddDefaultToRoleStatus < ActiveRecord::Migration[5.0]
  def change
    change_column :roles, :status, :boolean, :default => true
  end
end
