# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  album_id   :integer
#  image_url  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  public     :boolean          default(TRUE)
#

class Photo < ActiveRecord::Base
  # before_validation :add_album

  attr_accessible :name, :album_id, :image_url, :public

  # validates :name, :presence => true

  belongs_to :album
  
  has_many :taggings
  has_many :tags, :through => :taggings


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


