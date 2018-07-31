#!/usr/bin/env python3

expsz  = 4    # number of bits in the exponent
wordsz = 8    # number of bits in the word

# no config below
# how many bits in the mantissa
mansz = wordsz - 2 - expsz   # please ensure mansz >= 1

# print bits allocation
print(f"{wordsz}b allocation: [1b sign] [{mansz}b mantissa] "\
    f"[1b exp sign] [{expsz}b exponent]\n")

# compute largest positive number
#  compute mantissa
maxman = (1 << mansz) - 1    # number of binary 1's right of radix
manval = 1 + (maxman / (1 << mansz))    # convert to floating
print(f"max mantissa = 1.{maxman:b}b -> {manval:f}")
#  compute exponent
maxexp = (1 << expsz) - 1    # largest exponent
expval = 2 ** maxexp         # raise to power of 2
print(f"max exponent = {maxexp:b}b "\
    f"-> 2^{maxexp:b}b = {expval:f}")
maxval = manval * expval     # largest positive value
print(f"max value = mantissa * exponent = "\
    f"{manval:f} * {expval:f} -> {maxval:f}\n")

# compute smallest positive number
#  compute mantissa
minman = 0    # all mantissa is zero for smallest number
manval = 1    # the smallest mantissa is 1.0
print(f"min mantissa = 1.{minman:b}b -> {manval:f}")
#  compute exponent
minexp = (1 << expsz) - 1
expval = 2 ** - minexp       # smallest exponent is less than 1.0
print(f"min exponent = -{minexp:b}b -> "\
    f"2^-{minexp:b}b = {expval:g}")
minval = manval * expval     # smallest positive value
print(f"min value = mantissa * exponent = "\
    f"{manval:f} * {expval:g} -> {minval:g}\n")
