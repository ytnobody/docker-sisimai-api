# ytnobody/sisimai-api

Sisimai (Mail Analyzing Interface for bounce mails) + JSON-API

## SYNOPSIS

Way to bootup:

Run with docker command as followings.

    docker run --rm -it -v /path/to/mailbox:/opt/mail -p 5000:5000 ytnobody/sisimai-api

Way to get summaries of bounce mails:

Access to http://your-docker-host:5000/

## ABOUT API RESPONSE

* status - As http response code

* rows - Summaries of bounce mails. Please see http://search.cpan.org/dist/Sisimai/lib/Sisimai/Data.pm#PROPERTIES for detail.

## MAINTAINER

ytnobody <ytnobody at gmail dot com>

## SEE ALSO

* http://libsisimai.org/
