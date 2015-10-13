require 'dockingstation'

describe DockingStation do
  it 'responds to the method relese_bike' do
     expect(subject).to respond_to :release_bike
  end

end
