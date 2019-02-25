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

  def test_that_game_player_hands_are_accessible
    poker = Game.new
    assert_equal(Array, poker.white.hand.class)
    assert_equal(Array, poker.black.hand.class)
  end

  def test_game_deck_is_array
    poker = Game.new
    assert_equal(Array, poker.deck.class)
  end

  def test_game_deck_is_52_cards
    poker = Game.new
    assert_equal(52, poker.deck.count)
  end

  def test_deal_game_deals_cards
    poker = Game.new
    poker.deal
    assert_equal(5, poker.white.hand.count)
    assert_equal(5, poker.black.hand.count)
  end

  def test_that_player_hands_are_different
    poker = Game.new
    poker.deal
    refute(poker.black.hand == poker.white.hand)
  end

  def test_cards_are_being_removed_from_deck
    poker = Game.new
    poker.deal
    assert_equal(42, poker.deck.count)
  end

  def test_for_high_card
    poker = Game.new
    poker.deal
    poker.white.hand = ["D9", "S5", "H8", "H12", "S7"]
    poker.black.hand = ["C12", "C5", "S2", "D6", "D7"]
    assert_equal(
      [0],
      poker.checker.check_high_card(poker.white, poker.black)
    )
  end

  def test_for_high_card_with_match
    poker = Game.new
    poker.deal
    poker.white.hand = ["C14", "C11", "C10", "S2", "D7"]
    poker.black.hand = ["S5", "S9", "D9", "H14", "H12"]
    print poker.deck
    assert_equal(
      [0],
      poker.checker.check_high_card(poker.white, poker.black)
    )
  end

  def test_return_suits_return_sorted_array
    poker = Game.new
    poker.deal
    poker.white.hand = ["D9", "S5", "H8", "H12", "S7"]
    poker.black.hand = ["C12", "C5", "S2", "D6", "D7"]
    assert_equal([12, 9, 8, 7, 5], poker.checker.return_suits(poker.white))
    assert_equal([12, 7, 6, 5, 2], poker.checker.return_suits(poker.black))
  end

end
