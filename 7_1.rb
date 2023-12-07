


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

five_of_a_kind = []
four_of_a_kind = []
full_house = []
three_of_a_kind = []
two_pair = []
one_pair = []
high_card = []

$card_values = %w[A K Q J T 9 8 7 6 5 4 3 2]

def compare_hands(hand1, hand2)                         # hand comparator
  hand1[0].each_char.with_index do |card1, index|
    card2 = hand2[0][index]

    value1 = $card_values.index(card1)
    value2 = $card_values.index(card2)

    return 1 if value1 > value2
    return -1 if value1 < value2
  end

  0
end

def sort_hands(hands)       # hand sort
  hands.sort! do |hand1, hand2|
    compare_hands(hand1, hand2)
  end
end


line = "true"
sum = 0

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    line = line.split(" ").map(&:to_s)
    remaining_cards = line[0]
    different_cards_amounts = []

    while remaining_cards != ""       # creates an array with the max numbers of same cards
      different_cards_amounts.append(remaining_cards.count(remaining_cards[0]))
      remaining_cards = remaining_cards.gsub(remaining_cards[0], "")
    end

    case different_cards_amounts.max        # horrible switch case of all the possible hand types
    when 5                                  # the hand types are put in different arrays
      five_of_a_kind.append(line)
    when 4
      four_of_a_kind.append(line)
    when 3
      different_cards_amounts.delete(3)
      if different_cards_amounts.max == 2
        full_house.append(line)
      else
        three_of_a_kind.append(line)
      end
    when 2
      if different_cards_amounts.count(2) == 2
        two_pair.append(line)
      else
        one_pair.append(line)
      end
    when 1
      high_card.append(line)
    end
  end
end
sort_hands(five_of_a_kind)    # arrays are sorted
sort_hands(four_of_a_kind)
sort_hands(full_house)
sort_hands(three_of_a_kind)
sort_hands(two_pair)
sort_hands(one_pair)
sort_hands(high_card)

all_hands = five_of_a_kind + four_of_a_kind + full_house + three_of_a_kind + two_pair + one_pair + high_card
# arrays are merged

for i in 0...all_hands.size
  sum += all_hands[i][1].to_i*(all_hands.size-i)    # adds points equal to the rank times the value
end                                                 #   keep in mind the hands are sorted best to worst

print sum
