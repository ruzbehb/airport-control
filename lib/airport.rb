class Airport

	CAPACITY = 20

	def initialize
		@planes = []
		@capacity = CAPACITY

	end

	def plane_count
		@planes.length
	end

	def land plane
		return 'Sorry the airport is full, you can\'t land' if full?
		@planes << plane
	end

	def take_off plane
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity
	end

end