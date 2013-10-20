require_relative 'weather_condition'
require_relative 'plane'

class Airport

	include WeatherCondition

	CAPACITY = 6
	

	def initialize
		@planes = []
		@capacity = CAPACITY
		weather_options = ['sunny','stormy']
		@weather_condition = weather_options.sample(1)
	end

	def plane_count
		@planes.length
	end

	def land plane
		return 'Sorry, storm expected' if storm_expected?
		return 'Sorry the airport is full, you can\'t land' if full?
		plane.land
		@planes << plane
	end

	def take_off plane
		return 'Sorry, no planes at the airport' if plane_count == 0
		return 'Sorry, storm expected' if storm_expected?
		@planes.delete(plane)
		plane.take_off
	end

	def full?
		plane_count == @capacity
	end

end