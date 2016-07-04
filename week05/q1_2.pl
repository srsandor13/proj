#!/usr/bin/perl
# Question 1.2 Write a script that generates an array of 10 random DNA 50mers and uses Storable to write them out to disk. Write a second script that uses Storable to read the stored sequences back into memory and then loops over them printing out details about which sequences contain 4mer runs of identical bases (i.e., 4 As, 4 Cs, etc.) (Yes, this is the same as the problem from week 3, only using Storable instead of files.)

use strict;
use warnings;
use Storable;

my @array1;
for (my $i = 0 ; $i < 10 ; $i++ ) {
	$array1[$i]= random_sequence(50);
}

store \@array1, 'q1.2_1';
sub random_sequence{
	my (@args) = (@_);
	my $length = $args[0];
	if ( length(@args) > 1 ) {
		my $random_size = $args[1];
		chomp $random_size;
		if ($random_size eq "yes" ) {
			$length = int(rand $length) + 1;
		}
	}	


	my @aa = ( 'A' , 'T' , 'G' , 'C' );
	my$sequence = ' ';
	my $i = 0;
	while ($i < $length) {
		my $prompt = int (rand @aa);
		$sequence .= $aa[$prompt];
		$i++;
	}
	return $sequence 
}
