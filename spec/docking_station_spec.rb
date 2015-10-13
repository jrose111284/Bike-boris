require 'docking_station'

describe DockingStation do
  it 'expects DockingStation to respond to method release_bike' do
      expect(subject).to respond_to :release_bike
  end
  it 'expects DockingStation to get bike to be working' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
