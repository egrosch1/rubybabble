require 'minitest/autorun'
require_relative '../../tile_group'

class TileGroup::TestInitialize < Minitest::Test
  def test_create_empty_tile_group
    tile_group = TileGroup.new
    assert_empty tile_group.tiles
  end
end
