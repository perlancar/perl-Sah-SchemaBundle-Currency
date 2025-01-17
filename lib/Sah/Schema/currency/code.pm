package Sah::Schema::currency::code;

use strict;

use Locale::Codes::Currency_Codes ();

# AUTHORITY
# DATE
# DIST
# VERSION

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
        {value=>'idr', valid=>1, validated_value=>'IDR'},
        {value=>'foo', valid=>0},
    ],
}];

1;
# ABSTRACT:
