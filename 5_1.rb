


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"

seeds = file.readline.gsub("seeds: ", "").split(" ").map(&:to_i)
found_link = Array.new(seeds.size, false)

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    if line[0] =~ /\d/
      current_map = line.split(" ").map(&:to_i)
      seeds.each_with_index do |seed, i|
        if seed >= current_map[1] && seed < current_map[1] + current_map[2]
          unless found_link[i]
            seeds[i] = seed - current_map[1] + current_map[0]
            found_link[i]=true
          end
        end
      end
    else
      line = file.readline
      found_link.fill(false, 0...seeds.size)
    end
  end
end

puts seeds.min