class Activity
  attr_reader :cost, :participants

  def initialize(cost = 0)
    @cost = cost
    @participants = {}
  end

  def add_participant(name, paid = 0)
    @participants[name] = paid
  end

  def total_paid
    paid = @participants.values
    paid.sum
  end

  def total_due
    @cost - total_paid
  end

  def due(name)
    paid = @participants[name]
    @cost - paid
  end
end
