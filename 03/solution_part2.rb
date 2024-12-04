text = File.read("03/input.txt")

score = 0
enabled = true
text.scan(/(mul\(\d+\,\d+\))|(do\(\))|(don\'t\(\))/).each do |match|
  mul, doit, dont = match
  enabled = true if doit
  enabled = false if dont
  next unless enabled && mul

  a, b = mul.scan(/\d+/).map(&:to_i)
  score += a * b
end
puts score

