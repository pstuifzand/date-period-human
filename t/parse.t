use Test::More tests => 7;

use Test::Exception;
use Date::Period::Human;

is_deeply([Date::Period::Human::_parse_mysql_date('2010-01-01 00:00:00')],
          ['2010','01','01','00','00','00']);

my @should_fail = (
    '010-01-01 00:00:00',
    '',
    undef,
    '01-01-2001 00:00:00',
    '01-01-2001 00:00',
    '2001-01-20 00:00',
);
for (@should_fail) {
    dies_ok { Date::Period::Human::_parse_mysql_date($_) };
}

