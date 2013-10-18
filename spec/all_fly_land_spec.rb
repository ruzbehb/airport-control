require './lib/airport'

# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The grand finale (last spec)" do
  
  airport = Airport.new
  plane = Plane.new
  CAPACITY = 6

  it 'does not allow a plane to land when it is stormy' do
  	airport.storm
  	expect(airport.land plane).to eq 'Sorry, storm expected'
  end 

  it 'allows all planes to land when it is not stormy' do
  	airport.sunny
  	CAPACITY.times{airport.land plane}
  	expect(airport.plane_count).to eq CAPACITY
  end

  it 'all landed planes have status landed' do
  	expect(plane.status?).to eq 'landed'
  end

  it 'does not allow more than capacity planes to land' do
  	expect(airport.land plane).to eq 'Sorry the airport is full, you can\'t land'
  end

  it 'allows all plans to fly' do
  	airport.plane_count.times {airport.take_off plane}
  	expect(airport.plane_count).to eq 0
  end

  it 'all planes in the air have status flying' do
  	expect(plane.status?).to eq 'flying'
  end

  it 'all planes can land and all planes can take off' do
  	airport = Airport.new
  	plane = Plane.new
  	CAPACITY.times{airport.land plane}
  	expect(plane.status?).to eq 'landed'
  	expect(airport.plane_count).to eq CAPACITY
  	expect(airport.land plane).to eq 'Sorry the airport is full, you can\'t land'
  	airport.plane_count.times {airport.take_off plane}
  	expect(airport.plane_count).to eq 0
  	expect(plane.status?).to eq 'flying'
  end
  

end