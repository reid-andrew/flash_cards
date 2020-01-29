require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'

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
puts "This is card number #{round.turns.size + 1} out of #{deck.count} cards."
puts
puts "Question: #{round.current_card.question}"
user_input = gets.chomp
answered_question = round.take_turn(user_input)
puts answered_question.feedback
