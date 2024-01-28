require 'minitest/autorun'
require_relative '../../tile_rack'

class TileRack::TestRemoveWord < Minitest::Test
  def setup
    @tile_rack = TileRack.new
    @tile_rack.append(:A)
    @tile_rack.append(:B)
    @tile_rack.append(:C)
  end

  def test_can_remove_a_word_whose_letters_are_in_order_on_the_rack
    word = @tile_rack.remove_word('ABC')
    assert_equal [:A, :B, :C], word.tiles
  end

  def test_can_remove_a_word_whose_letters_are_not_in_order_on_the_rack
    word = @tile_rack.remove_word('CBA')
    assert_equal [:C, :B, :A], word.tiles
  end

  def test_can_remove_word_with_duplicate_letters
    @tile_rack.append(:A)
    word = @tile_rack.remove_word('AAB')
    assert_equal [:A, :A, :B], word.tiles
  end

  def test_can_remove_word_without_removing_unneeded_duplicate_letters
    @tile_rack.append(:A)
    word = @tile_rack.remove_word('AAB')
    assert_equal [:A, :A, :B], word.tiles
    assert_equal [:C], @tile_rack.tiles
  end
end
