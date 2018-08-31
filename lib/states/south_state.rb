class SouthState
  NAME = "SOUTH".freeze
  attr_accessor :name

  def initialize
    @name = NAME
  end

  def next_state_turn_left
    return EastState.new
  end

  def next_state_turn_right
    return WestState.new
  end
end
