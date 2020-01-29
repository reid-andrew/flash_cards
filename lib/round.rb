class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def take_turn(string)
    new_turn = Turn.new(string, self.current_card)
    @turns << new_turn
    @deck.cards.rotate!(1)
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

  def current_card
    @deck.cards[0]
  end

  def percent_correct
    @number_correct.to_f / @turns.count * 100
  end

  def number_correct_by_category(category)
    num_corr = 0
    @turns.each do |turn|
      num_corr += 1 if turn.correct? && turn.card.category == category
    end
    return num_corr
  end

  def percent_correct_by_category(category)
    num_test = 0
    num_corr = 0
    @turns.each do |turn|
      turn.card.category == category ? num_test += 1 : num_test += 0
      turn.correct? == true && turn.card.category == category ? num_corr +=1 : num_corr += 0
      # if turn.card.category == category
      #   num_test += 1
      #   if turn.correct?
      #     num_corr += 1
      #   end
      # end
    end
    if num_test == 0
      return 0.0
    else
      num_corr.to_f / num_test * 100
    end
  end



end
