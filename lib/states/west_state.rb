class WestState
  NAME = "WEST".freeze
  attr_accessor :name

  def initialize
    @name = NAME
  end

  def next_state_turn_left
    return SouthState.new
  end

  def next_state_turn_right
    return NorthState.new
  end
end
