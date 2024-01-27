require 'minitest/autorun'
require_relative '../../tile_group'

class TileGroup::TestHand < Minitest::Test
  def test_convert_empty_group_to_string
    tile_group = TileGroup.new
    assert_equal '', tile_group.hand
  end

  def test_convert_single_tile_group_to_string
    tile_group = TileGroup.new
    tile_group.append(:A)
    assert_equal 'A', tile_group.hand
  end

  def test_convert_multi_tile_group_to_string
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    assert_equal 'ABC', tile_group.hand
  end

  def test_convert_multi_tile_group_with_duplicates_to_string
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    assert_equal 'AABC', tile_group.hand
  end
end
