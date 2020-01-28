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
    # @deck.cards.rotate(1)
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end

  # def number_correct
  #   num_corr = 0
  #   @turns.each do |turn|
  #     if turn.correct?
  #       num_corr += 1
  #     end
  #   end
  # end
end
