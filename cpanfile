# This file is generated by Dist::Zilla::Plugin::SyncCPANfile v0.02
# Do not edit this file directly. To change prereqs, edit the `dist.ini` file.

requires "Carp" => "0";
requires "File::Basename" => "0";
requires "Getopt::Long" => "0";
requires "LaTeX::Table" => "1.0";
requires "Moo" => "2.0";
requires "Text::CSV_XS" => "1.40";
requires "perl" => "5.024";

on 'test' => sub {
    requires "File::Spec" => "0";
    requires "Test::LongString" => "0";
    requires "Test::More" => "0";
};

on 'configure' => sub {
    requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
    requires "Pod::Coverage::TrustPod" => "0";
    requires "Test::BOM" => "0";
    requires "Test::More" => "0.88";
    requires "Test::NoTabs" => "0";
    requires "Test::Perl::Critic" => "0";
    requires "Test::Pod" => "1.41";
    requires "Test::Pod::Coverage" => "1.08";
};
