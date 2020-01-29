class Turn
  attr_reader :card, :guess

  def initialize(string, card)
    @card = card
    @guess = string
  end

  def correct?
    @guess == card.answer ? true : false
  end

  def feedback
    @guess == card.answer ? "Correct!" : "Incorrect."
  end
end
