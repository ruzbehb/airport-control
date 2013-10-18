require 'plane'
require 'weather_condition_spec'
 
 
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
 
  let(:plane) { Plane.new }
  let(:airport) {double :Airport}

  it 'has a flying status when created' do
    expect(plane.status?).to eq 'flying'
  end
  
  it 'changes its status to landed when the plane lands' do
    plane.land
    expect(plane.status?).to eq 'landed'
  end

  it 'can take off' do
    expect(plane.take_off?).to eq true
  end  
    
  it 'changes its status to flying after taking of' do
    plane.take_off
    expect(plane.status?).to eq 'flying'
  end

  it 'has a flying status when in the air' do
    expect(plane.status?).to eq 'flying'
  end

  it_behaves_like 'weather conditions checker'

  it 'a plane cannot take off when there is a storm brewing' do
      plane.storm
      expect(plane.take_off?).to eq false
  end
      
  it 'a plane cannot land in the middle of a storm' do
      plane.storm
      expect(plane.land?).to eq false
  end

end
 