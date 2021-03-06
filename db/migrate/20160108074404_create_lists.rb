class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.text :description
      t.string :image
      t.references :category, index: true,  foreign_key: true

      t.timestamps null: false
    end
  end
end
