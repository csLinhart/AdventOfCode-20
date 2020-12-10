input = File.read("D10.txt").split().map(&:to_i).sort
input = input.unshift(0).push(input.last+3)

def D10P1(inp)
    c1 = c3 = 0
    for i in 0..(inp.length - 2)
        diff = inp[i + 1] - inp[i]
        c1 += diff == 1 ? 1 : 0
        c3 += diff == 3 ? 1 : 0
    end
    c1 * c3
end

def D10P2(inp)
    dd = Hash.new(0)
    dd[0] = 1
    for i in 1..(inp.length - 1)
        for j in (i-1..0).step(-1) 
            break if inp[i] - inp[j] > 3
            dd[i] += dd[j]
        end
    end
    dd[inp.length - 1]
end

puts D10P1(input)
puts D10P2(input)
