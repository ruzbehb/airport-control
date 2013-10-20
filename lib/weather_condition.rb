module WeatherCondition

	@storm_error = 'Sorry, storm expected'
	
	

	def storm_expected?
		@weather_condition == 'stormy'
	end

	def storm
		@weather_condition = 'stormy'
	end

	def sunny
		@weather_condition = 'sunny'
	end

end