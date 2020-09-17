# blackjack_score.rb

VALID_CARDS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

def blackjack_score(hand)
  #hand is an array
  scores = 0
  hand = hand.map do |card|
    if card.class == String
      card.downcase!
    else
      card
    end
  end

  hand.each do |card| # do each
    if (2..10).to_a.include? (card)
      scores += card
    elsif card.class == String and ['jack', 'queen', 'king'].include? (card.downcase)
      scores += 10
    elsif card.class == String and card.downcase == 'ace'
      scores += 0
    else
      raise ArgumentError.new("Invalid Card")
    end
  end

  if  hand.include? ('ace')
    if (scores + 11) > 21
      scores += 1
    elsif (scores + 11) <= 21
      scores += 11
    end
  end

#   if scores > 21
#     raise ArgumentError
#
#   elsif hand.length > 5
#     raise ArgumentError
#   end
#
  return scores
end
