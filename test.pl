#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;

use Data::Dumper;

print "ENV: ", Dumper \%ENV;
say for @ARGV;
