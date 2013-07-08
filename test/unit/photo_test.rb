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

require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
