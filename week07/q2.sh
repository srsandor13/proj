#!/usr/bin/perl


sub get_hash_ref{
	
	#Declaring Hash
	%data = ('Stephanie', 26, 'Peyton', 2, 'Dallas', 29);
	
	#Creating reference to above hash
	$hashref   = \%data;
	
	#Returning reference
	return $hashref;
}



# Create a reference to above function.
$funcref = \&get_hash_ref;

# Function call using reference.
$hashref =  &$funcref();

# Printing out the hash whose reference is returned from the subroutine
print %$hashref;
