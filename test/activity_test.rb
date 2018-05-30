require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('bowling', 10.00, 2.00)
    assert_instance_of Activity, activity
  end

  def test_activity_has_a_name
    activity = Activity.new('bowling', 10.00, 2.00)
    assert_equal 'bowling', activity.name
  end

  def test_activity_can_have_participants
    participants = {Tom: 5.00,
                    Sally: 7.00,
                    Josh: 2.50,
                    Zach: 3.50}
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    assert_equal participants, activity.participants
  end

  def test_can_add_participants_to_an_activity
    participants = {  Tom: 5.00,
                      Sally: 7.00,
                      Josh: 2.50,
                      Zach: 3.50 }
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    participants_to_add = { Jill: 2.00,
                            Aaron: 2.00 }
    activity.add_participants(participants_to_add)
    expected = {  Tom: 5.00,
                  Sally: 7.00,
                  Josh: 2.50,
                  Zach: 3.50,
                  Jill: 2.00,
                  Aaron: 2.00 }
    assert_equal expected, activity.participants
  end

  def test_activity_has_base_cost
    participants = {  Tom: 5.00,
                      Sally: 7.00,
                      Josh: 2.50,
                      Zach: 3.50 }
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    assert_equal 10.00, activity.base_cost
  end

  def test_activity_has_cost_per_participant
    participants = {  Tom: 5.00,
                      Sally: 7.00,
                      Josh: 2.50,
                      Zach: 3.50 }
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    assert_equal 2.00, activity.cost_per_participant
  end

  def test_can_caculate_total_cost_of_an_activity
    participants = {  Tom: 5.00,
                      Sally: 7.00,
                      Josh: 2.50,
                      Zach: 3.50 }
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    assert_equal 18.00, activity.total_cost
  end

  def test_can_calculate_fair_share
    participants = {  Tom: 5.00,
                      Sally: 7.00,
                      Josh: 2.50,
                      Zach: 3.50 }
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    assert_equal 4.50, activity.fair_share
  end

  def test_can_calculate_how_much_each_participant_owes
    participants = {  Tom: 5.00,
                      Sally: 7.00,
                      Josh: 2.50,
                      Zach: 3.50 }
    activity = Activity.new('bowling', 10.00, 2.00, participants)
    expected = {Tom: -0.50,
                Sally: -2.50,
                Josh: 2.00,
                Zach: 1.00}
    assert_equal expected, activity.owes
  end
end
