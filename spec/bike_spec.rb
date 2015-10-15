require 'bike'

describe Bike do
  it 'expects Bike to respond to method working?' do
      expect(subject).to respond_to :working?
  end
  it 'stores the working state of the bike' do
    subject.working = false
    expect(subject.working?).to be false
  end
end
