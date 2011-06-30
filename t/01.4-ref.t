#!perl -T

use Test::More tests => 8;

use VarGuard;

for( \'abc', [3,2,1], { a => 1, b => 2 } ) {
    my $scalar_destroy;
    {
	var_guard { $scalar_destroy = $_[0] } my $var;
	$var = $_;

	is($scalar_destroy, undef, 'nothing');
    }
    is($scalar_destroy, $_, 'something');
}

{
    my $scalar_destroy;
    {
	var_guard { $_[0]('xyz') } my $code;
	$code = sub { $scalar_destroy = $_[0] };

	is($scalar_destroy, undef, 'nothing');
    }
    is($scalar_destroy, 'xyz', 'something');
}
