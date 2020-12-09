using DelimitedFiles, Combinatorics
input = readdlm("D09.txt", '\n', Int)

function D09P1(input)
    for i = 26:length(input)
        v = input[i - 25:i - 1]
        c = combinations(v, 2)
        s = sum.(c)
        if !(input[i] in s)
            return input[i]
        end
    end
end

function D09P2(input)
    n = D09P1(input)
    for i = 1:length(input)
        for j = 1:length(input)
            s = sum(input[i:j])
            if s == n
                return minimum(input[i:j]) + maximum(input[i:j])
            end
        end
    end
end

println(D09P1(input))
println(D09P2(input))
