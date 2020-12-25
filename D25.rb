def D25(card, door)
    modulus = 20201227 
    exponent = 0
    while 7.pow(exponent, modulus) != card
        exponent += 1
    end
    door.pow(exponent, modulus)
end

card = 2084668
door = 3704642
print(D25(card, door))
