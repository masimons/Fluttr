# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  failed_attempts        :integer          default(0)
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  profile_url            :string(255)
#  cover_url              :string(255)
#  username               :string(255)
#

class User < ActiveRecord::Base
  after_create :add_album

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :profile_url, :cover_url, :username

  validates :username, :presence => true, :uniqueness => true

  has_many :albums
  has_many :photos, :through => :albums

  has_many :memberships
  has_many :groups, :through => :memberships

  has_many :owned_groups, :class_name => "Group", :foreign_key => :creator_id

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :followings, :foreign_key => :followee_id
  has_many :followers, :through => :followings

  has_many :followings2, :class_name => "Following", :foreign_key => :follower_id
  has_many :followees, :through => :followings2

  has_many :comments

  has_many :favorites
  has_many :favorite_photos, :through => :favorites, :source => :photo

  def add_album
    self.albums.create!(:title => "Other")
  end

  def recent_friends_photos
    photos = self.followees.map { |followee| followee.photos }.flatten!
    photos = (photos.sort_by { |photo| photo.created_at }).reverse
  end

  def feed_photos
    followee_ids = self.followees.map { |followee| followee.id }
    Photo.find_by_sql("SELECT photos.* FROM photos
                    JOIN albums ON imageable_id = albums.id
                    JOIN users ON albums.user_id = users.id
                    WHERE users.id IN (#{followee_ids.join(',')})
                    AND imageable_type = 'Album'
                    ORDER BY photos.created_at DESC;
                  ")
  end

end
