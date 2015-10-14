require 'docking_station'
require 'bike'

describe Bike do
  it 'expects Bike to respond to method working?' do
      expect(subject).to respond_to :working?
  end
end
