package Sah::Schema::currency::code;

# AUTHORITY
# DATE
# DIST
# VERSION

use Locale::Codes::Currency_Codes ();

my $codes = [sort keys %{ $Locale::Codes::Data{'currency'}{'code2id'}{alpha} }];
die "Can't extract any currency codes from Locale::Codes::Currency_Codes"
    unless @$codes;

our $schema = [str => {
    summary => 'Currency code',
    description => <<'_',

Accept only current (not retired) codes. Code will be converted to uppercase.

_
    match => '\A[A-Z]{3}\z',
    in => $codes,
    'x.perl.coerce_rules' => ['From_str::to_upper'],
    examples => [
        {value=>'', valid=>0},
        {value=>'idr', valid=>1, res=>'IDR'},
        {value=>'foo', valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
