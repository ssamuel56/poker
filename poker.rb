class Deck

  def initialize()

  end

  def cards
    ary = Array.new
    ["C", "D", "H", "S"].each do |s|
      ary << ((2..9).to_a + ["T", "J", "Q", "K", "A"]).map {
        |i| s + i.to_s
      }
    end
    return ary.flatten
  end

end
