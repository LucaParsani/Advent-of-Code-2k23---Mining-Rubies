


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"

seeds = file.readline.gsub("seeds: ", "").split(" ").map(&:to_i)  # puts the seeds in an array
found_link = Array.new(seeds.size, false)                                 # initializes an array of flags that indicate
                                                                          #   if the object was mapped in this iteration
while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    if line[0] =~ /\d/                                                      # tries to map the object if the line begins with a number
      current_map = line.split(" ").map(&:to_i)                     # puts the map elements in an array
      seeds.each_with_index do |seed, i|
        if seed >= current_map[1] && seed < current_map[1] + current_map[2] # if it's mappable
          unless found_link[i]                                              # and it's not been already mapped
            seeds[i] = seed - current_map[1] + current_map[0]               # substitutes the value with the value it's mapped to
            found_link[i]=true                                              # and sets the flag to true
          end
        end
      end
    else
      line = file.readline                                                  # if the line doesn't begin with a number, it means it's a new map
      found_link.fill(false, 0...seeds.size)                                # so it sets all flags to false
    end
  end
end

puts seeds.min                                                              #prints the minimum distance