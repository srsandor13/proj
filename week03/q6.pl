#!/usr/bin/perl

#Question 6: Write a regexp debugger: Code which asks for a regular expression, then tests inputs against that regular expression and reports whether or not they match. It should also support an 'exit' command to allow quitting


use strict;
use warnings;

my $file = "./q6_Output";

print "Enter regexp: ";
my $regex = <STDIN>;
chomp $regex;

my $exit = 0;
while ( $exit == 0 ) {
        print "Enter string or type 'exit': ";
        my $input = <STDIN>;
        chomp $input;
        unless ( $input =~ /exit/ ) {
                if ( $input =~ /$regex/ ) {
                        print "There is a math!\n";
                } else {
                        print "There is no match!\n";
                }
        } else {
                print "Exiting now\n";
                $exit = 1;
        }
}
