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

  def check_high_card(player1, player2)
    [
      self.return_suits(player1)[0] <=> self.return_suits(player2)[0]
    ]
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

  def run_check
    checker.check_high_card(@white, @black)
  end


end
