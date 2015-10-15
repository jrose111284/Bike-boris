require 'garage'
require 'van'
require 'docking_station'
require 'bike'

describe Garage do
  before(:each) do
    docking_station = DockingStation.new
    10.times {docking_station.dock(Bike.new, false)}
    @van = Van.new
    @van.collect(docking_station)
  end

  describe 'except delivery from van' do
    it 'takes delivery from van' do
      expect(subject.take_delivery(@van)).to be_instance_of Array
    end
    it 'stores the contents of a delivery' do
      subject.take_delivery(@van)
      expect(subject.inventory).to be_instance_of Array
      expect(subject.inventory.count).to eq(10)
    end
  end
  describe 'Fixing Bikes' do
    it 'fixes all the bikes in the inventory' do
      subject.take_delivery(@van)
      fixed_bikes = subject.fix_all
      expect( fixed_bikes.all? {|bike| bike.working?}).to be true
    end
  end

end
