
reports = []
File.read("02/input.txt").each_line do |line|
  reports << line.split(" ").map(&:to_i)
end

def test_report(report)
  unsafe_levels = count_up = count_down = 0
  report.each_index do |i|
    a = report[i]
    b = report[i+1]
    break if b.nil?
  
    dif = a - b
    abs = dif.abs

    if abs < 1 || abs > 3
      unsafe_levels += 1
    elsif dif > 0
      count_down += 1
    else
      count_up += 1
    end
  end
  wrong_direction = [count_down, count_up].min

  wrong_direction + unsafe_levels == 0
end

safe_count = 0
reports.each do |report|
  if test_report(report)
    safe_count += 1
    next
  end

  recovered = report.each_index.any? do |problem_index|
    new_report = report.select.with_index { |_, i| i != problem_index }
    test_report(new_report)
  end

  safe_count += 1 if recovered
end

puts(safe_count)
