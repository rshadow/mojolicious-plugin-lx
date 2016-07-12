use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Mojolicious::Plugin::XML::LX',
    AUTHOR           => q{Roman V. Nikolaev <rshadow@rambler.ru>},
    VERSION_FROM     => 'lib/Mojolicious/Plugin/XML/LX.pm',
    ABSTRACT_FROM    => 'lib/Mojolicious/Plugin/XML/LX.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.006,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {
        'XML::Hash::LX'     => 0.0603,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Mojolicious-Plugin-XML-LX-*' },
);
