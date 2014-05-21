#!usr/bin/perl

use strict;

my @palindromes;

FIRST_LOOP: for my $num (reverse(100..999)){

	SECOND_LOOP: for my $multiplier (reverse(100..999)){

		my $testing = ($num * $multiplier);
	
		if (&is_palindrome($testing) == 1) {
			push (@palindromes, $testing);
			next FIRST_LOOP;
		}
	}
}

my @sorted_pal = sort {$b <=> $a} @palindromes;

print "$_\n" for (@sorted_pal);

## Be wary of possible sign-posting error below due to length vs. index
## If the number of digits is even, you must stop before it gets to the halfway mark
## If the number is 6 digits, stop at index two, since this is the halway mark.


sub is_palindrome {
	my $test = @_[0];
	my $length = length($test);
	my $stop;
	my $start = 0;
	my $end = ($length - 1);

	if (($length % 2) == 0){
		$stop = ($length/2);
	} else {
		$stop = (($length/2) + 1);
	}

	while ($start < $stop){

		my $first = substr $test, $start, 1;
        	my $last = substr $test, $end, 1;

		if ($first != $last){
			return 0;
		}
		$start ++;
		$end --;
	}
	return 1;
}

