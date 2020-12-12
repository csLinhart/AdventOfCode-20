using DelimitedFiles
input = readdlm("D12.txt", '\n', String)

function D12(input)
    dir = [0,1]
    pos1 = pos2 = [0,0]
    nsew = Dict('N' => [1,0], 'S' => [-1,0], 'E' => [0,1], 'W' => [0,-1])
    rot(n) = Dict('R' => [cosd(n) -sind(n); sind(n) cosd(n)], 'L' => [cosd(n) sind(n); -sind(n) cosd(n)])
    wp = [1, 10]
    for line in input
        a = line[1]
        n = parse(Int, line[2:end])
        if a in keys(nsew)
            pos1 += nsew[a] * n
            wp += nsew[a] * n
        elseif a in keys(rot(n))
            r = rot(n)[a]
            dir = r * dir
            wp = r * wp
        elseif a == 'F'
            pos1 += dir * n
            pos2 += wp * n
        end
    end
    Int.((sum(abs.(pos1)), sum(abs.(pos2))))
end

display(D12(input))
