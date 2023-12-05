


def search_seed(seed)
  file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")
  line = file.readline
  found_link = false
  while line
    begin
      line = file.readline
    rescue EOFError
      break
    else
      if line[0] =~ /\d/
        current_map = line.split(" ").map(&:to_i)
        if seed >= current_map[1] && seed < current_map[1] + current_map[2]
          unless found_link
            seed = seed - current_map[1] + current_map[0]
            found_link = true
          end
        end
      else
        line = file.readline
        found_link = false
      end
    end
  end
  seed
end

file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")
seeds_line = file.readline.gsub("seeds: ", "").split(" ").map(&:to_i)
min_distance = Float::INFINITY
i = 0
until i == seeds_line.size
  (0...seeds_line[i + 1]).each { |j|
    distance = search_seed(seeds_line[0] + j)
    if distance < min_distance
      min_distance = distance
    end
  }
  i += 2
end

print min_distance


