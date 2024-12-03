left = []
right = []

File.read("01/input.txt").each_line do |line|
  a, b = line.split(" ")
  left << a.to_i
  right << b.to_i
end

left = left.sort
right = right.sort

sum = 0
left.each_index do |i|
  sum += (left[i] - right[i]).abs
end

puts(sum)
