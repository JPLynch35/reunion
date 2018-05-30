require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('bowling')
    assert_instance_of Activity, activity
  end

    def test_activity_has_a_name
      activity = Activity.new('bowling')
      assert_equal 'bowling', activity.name
    end

    def test_activity_can_have_participants
      participants = {Tom: 5.00,
                      Sally: 7.00,
                      Josh: 8.92,
                      Zach: 3.67}
      activity = Activity.new('bowling', participants)
      assert_equal participants, activity.participants
    end

    def test_can_add_participants_to_an_activity
      participants = {Tom: 5.00,
                      Sally: 7.00,
                      Josh: 8.92,
                      Zach: 3.67}
      activity = Activity.new('bowling', participants)
      participants_to_add = {Jill: 4.32,
                          Aaron: 1.99}
      activity.add_participants(participants_to_add)
      expected = {Tom: 5.00,
                  Sally: 7.00,
                  Josh: 8.92,
                  Zach: 3.67,
                  Jill: 4.32,
                  Aaron: 1.99}
      assert_equal expected, activity.participants
    end
end
