# tile_rack.rb

require_relative 'tile_group'
require_relative 'word'

class TileRack < TileGroup
  def number_of_tiles_needed
    [0, 7 - @tiles.length].max
  end

  def has_tiles_for?(text)
    available_tiles = @tiles.dup

    text.each_char do |char|
      index = available_tiles.index(char.to_sym)
      return false unless index

      available_tiles.delete_at(index)
    end

    true
  end

  def remove_word(text)
    return unless has_tiles_for?(text)

    removed_tiles = []
    text.each_char do |char|
      index = @tiles.index(char.to_sym)
      removed_tiles << @tiles.delete_at(index)
    end

    Word.new(removed_tiles)
  end
end
