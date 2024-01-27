class TileBag
	# symbols with points
	POINTS = {
	:A => 1, :B => 3, :C => 3, :D => 2, :E => 1, :F => 4, :G => 2,
   	:H => 4, :I => 1, :J => 8, :K => 5, :L => 1, :M => 3, :N => 1,
    	:O => 1, :P => 3, :Q => 10, :R => 1, :S => 1, :T => 1, :U => 1,
    	:V => 4, :W => 4, :X => 8, :Y => 4, :Z => 10
  }


   TILES = [
    :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E, :E,    # 12 Es
    :A, :A, :A, :A, :A, :A, :A, :A, :A,								# 9 As
    :I, :I, :I, :I, :I, :I, :I, :I, :I,								# 9 Is
    :O, :O, :O, :O, :O, :O, :O, :O,                  # 8 Os
    :N, :N, :N, :N, :N, :N,                          # 6 Ns
    :R, :R, :R, :R, :R, :R,                          # 6 Rs
    :T, :T, :T, :T, :T, :T,                          # 6 Ts
    :L, :L, :L, :L,                                 # 4 Ls
    :S, :S, :S, :S,                                 # 4 Ss
    :U, :U, :U, :U,                                 # 4 Ls
    :D, :D, :D, :D,                                 # 4 Ds
    :G, :G, :G,                                     # 3 Gs
    :B, :B,                                         # 2 Bs
    :C, :C,                                         # 2 Cs
    :M, :M,                                         # 2 Ms
    :P, :P,                                         # 2 Ps
    :F, :F,                                         # 2 Fs
    :H, :H,                                         # 2 Hs
    :V, :V,                                         # 2 Vs
    :W, :W,                                         # 2 Ws
    :Y, :Y,                                         # 2 Ys
    :K,                                            # 1 K
    :J,                                            # 1 J
    :X,                                            # 1 X
    :Q,                                            # 1
    :Z                                              # 1 Z
    ]
	def initialize
		# Array to store tiles
		@tiles = TILES.dup
	end

	def drawTile
 		# Remove and return a random tile from the bag
  		tile_index = rand(@tiles.length)
  		@tiles.delete_at(tile_index)
	end

	def empty?
   	 	# Check if the bag is empty
  		@tiles.empty?
  end

  	def self.points_for(tile)
    		# Class method to get points for a given tile
   		POINTS[tile]
  	end
end
