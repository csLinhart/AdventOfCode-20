function D23(input, iter)
    i = c = 1
    dc = 0
    while i <= iter
        cc = input[c]
        if c + 3 > length(input)
            tc = vcat(input, input[1:3])[c + 1:c + 3]
        else
            tc = input[c + 1:c + 3]
        end

        j = cc
        while true
            j -= 1
            if j == 0
                j = maximum(input)
            end
            if !(j in tc)
                dc = j
                break
            end
        end

        filter!(e -> !(e in tc), input)
        p = findfirst(x -> x == dc, input)
        input = vcat(input[1:p], tc, input[p + 1:end])

        i += 1
        c = findfirst(x -> x == cc, input) + 1
        c = c > length(input) ? 1 : c
    end
    p1 = findfirst(x -> x == 1, input)
    join(vcat(input[p1 + 1:end], input[1:p1 - 1]))
end

input = "583976241"
input = parse.(Int, split(input, ""))
input2 = vcat(input, maximum(input) + 1:1000000)

println(D23(input, 100))
println(D23(input2, 10000000))
