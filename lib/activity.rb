class Activity
  attr_reader :name, :paid

  def initialize(name=name)
    @name = name
    @paid = 0
  end

  # def participant
  #   participant = []
  #   @name << participant
  # end
end
