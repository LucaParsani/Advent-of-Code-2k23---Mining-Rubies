


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    # do something
  end
end



