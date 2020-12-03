input = File.read("C:\\Repos\\AoC\\AoC20\\D01.txt").split().map(&:to_i)

def D01(input, n)
    input.combination(n).select { |x| x.sum == 2020}[0].reduce(:*)
end

puts D01(input, 2)
puts D01(input, 3)
