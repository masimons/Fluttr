class Polymorphisizephotos < ActiveRecord::Migration
  def change
    remove_column :photos, :album_id
    add_column :photos, :imageable_id, :integer
    add_column :photos, :imageable_type, :string

  end
end
