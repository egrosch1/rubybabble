require_relative 'tile_group'

class Word < TileGroup
  def initialize (tiles = [])
    super()
    @tiles = tiles
  end

  def score
    @tiles.inject(0) { |sum, tile| sum + TileBag.points_for(tile) }
  end
end
