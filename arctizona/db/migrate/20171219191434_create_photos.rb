class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.references :album
      t.string :title, default: ""
      t.text :image_data
      t.boolean :is_art, default: false
      t.boolean :is_photo, default: false
      t.text :description, default: ""
      t.string :resolution, default: ""
      t.string :camera, default: ""
      t.string :lens, default: ""
      t.string :aperture, default: ""
      t.string :exposure, default: ""
      t.string :flash, default: ""
      t.string :focal_length, default: ""
      t.string :iso, default: ""
      t.string :tool, default: ""
      t.string :medium, default: ""
      t.string :size, default: ""
      t.string :style, default: ""
      t.boolean :for_sale, default: false
      t.integer :base_price, default: ""
      t.integer :shipping_price, default: ""
      t.integer :total_price, default: ""
      t.string  :currency, default: ""
      t.integer :quantity, default: ""
      t.string :slug

      t.timestamps
    end
  end
end
