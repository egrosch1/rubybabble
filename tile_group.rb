class TileGroup
  attr_accessor :tiles

  def initialize
    @tiles = []
  end

  def append(tile)
    @tiles << tile
  end

  def remove(tile)
    index = @tiles.index(tile)
    @tiles.delete_at(index) if index
  end

  def hand
    @tiles.join('')
  end

end
