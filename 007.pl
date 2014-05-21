#!usr/bin/perl

use 5.010;
use strict;
use bigint;

my @primes;

sub is_prime {
	my $i = @_[0];
	for my $k (@primes){
		if (($i % $k) == 0){
			return 0;
		}
	}
	push (@primes, $i);
	return 1;
}

my $prime_counter = 0;
my $tester = 1;

while (1){
	$tester ++;
	if (($tester != 2) && (($tester % 2) == 0)){
		next;
	}

	if (&is_prime($tester) == 1){
		$prime_counter ++;
		say "$tester is prime number $prime_counter";
	} 
	last if ($prime_counter == 10001);
}
