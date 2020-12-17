using DelimitedFiles, DataStructures

input = readdlm("D02.txt", '\n', String)
input = split.(input, " ")
function D02(input)
    count1 = count2 = 0
    for line in input
        pwd = line[3]
        cm = counter(pwd)
        r = parse.(Int, split(line[1], "-"))
        letter = line[2][1]
        count1 += cm[letter] in r[1]:r[2] ? 1 : 0
        count2 += xor(pwd[r[1]] == letter, pwd[r[2]] == letter) ? 1 : 0
    end
    (count1, count2)
end

println(D02(input))
