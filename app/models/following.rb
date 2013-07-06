# == Schema Information
#
# Table name: followings
#
#  id          :integer          not null, primary key
#  followee_id :integer
#  follower_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Following < ActiveRecord::Base
  attr_accessible :followee_id, :follower_id

  belongs_to :followee, :class_name => "User", :foreign_key => :followee_id
  belongs_to :follower, :class_name => "User", :foreign_key => :follower_id
end
