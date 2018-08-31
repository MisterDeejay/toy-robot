class DirectionStateCreator
  def initialize(direction)
    @direction = direction
  end

  def create
    case @direction
    when NorthState::NAME
      NorthState.new
    when EastState::NAME
      EastState.new
    when SouthState::NAME
      SouthState.new
    when WestState::NAME
      WestState.new
    end
  end
end
