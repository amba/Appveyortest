#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;
use experimental 'signatures';
use Data::Dumper;
use Cwd;

my $build_folder = $ENV{APPVEYOR_BUILD_FOLDER};
$build_folder =~ s{\\}{/}g;
my @bash = ('C:\\msys64\usr\bin\bash', '-lc');
say "folder: $build_folder";

my $dir = getcwd();
say "pwd: $dir";
my $path = $ENV{PATH};
say "PATH: $path";

verbose_system(qw/ls -l/);
verbose_system(qw/make --version/);
verbose_system(qw/gcc --version/);

sub verbose_system (@command) {
    warn "command: @command\n";
    system(@command) == 0
        or die "command failed\n";
}
