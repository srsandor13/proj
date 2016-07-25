#! /usr/bin/perl

use strict;
use warnings;

use DBI;
use CGI (':standard');

#Sets connection
my $dbh = DBI->connect( "DBI:SQLite:dbname=mRNA", "", "",
                        { PrintError => 0 , RaiseError => 1 } );

my @ORGANISMS = ('Any');
my $sth = $dbh->prepare( "select ORGANISM_NAME from Organism;" );
$sth->execute();
#Places that list into the Organisms Variable
while ( my @row = $sth->fetchrow_array() ) {
        push(@ORGANISMS, @row);
}
$sth->finish();

my @TISSUES = ('Any');
$sth = $dbh->prepare( "select TISSUE_NAME from Tissue;" );
$sth->execute();
#Places that list into the Organisms Variable
while ( my @row = $sth->fetchrow_array() ) {
        push(@TISSUES, @row);
}



$sth->finish();

my @GENES = ('Any');
$sth = $dbh->prepare( "select GENE_NAME from Gene;" );
$sth->execute();
#Places that list into the Organisms Variable
while ( my @row = $sth->fetchrow_array() ) {
        push(@GENES, @row);
}
$sth->finish();


#CGI Title
my $title = 'Search';
print header,
start_html( $title ),
        h1( $title );


#A form Submission
if( param( 'submit' )) {

        my $GENE_NAME = param( 'gene_name' );
        my $TISSUE_NAME  = param( 'tissue_name' );
        my $ORGANISM_NAME  = param( 'organism_name' );
        my $EXPRESSION_LEVEL = param( 'expression_level' );

        #If Any selected then replace with SQL wildcard
        if ($GENE_NAME eq 'Any'){$GENE_NAME = '%';}
        if ($TISSUE_NAME eq 'Any'){$TISSUE_NAME = '%';}
        if ($ORGANISM_NAME eq 'Any'){$ORGANISM_NAME = '%';}
        if ($EXPRESSION_LEVEL eq 'Any'){$EXPRESSION_LEVEL = '%';}

        #Call
        $sth = $dbh->prepare( "select
                                o.ORGANISM_NAME, t.TISSUE_NAME, g.GENE_NAME, s.EXPRESSION_LEVEL, s.START, s.STOP, s.SEQUENCE
                                from SEQUENCE s
                                INNER JOIN GENE g ON s.GENE_ID = g.ID
                                INNER JOIN ORGANISM o ON g.ORGANISM_ID = o.ID
                                INNER JOIN TISSUE t ON g.TISSUE_ID = t.ID
                                where o.ORGANISM_NAME like '$ORGANISM_NAME'
                                and t.TISSUE_NAME like '$TISSUE_NAME'
                                and g.GENE_NAME like '$GENE_NAME'
                                and s.EXPRESSION_LEVEL like '$EXPRESSION_LEVEL';" );

        $sth->execute();
        #Prints Results
        print p( "ORGANISM NAME | TISSUE NAME | GENE NAME | EXPRESSION LEVEL | START | STOP | SEQUENCE");
        while ( my @row = $sth->fetchrow_array() ) {
                print p("@row");
        }
        hr();
        $sth->finish();
}

#Sets form
my $url = url();
print start_form( -method => 'GET' , action => $url ),
p( "Organism Name: " . popup_menu( -name => 'organism_name' ,
        -values => @ORGANISMS )),
p( "Gene Name: "  . popup_menu( -name   => 'gene_name' ,
        -values => @GENES )),
p( "Tissue Name: "  . popup_menu( -name    => 'tissue_name' ,
        -values => @TISSUES )),
p( "Expression Level: " . textfield( -name => 'expression_level' )),
p( submit( -name => 'submit' , value => 'Submit' )),
end_form(),
end_html();

#Close DB Connection
$dbh->disconnect();

