# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  friend_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base
  attr_accessible :user_id, :friend_id

  belongs_to :user
  belongs_to :friend, :class_name => "User"
end
