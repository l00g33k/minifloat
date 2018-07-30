#!/usr/bin/perl

$expsz  = 4;    # number of bits in the exponent
$wordsz = 8;    # number of bits in the word

# no config below
# how many bits in the mantissa
$mansz = $wordsz - 2 - $expsz;      # please ensure $mansz >= 1

# print bits allocation
print "${wordsz}b allocation: [1b sign] [${mansz}b mantissa] ".
    "[1b exp sign] [${expsz}b exponent]\n\n";

# compute largest positive number
#  compute mantissa
$maxman = (1 << $mansz) - 1;# number of binary 1's right of radix
$manval = 1 + ($maxman / (1 << $mansz));    # convert to floating
printf ("max mantissa = 1.%bb -> %f\n", $maxman, $manval);
#  compute exponent
$maxexp = (1 << $expsz) - 1;    # largest exponent
printf ("max exponent = %bb -> ", $maxexp);
$expval = 2 ** $maxexp;         # raise to power of 2
printf ("2^%bb = %f\n", $maxexp, $expval);
#  print largest positive value
printf ("max value = mantissa * exponent = %f * %f -> %f\n\n", 
    $manval, $expval, $manval * $expval);

# compute smallest positive number
#  compute mantissa
$minman = 0;    # all mantissa is zero for smallest number            
$manval = 1;    # the smallest mantissa is 1.0
printf ("min mantissa = 1.%bb -> %f\n", $minman, $manval);
#  compute exponent
$minexp = (1 << $expsz) - 1;
printf ("min exponent = -%bb -> ", $minexp);
$expval = 2 ** -$minexp;        # smallest exponent is less than 1.0
printf ("2^-%bb = %g\n", $minexp, $expval);
#  print smallest positive value
printf ("min value = mantissa * exponent = %f * %g -> %g\n\n", 
    $manval, $expval, $manval * $expval);
