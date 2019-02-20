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



class Game

  attr_accessor :white, :black, :deck

  def initialize
    @deck = Deck.new.shuffle
    @white = Player.new
    @black = Player.new
  end

end
