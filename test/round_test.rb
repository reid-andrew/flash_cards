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
    # skip
    assert_instance_of Round, @round
  end

  def test_it_has_a_deck
    # skip
    assert @round.deck
  end

  def test_it_starts_with_no_turns_taken
    # skip
    assert_equal [], @round.turns
  end

  def test_it_has_a_current_card
    # skip
    assert_equal "Juneau", @round.current_card.answer
  end

  def test_it_takes_a_turn
    # skip
    assert_equal "Juneau", @round.current_card.answer
    assert_equal "Juneau", @round.take_turn("Juneau").guess
    assert_equal "Mars", @round.current_card.answer
  end

  def test_turn_is_a_class
    # skip
    assert_equal Turn, @round.take_turn("Juneau").class
  end

  def test_turn_is_correct
    # skip
      assert_equal true, @round.take_turn("Juneau").correct?
  end

  def test_turns_are_tracked
    # skip
    taken_turn = @round.take_turn("Juneau")
    assert_equal [taken_turn], @round.turns
  end

  def test_multiple_turns_are_tracked
    # skip
    taken_turn1 = @round.take_turn("Juneau")
    taken_turn2 = @round.take_turn("Mars")
    assert_equal [taken_turn1, taken_turn2], @round.turns
  end

  def test_number_correct_is_counted
    # skip
    @round.take_turn("Juneau")
    assert_equal 1, @round.number_correct
  end

  def test_current_card_is_updated
    # skip
    assert_equal "Juneau", @round.current_card.answer
    @round.take_turn("Juneau")
    assert_equal "Mars", @round.current_card.answer
  end

  def test_two_turns_are_taken
    # skip
    @round.take_turn("Juneau")
    assert_equal "Venus", @round.take_turn("Venus").guess
    assert_equal 2, @round.turns.size
  end

  def test_second_answer_gets_negative_feedback
    # skip
    @round.take_turn("Juneau")
    assert_equal "Incorrect.", @round.take_turn("Venus").feedback
  end

  def test_incorrect_answer_doesnt_increment_number_correct
    # skip
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_number_correct
    # skip
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct
  end

  def test_percent_correct
    # skip
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end

  def test_number_correct_by_categories
    # skip
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")

    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 1, @round.number_correct_by_category(:STEM)
    assert_equal 0, @round.number_correct_by_category("Pop Culture")
  end

  def test_percent_correct_by_categories
    # skip
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    @round.take_turn("North north west")

    assert_equal 100.0, @round.percent_correct_by_category(:Geography)
    assert_equal 50.0, @round.percent_correct_by_category(:STEM)
    assert_equal 0.0, @round.percent_correct_by_category("Pop Culture")
  end
end
