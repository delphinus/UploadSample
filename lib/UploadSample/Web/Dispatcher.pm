package UploadSample::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::Lite;
use Encode;
use JSON;

get '/' => sub {
    my ($c) = @_;
    $c->render('index.tt');
};

post '/upload' => sub {
    my ($c) = @_;
    my $p = $c->req->parameters;
    my $file1 = $c->req->upload('file1');

    my %res = (text1 => $p->{text1});
    if ($file1) {
        $res{size} = $file1->size;
        $res{basename} = $file1->basename;
        $res{content_type} = $file1->content_type;
    }

    $c->create_response(
        200,
        ['Content-Type' => 'text/html; charset=UTF-8'],
        [encode(utf8 => to_json(\%res))],
    );
};

1;
