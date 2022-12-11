package App::CSV2LaTeXTable;

# ABSTRACT: Generate LaTeX table from CSV file

use v5.24;

use Carp;
use File::Basename;
use LaTeX::Table;
use Moo;
use Text::CSV_XS;

# VERSION

use experimental 'signatures';

has csv         => ( is => 'ro', required => 1 );
has csv_param   => ( is => 'ro', default => sub { [] } );
has latex       => ( is => 'ro', required => 1 );
has latex_param => ( is => 'ro', default => sub { [] } );

sub run ($self) {
    my %csv_params = map { split /=/, $_, 2 } $self->csv_param->@*;
    $csv_params{binary} = 1;

    my $csv = Text::CSV_XS->new(\%csv_params);

    if ( !-f $self->csv ) {
        croak sprintf "File %s does not exist", $self->csv;
    }

    my ($header, $data);

    open my $fh, '<:encoding(utf-8)', $self->csv or croak $!;
    while ( my $row = $csv->getline( $fh ) ) {
        if ( $. == 1 ) {
            push $header->@*, $row;
            next;
        }

        push $data->@*, $row;
    }
    close $fh or croak $!;

    my %latex_params = map { split /=/, $_, 2 } $self->latex_param->@*;

    if ( !defined $latex_params{label} ) {
        my $basename = basename $self->csv, '.csv';
        $latex_params{label} = 'table:' . $basename;
    }

    my $table = LaTeX::Table->new({
        %latex_params,
        filename => $self->latex,
        header   => $header,
        data     => $data,
    });

    $table->generate;
}

1;

=head1 DESCRIPTION

This is the module behind L<csv2latextable>.

=head1 SYNOPSIS

    use App::CSV2LaTeXTable;

    my $csv   = '/path/to/a_csv_file.csv';
    my $latex = '/path/to/resulting_latex_file.tex';

    my $obj = App::CSV2LaTeXTable->new(
        csv   => $csv,
        latex => $latex,
    );

    $obj->run;

Using this CSV file:

    Name,Age,City
    Mr X,34,London
    Q,43,London
    M,55,London

This module generates this:

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
