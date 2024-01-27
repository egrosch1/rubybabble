require 'minitest/autorun'
require_relative '../../word'

class Word::TestScore < Minitest::Test
  def test_empty_word_should_have_score_of_zero
    word = Word.new
    assert_equal 0, word.score
  end

  def test_score_a_one_tile_word
    word = Word.new
    word.append(:A)
    assert_equal TileBag.points_for(:A), word.score
  end

  def test_score_a_word_with_multiple_different_tiles
    word = Word.new
    word.append(:A)
    word.append(:B)
    word.append(:C)
    assert_equal TileBag.points_for(:A) + TileBag.points_for(:B) + TileBag.points_for(:C), word.score
  end

  def test_score_a_word_with_recurring_tiles
    word = Word.new
    word.append(:A)
    word.append(:A)
    word.append(:B)
    assert_equal TileBag.points_for(:A) + TileBag.points_for(:A) + TileBag.points_for(:B), word.score
  end
end
