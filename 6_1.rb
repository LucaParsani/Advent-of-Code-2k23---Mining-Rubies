


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

product = 1

time = file.readline.gsub(/Time: +/, "").split(/ +/).map(&:to_i)          # puts the times in an array
distance = file.readline.gsub(/Distance: +/, "").split(/ +/).map(&:to_i)  # puts the distances in an array

time.each_with_index do |time, race|
  different_ways = 0
  for i in 0..time
    if (time - i)*i > distance[race]  # speed is i (= time spent pushing), and time spent travelling
      different_ways += 1             #   is time-i, so distance travelled is (time - i)*i
    end
  end
  product *= different_ways
end

print product


