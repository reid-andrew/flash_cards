require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_instance_of Card, card
  end

  def test_it_has_a_question
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "What is the capital of Alaska?", card.question
  end

  def test_it_has_another_question
    # skip
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_equal "Which planet is closest to the sun?", card.question
  end

  def test_it_has_an_answer
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal "Juneau", card.answer
  end

  def test_it_has_another_answer
    # skip
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_equal "Mercury", card.answer
  end

  def test_it_has_a_category
    # skip
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

    assert_equal :Geography, card.category
  end

  def test_it_has_another_category
    # skip
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)

    assert_equal :STEM, card.category
  end
end
