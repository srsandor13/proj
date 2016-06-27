#!/usr/bin/perl 

package random_generator::DNA;
# Place the function from last week's "two argument" random DNA generation questi                                           on into a module. The module should export the function.

use strict;
use warnings;

use Exporter 'import';
our @EXPORT_OK = ( "random" );

my @bases = qw/ A C G T /;
my $length = 50;
  
sub random_sequence {
	my( $length , $random_length ) = @_;
  
	if ( $random_length ) {
		$length = int( rand( $length ));
   	}	
  
    	foreach ( 1 .. $length ) {
      		print $bases[int(rand(4))];
   	}	
    	print "\n";
  }
  
 random_sequence( 50 );
 random_sequence( 50 , 1 );

#use it

