class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :bike, :capacity
  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty? || all_broken?
    @bikes[@bikes.find_index {|bike| bike.working?}]
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
  def dispatch
    @bikes.select {|bike| !bike.working?}
  end
  private
  def all_broken?
   @bikes.all? {|bike|!bike.working?}
  end
end
