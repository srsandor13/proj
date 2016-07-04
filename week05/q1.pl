#!/usr/bin/perl
#Question 1: Write a function which takes two arrays as arguments (passed by reference) and returns a reference to an array of arrays, consisting of the products of the elements of the two arrays. Write a script that uses the function and then prints out the resulting matrix.


use strict;
use warnings;

my $file = "./q1_Output";
open ( my $OUT , '>' , $file ) or die ("Can't open this $file ($!)" );

my @array1 = (1, 2, 3);
my $reference1 = \@array1;
my @array2 = (2, 4, 6);
my $reference2 = \@array2;

my $output = array_output(\@array1, \@array2);
for my $array (@$output) {
	for ( @$array ) {
		print $_. " ";
		print $OUT $_. " ";
	}
	print "\n";
	print $OUT "\n";
}

close ($OUT);

sub array_output {
	my ($array1, $array2 ) = @_;
	my $size_1 = @$array1;
	my $size_2 = @$array2;
	if ($size_1 == $size_2 ) {
		my @ArrayofArray;
		for (my $i = 0; $i < $size_1 ; $i++) {
			for (my $j = 0; $j < $size_1 ; $j++) {
				my $array_product = $array1->[$i]*$array2->[$j];
				$ArrayofArray[$i][$j] = $array_product;
			}
		}
		my $ArrayofArray_1 = \@ArrayofArray;
		return $ArrayofArray_1;
	}
}

