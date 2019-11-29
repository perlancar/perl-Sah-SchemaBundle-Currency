package Sah::Schema::currency::code;

# DATE
# VERSION

use Locale::Codes::Currency_Codes ();

my $codes = [sort keys %{ $Locale::Codes::Data{'currency'}{'code2id'}{alpha} }];
die "Can't extract any currency codes from Locale::Codes::Currency_Codes"
    unless @$codes;

our $schema = [str => {
    summary => 'Currency code',
    description => <<'_',

Accept only current (not retired) codes.

_
    match => '\A[A-Z]{3}\z',
    in => $codes,
    'x.perl.coerce_rules' => ['From_str::to_upper'],
}, {}];

1;
# ABSTRACT:
