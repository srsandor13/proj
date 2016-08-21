#!/usr/bin/perl

#Use BioPerl modules to write a script that converts a sequence file to another format. 
# STDIN:$ ./format_convert ./genbank-data.gb fasta Wrote ./genbank-data.fasta

use strict;
use warnings;
use Bio::Perl;

my ($input, $format, $wrote, $file_name) = @ARGV;

my @bio_seq_objects = read_all_sequences( $input );
write_sequence( ">$file_name" , $format , @bio_seq_objects );

