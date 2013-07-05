# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  image_url      :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  public         :boolean          default(TRUE)
#  imageable_id   :integer
#  imageable_type :string(255)
#

class Photo < ActiveRecord::Base
  # before_validation :add_album

  attr_accessible :name, :album_id, :image_url, :public, :imageable_id, :imageable_type

  # validates :name, :presence => true

  belongs_to :imageable, :polymorphic => true
  
  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :comments

  has_many :favorites
  has_many :favoriters, :through => :favorites, :source => :user


  # def add_album
  #   album = current_user.albums.where(:title => "Other")
  #   if album_id.nil? && album.empty?
  #     new_album = Album.create!(:title => "Other",
  #                                :user_id => current_user.id)
  #     self.album_id = new_album.id
  #   else
  #     self.album_id = album[0].id
  #   end
  # end

end


