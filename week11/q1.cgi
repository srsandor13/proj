#!/usr/bin/perl
#Week 11: write a CGI that takes in a query from user input to displays hits from NCBI Entrez database..aka: recreate global query web interface from NCBI

use strict;
use warnings;
use LWP::Simple;
use CGI (':standard');

#CGI title
my $title = 'Query of NCBI Entrez';
print header,
start_html($title),
        h1($title);


#Entrez form set-up
my @db  = ("Pubmed", "protein", "nucleotide", "nuccore", "nucgss", "nucest", "structure", "genome",
                "biosystems", "books", "cancerchromosomes", "cdd", "gap",
                "domains", "gene", "genomeprj", "gensat", "geo", "gds",
                "homologene", "journals", "mesh", "ncbisearch", "nlmcatalog",
                "omia", "omim", "pepdome", "pmc", "popset", "probe",
                "proteinclusters", "pcassay", "pccompound", "pcsubstance",
                "seqannot", "snp", "sra", "taxonomy", "toolkit", "toolkitall",
                "unigene", "unists");


#Submission of form
if (param('submit')) {
        my $input = param('query');
        print "Results:\n";
	foreach my $db (@db) {
        	my $utils = "http://www.ncbi.nlm/nih.gov/entrez/eutils";
        	my $egquery = "$utils/egquery.fcgi?"."db=$db&retmax=1&usehistory=y&term=";
        	my $result = get($egquery.$input);
        	my ($count)=($result =~ m|<Count>(.*)</Count>|);
		print p("$db-$count\n");

	}	
}

#Form set-up
my $url = url();
print start_form (-method => 'GET' , action => $url ),
p( "Query:" . textfield( -name => 'query')),
p( submit (-name => 'submit' , value => 'Submit' )),
end_form();
end_html();


