class Airport

	def initialize
		@planes = []

	end

	def plane_count
		@planes.count
	end

	def land plane
		@planes << plane
	end

	def take_off plane

	end

end