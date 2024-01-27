require 'minitest/autorun'
require_relative '../../tile_group'

class TileGroup::TestAppend < Minitest::Test
  def test_append_one_tile
    tile_group = TileGroup.new
    tile_group.append(:A)
    assert_equal [:A], tile_group.tiles
  end

  def test_append_many_tiles
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    assert_equal [:A, :B, :C], tile_group.tiles
  end

  def test_append_duplicate_tiles
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:A)
    assert_equal [:A, :A], tile_group.tiles
  end
end
