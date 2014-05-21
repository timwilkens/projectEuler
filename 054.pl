#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $test = { 1 => { value => '10', suit => 'H' },
             2 => { value => '10', suit => 'H' },
             3 => { value => '7', suit => 'D' },
             4 => { value => '14', suit => 'C' },
             5 => { value => '14', suit => 'H' },
           };

open (my $hands, "<", "054poker.dat") 
  or die "Failed to open file\n";

my $data = do { local $/; <$hands>; };
close $hands;

my @lines = split(/\n/, $data);
my $hand_counter = 1;
my $one_wins = 0;

for my $line (@lines) {

  my @cards = split(/\s/, $line);

  my @part2 = splice @cards, scalar(@cards)/2;

  my $hand1 = make_hand(@cards);
  my $hand2 = make_hand(@part2);

  my $result = play_hands($hand1, $hand2);
  if ($result == 1) {
    $one_wins++;
    print "@cards BEATS @part2\n";
  } else {
    print "@part2 BEATS @cards\n";
  }
  print "\n";

  $hand_counter++;
}
print "$one_wins\n";

sub make_hand {
  my @hand = @_;

  my %hand_hash;
  my $counter = 1;

  for my $card (@hand) {
    my @parts = split(//, $card);

    my $value = $parts[0];
    if ($value eq 'T') {
      $value = 10;
    } elsif ($value eq 'J') {
      $value = 11;
    } elsif ($value eq 'Q') {
      $value = 12;
    } elsif ($value eq 'K') {
      $value = 13;
    } elsif ($value eq 'A') {
      $value = 14;
    }

    $hand_hash{$counter}{value} = $value;
    $hand_hash{$counter}{suit} = $parts[1];
    $counter++;
  }
  return \%hand_hash;
}

sub play_hands {
  my ($hand1, $hand2) = @_;

  return 1 if (is_royal_flush($hand1));
  return 2 if (is_royal_flush($hand2));

  if (is_straight_flush($hand1) && is_straight_flush($hand2)) {
    my $high1 = get_high_card($hand1);
    my $high2 = get_high_card($hand2);
    if ($high1 > $high2 ) {
      return 1;
    } else {
      return 2;
    }
  } elsif (is_straight_flush($hand1)) {
    return 1;
  } elsif (is_straight_flush($hand2)) {
    return 2;
  }

  if (is_blank_of_a_kind($hand1, 4) && is_blank_of_a_kind($hand2, 4)) {
    my $values1 = get_values($hand1);
    my $values2 = get_values($hand2);
    my $high1;
    my $high2;

    for my $v (keys %$values1) {
      next unless ($values1->{$v} == 4);  
      $high1 = $v;
    }

    for my $v (keys %$values2) {
      next unless ($values2->{$v} == 4);  
      $high2 = $v;
    }

    if ($high1 > $high2) {
      return 1;
    } else {
      return 2;
    }

  } elsif (is_blank_of_a_kind($hand1, 4)) {
    return 1;
  } elsif (is_blank_of_a_kind($hand2, 4)) {
    return 2;
  }

  if (is_full_house($hand1) && is_full_house($hand2)) {
    my $values1 = get_values($hand1);
    my $values2 = get_values($hand2);
    my $high1;
    my $high2;

    for (qw(3 2)) {
      for my $v (keys %$values1) {
        next unless ($values1->{$v} == $_);
        $high1 = $v;
      }
  
      for my $v (keys %$values2) {
        next unless ($values2->{$v} == $_);
        $high2 = $v;
      }
  
      if ($high1 > $high2) {
        return 1;
      } elsif ($high2 > $high1) {
        return 2;
      }
    }

  } elsif (is_full_house($hand1)) {
    return 1;
  } elsif (is_full_house($hand2)) {
    return 2;
  }

  if (is_flush($hand1) && is_flush($hand2)) {
    my $high1;
    my $high2;

    for (1 .. 5) {
      $high1 = get_high_card($hand1);    
      $high2 = get_high_card($hand2);    
      if ($high1 > $high2) {
        return 1;
      } elsif ($high2 > $high1) {
        return 2;
      }
   
      ONE: for my $k (keys %$hand1) {
        if ($hand1->{$k}{value} == $high1) {
          delete $hand1->{$k};
          last ONE;
        }
      }

      TWO: for my $k (keys %$hand2) {
        if ($hand2->{$k}{value} == $high2) {
          delete $hand2->{$k};
          last TWO;
        }
      }

    }

  } elsif (is_flush($hand1)) {
    return 1;
  } elsif (is_flush($hand2)) {
    return 2;
  }

  if (is_straight($hand1) && is_straight($hand2)) {
    my $high1 = get_high_card($hand1);
    my $high2 = get_high_card($hand2);
  
    if ($high1 > $high2) {
      return 1;
    } else {
      return 2;
    }

  } elsif (is_straight($hand1)) {
    return 1;
  } elsif (is_straight($hand2)) {
    return 2;
  }

  if (is_blank_of_a_kind($hand1, 3) && is_blank_of_a_kind($hand2, 3)) {
    my $values1 = get_values($hand1);
    my $values2 = get_values($hand2);
    my $high1;
    my $high2;

    for (1 .. 3) {
      for my $v (keys %$values1) {
        next unless ($values1->{$v} == 3 and (scalar keys %$values1 == 3));
        $high1 = $v;
      }
   
      for my $v (keys %$values2) {
        next unless ($values2->{$v} == 3 and (scalar keys %$values2 == 3));
        $high2 = $v;
      }
   
      if ($high1 > $high2) {
        return 1;
      } elsif ($high2 > $high1) {
        return 2;
      }

      ONE: for my $k (keys $hand1) {
        my $v = $hand1->{$k}{value};
        if ($v == $high1) {
          delete $hand1->{$k};
          last ONE;
        }
      }

      TWO: for my $k (keys $hand2) {
        my $v = $hand2->{$k}{value};
        if ($v == $high2) {
          delete $hand2->{$k};
          last TWO;
        }
      }
    }

  } elsif (is_blank_of_a_kind($hand1, 3)) {
    return 1;
  } elsif (is_blank_of_a_kind($hand2, 3)) {
    return 2;
  }

  if (is_two_pairs($hand1) && is_two_pairs($hand2)) {
    my $values1 = get_values($hand1);
    my $values2 = get_values($hand2);

    my $high1 = 0;
    my $high2 = 0;

    for (1 .. 3) {
      for my $k (keys %$values1) {
        if ($values1->{$k} == 2 && $k > $high1 && (scalar keys %$values1 != 1)) {
          $high1 = $k;
        }
      }
  
      for my $k (keys %$values2) {
        if ($values2->{$k} == 2 && $k > $high2 && (scalar keys %$values2 != 1)) {
          $high2 = $k;
        }
      }
   
      if ($high1 > $high2) {
        return 1;
      } elsif ($high2 > $high1) {
        return 2;
      }

      ONE: for my $k (keys $hand1) {
        my $v = $hand1->{$k}{value};
        if ($v == $high1) {
          delete $hand1->{$k};
          last ONE;
        }
      }

      TWO: for my $k (keys $hand2) {
        my $v = $hand2->{$k}{value};
        if ($v == $high2) {
          delete $hand2->{$k};
          last TWO;
        }
      }

    }

  } elsif (is_two_pairs($hand1)) {
    return 1;
  } elsif (is_two_pairs($hand2)) {
    return 2;
  }

  if (is_blank_of_a_kind($hand1, 2) && is_blank_of_a_kind($hand2, 2)) {
    my $values1 = get_values($hand1);
    my $values2 = get_values($hand2);
    my $high1;
    my $high2;

    for (1 .. 4) {
      for my $v (keys %$values1) {
        next unless ($values1->{$v} == 2 and (scalar keys %$values1 == 4));
        $high1 = $v;
      }

      for my $v (keys %$values2) {
        next unless ($values2->{$v} == 2 and (scalar keys %$values2 == 4));
        $high2 = $v;
      }

      if ($high1 > $high2) {
        return 1;
      } elsif ($high2 > $high1) {
        return 2;
      }

      ONE: for my $k (keys $hand1) {
        my $v = $hand1->{$k}{value};
        if ($v == $high1) {
          delete $hand1->{$k};
          last ONE;
        }
      }

      TWO: for my $k (keys $hand2) {
        my $v = $hand2->{$k}{value};
        if ($v == $high2) {
          delete $hand2->{$k};
          last TWO;
        }
      }
    }

  } elsif (is_blank_of_a_kind($hand1, 2)) {
    return 1;
  } elsif (is_blank_of_a_kind($hand2, 2)) {
    return 2;
  }

  for (1 .. 5) {
    my $high1 = get_high_card($hand1);
    my $high2 = get_high_card($hand2);

    if ($high1 > $high2) {
      return 1;
    } elsif ($high2 > $high1) {
      return 2;
    }

    ONE: for my $k (keys $hand1) {
      my $v = $hand1->{$k}{value};
      if ($v == $high1) {
        delete $hand1->{$k};
        last ONE;
      }
    }

    TWO: for my $k (keys $hand2) {
      my $v = $hand2->{$k}{value};
      if ($v == $high2) {
        delete $hand2->{$k};
        last TWO;
      }
    }
  }
}

sub get_high_card {
  my $hand = shift;

  my $values = get_values($hand);
  my $highest = 0;

  for my $v (keys %$values) {
    if ($v > $highest){
      $highest = $v;
    }
  }
  return $highest;
}

sub get_values {
  my $hand = shift;

  my %values;
  for my $card (keys %$hand) {
    my $v = $hand->{$card}{value};
    $values{$v}++;
  }
  return \%values;
}

sub is_flush {
  my $hand = shift;

  my %values;
  my $suit = $hand->{1}{suit};
  for my $card (keys %$hand) {
    next if ($card == 1);
    my $s = $hand->{$card}{suit};
    $values{$hand->{$card}{value}}++;
    return 0 if ($s ne $suit);
  }
  return 1;
}

sub is_straight {
  my $hand = shift;

  my $values = get_values($hand);
  return 0 unless ((scalar keys %$values) == 5);
  my $lowest = 100;    # Arbitrary

  for my $value (keys %$values) {
    return 0 if ($value == $lowest);
    $lowest = $value if ($value < $lowest);
  }
  return 0 if ($lowest == 100);

  for (1 .. 4) {
    $lowest++;
    return 0 unless (exists $values->{$lowest});
  }
  return 1;
}

sub is_royal_flush {
  my $hand = shift;

  return 0 unless (is_flush($hand));
  my $values = get_values($hand);
  return 0 unless (scalar keys %$values == 5);

  for my $v (10 .. 14) {
    return 0 unless (exists $values->{$v});
  }
  return 1;
}

sub is_straight_flush {
  my $hand = shift;

  return 0 unless (is_straight($hand));
  return 0 unless (is_flush($hand));
  return 1;
}

sub is_blank_of_a_kind {
  my ($hand, $number_of) = @_;

  my $values = get_values($hand);

  for my $value (keys %$values) {
    return 1 if ($values->{$value} == $number_of);
  }
  return 0;
}

sub is_full_house {
  my $hand = shift;

  return 0 unless (is_blank_of_a_kind($hand, 3));
  return 0 unless (is_blank_of_a_kind($hand, 2));

  return 1;
}

sub is_two_pairs {
  my $hand = shift;

  my $values = get_values($hand);
  my $pairs = 0;

  for my $k (keys %$values) {
    $pairs++ if ($values->{$k} == 2);
  }
  return 1 if ($pairs == 2);
  return 0;
}

