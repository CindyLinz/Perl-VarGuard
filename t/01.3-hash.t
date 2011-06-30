#!perl -T

use Test::More tests => 2;

use VarGuard;

my %destroy;
{
    var_guard { %destroy = @_ } my %var;
    %var = ( a => 1, b => 2 );

    is_deeply(\%destroy, {}, 'nothing');
}
is_deeply(\%destroy, { a => 1, b => 2 }, 'something');
