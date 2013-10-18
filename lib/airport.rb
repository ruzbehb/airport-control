require_relative 'weather_condition'
require_relative 'plane'

class Airport

	include WeatherCondition

	CAPACITY = 20

	def initialize
		@planes = []
		@capacity = CAPACITY

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
		return 'Sorry, storm expected' if storm_expected?
		@planes.delete(plane)
		plane.take_off
	end

	def full?
		plane_count == @capacity
	end

end