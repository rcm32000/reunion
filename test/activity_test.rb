require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    hiking = Activity.new
    assert_instance_of Activity, hiking
  end

  def test_person_involvement
    hiking = Activity.new
    hiking.add_participant('Rob')
    assert_equal true, hiking.participants.keys.include?('Rob')
  end

  def test_more_than_one_person
    hiking = Activity.new
    hiking.add_participant('Rob')
    hiking.add_participant('Margaret')
    assert_equal true, hiking.participants.keys.include?('Rob')
  end

  def test_cost_of_activity
    hiking = Activity.new
    hiking.add_participant('Rob')
    hiking.add_participant('Margaret')
    assert_equal 0, hiking.cost
  end

  def test_total_paid_defaults_to_zero
    hiking = Activity.new
    hiking.add_participant('Rob')
    hiking.add_participant('Margaret')
    assert_equal 0, hiking.total_paid
  end

  def test_total_paid
    hiking = Activity.new
    hiking.add_participant('Rob', 10)
    hiking.add_participant('Margaret', 5)
    assert_equal 15, hiking.total_paid
  end

  def test_total_due_of_activity
    hiking = Activity.new
    hiking.add_participant('Rob')
    hiking.add_participant('Margaret')
    assert_equal 0, hiking.total_due
  end

  def test_total_due_of_one_person
    hiking = Activity.new(10)
    hiking.add_participant('Rob')
    hiking.add_participant('Margaret')
    assert_equal 10, hiking.due('Rob')
  end

  def test_total_due_of_one_person_is_negative
    hiking = Activity.new
    hiking.add_participant('Rob', 10)
    hiking.add_participant('Margaret')
    assert_equal -10, hiking.due('Rob')
  end
end
