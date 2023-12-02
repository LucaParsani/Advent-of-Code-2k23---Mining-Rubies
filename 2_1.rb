


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

def singleColorNumbers(line, color)
  positions = line.enum_for(:scan, /\d #{color}/).map { Regexp.last_match.begin(0) }
  numberOfCubes = []
  i = 0
  loop do
    if line[positions[i]-1] =~ /\d/
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

game = 0
redCubes = 12
greenCubes = 13
blueCubes = 14

while line
  game+=1
  impossibleFlag = false
  begin
    line = file.readline
  rescue EOFError
    break
  else
    numberOfReds = singleColorNumbers(line,"red")
    numberOfReds.each do |k|
      if k > redCubes
        impossibleFlag = true
      end
    end
    numberOfGreens = singleColorNumbers(line,"green")
    numberOfGreens.each do |k|
      if k > greenCubes
        impossibleFlag = true
      end
    end
    numberOfBlues = singleColorNumbers(line,"blue")
    numberOfBlues.each do |k|
      if k > blueCubes
        impossibleFlag = true
      end
    end
    unless impossibleFlag
      sum += game
    end
  end
end

print sum


