require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    #skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_card
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Card, turn.card
  end

  def test_it_has_a_guess
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("Homer", card)

    assert_equal "Juneau", turn.guess
    assert_equal "Homer", turn2.guess
  end

  def test_it_is_correct
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("Homer", card)

    assert turn.correct?
    refute turn2.correct?
  end

  def test_positive_feedback_is_provided
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)
    turn2 = Turn.new("Homer", card)

    assert_equal "Correct!", turn.feedback
    assert_equal "Incorrect.", turn2.feedback
  end
end
