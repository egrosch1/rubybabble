require 'minitest/autorun'
require_relative '../../tile_bag'

class TileBag::TestDrawTile < Minitest::Test
    def test_has_proper_number_of_tiles
      tile_bag = TileBag.new

      98.times do
        refute tile_bag.empty?, "Expected Bag to have tiles, but it's empty"
        tile_bag.drawTile
      end

      assert tile_bag.empty?, "Expected bag to be empty after drawing 98 tiles but it isn't"
    end

    def test_has_proper_tile_distributions
      tile_bag = TileBag.new
      expected_distribution =  {
    1 => 68,  # tiles with 1 point
    2 => 7,   # tiles with 2 points
    3 => 8,   # tiles with 3 points
    4 => 10,  # tiles with 4 points
    5 => 1,   # tiles with 5 points
    8 => 2,   # tiles with 8 points
    10 => 2   # tiles with 10 points
  }
      actual_distribution = Hash.new { |has, key| has[key] = 0 }

      98.times do
        tile = tile_bag.drawTile
        actual_distribution[TileBag.points_for(tile)] += 1
      end

      assert_equal expected_distribution, actual_distribution, "Tile distribution does not math the excpeted distribution"
    end
  end
