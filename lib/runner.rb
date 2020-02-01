class Runner

  def start
    card_01 = Card.new("What is the capital of Canada?", "Ottawa", :Geography)
    card_02 = Card.new("What is 2 + 2?", "4", :Math)
    card_03 = Card.new("Who is buried in Grant's Tomb?", "Grant", :History)
    card_04 = Card.new("What is 2 * 2?", "4", :Math)
    card_05 = Card.new("What is the capital of British Columbia?", "Victoria", :Geography)
    card_06 = Card.new("Which woman helped found the United Farm Workers?", "Dolores Huerta", :History)

    cards = [card_01, card_02, card_03, card_04, card_05, card_06]
    deck = Deck.new(cards)
    round = Round.new(deck)
    
    card_categories = []
    cards.each {|card| card_categories << card.category}
    unique_card_categories = card_categories.uniq

    puts "\n"+ "\n"+ "Welcome! You're playing with #{deck.count} cards."
    puts "-------------------------------------------------"

    while round.turns.size < deck.count do
      puts "This is card number #{round.turns.size + 1} out of #{deck.count} cards." + "\n"
      puts "Question: #{round.current_card.question}"
      print ">"
      user_input = gets.chomp
      answered_question = round.take_turn(user_input)
      puts answered_question.feedback + "\n" + "\n"
    end

    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{round.turns.size} for a total score of #{round.percent_correct.round(2)}%."
    unique_card_categories.each do |unique_category|
      puts "#{unique_category} Questions - #{round.percent_correct_by_category(unique_category)}%"
    end
    puts "\n" + "\n" + "\n"
  end
end
