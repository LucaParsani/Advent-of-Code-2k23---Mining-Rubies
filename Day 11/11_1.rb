


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"

$galaxy = []
$sum = 0

def find_paths(line, index)
  sample_galaxy = $galaxy_copy.map(&:clone)
  sample_galaxy[line][index] = "S"
  (0...sample_galaxy.size).each do |i|
    while sample_galaxy[i].include?("#")
      $sum += (i - line).abs + (sample_galaxy[i].index("#")-index).abs
      sample_galaxy[i][sample_galaxy[i].index("#")] = "S"
    end
  end
end

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    unless line.include?("#")
      $galaxy.append(line.gsub("\n","").split(""))
    end
    $galaxy.append(line.gsub("\n","").split(""))
  end
end

$galaxy = $galaxy.transpose
insertions = []
(0...$galaxy.size).each do |i|
  unless $galaxy[i].include?("#")
    insertions.append(i)
  end
end
(0...insertions.size).each do |i|
  $galaxy = $galaxy.insert(insertions[i]+i, $galaxy[insertions[i]+i])
end

$galaxy = $galaxy.transpose
$galaxy_copy = $galaxy.map(&:clone)

(0...$galaxy.size).each do |i|
  while $galaxy[i].include?("#")
    find_paths(i, $galaxy[i].index("#"))
    $galaxy[i][$galaxy[i].index("#")] = "F"
  end
end
print $sum/2


