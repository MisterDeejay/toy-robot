class NorthState
  NAME = "NORTH".freeze
  attr_accessor :name

  def initialize
    @name = NAME
  end

  def next_state_turn_left
    return WestState.new
  end

  def next_state_turn_right
    return EastState.new
  end
end
