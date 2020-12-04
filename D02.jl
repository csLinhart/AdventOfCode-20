using DelimitedFiles, StatsBase
println(length(filter(line -> occursin(line[2][1], line[3]) && countmap([c for c in line[3]])[line[2][1]] in parse.(Int, split(line[1], "-"))[1]:parse.(Int, split(line[1], "-"))[2], split.(readdlm("D02.txt", '\n', String), " "))))
println(length(filter(line -> xor(line[3][parse.(Int, split(line[1], "-"))[1]] == line[2][1], line[3][parse.(Int, split(line[1], "-"))[2]] == line[2][1]), split.(readdlm("D02.txt", '\n', String), " "))))
