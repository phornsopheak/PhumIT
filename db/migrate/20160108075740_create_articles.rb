class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :description
      t.integer :view
      t.string :source
      t.string :link_source
      t.string :image

      t.timestamps null: false
    end
  end
end
