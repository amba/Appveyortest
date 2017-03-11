#!/usr/bin/env perl
use 5.020;
use warnings;
use strict;
use experimental 'signatures';
use Data::Dumper;
use Cwd;

my $build_folder = $ENV{APPVEYOR_BUILD_FOLDER};
$build_folder =~ s{\\}{/}g;
say "folder: $build_folder";

safe_chdir($build_folder);

my $dir = getcwd();
say "pwd: $dir";
my $path = $ENV{PATH};
say "PATH: $path";

verbose_system(qw/ls -l/);
verbose_system(qw/make --version/);
verbose_system(qw/gcc --version/);
verbose_system(qw/perl --version/);
verbose_system(qw(wget http://cpanmin.us -O /usr/bin/cpanm));
verbose_system(qw(chmod u+x /usr/bin/cpanm));
verbose_system(qw(cpanm --version));
verbose_system(qw(cpanm Text::Diff));

sub verbose_system (@command) {
    warn <<"EOF";
##################################################
# command: @command
##################################################
EOF
    system(@command) == 0
        or die "command failed\n";
}

sub safe_chdir ($path) {
    chdir $path
        or die "cannot chdir to $path: $!";
}
