#!/usr/bin/perl 
## Question 4: Use Test::Simple to produce a simple test framework that exercises the module from the previous questions.

use strict;
use warnings;

use random_generator;
use Test::Simple tests => 1;

my $file = "./q4_testOutput";
open( my $OUT , '>' , $file ) or die( "Can't open this $file ($!)" );

sub gen;
my $length = 50;
my $random_length = "N";
my $gen = random_generator($length, $random_length);
ok( $length ($gen)>10, "Sequence generated is > than 10bp!");


