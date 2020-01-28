class Turn

  def initialize(string, card)
    @card = card
    @guess = string
  end

  def guess
    @guess
  end

  def card
    @card
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
