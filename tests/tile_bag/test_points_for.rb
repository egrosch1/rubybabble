require 'minitest/autorun'
require_relative '../../tile_bag'

class TileBag::TestPointsFor < Minitest::Test
	def test_confirm_point_values
		tile_bag = TileBag.new 
		
		TileBag::POINTS.each do |tile, points|
			assert_equal points, TileBag.points_for(tile)
		end
	end
end
