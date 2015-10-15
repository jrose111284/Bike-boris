class Garage
  attr_reader :inventory
  def initialize
    @inventory = []
  end

  def take_delivery(van)
    @inventory = van.contents
    
  end

end
