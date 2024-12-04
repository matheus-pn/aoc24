text = File.read("03/input.txt")

score = 0
text.scan(/mul\(\d+\,\d+\)/).each do |match|
  a, b = match.scan(/\d+/).map(&:to_i)
  score += a * b
end
puts score

