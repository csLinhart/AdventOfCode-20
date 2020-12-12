using DelimitedFiles
input = readdlm("D12.txt", '\n', String)

function D12(input)
    dir = [0,1]
    pos1 = pos2 = [0,0]
    wp = [1, 10]
    for line in input
        a = line[1]
        n = parse(Int, line[2:end])
        if a == 'N'
            pos1 += [1,0] * n
            wp += [1,0] * n
        elseif a == 'S'
            pos1 += [-1,0] * n
            wp += [-1,0] * n
        elseif a == 'E'
            pos1 += [0,1] * n
            wp += [0,1] * n
        elseif a == 'W'
            pos1 += [0,-1] * n
            wp += [0,-1] * n
        elseif a == 'L'
            rl = [cosd(n) sind(n); -sind(n) cosd(n)]
            dir = rl * dir
            wp = rl * wp
        elseif a == 'R'
            rr = [cosd(n) -sind(n); sind(n) cosd(n)]
            dir = rr * dir
            wp = rr * wp
        elseif a == 'F'
            pos1 += dir * n
            pos2 += wp * n
        end
    end
    Int.((sum(abs.(pos1)), sum(abs.(pos2))))
end

display(D12(input))
