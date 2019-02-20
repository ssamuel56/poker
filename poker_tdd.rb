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
    assert_equal([], black.hand)
  end

  def test_game_is_a_class
    poker = Game.new
    assert_equal(Game, poker.class)
  end

  def test_that_running_game_makes_players
    poker = Game.new
    assert_equal(Player, poker.white.class)
    assert_equal(Player, poker.black.class)
  end

  def test_that_player_hands_are_accessible
    poker = Game.new
    assert_equal(Array, poker.white.hand.class)
    assert_equal(Array, poker.black.hand.class)
  end

end
