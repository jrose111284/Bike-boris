class Van
  attr_reader :contents
  def initialize
    @contents = []
  end
  def collect(docking_station)
    @contents = docking_station.dispatch_broken
  end
end
