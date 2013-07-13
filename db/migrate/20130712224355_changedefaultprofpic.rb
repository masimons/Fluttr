class Changedefaultprofpic < ActiveRecord::Migration
  def change
    change_column :users, :profile_url, :string, :default => 'https://www.filepicker.io/api/file/nSCsCKIJSR2BSWI84YFY'
  end
end
