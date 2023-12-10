


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

def move(pipe, comes_from_direction)
  case pipe
    when "|"
      if comes_from_direction == "u"
        "u"
      else
        "d"
      end
    when "-"
      if comes_from_direction == "l"
        "l"
      else
        "r"
      end
    when "L"
      if comes_from_direction == "u"
        "l"
      else
        "d"
      end
    when "J"
      if comes_from_direction == "l"
        "d"
      else
        "r"
      end
    when "7"
      if comes_from_direction == "l"
        "u"
      else
        "r"
      end
    when "F"
      if comes_from_direction == "d"
        "l"
      else
        "u"
      end
  end
end

line = "true"
terrain = []
x = 0
y = 0

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    terrain.append(line.gsub("\n",""))
    if line.include?("S")
      y = terrain.size-1
      x = line.index("S")
    end
  end
end

comes_from_direction = move("|","d")
y -= 1

steps = 0
while terrain[y][x] != "S"
  comes_from_direction = move(terrain[y][x], comes_from_direction)
  case comes_from_direction
  when "u"
    y += 1
  when "d"
    y -= 1
  when "l"
    x += 1
  when "r"
    x -= 1
  end
  steps += 1
end

print ((steps+1)/2).round
