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
    if @guess == card.question
      true
    else
      false
    end
  end

  def feedback
    if @correct
      "Correct!"
    else
      "Incorrect."
    end
  end
end
