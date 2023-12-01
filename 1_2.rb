


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

def wordsToNumbers(line)                        # replaces number words with numbers
  line = line.gsub("one", "one1one")                # also prepends and appends the number word not to
  line = line.gsub("two", "two2two")                # preclude finding colliding numbers, e.g. twone
  line = line.gsub("three", "three3three")
  line = line.gsub("four", "four4four")
  line = line.gsub("five", "five5five")
  line = line.gsub("six", "six6six")
  line = line.gsub("seven", "seven7seven")
  line = line.gsub("eight", "eight8eight")
  line = line.gsub("nine", "nine9nine")
  return line
end

line = "true"
sum = 0

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    print line
    line = wordsToNumbers(line)
    line = line.gsub(/[a-z\n]/,"")        # removes letters and newlines
    line = line[0] << line[-1]            # concatenates the first digit with the last
    print line, "\n"
    sum += line.to_i
  end
end

print sum


