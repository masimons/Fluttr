class Adddefaultprofpic < ActiveRecord::Migration
  def change
    change_column :users, :profile_url, :string, :default => '/img/empty-profile.jpg'
  end
end
