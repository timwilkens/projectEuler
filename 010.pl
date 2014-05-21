#!usr/bin/perl

use strict;
use bigint;

sub is_prime
{
        my ($n,$k) = @_;
        return 1 if $n == 2;
        return 0 if $n < 2 or $n % 2 == 0;
 
        my $d = $n - 1;
        my $s = 0;
 
        while(!($d % 2))
        {
                $d /= 2;
                $s++;
        }
 
   LOOP: for (1..$k){
                $a = 2 + int(rand($n-2));
 
                my $x = $a->bmodpow($d, $n);
                next if $x == 1 or $x == $n-1;
 
                for(1..$s-1)
                {
                        $x = ($x*$x) % $n;
                        return 0 if $x == 1;
                        next LOOP if $x == $n-1;
                }
                return 0;
        }
        return 1;
}
### Start with total of 2 since the while loop while skip 2, and not add it to the total.

my $total = 2;
my $test = 2;

while ($test < 2000000){
	if (($test % 2) == 0){
		$test ++;		
		next;
	}

        if (&is_prime($test,10) == 1){
                $total += $test;
                print "Added $test\n";
        }
        $test ++;
}

print "Total is $total\n";

