class Addlatlngtophotos < ActiveRecord::Migration
  def change
    add_column :photos, :lat, :float
    add_column :photos, :lng, :float
  end
end
