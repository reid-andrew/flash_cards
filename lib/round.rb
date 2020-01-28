class Round

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def deck
    @deck
  end

  def take_turn(string)
    Turn.new(string, self.current_card)
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end
end
