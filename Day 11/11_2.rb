


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"

$galaxy = []
$empty_rows = []
$empty_cols = []

$sum = 0

def find_paths(line, index)
  sample_galaxy = $galaxy_copy.map(&:clone)
  sample_galaxy[line][index] = "S"
  (0...sample_galaxy.size).each do |i|
    while sample_galaxy[i].include?("#")
      $sum += (i - line).abs + (sample_galaxy[i].index("#")-index).abs
      (0...$empty_cols.size).each do |c|
        if $empty_cols[c].between?(sample_galaxy[i].index("#"), index) || $empty_cols[c].between?(index, sample_galaxy[i].index("#"))
          $sum += 999999
        end
      end
      (0...$empty_rows.size).each do |r|
        if $empty_rows[r].between?(i, line) || $empty_rows[r].between?(line, i)
          $sum += 999999
        end
      end
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
      $empty_rows.append($galaxy.size)
    end
    $galaxy.append(line.gsub("\n","").split(""))
  end
end

$galaxy = $galaxy.transpose
insertions = []
(0...$galaxy.size).each do |i|
  unless $galaxy[i].include?("#")
    $empty_cols.append(i)
  end
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


