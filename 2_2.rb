


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

def singleColorNumbers(line, color)     # returns an array of all the draws of cubes of the given color in each game
  positions = line.enum_for(:scan, /\d #{color}/).map { Regexp.last_match.begin(0) }
  numberOfCubes = []
  i = 0
  loop do
    if line[positions[i]-1] =~ /\d/     # because the regexp only considers the last digit, if it's a two-digit number i'm also going to consider the first digit
      numberOfCubes[i]=line[positions[i]-1].to_i*10 + line[positions[i]].to_i
    else
      numberOfCubes[i]= line[positions[i]].to_i
    end
    i+=1
    break if i > positions.size-1
  end
  numberOfCubes
end

line = "true"
sum = 0

colors = [["red",12],["green",13],["blue",14]]

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    minimum = 1
    colors.each do |color|
      minColor = 0
      numberOfCubes = singleColorNumbers(line, color[0])
      numberOfCubes.each do |k|         # finds the minimum number of cubes necessary for each color
        if k > minColor
          minColor = k
        end
      end
      minimum = minimum*minColor
    end
    sum += minimum
  end
end

print sum


