#!/usr/bin/perl
#Question 1.2.2 Write a second script that uses Storable to read the stored sequences back into memory and then loops over them printing out details about which sequences contain 4mer runs of identical bases (i.e., 4 As, 4 Cs, etc.) (Yes, this is the same as the problem from week 3, only using Storable instead of files.)

use strict;
use warnings;
use Storable;

my $file = "./q2_Output";
open (my $OUT , '>' , $file ) or die ( "cannot open this $file ($!)");

my $read_ref = retrieve( 'q1.2_1');
my $count = 1;
for my $sequence (@$read_ref ) {
	my @bp = ( "A" , "T" , "G" , "C");
	foreach my $nucl (@bp) {
		if ($sequence =~ /$nucl{4,}/) {
			print "4x $nucl is found in $sequence\n";
			print $OUT "$nucl is found in $sequence \n";
		}
	}
}


close($OUT);

