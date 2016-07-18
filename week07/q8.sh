#!/usr/bin/perl


sub translate_dna
{
	$seq = $_;
	$start = "ATG";
	@stop = ("TAA","TAG" ,"TGA");
	
	$nucleotideChars = $seq =~ tr/ATGC//;
	if($nucleotideChars != length($seq))
	{
		warn("The sequence contains non-nucleotide characters.");
		die();
	}
	
	 $startFound = index($seq, $start);
	 
	 if( $startFound == -1 ){
	 	return "No start condon";
	 }
	 
	 $endIndex = -1;
	 $endIndex = (index($seq, $stop[0],$startFound) > $endIndex) ? index($seq, $stop[0],$startFound) : $endIndex;
	 $endIndex = (index($seq, $stop[1],$startFound) > $endIndex) ? index($seq, $stop[1],$startFound) : $endIndex;
	 $endIndex = (index($seq, $stop[2],$startFound) > $endIndex) ? index($seq, $stop[2],$startFound) : $endIndex;
	 

	 if( $endIndex == -1 ){
			return substr($seq, $startFound+3,length($seq)-3);
	 }
	 else
	 {
		return substr($seq, $startFound+3,$endIndex-3-$startFound);
	 }
	 

}

1;
