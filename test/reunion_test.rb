require 'minitest'
require 'minitest/autorun'
require 'pry'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new
    assert_instance_of Reunion, reunion
  end

  def test_it_has_a_default_location
    reunion = Reunion.new
    assert_equal 'California', reunion.location
  end

  def test_it_can_have_a_different_location
    reunion = Reunion.new('Florida')
    assert_equal 'Florida', reunion.location
  end

  def test_add_member
    reunion = Reunion.new
    reunion.add_member('Rob')
    assert reunion.members.include?('Rob')
  end

  def test_add_members
    reunion = Reunion.new
    reunion.add_member('Rob')
    reunion.add_member('Mike')
    assert reunion.members.include?('Rob')
  end

  def test_it_can_have_an_activity
    reunion = Reunion.new
    hiking = Activity.new
    reunion.add_activity('Hiking', hiking)
    assert reunion.activities.include?('Hiking')
  end

  def test_it_can_have_multiple_activities
    reunion = Reunion.new
    hiking = Activity.new
    cycling = Activity.new
    reunion.add_activity('Hiking', hiking)
    reunion.add_activity('Cycling', cycling)
    assert reunion.activities.include?('Hiking')
  end

  def test_it_can_have_member_added_to_an_activity
    reunion = Reunion.new
    hiking = Activity.new
    reunion.add_activity('Hiking', hiking)
    hiking.add_participant('Rob')
    assert reunion.activities['Hiking'][0].participants.include?('Rob')
  end

  def test_it_can_have_members_added_to_an_activity
    reunion = Reunion.new
    hiking = Activity.new
    reunion.add_activity('Hiking', hiking)
    hiking.add_participant('Rob')
    hiking.add_participant('Tristan')
    assert reunion.activities['Hiking'][0].participants.include?('Rob')
  end

  def test_total_cost_of_reunion
    reunion = Reunion.new
    hiking = Activity.new(10)
    cycling = Activity.new(20)
    reunion.add_activity('Hiking', hiking)
    reunion.add_activity('Cycling', cycling)
    hiking.add_participant('Rob')
    hiking.add_participant('Tristan')
    cycling.add_participant('Rob')
    assert_equal 40, reunion.total_cost
  end

  def test_total_cost_due_by_member
    skip
    reunion = Reunion.new
    hiking = Activity.new(10)
    cycling = Activity.new(20)
    reunion.add_member('Rob')
    reunion.add_activity('Hiking', hiking)
    reunion.add_activity('Cycling', cycling)
    hiking.add_participant('Rob', 0)
    cycling.add_participant('Rob', 10)

    assert_equal 20, reunion.member_due('Rob')
  end
end
