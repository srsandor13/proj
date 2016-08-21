#!/usr/bin/perl
#Question 5: Write a blater program that utilizes RemorteBlast and has input:

use strict;
use warnings;
use Bio::perl;
Use Bio::Tools::run::RemoteBlast;

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
elsif ($type eq 'prtotein') {
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
my $sequence = get_sequence ($db, $accesion ):
my $factory = Bio::Tools::Run::RemoteBlast->new ( - prog => $input , - data => 'nr' ,  -expect => '1e-10' , -readmethod => 'SearchIO' );

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
	
