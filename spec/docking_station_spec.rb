require 'docking_station'

describe DockingStation do
  let(:bike) { double :bike }

  it 'expects DockingStation to respond to method release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it {is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bike) }

  it 'reports a bike as broken when returning it' do
    allow(bike).to receive(:working=).with(false).and_return(false)
    expect(subject.dock(bike, false)).to be_instance_of Array
  end

  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error "No bikes available"
    end
  end


  describe '#dock' do
    it 'raises an error when dock is full' do
      allow(bike).to receive(:working=).with(true).and_return(true)
      DockingStation::DEFAULT_CAPACITY.times { subject.dock bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end


    it 'creates a DockingStation with a capacity that it passed with a argument' do
      docking_station = DockingStation.new(100)
      expect(docking_station.capacity).to eq(100)
    end

    it 'it creates a docking station with DEFAULT_CAPACITY if no capacity is passed' do
      expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
    end

    it 'does not release a broken bike' do
      allow(bike).to receive(:working=).with(false).and_return(false)
      allow(bike).to receive(:working?).and_return(false)
      subject.dock(bike, false)
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'release a bike when not broken' do
      allow(bike).to receive(:working=).with(true).and_return(true)
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to be_working
    end

    it 'finds an unbroken bike amongst broken ones' do
      allow(bike).to receive(:working=).with(false).and_return(false)
      5.times {subject.dock(bike, false)}
      allow(bike).to receive(:working=).with(true).and_return(true)
      subject.dock(bike)
      allow(bike).to receive(:working=).with(false).and_return(false)
      subject.dock(bike, false)
      allow(bike).to receive(:working?).and_return(true)
      expect(subject.release_bike).to be_working
    end
  end
  describe 'dispatching broken bikes to be fixed' do
    it 'returns an Array of broken bikes' do
      allow(bike).to receive(:working=).with(false).and_return(false)
      5.times {subject.dock(bike, false)}
      allow(bike).to receive(:working?).and_return(false)
      expect(subject.dispatch_broken.count).to eq 5
    end
  end
end
