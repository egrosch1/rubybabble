require 'minitest/autorun'
require_relative '../../tile_rack'

class TileRack::TestHasTilesFor < Minitest::Test
  def setup
    @tile_rack = TileRack.new
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:C)
  end

  def test_rack_has_letters_when_letters_are_in_order_no_duplicates
    assert @tile_rack.has_tiles_for?('ABC')
  end

  def test_rack_has_needed_letters_when_letters_are_not_in_order_no_duplicates
    assert @tile_rack.has_tiles_for?('CBA')
  end

  def test_rack_doesnt_contain_any_needed_letters
    refute @tile_rack.has_tiles_for?('XYZ')
  end

  def test_rack_contains_some_but_not_all_needed_letters
    refute @tile_rack.has_tiles_for?('ABCD')
  end

  def test_rack_contains_a_word_with_duplicate_letters
    @tile_rack.append(:A)
    assert @tile_rack.has_tiles_for?('AAB')
  end

  def test_rack_doesnt_contain_enough_duplicate_letters
    refute @tile_rack.has_tiles_for?('AAA')
  end
end
