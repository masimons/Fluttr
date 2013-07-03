class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :creator_id
      t.string :image_url

      t.timestamps
    end

    add_index :groups, :creator_id
  end
end
