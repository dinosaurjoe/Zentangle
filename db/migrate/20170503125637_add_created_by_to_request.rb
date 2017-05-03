class AddCreatedByToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :created_by, :string
  end
end
