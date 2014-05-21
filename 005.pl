#!usr/bin/perl

use strict;

sub is_divisible{
## Returns 1 for evenly divisble by numbers 1-20. Returns 0 for not.
	
	my $i = @_[0];

	for my $divisor (11..20){
		if (($i % $divisor) != 0){
			return 0;
		}

	}
	return 1;
}

my $test = 20;

while (1){
	print "$test\n";
	if ((&is_divisible($test)) == 1){
		print "$test is divisible!\n";
		last;
	}

	$test += 20;

}
