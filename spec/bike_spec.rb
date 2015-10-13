require 'docking_station'

describe Bike do
  it 'expects Bike to respond to method working?' do
      expect(subject).to respond_to :working?
  end
end
