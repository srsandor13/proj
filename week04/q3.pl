#!/usr/bin/perl
# Place the function from last week's "two argument" random DNA generation question into a module. The module should export the function.

=pod head 1 Description
package 'randomDNAgenerator is a function:
A sequence is to be returned and of a random length <1 basepair and returned length
=cut

use strict;
use warnings;
use lib '.';
use random_generator;

my $length = 50;
my $random_sequence = "N";

my $gen = random_generator( $length, $random_sequence);
print "$gen\n";
