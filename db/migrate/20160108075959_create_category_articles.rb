class CreateCategoryArticles < ActiveRecord::Migration
  def change
    create_table :category_articles do |t|
      t.references :category, index: true,  foreign_key: true
      t.references :article, index: true,  foreign_key: true

      t.timestamps null: false
    end
  end
end
