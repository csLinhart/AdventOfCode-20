using DelimitedFiles
input = readdlm("D18.txt", '\n', String)

function D18(input)
    *₂(a, b) = a * b
    *₃(a, b) = a + b
    +₄(a, b) = a * b
    sum1 = sum2 =0
    for line in input
        sl1 = split(line, "")
        sl1[sl1 .== "*"] .= "*₂"
        sl1[sl1 .== "+"] .= "*₃"
        sum1 += eval(Meta.parse(join(sl1)))
        
        sl2 = split(line, "")
        sl2[sl2 .== "*"] .= "+₄"
        sl2[sl2 .== "+"] .= "*₃"
        sum2 += eval(Meta.parse(join(sl2)))
    end
    (sum1, sum2)
end

println(D18(input))
