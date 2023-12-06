


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

product = 1

time = file.readline.gsub(/Time: +/, "").gsub(/ +/,"").to_i
distance = file.readline.gsub(/Distance: +/, "").gsub(/ +/,"").to_i

  different_ways = 0
  for i in 0..time
    if (time - i)*i > distance
      different_ways += 1
    end
  end

print different_ways


