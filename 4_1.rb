


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
sum = 0
winningNumbers = []
myNumbers = []

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    line = line.gsub(/Card [ 0-9]+:/, "")                                       # eliminates the header
    winningNumbers = line.gsub(/\|[ 0-9]+/, "").split(" ").map(&:to_i)  # puts the winning numbers in an array
    myNumbers = line.gsub(/[ 0-9]+\|/, "").split(" ").map(&:to_i)       # puts my numbers in an array

    winPoints = 0
    winningNumbers.each do |winningNumber|                                # for each winning number,
      myNumbers.each do |myNumber|                                        # checks it against my numbers
        if winningNumber == myNumber
          if winPoints == 0
            winPoints = 1                                                        # if it's the first win, i get a point
          else
            winPoints = winPoints*2                                              # otherwise doubles my current points
          end
        end
      end
    end
    sum += winPoints
  end
end

print sum


