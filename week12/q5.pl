#!/usr/bin/perl
#Question 5: Write a blater program that utilizes RemorteBlast and has input:

use strict;
use warnings;
use Bio::perl;
Use Bio::Tools::Run::RemoteBlast;

#Define search/input argument 
my ( $input, $type, $accesion ) = @ARGV;
my $db;
if ($type eq 'dna') {
	if ($input eq 'blastn' || $input eq 'blastx' || $input eq 'tblastx') {
		$db = 'genbank';
	}
	else {	
		die ("No match");
	}
}
elsif ($type eq 'protein') {
	if ($input eq 'blastp' or $input eq 'tblastn') {
		$db = 'genpept';
	}
	else {
		die ("No match");
	}
}
else {
	die ("Needs to be 'dna' or 'protein')";
}
#get the sequence of the search by accession number in the database
my $sequence = get_sequence ($db, $accesion ):
#define parameters
my $factory = Bio::Tools::Run::RemoteBlast->new ( - prog => $input , - data => 'nr' ,  -expect => '1e-10' , -readmethod => 'SearchIO' );
#Get blast and output to a file
my $factory->submit_blast($sequence);
while (my @rids = $factory->new_rid) {
	foreach my $rid (@rids ) {
		my $final = $factory->get_blast($rid);
		if (ref($final)) {
			my $output = $final->next();
			my $file = $output->query()."_".$input.".out";
			$factory->save($file);
			$factory->remove($rid);
		}
		elsif ($final < 0 ) {
			$facotry->remove($rid);
		}
		else {
			sleep 10;
		}
	}
}
	
