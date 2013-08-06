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
#  lat            :float
#  lng            :float
#

class Photo < ActiveRecord::Base
  before_destroy :delete_filepicker_photo

  attr_accessible :name, :album_id, :image_url, :public, :imageable_id, 
                  :imageable_type, :lat, :lng

  belongs_to :imageable, :polymorphic => true
  
  has_many :taggings
  has_many :tags, :through => :taggings

  has_many :comments

  has_many :favorites
  has_many :favoriters, :through => :favorites, :source => :user

  def delete_filepicker_photo
    require 'rest-client'
    RestClient.delete self.image_url
  end

  def convert_photo(url, width, height, fit)
    url + "/convert?w=#{width}&h=#{height}&fit=#{fit}"
  end

end


