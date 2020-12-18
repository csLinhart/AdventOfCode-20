using DelimitedFiles
input = readdlm("D18.txt", '\n', String)

*₁(a, b) = a + b
+₁(a, b) = a * b

function D18(input)
    sum1 = sum2 = 0
    for line in input
        sl1 = split(line, "")
        sl1[sl1 .== "+"] .= "*₁"
        sum1 += eval(Meta.parse(join(sl1)))
        
        sl2 = split(line, "")
        sl2[sl2 .== "*"] .= "+₁"
        sl2[sl2 .== "+"] .= "*₁"
        sum2 += eval(Meta.parse(join(sl2)))
    end
    (sum1, sum2)
end

println(D18(input))
