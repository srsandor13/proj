#!/usr/bin/perl

use strict;
use warnings;

#begin temp prompt
print "Enter a temperature: \n";
my $temp = <STDIN>;

chomp($temp);

#prompt user for conversion
print "Enter the 'F-C' or 'C-F' conversion:\n";
my $conv = <STDIN>;

chomp($conv);

my $cel;
my $fah;

if ($conv eq 'F-C')
{
 $cel = ($temp - 32) * 5/9;
 print "$temp degrees Fahrenheit is $cel degrees Celsius";
}
else {
	print("Error value\n") }
if ($conv eq 'C-F')
{
 $fah = (9 * $temp/5) + 32;
 print "$temp degree Celsius is $fah degree Fahrenheit"; 
}
else{
	print("Error value\n") }

