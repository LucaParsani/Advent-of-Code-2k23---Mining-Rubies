


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
sum = 0

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    line = line.gsub(/[a-z\n]/,"")        #removes letters and newlines
    line = line[0] << line[-1]            #concatenates the first digit with the last

    sum += line.to_i
  end
end

print sum


