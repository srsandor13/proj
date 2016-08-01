#!/usr/bin/perl

use strict;
use warnings;

use Bio::Perl;
my $input;
print "Enter your fasta file name here: ";
chomp($input = <STDIN>);

my @bio_seq_objects = read_all_sequences($input , "fasta" );

my %data;
foreach my $seq (@bio_seq_objects) {
	my $name = $seq->display_id;
	my $sequence = $seq->seq;
	my $display = $seq->subseq(1,12);
	print "NAME: $name , SEQ: $display" ;

}
print "Please select one or more sequences to BLAST separated by a comma:";

my $input_seq = <STDIN>;
chomp($input_seq = <STDIN>);
my @input_BLAST = split(/,/, $input_seq);

foreach my $request (@input_BLAST){
	chomp($request);
	foreach my $obj(@bio_seq_objects){
		if ($obj->display_id eq $request) {
			$obj = $obj->translate();
			my $blast = blast_seq($obj);
			my $file = "./blast_$request";
			write_blast(">$file" , $blast);
		}
	}
}

	
