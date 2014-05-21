#!usr/bin/perl

use strict;
use bigint;

#my @primes = &prime_factors(600851475143);
my @primes = &prime_factors(12345678987654321);
print "@primes\n";

sub prime_factors{
	my $number = @_[0];	
	my @factors;
	my $divisor = 2;
	while ($number > 1){
		while (($number % $divisor) == 0){
			push (@factors, $divisor);
			$number = ($number/$divisor);
		}
		$divisor += 1;
	}
	return @factors;
}
