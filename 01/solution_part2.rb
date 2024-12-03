left = []
right = []

File.read("01/input.txt").each_line do |line|
  a, b = line.split(" ")
  left << a.to_i
  right << b.to_i
end

left = left.sort
right = right.sort

freq = Hash.new(0)
right.each do |n|
  freq[n] += 1
end

score = 0
left.each do |n|
  score += (n * freq[n])
end

puts(score)
