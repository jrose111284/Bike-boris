class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike, :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike, working=true)
    fail 'Docking station full' if full?
    bike.working = working
    @bikes << bike
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
