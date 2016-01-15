class CreateListArticles < ActiveRecord::Migration
  def change
    create_table :list_articles do |t|
      t.references :list, index: true,  foreign_key: true
      t.references :article, index: true,  foreign_key: true

      t.timestamps null: false
    end
  end
end
