#!/usr/bin/perl
#Week11: runs off of q1.cgi in /home/ssandor4/proj/week11/q1.cgi

use LWP::Simple;

my $utils = "http://www.ncbi.nlm.nih.gov/entrez/eutils";

#User query
print "Type in your query: ";
chomp($input = <STDIN>);

#Entrez database set-up
my @db  = ("Pubmed", "protein", "nucleotide", "nuccore", "nucgss", "nucest", "structure", "genome",
                "biosystems", "books", "cancerchromosomes", "cdd", "gap",
                "domains", "gene", "genomeprj", "gensat", "geo", "gds",
                "homologene", "journals", "mesh", "ncbisearch", "nlmcatalog",
                "omia", "omim", "pepdome", "pmc", "popset", "probe",
                "proteinclusters", "pcassay", "pccompound", "pcsubstance",
                "seqannot", "snp", "sra", "taxonomy", "toolkit", "toolkitall",
                "unigene", "unists");

print "Results:\n";

#Print
foreach my $db (@db) {
        my $egquery = "$utils/esearch.fcgi?". "db=$db&retmax=1&usehistory=y&term=";
        my $result = get($esearch . $input);
        my ($count)=($result =~ m|<Count>(.*)</Count>|);
        if($count eq ""){$count = 0};
        print "$db - $count\n";
}

