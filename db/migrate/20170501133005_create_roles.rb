class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.references :project, foreign_key: true
      t.text :description
      t.string :requirements
      t.string :offers
      t.string :title

      t.timestamps
    end
  end
end
