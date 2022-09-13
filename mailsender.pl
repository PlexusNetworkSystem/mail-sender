#!/usr/bin/perl
use strict;
use warnings;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;
print "Enter sender mail address: ";my $from = <STDIN>;
print "Enter reciver mail address: ";my $to = <STDIN>;
print "Enter password of sender mail address: ";my $passwd = <STDIN>;
print "Enter subject: ";my $subject = <STDIN>;
print "Enter text: ";my $body = <STDIN>;
my $email = Email::Simple->create(
    header => [
        From    => $from,
        To      => $to,
        Subject => $subject,
    ],
    body => $body,
);
my $sender = Email::Send->new(
    {   mailer      => 'Gmail',
        mailer_args => [
            username => $from,
            password => $passwd,
        ]
    }
);
eval { $sender->send($email) };
die "Error sending email: $@" if $@;
