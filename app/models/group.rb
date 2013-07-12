# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  creator_id  :integer
#  image_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ActiveRecord::Base
  attr_accessible :name, :description, :creator_id, :image_url

  validates :name, :creator_id, :presence => true

  has_many :memberships, :dependent => :destroy
  has_many :members, :through => :memberships, :source => :user, :dependent => :destroy

  has_many :photos, :as => :imageable

  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
end
