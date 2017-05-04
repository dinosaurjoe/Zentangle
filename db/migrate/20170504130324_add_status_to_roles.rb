class AddStatusToRoles < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :status, :boolean
  end
end
