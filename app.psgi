use strict;
use warnings;
use Plack::Request;
use Sisimai;
use JSON;

my $mbox = $ENV{SISIMAI_MBOX} || '/opt/mail';
my $j = JSON->new->utf8(1);

sub get_entries {
    my ($path) = @_;
    my $v = Sisimai->make($path);
    return if !defined $v;
    map {$_->damn} @$v;
}

sub {
    my $env = shift;
    my $req = Plack::Request->new($env);
    if ($req->path ne '/') {
        return [404, ['Content-Type' => 'application/json'], ['{"status":404,"message":"Not found"}']];
    }
    my @entries = get_entries($mbox);
    my $content = $j->encode({status => 200, rows => [@entries]});
    return [200, ['Content-Type' => 'application/json'], [$content]];
};
