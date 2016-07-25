#!/usr/bin/perl

use stict;
use warnings;


package Restriction_Enzyme;

my %enzyme = (
	_name => '' ,
	_manufacturer => '' ,
	_recog_site => '' ,
	_length = > '',
);

my $obj = bless \%enzyme, 'Enzyme';

print "OBJ:" ref($obj), "\n";
print "ENZYME:", ref(\%enzyme), "\n";

