class Garage
  attr_reader :inventory
  def initialize
    @inventory = []
  end

  def take_delivery(van)
    @inventory = van.contents
  end
  def fix_all
    @inventory.each do |bike|
      bike.working = true
    end
    @inventory
  end
  def dispatch
    inventory
  end
end
