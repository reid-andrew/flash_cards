class Round

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def deck
    @deck
  end

  def take_turn(string)
    new_turn = Turn.new(string, self.current_card)
    @turns << new_turn
    @deck.cards.rotate!(1)
    if new_turn.correct?
      @number_correct += 1
    end
    return new_turn
  end

  def turns
    @turns
  end

  def current_card
    @deck.cards[0]
  end

  def number_correct
    @number_correct
  end

  def percent_correct
    @number_correct.to_f / @turns.count
  end

  def number_correct_by_category(category)
    @num_corr = 0
    @turns.each do |turn|
      if turn.correct? && turn.card.category == category
        @num_corr += 1
      end
    end
  end

  def percent_correct_by_category(category)
  end
end
