#!/usr/bin/perl

print"You will need to write 9 values (i.e: one, two)";
for( $i = 0; $i < 3; $i = $i + 1 ){
	for( $j = 0; $j < 3; $j = $j + 1 ){
		print "Enter number: ";
	 	my $num = <STDIN>;
    	chomp $num;
    	$array[$i][$j] = $num;
	}
}

$trans = ();
for(my $i = 0; $i <= $#array; $i++){
   for(my $j = 0; $j <= $#array ; $j++){
      $trans[$i][$j] = $array[$j][$i] ;
   }
}

print "Output: \n";
for(my $i = 0; $i <= $#array; $i++){
   for(my $j = 0; $j <= $#array ; $j++){
      print "$trans[$i][$j]  ";
   }
   print "\n";
}
