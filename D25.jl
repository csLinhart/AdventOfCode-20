function D25(card, door)
    modulus = 20201227 
    exponent = 0
    while powermod(7, exponent, modulus) != card
        exponent += 1
    end
    powermod(door, exponent, modulus)
end

card = 2084668
door = 3704642
print(@time D25(card, door))
