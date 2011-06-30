#!perl -T

use Test::More tests => 2;

use VarGuard;

my @destroy;
{
    var_guard { @destroy = @_ } my @var;
    @var = (3,2,1);

    is_deeply(\@destroy, [], 'nothing');
}
is_deeply(\@destroy, [3,2,1], 'something');
