# NAME

Date::Period::Human - Human readable date periods

# SYNOPSYS

    # Create the Date::Period::Human object
    my $d = Date::Period::Human->new();

    # Get a relative human readable date string
    my $s = $d->human_readable('2010-01-01 02:30:42');

    # Now $s contains the relative date in human readable form, e.g. "1 year
    # ago", "3 weeks ago", etc.

    # Use English instead of the default Dutch
    # my $d = Date::Period::Human->new({ lang => 'en' });

# DESCRIPTION

Creates a string of relative time. This is useful when you're showing user
created content, where it's nicer to show how long ago the item was posted
(e.g. "3 weeks ago") instead of the date and time.

This also solves the problem where you don't know the timezone of the user who
is viewing the item. This is solved because you show relative time instead of
absolute time in most cases.

There is one case that isn't relative.

# CLASS METHODS

This class contains one public class method.

## new \[options\]

- lang

    The language you want to use. Default 'nl', can be 'en' for English.

- today\_and\_now

    An arrayref containing \[ $year, $month, $day, $hour, $min, $sec \].

    Will be used as the fixed point from which the relative time will be calculated.

# METHODS

This class contains one public method.

## $self->human\_readable($mysql\_date|$datetime|$epoch)

Parses the $mysql\_date and returns a human readable time string.

Or, $datetime (a DateTime object) and returns a human readable time string.

Or, $epoch (identified by regex /^\\d+$/) and passed through gmtime().

# HOMEPAGE

http://github.com/pstuifzand/date-period-human

# LICENSE

This library is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

# AUTHOR

Peter Stuifzand <peter@stuifzand.eu>

# COPYRIGHT

Copyright 2010 Peter Stuifzand
