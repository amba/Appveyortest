#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;

use Alien::Gnuplot;

my $gnuplot = $Alien::Gnuplot::executable;

say "gnuplot: $gnuplot";

my $version = $Alien::Gnuplot::version;

say "gnuplot version: $version";

my %terms = %Alien::Gnuplot::terms;

for my $term (keys %terms) {
    say "$term: $terms{$term}";
}
