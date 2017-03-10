#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;
use experimental 'signatures';
use autodie qw/:all/;
use Data::Dumper;

my @bash_cmd = ('C:\\msys64\usr\bin\bash', '-lc');
my $build_folder = $ENV{APPVEYOR_BUILD_FOLDER};
say "folder: $build_folder";

verbose_system(@bash_cmd, qw/ls -l/);

sub verbose_system (@command) {
    warn "command: @command\n";
    system(@command);
}
