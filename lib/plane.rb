require_relative 'weather_condition'

class Plane

	include WeatherCondition

	def initialize
		@status = 'flying'
	end

	def status?
		@status
	end

	def take_off
		#return 'Sorry, storm expected' if storm_expected?
		@status = 'flying'
	end

	def take_off?
		!storm_expected?
	end

	def land
		#return 'Sorry, storm expected' if storm_expected?
		@status = 'landed'
	end

	def land?
		!storm_expected?
	end

end