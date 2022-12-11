[![Kwalitee status](https://cpants.cpanauthors.org/dist/App-CSV2LaTeXTable.png)](https://cpants.cpanauthors.org/dist/App-CSV2LaTeXTable)
[![GitHub issues](https://img.shields.io/github/issues/reneeb/App-CSV2LaTeXTable.svg)](https://github.com/reneeb/App-CSV2LaTeXTable/issues)
[![CPAN Cover Status](https://cpancoverbadge.perl-services.de/App-CSV2LaTeXTable-1.0.0)](https://cpancoverbadge.perl-services.de/App-CSV2LaTeXTable-1.0.0)
[![Cpan license](https://img.shields.io/cpan/l/App-CSV2LaTeXTable.svg)](https://metacpan.org/release/App-CSV2LaTeXTable)

# NAME

App::CSV2LaTeXTable - Generate LaTeX table from CSV file

# VERSION

version 1.0.0

# SYNOPSIS

```perl
use App::CSV2LaTeXTable;

my $csv   = '/path/to/a_csv_file.csv';
my $latex = '/path/to/resulting_latex_file.tex';

my $obj = App::CSV2LaTeXTable->new(
    csv   => $csv,
    latex => $latex,
);

$obj->run;
```

Using this CSV file:

```
Name,Age,City
Mr X,34,London
Q,43,London
M,55,London
```

This module generates this:

```
\begin{table}
\centering
\begin{tabular}{lrl}
\toprule
Name & Age & City \\
\midrule
Mr X & 34 & London \\
Q    & 43 & London \\
M    & 55 & London \\
\bottomrule
\end{tabular}
\label{table:a_csv_file}
\end{table}
```

# DESCRIPTION

This is the module behind [csv2latextable](https://metacpan.org/pod/csv2latextable).

# ATTRIBUTES

- csv
- csv\_param
- latex
- latex\_param

# METHODS

## run

```perl
my $obj = App::CSV2LaTeXTable->new(
    csv   => 'A-csv-file.csv',
    latex => 'Target_file.tex',
);

$obj->run;
```



# Development

The distribution is contained in a Git repository, so simply clone the
repository

```
$ git clone git://github.com/reneeb/App-CSV2LaTeXTable.git
```

and change into the newly-created directory.

```
$ cd App-CSV2LaTeXTable
```

The project uses [`Dist::Zilla`](https://metacpan.org/pod/Dist::Zilla) to
build the distribution, hence this will need to be installed before
continuing:

```
$ cpanm Dist::Zilla
```

To install the required prequisite packages, run the following set of
commands:

```
$ dzil authordeps --missing | cpanm
$ dzil listdeps --author --missing | cpanm
```

The distribution can be tested like so:

```
$ dzil test
```

To run the full set of tests (including author and release-process tests),
add the `--author` and `--release` options:

```
$ dzil test --author --release
```

# AUTHOR

Renee Baecker <reneeb@cpan.org>

# COPYRIGHT AND LICENSE

This software is Copyright (c) 2022 by Renee Baecker.

This is free software, licensed under:

```
The Artistic License 2.0 (GPL Compatible)
```
