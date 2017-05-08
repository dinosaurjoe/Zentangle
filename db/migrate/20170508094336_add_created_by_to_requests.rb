class AddCreatedByToRequests < ActiveRecord::Migration[5.0]
  def change
    add_reference :requests, :created_by
  end
end
