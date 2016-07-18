#!/usr/bin/perl


print "Enter Sequence: ";
$seq = <>;
chomp $seq;


#Basic Calculations
$len = length($seq);
$T++ while ($seq =~ m/T/g);
$G++ while ($seq =~ m/G/g);
$C++ while ($seq =~ m/C/g);
$A++ while ($seq =~ m/A/g);

#Temprature Caluculation
$Temp = 2*($A+$T) + 4*($G+$C);

#GC Caluculation
$GC = 100 * ($G + $C)/$len;


#Display All
print "\n\n";
print "Length of Sequence: $len\n";
print "T Count = $T\n";
print "G Count = $G\n";
print "C Count = $C\n";
print "A Count = $A\n";
print "\n\n";
print "Using Formula: Temp = 2°C(A+T) + 4°C(G+C)\n";
print "Temp = $Temp°C\n";
print "\n\n";
print "Using Formula: GC = 100 * (G + C)/Length of Sequence\n";
printf ("GC Content = %.2f%%",$GC);


