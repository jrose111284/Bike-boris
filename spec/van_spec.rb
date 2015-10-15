require 'van'
require 'docking_station'
require 'bike'

describe Van do
  before(:each) do
    @docking_station = DockingStation.new
    10.times {@docking_station.dock(Bike.new, false)}
  end
  describe 'Collecting bikes from a docking station' do
    it 'gets back a collection of bikes from a docking station' do
      expect(subject.collect(@docking_station).count).to eq 10
    end
  end
  describe 'Delivering bikes' do
    it 'Delivers bikes' do
      subject.collect(@docking_station)
      expect(subject.contents).to be_instance_of Array
    end
  end
end
