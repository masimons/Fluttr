class Indexphotos < ActiveRecord::Migration
  def change
    add_index :photos, :lat
    add_index :photos, :lng
  end
end
