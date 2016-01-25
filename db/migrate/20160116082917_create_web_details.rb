class CreateWebDetails < ActiveRecord::Migration
  def change
    create_table :web_details do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :telephone
      t.string :image
      t.string :fb_page
      t.string :google_plus
      t.string :tweatter
      t.string :youtube
      t.string :instagram
      t.text :about_us

      t.timestamps null: false
    end
  end
end
