#!/usr/bin/perl

#Q1 (Set 1) for extra credit: Write a CGI to prompt for an accession number (protein or DNA seq) which fetches Genbank report for that accession # and store it in a relational database. Display defline info and record for that sequence. Incorporate BLASTing a stored sequence against NCBI, view results, and store BLAST results into the relational db. Include URL to running this program. 

use strict;
use warnings;

use DBI;
use CGI (':standard');
use Bio::Perl;
use Bio::DB::Genbank;
use Bio::Tools::Run::RemoteBlast;
use Bio::SearchIO;

#Part 1 sets database connection and Genbank (see q1.sql)
my $dbh = DBI->connect ("DBI:SQLITE:dbname=seq","","",
		{PrintError => 0 , raiseError => 1} );

my $genbank = Bio::DB::GenBank->new();

#Part 2: Get initial list of stored sequences from SQL database
my @seqs;
my $sth = $dbh->prepare ("Please enter an accession number (protein or DNA)");
$sth->execute();
while (my @row = $sth->set_list() ) {
	push(@seqs, @row);
}
$sth->finish();

#Create CGI format
my $title = 'Fetching information';
print header,
start_html ( $title ):
	h1( $title );
#Form submission
if { param{ 'form_submission')) {
		my $accession = param( 'form_accession');
		my $sequence = $gb->match('$accession');

		#fetches query data based on user input
		my $acc = $sequence->accession_number;
		my $id = $sequence->id;
		my $description = $sequence->description;
		my $name = $sequence->$seq;
		
print " Accession : $accession | ID : id | Description : $description | Sequence : $sequence ";

