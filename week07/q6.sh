#!/usr/bin/perl

@arr = (6,8,3,-3,3,4);


# Function calls
$max = max_num(@arr);
$min = min_num(@arr);

print "Maximum in list is  $max\n";
print "Minimum in list is  $min\n";



# Function definitions
sub max_num{
   my @list = @_;
   $max = $list[0];
   for my $el (@list) {
   
   		$max =	($max < $el )? $el : $max;
   
   }
   
   return $max;
}

sub min_num{
   my @list = @_;
   $min = $list[0];
   for my $el (@list) {
   
   		$min =	($min > $el )? $el : $min;
   
   }
   
   return $min;
}

