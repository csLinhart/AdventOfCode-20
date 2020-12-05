using DelimitedFiles
input = readdlm("D05.txt", String)

function D05(input)
    seats=[]
    for line in input
        u = 127
        d = r=  0
        l=7
        for e in line
            if e =='F'
                u = u - (u+1-d)/2
            elseif e =='B'
                d = d + (u+1-d)/2
            elseif e =='R'
                r = r + (l+1-r)/2
            elseif e =='L'
                l = l - (l+1-r)/2
            end
        end
        push!(seats, u* 8 + r )
    end
    m = maximum(seats)
    s=0
    for i=1:m
        if i - 1 in seats && i + 1 in seats && !(i in seats)
            s=i
        end
    end
    (m, s)
end

println(D05(input))
