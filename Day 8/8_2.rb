


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
$steps = 0
steps_all = []

$directions = file.readline.gsub("\n","")

starting_points = []
forks = []

file.readline

def search(forks, code)             # outputs the next step starting from the given code
  if code == "ZZZ"
    return
  end
  index = 0
  for i in 0...forks.size
    if forks[i][0] == code                              # finds the index of the code between all the forks
      index = i
      break
    end
  end
  direction = $directions[$steps%$directions.size]      # reads the direction based on the number of steps
                                                        #   if it exceeds the length of the directions, uses the remainder
  $steps += 1
  if direction == "L"
    forks[index][1]
  else
    forks[index][2]
  end
end

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    forks.append(line.gsub(/[=(),\n]/,"").split(" "))           # forks are the tuples like <source, left, right>
    if line[2]=="A"
      starting_points.append(line.gsub(/[=(),\n]/," ").gsub(/ +[ 0-9A-Z]+ +/,""))
                                                                        # starting points are the three-letter groups ending with A
    end
  end
end
starting_points.each do |code|            # for every starting point
  while code[2] != "Z"                         # until it finds the first three-letter group ending with Z
    code = search(forks,code)                  # it's not recursive because it would be too much for the stack
  end
  steps_all.append($steps)
  $steps=0
end
print steps_all.reduce(1, :lcm)                # calculates lcm to find when they will converge on points ending with Z


