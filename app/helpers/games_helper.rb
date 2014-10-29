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

	class Actions
		@actions = nil
		@path = nil
    @moves_locked = false
    @triggers

		def initialize(path)
			@path = path
		end

		def queue_move
      if not @moves_locked
			  @actions.push("move")
      end
			self
		end

		def queue_free
      if not @moves_locked
        @action.push("free")
			  @action.push("move")
      end
			self
		end

		def queue_shift
      @action.push("row_or_col")
			@action.push("shift")
      self
    end

    def queue_flip
      @action.push("flip")
      self
    end

    def queue_unflip
      @action.push("unflip")
      self
    end

    def lock_moves
      @moves_locked = true
      self
    end

    def unlock_moves
      @moves_locked = false
      self
    end

    def queue_target
      @action.push("set_target")
      self
    end

    def queue_discard
      @action.push("discard")
      self
    end

    def queue_edge_place
      @action.push("edge")
      @action.push("place")
      self
    end

    def queue_swap
      @action.push("swap")
      self
    end

    def queue_free_place
      @action.push("free")
      @action.push("swap")
      self
    end
	end
end
