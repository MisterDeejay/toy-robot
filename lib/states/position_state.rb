class PositionState
  attr_accessor :val

  def initialize(val)
    @val = val
  end

  def name
    "#{val.to_s}"
  end

  def next_state_move_forward
    self.class.new(val + 1)
  end

  def next_state_move_backward
    self.class.new(val - 1)
  end
end
