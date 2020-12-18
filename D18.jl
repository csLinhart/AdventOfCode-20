*₁(a, b) = a + b
+₁(a, b) = a * b

function D18(input)
    sum1 = sum2 = 0
    for line in input
        l1 = replace(line, "+" => "*₁")
        sum1 += eval(Meta.parse(l1))
        
        sl2 = split(line, "")
        sl2[sl2 .== "*"] .= "+₁"
        sl2[sl2 .== "+"] .= "*₁"
        sum2 += eval(Meta.parse(join(sl2)))
    end
    (sum1, sum2)
end

input = readlines("D18.txt")
println(D18(input))
