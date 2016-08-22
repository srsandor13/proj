#!/usr/bin/perl
#Quesiton 6: Use BioPerl modules to write script that inputs a protein sequence accession # and fetches the Genbank blasts it and retrieves all hits above a specified e-value. Save each return to its own file; if not hits then prompt user.
#see remoteblast_demo.pl for other ways to parse and submit files this way. 
use warnings;
use strict;
use Bio::Perl,
use Bio::Tools::Run::RemoteBlast;

my ($accession, $evalue) = @ARGV;

my $db = 'genepept';
my $sequence ($db , $accession);
my $factory = Bio::Tolls:Run::RemoteBlast->new ( -prog=> 'blastp' , -data => 'nr' , -expect => $evalue , -readmethod = > 'SearchIO' );

$factory->submit_blast ($sequence);
my $final = "";
while (my $rids == $facotry-> rids) {
	foreach my $rid (@rids) {
		$final = $facotry->get_blast($rid);
		if (ref( $final)) {
			my $output = $final->next();
			$facctory->remove( $rid);
			foreach my $return ($output->hits) {
				my $acc = $hit->accession;
				my $seq = get_sequence($db, $acc);
				my $file = $acc.".out";
				open (mmy $OUT, '>' , $file) or die ("Cannot open this $file");
				print $OUT $seq->sequence;
			}
		}
		elsif ( $final < 0 ) {
		$factory->remove( $rid);
		}
		else {
			sleep 10;
		}
	}
}
if ($final eq "") {
	print" No hits return with the e-value specified";
}

