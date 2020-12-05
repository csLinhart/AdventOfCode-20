input = File.read("D05.txt").split().map(&:to_s)

def D05(input)
    seats = input.map {|x| x.gsub("F", "0").gsub("B", "1").gsub("L", "0").gsub("R", "1").to_i(2)}
    id = (1..seats.max).select.with_index { |v, i|  seats.include?(i - 1) && seats.include?(i + 1) && !seats.include?(i)}
    [seats.max, id]
end

puts D05(input)
