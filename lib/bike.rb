class Bike
  attr_writer :working
  def initialize
    @working = true
  end

  def working?
    working
  end
  private
  attr_reader :working
end
