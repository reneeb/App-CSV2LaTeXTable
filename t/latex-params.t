#!/usr/bin/env perl

use strict;
use warnings;

use Test::More;
use Test::LongString;
use File::Basename;

my $dir = dirname __FILE__;

use_ok 'App::CSV2LaTeXTable';

my $latex = $dir . '/data/test.latex';
my $csv   = $dir . '/data/test.csv';

{
    unlink $latex;
    ok !-f $latex;

    my $obj = App::CSV2LaTeXTable->new(
        csv   => $csv,
        latex => $latex,
        latex_param => [
            "coldef='|c|c|p{3cm}|'",
            "caption='Testtable'",
        ]
    );

    $obj->run;

    ok -f $latex;

    my $content = do { local (@ARGV, $/) = $latex; <> };
    like_string $content, qr/begin\{table\}/;
    like_string $content, qr/\Q|c|c|p{3cm}|\E/;
    like_string $content, qr/Testtable/;
    like_string $content, qr/Name & Age & City \\\\/;
}

done_testing();
