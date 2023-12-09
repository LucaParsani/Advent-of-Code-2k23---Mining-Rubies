


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
$steps = 0

$directions = file.readline.gsub("\n","")
forks = []

file.readline

def search(forks, code)             # outputs the next step starting from the given code
  if code == "ZZZ"
    return
  end
  index = 0
  for i in 0...forks.size
    if forks[i][0] == code          # finds the index of the code between all the forks
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
    forks.append(line.gsub(/[=(),\n]/,"").split(" "))     # forks are the tuples like <source, left, right>
  end
end
code = "AAA"
while code != "ZZZ"                                               # iterates until ZZZ is found
  code = search(forks,code)                                       # it's not recursive because it would be too much for the stack
end
print $steps


