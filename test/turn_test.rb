require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require '.lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists
    #skip
    turn = Turn.new("Fairbanks", card)

    assert_instance_of Turn, turn
  end
end
