#!perl -T

use Test::More tests => 2;

use VarGuard;

my $scalar_destroy;
{
    var_guard { $scalar_destroy = $_[0] } my $var;
    $var = 'abc';

    is($scalar_destroy, undef, 'nothing');
}
is($scalar_destroy, 'abc', 'something');
