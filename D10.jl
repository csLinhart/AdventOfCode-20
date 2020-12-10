using DelimitedFiles, DataStructures
input = readdlm("D10.txt", '\n', Int)
input = sort(input, dims=1)
input = [0; input; input[end] + 3]

function D10P1(inp)
    c1 = c3 = 0
    for i = 1:length(inp) - 1
        if inp[i + 1] - inp[i] == 1
            c1 += 1
        elseif inp[i + 1] - inp[i] == 3
            c3 += 1
        end
    end
    c1 * c3
end

function D10P2(inp)
    dd = DefaultDict(0)
    dd[1]=1
    for i = 2:length(inp)
        for j=i:-1:1
            if inp[i] - inp[j] > 3
                break
            end
            dd[i] += dd[j]
        end
    end
    dd[length(inp)-1]
end

println(D10P1(input))
println(D10P2(input))
