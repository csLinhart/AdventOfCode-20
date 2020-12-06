using StatsBase
lines = readlines("D06.txt")
lines = vcat(lines, "")

function D06(lines)
    v = []
    count1 = count2 = c = 0
    for line in lines
        if isempty(line)
            uv= unique(v)
            count1 += length(uv)
            cm = countmap([c for c in v])
            count2 += length(filter( x -> x[2] == c, cm))
            c = 0
            v=[]
            continue
        end
        v= vcat(split(line, ""), v)
        c += 1
    end
    (count1, count2)
end

println(D06(lines))
