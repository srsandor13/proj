#!/usr/bin/perl

use strict;
use warnings;
use lib '.';
use random_generator;

my $length = 50;
my $random_sequence = "N";

my $gen = random_generator( $length, $random_sequence);
print "$gen\n";


