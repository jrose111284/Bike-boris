require 'docking_station'
require 'bike'

  describe DockingStation do

  it 'expects DockingStation to respond to method release_bike' do
      expect(subject).to respond_to :release_bike
  end
  #it 'expects DockingStation to get bike to be working' do
  #  bike = subject.release_bike
  #  expect(bike).to be_working
  #end
  it {is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }



  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end


   describe '#dock' do
  it 'raises an error when dock is full' do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
    expect { subject.dock Bike.new }.to raise_error 'Docking station full'
  end


    it 'creates a DockingStation with a capacity that it passed with a argument' do
      docking_station = DockingStation.new(100)
      expect(docking_station.capacity).to eq(100)
    end

    it 'it creates a docking station with DEFAULT_CAPACITY if no capacity is passed' do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    

    end
  end
end
