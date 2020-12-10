using DelimitedFiles, DataStructures
input = readdlm("D10.txt", Int)
input = sort(input, dims=1)
input = [0; input; input[end] + 3]

function D10P1(inp)
    c1 = c3 = 0
    for i = 1:length(inp) - 1
        diff = inp[i + 1] - inp[i]
        c1 += diff == 1 ? 1 : 0
        c3 += diff == 3 ? 1 : 0
    end
    c1 * c3
end

function D10P2(inp)
    dd = DefaultDict(0)
    dd[1] = 1
    for i = 2:length(inp)
        for j = i:-1:1
            if inp[i] - inp[j] > 3
                break
            end
            dd[i] += dd[j]
        end
    end
    dd[length(inp) - 1]
end

println(D10P1(input))
println(D10P2(input))
