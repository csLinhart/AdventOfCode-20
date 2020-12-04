input = open("D04.txt")
lines = readlines(input)
lines = vcat(lines, "")

function D04(lines)
    count1 = count2 = cc = 0
    w = []
    for line in lines
        if isempty(line)
            if length(w) == 7
                count1 += 1
                count2 += cc == 7 ? 1 : 0
            end
            w = []
            cc = 0
            continue
        end
        l = split(line, " ")
        l = filter(x -> x[1:3] != "cid", l)
        w = vcat(w, l)

        for e in l
            if e[1:3] == "byr"
                cc += parse(Int, e[5:end]) in 1920:2002 ? 1 : 0
            elseif e[1:3] == "iyr"
                cc += parse(Int, e[5:end]) in 2010:2020 ? 1 : 0
            elseif e[1:3] == "eyr"
                cc += 2020 <= parse(Int, e[5:end]) in 2020:2030 ? 1 : 0
            elseif e[1:3] == "hgt"
                if e[end - 1:end] == "cm"
                    cc +=  parse(Int, e[5:end - 2]) in 150:193 ? 1 : 0
                elseif e[end - 1:end] == "in"
                    cc += parse(Int, e[5:end - 2]) in 59:76 ? 1 : 0
                end
            elseif e[1:3] == "hcl"
                cc += e[5] == '#' && length(e[6:end]) == 6 && length(filter(x -> x in vcat('0':'9', 'a':'f'), e[6:end])) == 6  ? 1 : 0
            elseif e[1:3] == "ecl"
                cc += e[5:end] in ["amb" "blu" "brn" "gry" "grn" "hzl" "oth"] ? 1 : 0
            elseif e[1:3] == "pid"
                cc += length(e[5:end]) == 9 && tryparse(Int, e[5:end]) !== nothing ? 1 : 0
            end
        end
    end
    (count1, count2)
end

println(D04(lines))
