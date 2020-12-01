using DelimitedFiles, Combinatorics
input = readdlm("D01.txt", Int)

D01(input, n) =
    reduce(*, filter(x -> sum(x) == 2020, collect(combinations(input, n)))[1])

println(D01(input, 2))
println(D01(input, 3))