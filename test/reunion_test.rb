require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    location = 'beach'
    participants1 = {Tom: 5.00,
                    Sally: 7.00,
                    Josh: 2.50,
                    Zach: 3.50}
    participants2 = {Tom: 15.00,
                    Sally: 15.00,
                    Josh: 15.00,
                    Zach: 15.00}
    activity1 = Activity.new('sailing', 10.00, 2.00, participants1)
    activity2 = Activity.new('drinking', 20.00, 10.00, participants2)
    activities = [activity1, activity2]
    reunion = Reunion.new(location, activities)
    assert_instance_of Reunion, reunion
  end

  def test_reuniuon_has_location_and_activities
    location = 'beach'
    participants1 = {Tom: 5.00,
                    Sally: 7.00,
                    Josh: 2.50,
                    Zach: 3.50}
    participants2 = {Tom: 15.00,
                    Sally: 15.00,
                    Josh: 15.00,
                    Zach: 15.00}
    activity1 = Activity.new('sailing', 10.00, 2.00, participants1)
    activity2 = Activity.new('drinking', 20.00, 10.00, participants2)
    activities = [activity1, activity2]
    reunion = Reunion.new(location, activities)
    assert_equal 'beach', reunion.location
    assert_equal [activity1, activity2], reunion.activities
  end

  def test_can_add_activities_to_reunion
    location = 'beach'
    participants1 = {Tom: 5.00,
                    Sally: 7.00,
                    Josh: 2.50,
                    Zach: 3.50}
    participants2 = {Tom: 15.00,
                    Sally: 15.00,
                    Josh: 15.00,
                    Zach: 15.00}
    activity1 = Activity.new('sailing', 10.00, 2.00, participants1)
    activity2 = Activity.new('drinking', 20.00, 10.00, participants2)
    activities = [activity1, activity2]
    reunion = Reunion.new(location, activities)
    assert_equal [activity1, activity2], reunion.activities
    activity3 = Activity.new('games', 5.00, 2.00)
    activity4 = Activity.new('fishing', 10.00, 1.00)
    reunion.add_activities([activity3, activity4])
    expected = [activity1, activity2, activity3, activity4]
    assert_equal expected, reunion.activities
  end

  def test_can_calculate_total_cost_of_reunion
    location = 'beach'
    participants1 = {Tom: 5.00,
                    Sally: 7.00,
                    Josh: 2.50,
                    Zach: 3.50}
    participants2 = {Tom: 15.00,
                    Sally: 15.00,
                    Josh: 15.00,
                    Zach: 15.00}
    activity1 = Activity.new('sailing', 10.00, 2.00, participants1)
    activity2 = Activity.new('drinking', 20.00, 10.00, participants2)
    activities = [activity1, activity2]
    reunion = Reunion.new(location, activities)
    assert_equal 78.00, reunion.total_cost
  end
end
