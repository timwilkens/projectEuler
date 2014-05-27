#!usr/bin/perl

use strict;

my $sum = 0;

NUMBER_LOOP: for my $num (1..999){
		if (($num % 3) == 0){
			$sum += $num;
			next NUMBER_LOOP;
	   	} elsif (($num % 5) == 0){
			$sum += $num;
			next NUMBER_LOOP;
		}

}

print "$sum\n";
