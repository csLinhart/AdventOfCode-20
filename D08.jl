using DelimitedFiles
input = readdlm("D08.txt", '\n', String)

function D08P1(input)
    i = 1
    count = 0
    v = []
    while true
        line = input[i]
        num = parse(Int, line[5:end])
        if line[1:3] == "acc"
            count += num
            i += 1
        elseif line[1:3] == "jmp"
            i += num
        elseif line[1:3] == "nop"
            i += 1
        end
        if i in v
            return count
        end
        push!(v, i)
    end
end

function D08P2(input)
    for j = 1:length(input)
        i = 1
        count = 0
        v = []
        b = 0
        inp = copy(input)
        if inp[j][1:3] == "jmp"
            inp[j] = "nop" * inp[j][4:end]
        elseif inp[j][1:3] == "nop"
            inp[j] = "jmp" * inp[j][4:end]
        else
            continue
        end
        while true
            line = inp[i]
            num = parse(Int, line[5:end])
            if line[1:3] == "acc"
                count += num
                i += 1
            elseif line[1:3] == "jmp"
                i += num
            elseif line[1:3] == "nop"
                i += 1
            end
            if i in v
                b = 1
                break
            end
            if i > length(inp)
                break
            end
            push!(v, i)
        end
        if b == 0
            return count
        end
    end
end
println(D08P1(input))
println(D08P2(input))
