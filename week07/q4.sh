#!/usr/bin/perl

$val = "241";

# Regex if positive integer
if ($val =~ m[^\d+$]){
   print "Positive Intger\n";
}else{
   print "Error value\n";
}

$val = "-2.0";

# Regex if positive integer or decimal
if ($val =~ m[^\d*(.?)\d+$]){
   print "Positive Decimal or Integer\n";
}else{
   print "Error value\n";
}


# Regex if positive or negitive integer or decimal
if ($val =~ m[^(-?)\d*(.?)\d+$]){
   print "Pos/Neg Decimal or integer\n";
}else{
   print "Error value\n";
}

$val = "+2.3e4";

# Regex if positive or negitive scientific
if ($val =~ m[^([-+])?(\d+)(\.\d*)?e([-+]?\d+)$]){
   print "Pos/Neg Sci Notation\n";
}else{
   print "Error value\n";
}
