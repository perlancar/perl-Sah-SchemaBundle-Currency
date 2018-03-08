package Sah::Schema::currency::code;

# DATE
# VERSION

use Locale::Codes::Currency_Codes ();

my $codes = sort keys %{ $Locale::Codes::Data{'currency'}{'code2id'}{alpha} };

our $schema = [str => {
    summary => 'Currency code',
    description => <<'_',

Accept only current (not retired) codes.

_
    match => '\A[A-Z]{3}\z',
    in => [],
    'x.perl.coerce_rules' => ['str_toupper'],
}, {}];

1;
# ABSTRACT:
