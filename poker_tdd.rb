require_relative 'poker.rb'
require 'minitest/autorun'

class Test_poker_deck < Minitest::Test

  def test_that_deck_is_array
    deck = Deck.new
    assert_equal(Array, deck.cards.class)
  end

  def test_that_deck_is_52_cards
    deck = Deck.new
    assert_equal(52, deck.cards.count)
  end

  def test_that_shuffled_deck_is_52_cards
    deck = Deck.new
    assert_equal(52, deck.shuffle.count)
  end

  def test_deck_is_random_with_shuffle
    deck = Deck.new
    refute(deck.cards == deck.shuffle)
  end

  def test_player_exist
    black = Player.new
    assert_equal(Player, black.class)
  end

  def test_player_hand_is_array
    black = Player.new
    assert_equal(Class, black.hand)
  end

end
