


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

product = 1


time = file.readline.gsub(/Time: +/, "").split(/ +/).map(&:to_i)
distance = file.readline.gsub(/Distance: +/, "").split(/ +/).map(&:to_i)

time.each_with_index do |time, race|
  different_ways = 0
  for i in 0..time
    if (time - i)*i > distance[race]
      different_ways += 1
    end
  end
  product *= different_ways
end

print product


