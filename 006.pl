#!usr/bin/perl

use 5.010;
use strict;
use bigint;

my $sum_of_squares = 0;
my $squared_sum = 0;

for my $num (1..100){
	$squared_sum += $num;
	$sum_of_squares += ($num * $num);
}

$squared_sum = ($squared_sum * $squared_sum);

print "$sum_of_squares\n";
print "$squared_sum\n";

my $difference = ($sum_of_squares - $squared_sum);

say "$difference";
