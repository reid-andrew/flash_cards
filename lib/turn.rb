class Turn
  attr_reader :card, :guess

  def initialize(string, card)
    @card = card
    @guess = string
  end

  def correct?
    if @guess == card.answer
      true
    else
      false
    end
  end

  def feedback
    if self.correct? == true
      "Correct!"
    else
      "Incorrect."
    end
  end
end
