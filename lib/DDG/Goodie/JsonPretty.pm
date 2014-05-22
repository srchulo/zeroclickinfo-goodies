package DDG::Goodie::JSONPretty;
# ABSTRACT: Makes JSON pretty!

use DDG::Goodie;
use JSON::XS;

triggers start => 'json';

handle remainder => sub {
	my $coder = JSON::XS->new->ascii->pretty(1);

	my $decoded;
	eval { $decoded = $coder->decode($_); };

	return if $@;
	return $coder->encode($decoded);
};
1;

