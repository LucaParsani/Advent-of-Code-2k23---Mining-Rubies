


file = File.new("C:\\Users\\luca\\Desktop\\input.txt", "r")

line = "true"
$sum = 0
$schema = []

def examine (row, character)
  gearNumber=1                                                        # counter used to determine if there are two exact gear numbers
  numberOfCogs=0
  for num in -1..1                                                    # iterates through the square surrounding the character
    for otherNum in -1..1
      unless num==0&&otherNum==0
        unless $schema[row+num] == nil
          if $schema[row+num][character+otherNum] =~ /[0-9]/          # if it's a number,
            rightMostDigit = backtrack(row+num, character+otherNum)   #   finds its rightmost digit
            gearNumber = gearNumber*addSum(row+num, rightMostDigit)   #   multiplicates it for 1 or the other gear number
            numberOfCogs+=1                                           #   and segnalates that a cog it's been included
          end
        end
      end
    end
  end
  if numberOfCogs == 2
    $sum += gearNumber
  end
end

def backtrack(row, index)
  i=0
  while $schema[row][index+i+1] =~ /[0-9]/          # finds the last digit
    i+=1
  end
  index+i
end

def addSum(row, rightMostDigit)
  tempSum = 0
  i=0
  while $schema[row][rightMostDigit-i] =~ /[0-9]/
    tempSum+=$schema[row][rightMostDigit-i].to_i*(10**i)        # reconstructs the number
    $schema[row][rightMostDigit-i] = "."                        # erases it to avoid duplication
    i+=1
  end
  tempSum
end

while line
  begin
    line = file.readline
  rescue EOFError
    break
  else
    $schema.append(line.gsub("\n", ""))               # creates an array of strings, a.k.a. matrix of chars
  end
end

$schema.each_with_index do |row, i|       # iterates through rows
  row.each_char.with_index do |character, j|          # iterates through chars in a row
    if character == "*"                               # if the current character is an asterisk
      examine(i,j)                                    #   examines its surroundings
    end
  end
end

print $sum


