require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
    @turn2 = Turn.new("Homer", @card)
  end

  def test_it_exists
    #skip
    assert_instance_of Turn, @turn
  end

  def test_it_has_a_card
    # skip
    assert_instance_of Card, @turn.card
  end

  def test_it_has_a_guess
    # skip
    assert_equal "Juneau", @turn.guess
    assert_equal "Homer", @turn2.guess
  end

  def test_it_is_correct
    # skip
    assert @turn.correct?
    refute @turn2.correct?
  end

  def test_positive_feedback_is_provided
    # skip
    assert_equal "Correct!", @turn.feedback
    assert_equal "Incorrect.", @turn2.feedback
  end
end
