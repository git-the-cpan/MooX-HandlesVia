use strict;
use warnings;
use Test::More;
{
  package Ex1;

  use Moo;

  has bars => (
    is => 'ro',
    handles => {
      'get_bar' => 'foo';
      'set_bar' => 'bar';
    },
    default => sub { {} },
    moosify => sub {
      my $spec = shift;
      $spec->{handles} = {
        get_bar => 'get',
        set_bar => 'set'
      };
      $spec->{traits} = ['Hash'];
    }
  );

  sub foo { die; } sub bar { die; }
}
{
  package Ex2;
  use Moose;

  extends 'Ex1';
}

my $ex2 = Ex2->new;
use DDP; p $ex2;
$ex2->set_bar('ate', 'nine');
is ($ex2->get_bar('ate'), 'nine', 'get_baz inflated to moose worked');

done_testing;
