# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  attr_accessible :title, :user_id

  validates :title, :user_id, :presence => true

  belongs_to :user
  has_many :photos, :as => :imageable, :dependent => :delete_all

end
