require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    #skip
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_a_guess
    skip
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
  end

  def test_it_has_a_card
    skip
  end

  def test_it_is_correct
    skip
  end

  def test_it_is_incorrect
    skip
  end

  def test_feedback_is_provided
    skip
  end

end
