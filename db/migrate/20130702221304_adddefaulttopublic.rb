class Adddefaulttopublic < ActiveRecord::Migration
  def change
    change_column :photos, :public, :boolean, :default => true
  end
end
