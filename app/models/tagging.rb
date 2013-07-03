# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  photo_id   :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ActiveRecord::Base
  attr_accessible :photo_id, :tag_id

  belongs_to :photo
  belongs_to :tag
end
