module GamesHelper
	class Score
		@score = 0
		@path = nil

		def initialize(path)
			@path = path
		end

		def in_order(value_hash)
			path_enum = path.each
			value_array.each_pair do |cardname, points|
				card = path_enum.next
				if cardname == card.name
					@score += points
					next
				end
			end
			self
		end

		def in_path(value_hash)
			path.each do |card|
				value_Array.each_pair do |cardname, points|
					card = path_enum.next
					if cardname == card.name
						@score += points
					end
				end
			end
			self
		end
		
	end
end
