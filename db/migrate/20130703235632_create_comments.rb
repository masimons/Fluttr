class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :photo_id
      t.text :body

      t.timestamps
    end

    add_index :users
    add_index :photos
  end
end
