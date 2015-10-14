require 'docking_station'
require 'bike'

describe DockingStation do
  it 'expects DockingStation to respond to method release_bike' do
      expect(subject).to respond_to :release_bike
  end
  it 'expects DockingStation to get bike to be working' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it {is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

  

end
