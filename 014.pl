#!usr/bin/perl

use strict;
use bigint;
use Benchmark;
use Data::Dumper;

my %cache;

### Simple recursive function. My original one.
sub collatz{
	my ($i, $k) = @_;
	if ($i == 1){
		$k ++;
		return (1, $k);
	}

	if (($i % 2) == 0){
		$k ++;
		return &collatz(($i/2), $k);
	} else {
		$k ++;
		return &collatz(((3*$i) + 1), $k);
	}

}

### Avoids recursive calls, and makes use of caching (memoization). DRAMATICALLY faster than above.
sub clz{
	my ($i, $k) = @_;

	while ($i > 1){
		if ($cache{$i}){
			$k += $cache{$i};
			return ($i, $k);;
		}

		if (($i % 2) == 0){
			$i = ($i/2);
			$k ++;

                } else {
			$i = ((3 * $i) + 1);
			$k ++;
		}
		
	}
	
	if ($i == 1){
                $k ++;
                return ($i, $k);
        }


}
### Benchmarking. Recursive vs While (while faster by a small margin).
### Once I implemeneted the memoization, the while loop was many times faster.
timethese (
	25,
	{'Recursive' => '&one()',
	 'While_Loop_Cached' => '&two()'}
);

sub one{

my $max = 0;

my $starting_number;

for my $j (1..5000){

	my (undef, $terms) = &collatz($j, 0);

	if ($terms > $max){
		$max = $terms;
		$starting_number = $j;
#		print "New max at $max ---- $starting_number\n";
	}

}
#	print "Max is $max for starting point $starting_number\n";
}

sub two {

### Cache clearing for use during Benchmarking
%{cache} = ();

my $max = 0;

my $starting_number;

for my $j (1..5000){

        my (undef, $terms) = &clz($j, 0);

	$cache{$j} = $terms;

        if ($terms > $max){
                $max = $terms;
                $starting_number = $j;
#                print "New max at $max ---- $starting_number\n";
        }

}
#	print "Max is $max for starting point $starting_number\n";
}
&two();

