#!usr/bin/perl

use strict;

my $fib_1 = 1;
my $fib_2 = 2;
my $fib = 3;

my $sum = 2;

while ($fib < 4000000){
	if (($fib % 2) == 0){
		$sum += $fib;
	}
	print "$fib\n";
	$fib_1 = $fib_2;
	$fib_2 = $fib;
	$fib = $fib_1 + $fib_2;
}

print "$sum\n";
