require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

class Runner
  def initialize
  end

  def start
    card_01 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    card_02 = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    card_03 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)

    cards = [card_01, card_02, card_03]
    deck = Deck.new(cards)
    round = Round.new(deck)

    puts
    puts
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    while round.turns.size < deck.count do
      puts "This is card number #{round.turns.size + 1} out of #{deck.count} cards."
      puts
      puts "Question: #{round.current_card.question}"
      user_input = gets.chomp
      answered_question = round.take_turn(user_input)
      puts answered_question.feedback
      puts
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.turns.size} for a total score of #{round.percent_correct.round(2)}%."
    puts "STEM Questions - #{round.number_correct_by_category(:STEM)}"
    puts "Geography Questions - #{round.number_correct_by_category(:Geography)}"
    puts
    puts
  end
end

runner = Runner.new
runner.start
