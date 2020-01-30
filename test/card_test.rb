require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card2 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
  end


  def test_it_exists
    # skip

    assert_instance_of Card, @card
    assert_instance_of Card, @card2
  end

  def test_it_has_questions
    # skip

    assert_equal "What is the capital of Alaska?", @card.question
    assert_equal "Which planet is closest to the sun?", @card2.question
  end

  def test_it_has_answers
    # skip

    assert_equal "Juneau", @card.answer
    assert_equal "Mercury", @card2.answer
  end

  def test_it_has_categories
    # skip

    assert_equal :Geography, @card.category
    assert_equal :STEM, @card2.category
  end
end
