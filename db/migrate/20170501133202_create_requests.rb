class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
      t.boolean :user_confirm
      t.boolean :owner_confirm
      t.text :message

      t.timestamps
    end
  end
end
