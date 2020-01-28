class Round

  def initialize(deck)
    @deck = deck
    @turns = []
    # @number_correct = 0
  end

  def deck
    @deck
  end

  def take_turn(string)
    new_turn = Turn.new(string, self.current_card)
    @turns << new_turn
    @deck.cards.rotate!(1)
    return new_turn
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end
end
