require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

class RoundTest < Minitest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
  end

  def test_it_exists
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    assert @round.deck
  end

  def test_it_starts_with_no_turns_taken
    assert_equal [], @round.turns
  end

  def test_it_has_a_current_card
    assert_equal @card_1, @round.current_card
  end

  def test_it_takes_turns
    taken_turn = @round.take_turn("Juneau")
    assert_equal "Juneau", taken_turn.guess
    assert_equal 1, @round.turns.size
    assert_equal [taken_turn], @round.turns

    taken_turn_two = @round.take_turn("Pluto")
    assert_equal "Pluto", taken_turn_two.guess
    assert_equal 2, @round.turns.size
    assert_equal [taken_turn, taken_turn_two], @round.turns
  end

  def test_turn_is_a_class
    assert_equal Turn, @round.take_turn("Juneau").class
    assert_equal Turn, @round.take_turn("Pluto").class
  end

  def test_current_card_updates_when_turn_taken
    assert_equal @card_1, @round.current_card
    @round.take_turn("Juneau")
    assert_equal @card_2, @round.current_card
    @round.take_turn("Pluto")
    assert_equal @card_3, @round.current_card
  end

  def test_if_turn_is_correct
      assert_equal true, @round.take_turn("Juneau").correct?
      assert_equal false, @round.take_turn("Pluto").correct?
  end

  def test_if_feedback_is_provided
    assert_equal "Correct!", @round.take_turn("Juneau").feedback
    assert_equal "Incorrect.", @round.take_turn("Pluto").feedback
  end

  def test_total_number_correct_is_counted_correctly
    assert_equal 0, @round.number_correct
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
    @round.take_turn("Pluto")
    assert_equal 1, @round.number_correct
    @round.take_turn("North north west")
    assert_equal 2, @round.number_correct
  end

  def test_total_percent_correct_is_calculated_correctly
    @round.take_turn("Juneau")
    assert_equal 100.0, @round.percent_correct
    @round.take_turn("Pluto")
    assert_equal 50.0, @round.percent_correct
    @round.take_turn("North north west")
    assert_equal 66.67, @round.percent_correct
  end

  def test_number_correct_by_categories_is_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 1, @round.number_correct_by_category(:STEM)
    assert_equal 0, @round.number_correct_by_category("Pop Culture")
  end

  def test_percent_correct_by_categories_is_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
    assert_equal 0.0, @round.percent_correct_by_category("Pop Culture")
  end
end
