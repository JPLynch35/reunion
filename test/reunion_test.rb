require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    location = 'beach'
    activities = ['surfing', 'running']
    reunion = Reunion.new(location, activities)
    assert_instance_of Reunion, reunion
  end

  def test_reuniuon_has_location_and_activities
    location = 'beach'
    activities = ['surfing', 'running']
    reunion = Reunion.new(location, activities)
    assert_equal 'beach', reunion.location
    assert_equal ['surfing', 'running'], reunion.activities
  end

  
end
