class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :album_id
      t.string :image_url

      t.timestamps
    end

    add_index :photos, :album_id
  end
end
