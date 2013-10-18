require 'airport'
require 'weather_condition_spec'

#A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) {Plane.new}
  CAPACITY = 20
  
  def fill_airport_with plane
    CAPACITY.times {airport.land(plane)}
  end

  context 'taking off and landing' do
    
    it 'a plane can land' do
      expect(airport.plane_count).to eq 0
      airport.land plane
      expect(airport.plane_count).to eq 1
    end
    
    it 'a plane can take off' do
      airport.land plane
      airport.take_off plane
      expect(airport.plane_count).to eq 0
    end
  end
  
  context 'traffic control' do
    
    it 'should know when the airport is full' do
      expect(airport).not_to be_full
      fill_airport_with plane
      expect(airport).to be_full
    end

    it 'a plane cannot land if the airport is full' do
      fill_airport_with plane
      expect(airport.land plane).to eq 'Sorry the airport is full, you can\'t land'
    end
    
    context 'weather conditions' do

    it_behaves_like 'weather conditions checker'

    #it 'a plane cannot take off when there is a storm brewing' do
     # airport.storm  
      #expect(airport.take_off plane).to eq 'Sorry, storm expected'
    #end
      
    #it 'a plane cannot land in the middle of a storm' do
     # airport.storm  
      #expect(airport.land plane).to eq 'Sorry, storm expected'
    #end

    end
  end
end

  


