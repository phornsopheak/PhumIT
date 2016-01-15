class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :description
      t.integer :view
      t.text :source

      t.timestamps null: false
    end
  end
end
