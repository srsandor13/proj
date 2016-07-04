#!/usr/bin/perl
#Question2: Write a CGI that lets a user choose between generating a random 50 nucleotide DNA sequence or a random 50 amino acid protein sequence. Let the user run the programs as many times as she wants.

use strict;
use warnings;

use CGI (':standard');

my $title = 'CGI_3';
print header,
	start_html($title),
	h1 ($title);

if (param('submit')){
	my $select = param( 'select');
	my $seq;
	if ($select eq "DNA") {
		$seq = random_nucl(50);
	}
	else {
		$seq = random_protein(50);
	}
	print p( "$seq\n");
	'<ul>'
}

sub random_protein{
	my (@args) = (@_);
	my $length = $args[0]0;
	if (length(@args) > 1) {
		my $random_size = $args[1];
		chomp $random_size;
		if ($random_size eq "yes") {
		$length = int(rand $length) + 1;
		}
	}

	my @aa = ('G' , 'P' , 'A' , 'V' , 'L' , 'I' , 'M' , 'C' , 'F' , 'Y' , 'W' , 'H' , 'K' , 'R' , 'Q' , 'N' , 'E' , 'D' , 'S' , 'T' );
	my $i=0;
	my $sequeence = '';
	while ($i < $size) {
		my $choice = int(rand @aa);
		$sequence .= $aa[$choice];
		$i++;
	}
}

sub random_DNA {
	
	my (@args) = ( @_ );
        my $length = $args[0];
        if ( length(@args) > 1 ) {
                my $random_length = $args[1];
                chomp $random_length;
                if ( $random_length eq "yes" ) {
                        $length = int( rand $length ) + 1;
                }
        }
        my @bp = ( 'A' , 'T' , 'C' , 'G' );
        my $i = 0;
        my $sequence = '';
        while ( $i < $length ) {
                my $choice = int( rand @bp );
                $sequence .=  $bp[$choice];
                $i++;
        }
        return $sequence
}

my $url = url();
print start(-method => 'GET' , action => $url),
	p("Generate random protein or DNA sequence" . group( - name => 'choice' , -alues => [' DNA' , 'protein' } )),
	p (submit(-name => ' submit' , value => 'submit')),
	end();
	end_html();	
