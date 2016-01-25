class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :description
      t.integer :view
      t.string :source
      t.string :link_source
      t.string :image
      t.integer :state, default: 2
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
