package Sah::Schema::currency::pair;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Fiat currency pair, e.g. USD/IDR',
    description => <<'_',

Currency pair is string in the form of *currency1*/*currency2*, where
*currency1* is called the base currency while *currency2* is the quote (or
price) currency. Both must be known currency codes (e.g. USD, or IDR).

Currency code is checked against <pm:Locale::Codes::Currency_Codes>.

Will be normalized to uppercase.

_
    match => qr(\A\S+/\S+\z),
    #'x.completion' => 'currency_pair',
    'x.perl.coerce_rules' => ['From_str::to_currency_pair'],
    examples => [
        {value=>'', valid=>0},
        {value=>'idr', valid=>0},
        {value=>'usd/idr', valid=>1, validated_value=>'USD/IDR'},
        {value=>'usd idr', valid=>0},
        {value=>'usd/foo', valid=>0},
    ],
}, {}];

1;
# ABSTRACT:
