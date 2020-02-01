class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def take_turn(string)
    new_turn = Turn.new(string, current_card)
    @turns << new_turn
    @deck.cards.rotate!(1)
    @number_correct += 1 if new_turn.correct?
    return new_turn
  end

  def current_card
    @deck.cards[0]
  end

  def percent_correct
    (@number_correct.to_f / @turns.count * 100).round(2)
  end

  def number_correct_by_category(category)
    @correct_turns = @turns.select do |turn|
      turn.correct? && turn.card.category == category
    end
    @correct_turns.size
  end

  def percent_correct_by_category(category)
    @total_turns_by_category = @turns.select do |turn|
      turn.card.category == category
    end
    if @total_turns_by_category.size == 0
      0.0
    else
      (number_correct_by_category(category) / @total_turns_by_category.size.to_f * 100.0).round(2)
    end
  end
end
