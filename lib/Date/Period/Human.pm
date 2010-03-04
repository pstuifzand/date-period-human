package Date::Period::Human;
use strict;
use Carp;

use Date::Calc qw/Delta_DHMS Today_and_Now/;

our $VERSION='0.1.0';

sub new {
    my ($klass) = @_;
    my $self = {};
    return bless $self, $klass;
}

sub _parse_mysql_date {
    my ($mysql_date) = @_;

    if ($mysql_date =~ m/^(\d{4})-(\d{2})-(\d{2})\s(\d{2}):(\d{2}):(\d{2})$/) {
        return $1, $2, $3, $4, $5, $6;
    }
    croak "Not a MySQL date: [$mysql_date]";
}

sub human_readable {
    my ($self, $date) = @_;

    my (@date) = _parse_mysql_date($date);

    my ($Dd,$Dh,$Dm,$Ds) = Delta_DHMS(@date, Today_and_Now(0));

    if ($Dd > 10) {
        return $date[2] . '-' . $date[1] . '-' . $date[0];
    }
    elsif ($Dd > 1) {
        return $self->translate('time_num_days_ago', $Dd);
    }
    elsif ($Dd == 1) {
        return $self->translate('time_yesterday_at', $date[3], $date[4]);
    }
    elsif ($Dd == 0 && $Dh >= 1) {
        return $self->translate('time_hour_min_ago', $Dh, $Dm);
    }
    elsif ($Dd == 0 && $Dh == 0 && $Dm > 0) {
        if ($Dm == 1) {
            return $self->translate('time_minute_ago', $Dm);
        }
        return $self->translate('time_minutes_ago', $Dm);
    }
    elsif ($Dd == 0 && $Dh == 0 && $Dm == 0 && $Ds > 5) {
        return $self->translate('time_less_than_minute_ago');
    }
    else {
        return $self->translate('time_just_now');
    }
    return;
}

sub translate {
    my ($self, $key, @values) = @_;

    my %translation = (
        time_num_days_ago           => '%d dagen geleden',
        time_yesterday_at           => 'gister om %02d:%02d',
        time_hour_min_ago           => '%d uur %d minuten geleden',
        time_minute_ago             => '%d minuut geleden',
        time_minutes_ago            => '%d minuten geleden',
        time_less_than_minute_ago   => 'minder dan een minuut geleden',
        time_just_now               => 'net precies',
    );

    return sprintf($translation{$key}, @values);
}

1;

=head1 NAME

Date::Period::Human - Human readable date periods

=head1 DESCRIPTION

=head1 SYNOPSYS


=cut


