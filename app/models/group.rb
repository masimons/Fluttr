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

  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
end
