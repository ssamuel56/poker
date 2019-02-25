class Deck

  def cards
    ary = Array.new
    ["C", "D", "H", "S"].each do |s|
      ary << (2..14).to_a.map {
        |i| s + i.to_s
      }
    end
    return ary.flatten
  end

  def shuffle
    return self.cards.shuffle
  end

end



class Player

  attr_accessor :hand

  def initialize
    @hand = []
  end

end

class Checker

  def return_suits(player)
    player_compare = Array.new
    player.hand.length.times do |i|
      player_compare << player.hand[i][1..-1].to_i
    end
    return player_compare.sort.reverse
  end

end



class Game

  attr_accessor :white, :black, :deck, :checker

  def initialize
    @deck = Deck.new.shuffle
    @white = Player.new
    @black = Player.new
    @checker = Checker.new
  end

  def deal
    5.times do
      @white.hand << @deck.delete_at(1)
      @black.hand << @deck.delete_at(1)
    end
  end

  def check_high_card
    [

      @checker.return_suits(@white)[0] <=> @checker.return_suits(@black)[0]
    ]
  end

end
