class EastState
  NAME = "EAST".freeze
  attr_accessor :name

  def initialize
    @name = NAME
  end

  def next_state_turn_left
    return NorthState.new
  end

  def next_state_turn_right
    return SouthState.new
  end
end
