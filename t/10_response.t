#!perl

use warnings;
use strict;
use utf8;
use open qw(:std :utf8);
use lib qw(lib ../lib);

use Mojolicious::Lite;
use Test::Mojo;
use Test::More tests => 4;

{
    package MyApp;
    use Mojo::Base 'Mojolicious';
    sub startup { $_[0]->plugin('XML::LX') }
    1;
}

my $t = Test::Mojo->new('MyApp');

note 'Simple response test';
{
    $t->app->routes->any("/test")->to( format => 'xml', cb => sub {
        $_[0]->render(xml => {
            response => {
                status  => 'ok',
            }
        });
    });

    $t  -> get_ok("/test")
        -> content_type_is('application/xml')
        -> element_exists('response')
        -> text_is('response > status', 'ok')
    ;

    diag Encode::decode_utf8 $t->tx->res->body unless $t->tx->success;
}
