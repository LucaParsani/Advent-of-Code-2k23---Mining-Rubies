


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
sum = 0

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    line = line.split(" ")
    line = line.map { |number|
      number.to_i
    }

    analysis = [[]]
    analysis[0] = line

    iteration = 0
    flag = true

    while flag
      analysis[iteration+1] = []
      (0...analysis[iteration].size - 1).each do |i|
        analysis[iteration+1].append(analysis[iteration][i+1] - analysis[iteration][i])
      end

      iteration+=1

      flag = false
      analysis[iteration].each do |number|
        unless number == 0
          flag = true
        end
      end
    end

    analysis[iteration].append(0)
    rollback_iteration = iteration - 1
    (1..iteration).each do |i|
      analysis[rollback_iteration].append(analysis[rollback_iteration][analysis[rollback_iteration].size-1]+analysis[rollback_iteration+1][analysis[rollback_iteration+1].size-1])
      rollback_iteration -= 1
    end
  end
  sum += analysis[0][analysis[0].size-1]
end

print sum



