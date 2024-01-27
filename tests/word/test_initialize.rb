require 'minitest/autorun'
require_relative '../../word'

class Word::TestInitialize < Minitest::Test
  def test_create_empty_word
    word = Word.new
    assert_empty word.tiles
  end
end
