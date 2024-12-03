
reports = []
File.read("02/input.txt").each_line do |line|
  reports << line.split(" ").map(&:to_i)
end

safe_count = 0
reports.each do |levels|
  safe_margin = true
  count = 0
  levels.each_index do |i|
    a = levels[i]
    b = levels[i+1]
    break if b.nil?
  
    dif = a - b
    abs = dif.abs
    safe_margin = false if abs < 1 || abs > 3
    count += dif > 0 ? 1 : -1
  end
  safe_count += 1 if safe_margin && count.abs == (levels.size - 1)
end

puts(safe_count)
