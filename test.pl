#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;
use experimental 'signatures';
use Data::Dumper;

my @bash_cmd = ('C:\\msys64\usr\bin\bash', '-lc');
my $build_folder = $ENV{APPVEYOR_BUILD_FOLDER};
say "folder: $build_folder";

verbose_system(@bash_cmd, 'ls -l');

sub verbose_system (@command) {
    warn "command: @command\n";
    system(@command) == 0
        or die "command failed\n";
}
