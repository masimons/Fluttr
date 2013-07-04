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
#

class User < ActiveRecord::Base
  after_create :add_album

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  attr_accessible :email, :password, :password_confirmation, :remember_me, 
                  :profile_url, :cover_url

  has_many :albums
  has_many :photos, :through => :albums

  has_many :memberships
  has_many :groups, :through => :memberships

  has_many :owned_groups, :class_name => "Group", :foreign_key => :creator_id

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :comments

  def add_album
    self.albums.create!(:title => "Other")
  end

end
