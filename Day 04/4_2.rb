


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
cards = 0

cardCopies = []
cardCopies.fill(0, 0..203)

winningNumbers = []
myNumbers = []

while line
  cards += 1
  begin
    line = file.readline
  rescue EOFError
    break
  else
    line = line.gsub(/Card [ 0-9]+:/, "")                                       # eliminates the header
    winningNumbers = line.gsub(/\|[ 0-9]+/, "").split(" ").map(&:to_i)  # puts the winning numbers in an array
    myNumbers = line.gsub(/[ 0-9]+\|/, "").split(" ").map(&:to_i)       # puts my numbers in an array

    winPoints = 0
    winningNumbers.each do |winningNumber|                               # for each winning number,
      myNumbers.each do |myNumber|                                       # checks it against my numbers
        if winningNumber == myNumber
          winPoints = 1                                                         # if it's a win, i get a point
        end
      end
    end
    for i in 1..winPoints
      cardCopies[cards+i] += 1+cardCopies[cards]                                # i get a number of different cards equal to the number of points,
    end                                                                         #   each in a number of copies equal to 1 + the copies of this ticket
  end
end

cards -= 1                                                                      # i remove the card added in the last iteration of the file reading, because i's not really
                                                                                #   a card, i's an EOF
cardCopies.each do |card|
  cards += card                                                                 # because i already counted the originals, i now count all the copies
end

print cards


