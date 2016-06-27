#!/usr/bin/perl 
## Question 4: Use Test::Simple to produce a simple test framework that exercises the module from the previous questions.

use strict;
use warnings;

use lib '.';
use random_generator;
use Test::Simple tests => 1;


my $length = 50;
my $random_length = "N";
my $gen = random_generator($length, $random_length);
print "$gen\n";
ok( length ($gen) > 10 , "Sequence generated is > than 10bp!");


