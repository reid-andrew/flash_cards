class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    @cards_in_category = []
    @cards.select do |card|
      @cards_in_category << card if card.category == category
    end
  end


end
