class AddOwnerMessageToRequests < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :owner_message, :text
  end
end
