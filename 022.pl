#!/usr/bin/perl

use strict;
use warnings;

my $name_data = do { local $/; local @ARGV = '022names.dat'; <> };
my @names = sort { $a cmp $b } map { lc($_) } map { $_ =~ s/"//g; $_ } split(/,/, $name_data);

my %ordered;
for (0 .. $#names) {
  $ordered{($_ + 1)} = $names[$_];
}

my $grand_total;
while (my ($order, $word) = each %ordered) {
  $grand_total += ($order * (get_word_value($word)));
}
print "$grand_total\n";

sub get_word_value {
  my $word = shift;
  my $LETTER_MAP = { a => 1, b => 2, c => 3, d => 4, e => 5, f => 6,
                     g => 7, h => 8, i => 9, j => 10, k => 11, l => 12,
                     m => 13, n => 14, o => 15, p => 16, q => 17,
                     r => 18, s => 19, t => 20, u => 21, v => 22,
                     w => 23, x => 24, y => 25, z => 26 };

  my @letters = split(//, $word);
  my $total = 0;
  for my $letter (@letters) {
    next unless (exists $LETTER_MAP->{$letter});
    $total += ($LETTER_MAP->{$letter});
  }
  return $total;
}
