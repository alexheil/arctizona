class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.references :user
      t.references :album
      t.string :title, default: ""
      t.string :photo
      t.text :description, default: ""
      t.boolean :cover_photo, default: false
      t.boolean :profile_photo, default: false
      t.string :slug

      t.timestamps
    end
  end
end
