require 'spellchecker'
require 'tempfile'
require_relative 'tile_rack'
require_relative 'tile_bag'

class Babble
  def initialize
    @tile_rack = TileRack.new
    @tile_bag = TileBag.new
    @total_score = 0
  end

  def run
    until false
      replenish_rack(@tile_bag)
      display_rack_and_score
      print "Enter a word (or :quit to exit): "
      input = gets.chomp

      break if input.downcase == ':quit'

      if valid_word?(input)
        if @tile_rack.has_tiles_for?(input)
          if remove_tiles_from_rack(input)
            score = calculate_score(input)
            puts "You made #{input} for #{score} points"
            @total_score += score
          else
            puts "Error removing tiles from rack"
          end
        else
          puts "Not enough tiles"
        end
      else
        puts "Not a valid word"
      end
    end

    puts "Thanks for playing, total score: #{@total_score}"
  end

  private

  def replenish_rack(tile_bag)
    needed_tiles = @tile_rack.number_of_tiles_needed

    needed_tiles.times do
      @tile_rack.append(@tile_bag.drawTile)
    end
  end

  def display_rack_and_score
    puts "Current Rack: #{@tile_rack.hand}"
    puts "Total Score: #{@total_score}"
  end

  def valid_word?(word)
    Spellchecker::check(word)[0][:correct]
  end

  def calculate_score(word)
    word.chars.map { |tile| TileBag.points_for(tile.to_sym) }.sum
  end

  def remove_tiles_from_rack(word)
    word.chars.each do |char|
      return false unless @tile_rack.remove(char.to_sym)
    end
    true
  end
end

Babble.new.run
