require 'minitest/autorun'
require_relative '../../tile_group'

class TileGroup::TestRemove < Minitest::Test
  def test_remove_only_tile
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.remove(:A)
    assert_empty tile_group.tiles
  end

  def test_remove_first_tile_from_many
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    tile_group.append(:D)
    tile_group.remove(:A)
    assert_equal [:B, :C, :D], tile_group.tiles
  end

  def test_remove_last_tile_from_many
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    tile_group.append(:D)
    tile_group.remove(:D)
    assert_equal [:A, :B, :C], tile_group.tiles
  end

  def test_remove_middle_tile_from_many
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    tile_group.append(:D)
    tile_group.remove(:C)
    assert_equal [:A, :B, :D], tile_group.tiles
  end

  def test_remove_multiple_tiles
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    tile_group.append(:D)
    tile_group.remove(:D)
    tile_group.remove(:B)
    assert_equal [:A, :C], tile_group.tiles
  end

  def test_make_sure_duplicates_are_not_removed
    tile_group = TileGroup.new
    tile_group.append(:A)
    tile_group.append(:A)
    tile_group.append(:B)
    tile_group.append(:C)
    tile_group.append(:D)
    tile_group.remove(:A)
    assert_equal [:A, :B, :C, :D], tile_group.tiles
  end
end
