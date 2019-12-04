class CreateCommons < ActiveRecord::Migration[5.2]
  def change
    create_table :commons do |t|
      t.string :title
      t.text :url
      t.text :img_logo
      t.text :img_cover
      t.text :img_nav_icon
      t.string :email
      t.text :address
      t.text :facebook
      t.text :youtube
      t.text :phone_number

      t.timestamps
    end
  end
end
