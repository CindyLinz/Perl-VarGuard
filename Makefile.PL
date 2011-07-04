use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'VarGuard',
    AUTHOR              => q{Cindy Wang (CindyLinz)},
    VERSION_FROM        => 'lib/VarGuard.pm',
    ABSTRACT_FROM       => 'lib/VarGuard.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'Tie::Scalar' => 0,
	'Tie::Array' => 0,
	'Tie::Hash' => 0,
    },
    PM => {
	'lib/VarGuard.pm' => '$(INST_LIBDIR)/VarGuard.pm',
	'lib/VarGuard/Scalar.pm' => '$(INST_LIBDIR)/VarGuard/Scalar.pm',
	'lib/VarGuard/Array.pm' => '$(INST_LIBDIR)/VarGuard/Array.pm',
	'lib/VarGuard/Hash.pm' => '$(INST_LIBDIR)/VarGuard/Hash.pm',
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'VarGuard-*' },
);
