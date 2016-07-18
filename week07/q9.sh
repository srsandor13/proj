!/usr/bin/perl

require "q8.sh";

#@stop = ("TAA","TAG" ,"TGA");
# Test Script

$test1 = "ATGCCCAAGCTGA"; # Start Condon at Start
$test2 = "CCCAATGCAGCTGA"; # Start Condon at Mid
$test3 = "CCCAAGCTGAATG"; # Start Condon at End
$test4 = "CCCAAGCTGAGGGGTT"; # Sequence Without Start Condon
$test5 = "ATGCCCAAGCTATGTTG"; # Sequence Without Ending Condon
$test6 = "ATGFCCCAZAGCTGA"; # Sequence containing non-nucleotide characters


$array[0] = $test1;
$array[1] = $test2;
$array[2] = $test3;
$array[3] = $test4;
$array[4] = $test5;
$array[5] = $test6;



foreach (@array)
{
     print $_ ." - " ;
     print translate_dna($_) . "\n";
}
