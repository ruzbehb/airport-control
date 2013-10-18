shared_examples 'weather conditions checker' do 

	let(:unit) {described_class.new()}

	# Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    

    it 'changes the weather status to storm when a storm is expected' do
    	unit.storm
    	expect(unit.storm_expected?).to eq true
    end

	it 'changes the weather status to sunny when it is sunny' do
    	unit.sunny
    	expect(unit.storm_expected?).to eq false
    end    

end