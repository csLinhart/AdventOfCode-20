using DelimitedFiles, StatsBase
input = readdlm("D02.txt", '\n', String)
input = split.(input, " ")

function D02(input)
    count1 = count2 = 0
    for i = 1:length(input)
        pwd = input[i][3]
        cm = countmap([c for c in pwd])
        r = parse.(Int, split(input[i][1], "-"))
        letter = input[i][2][1]
        count1 += occursin(letter, pwd) && cm[letter] in r[1]:r[2] ? 1 : 0
        count2 += xor(pwd[r[1]] == letter, pwd[r[2]] == letter) ? 1 : 0
    end
    (count1, count2)
end

println(D02(input))
