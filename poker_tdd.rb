require_relative 'poker.rb'
require 'minitest/autorun'

class Test_poker_deck < Minitest::Test

  def test_that_deck_is_array
    assert_equal("", Deck.cards)
  end

end
