class CreatePieces < ActiveRecord::Migration[5.0]
  def change
    create_table :pieces do |t|
      t.references :user, foreign_key: true
      t.string :cloudinary_path
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
