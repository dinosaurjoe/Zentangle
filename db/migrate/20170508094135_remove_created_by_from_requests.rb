class RemoveCreatedByFromRequests < ActiveRecord::Migration[5.0]
  def change
    remove_column :requests, :created_by, :string
  end
end
