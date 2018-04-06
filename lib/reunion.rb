require './lib/activity'
class Reunion < Activity
  attr_reader :location, :members, :activities
  def initialize(location = 'California')
    @location = location
    @members = {}
    @activities = {}
  end

  def add_member(name, activity = nil)
    @members[name] = activity
  end

  def add_activity(name, activity, cost = @cost)
    @activities[name] = [activity, cost]
  end

  def total_cost
    total_cost = 0
    @activities.each do |activity|
      participants = activity[1][0].participants.keys.count
      total_cost += activity[1][0].cost * participants
    end
    total_cost
  end

  def member_due(name)
    binding.pry
  end
end
