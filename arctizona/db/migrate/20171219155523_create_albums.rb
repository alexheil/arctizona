class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.references :user
      t.references :gallery
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
