# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl sturm0.t'

use Test::Simple tests => 12;

use Math::Polynomial::Solve qw(:sturm);
use strict;
use warnings;
require "t/coef.pl";

my @case = (
	[32, 24, 1], 3.5,
	[1, 3, 0, -1], 2.25,
	[1, 0, 0, -1], 1,
	[1, 0, 0, 1], -1,
	[1, 0, 0, 0, 1], -1,
	[1, 0, 0, 0, -1], 1,
	[1, 0, 0, 0, 0, 1], -1,
	[1, 0, 0, 0, 0, -1], 1,
	[1, 3, 3, 1], 0,
	[1, -4, 4, -16], -900,
	[1, -6, 11, -6], 1,
	[8, -24, 0, 6], 14.625,
);

while (@case)
{
	my $p = shift @case;
	my $c = shift @case;
	my @polynomial = @$p;
	my @chain = poly_sturm_chain( @polynomial );

	my($fn) = @{$chain[$#chain]};	# get the last (constant) polynomial.
	ok($c == $fn, "Polynomial: [" . join(", ", @polynomial) . "], fn = $fn");
	#print "\nPolynomial: [", join(", ", @polynomial), "]\n";
	#foreach my $j (0..$#chain)
	#{
	#	my @c = @{$chain[$j]};
	#	print sprintf("    f%2d: [", $j) . join(", ", @c), "]\n";
	#}
}

exit(0);

