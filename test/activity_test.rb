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
    hiking = Activity.new("Rob")
    assert_equal true, hiking.name.include?("Rob")
  end

  def test_more_than_one_person
    hiking = Activity.new("Rob")
    hiking = Activity.new("Margaret")
    assert_equal true, hiking.name.include?("Rob")
  end
end
