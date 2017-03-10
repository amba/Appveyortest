#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;
use experimental 'signatures';
use Data::Dumper;

my $build_folder = $ENV{APPVEYOR_BUILD_FOLDER};
my @bash = ('C:\\msys64\usr\bin\bash', '-lc');
say "folder: $build_folder";

run_bash_command("ls -l");

sub run_bash_command ($command) {
    $command = "cd $build_folder && $command";
    verbose_system(@bash, $command);
}

sub verbose_system (@command) {
    warn "command: @command\n";
    system(@command) == 0
        or die "command failed\n";
}
