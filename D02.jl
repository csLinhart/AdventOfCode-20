using DelimitedFiles, StatsBase
input = readdlm("D02.txt", '\n', String)
input = split.(input, " ")

function D02(input)
    count1 = 0
    count2 = 0
    for i = 1:length(input)
        pwd = input[i][3]
        cm = countmap([c for c in pwd])
        r = parse.(Int, split(input[i][1], "-"))
        letter = input[i][2][1]
        if occursin(letter, pwd) && cm[letter] >= r[1] && cm[letter] <= r[2]
            count1 += 1
        end
        if xor(pwd[r[1]] == letter, pwd[r[2]] == letter)
            count2 += 1
        end
    end
    (count1, count2)
end

println(D02(input))
