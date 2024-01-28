# test_number_of_tiles_needed.rb
require 'minitest/autorun'
require_relative '../../tile_rack'

class TileRack::TestNumberOfTilesNeeded < Minitest::Test
  def test_empty_tile_rack_should_need_max_tiles
    tile_rack = TileRack.new
    assert_equal 7, tile_rack.number_of_tiles_needed
  end

  def test_tile_rack_with_one_tile_should_need_max_minus_one_tiles
    tile_rack = TileRack.new
    tile_rack.append(:A)
    assert_equal 6, tile_rack.number_of_tiles_needed
  end

  def test_tile_rack_with_several_tiles_should_need_some_tiles
    tile_rack = TileRack.new
    tile_rack.append(:A)
    tile_rack.append(:B)
    tile_rack.append(:C)
    assert_equal 4, tile_rack.number_of_tiles_needed
  end

  def test_that_full_tile_rack_doesnt_need_any_tiles
    tile_rack = TileRack.new
    tile_rack.append(:A)
    tile_rack.append(:B)
    tile_rack.append(:C)
    tile_rack.append(:D)
    tile_rack.append(:E)
    tile_rack.append(:F)
    tile_rack.append(:G)
    assert_equal 0, tile_rack.number_of_tiles_needed
  end
end
