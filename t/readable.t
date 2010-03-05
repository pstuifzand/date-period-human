use Test::More;
use Date::Period::Human;

my @tests =(
    [ '2010-03-05 10:15:00', 'net precies' ],
    [ '2010-03-05 10:14:56', 'net precies' ],
    [ '2010-03-05 10:14:54', 'minder dan een minuut geleden'],
    [ '2010-03-05 10:14:00', '1 minuut geleden'],
    [ '2010-03-05 10:13:53', '1 minuut geleden'],
    [ '2010-03-05 10:13:00', '2 minuten geleden'],
    [ '2010-03-05 10:10:00', '5 minuten geleden'],
    [ '2010-03-05 09:00:00', '1 uur 15 minuten geleden'],
    [ '2010-03-05 04:00:00', '6 uur 15 minuten geleden'],
    [ '2010-03-05 04:20:00', '5 uur 55 minuten geleden'],
    [ '2010-03-05 10:00:00', '15 minuten geleden'],
    [ '2010-03-01 10:00:00', '4 dagen geleden'],
);

my $d = Date::Period::Human->new({today_and_now => [2010,3,5,10,15,0]  });

for (@tests) {
    is($d->human_readable($_->[0]), $_->[1]);
}

done_testing();

