using DelimitedFiles
input = readdlm("D03.txt", String)

function D03(input, r, d)
    rl = length(input[1])
    x = y = 1
    count = 0
    while y < length(input)
        x += r
        y += d
        x = x > rl ? x - rl : x
        count += input[y][x] == '#' ? 1 : 0
    end
    count
end

println(D03(input, 3, 1))
println(D03(input, 1, 1) * D03(input, 3, 1) * D03(input, 5, 1) * D03(input, 7, 1) * D03(input, 1, 2))
