using DelimitedFiles, Combinatorics
input = readdlm("D14.txt", '\n', String)

function D14P1(input)
    dic = Dict()
    mask = ""
    for line in input
        line = split(line, " ")
        if line[1] == "mask"
            mask = line[end]
        else
            pos = line[1][5:end - 1]
            num = string(parse(Int, line[3]), base=2, pad=36)
            num = split(num, "")
            for i = 1:length(num)
                if mask[i] != 'X'
                    num[i] = string(mask[i])
                end
            end
            dic[pos] = parse(Int, join(num), base=2)
        end
    end
    sum(values(dic))
end


function D14P2(input)
    dic = Dict()
    mask = ""
    for line in input
        line = split(line, " ")
        if line[1] == "mask"
            mask = line[end]
        else
            num = parse(Int, line[3])
            arr = []
            c = 0
            pos = string(parse(Int, (line[1][5:end - 1])), base=2, pad=36)
            pos = split(pos, "")
            for i = 1:length(pos)
                if mask[i] == '1'
                    pos[i] = string(mask[i])
                elseif mask[i] == 'X'
                    pos[i] = "X"
                    c += 1
                end
            end

            perms = reverse.(Iterators.product(fill(0:1, c)...))[:]
            poss = []
            for j = 1:length(perms)
                p = findall(x -> x == "X", pos)
                temp = copy(pos)
                for k = 1:length(p)
                    temp[p[k]] = string(perms[j][k])
                end
                push!(poss, parse(Int, join(temp), base=2))
            end
            for l = 1:length(poss)
                dic[poss[l]] = num
            end
        end
    end
    sum(values(dic))
end

display(D14P1(input))
display(D14P2(input))
