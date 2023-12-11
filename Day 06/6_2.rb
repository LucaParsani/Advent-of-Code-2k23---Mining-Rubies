


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

time = file.readline.gsub(/Time: +/, "").gsub(/ +/,"").to_i           # calculates time
distance = file.readline.gsub(/Distance: +/, "").gsub(/ +/,"").to_i   # calculates distance

  different_ways = 0
  for i in 0..time
    if (time - i)*i > distance        # speed is i (= time spent pushing), and time spent travelling
      different_ways += 1             #   is time-i, so distance travelled is (time - i)*i
    end
  end

print different_ways


