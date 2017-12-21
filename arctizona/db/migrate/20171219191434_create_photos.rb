class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.references :album
      t.string :title, default: ""
      t.text :image_data
      t.text :description, default: ""
      t.string :camera, default: ""
      t.string :lens, default: ""
      t.string :aperture, default: ""
      t.string :exposure, default: ""
      t.string :flash, default: ""
      t.string :focal_length, default: ""
      t.string :iso, default: ""
      t.string :slug

      t.timestamps
    end
  end
end
