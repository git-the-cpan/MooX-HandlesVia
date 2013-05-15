
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "NativeTrait-like behavior for Moo.",
  "AUTHOR" => "Matthew Phillips <mattp\@cpan.org>",
  "BUILD_REQUIRES" => {
    "MooX::Types::MooseLike::Base" => "0.23",
    "Test::Exception" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "MooX-HandlesVia",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "MooX::HandlesVia",
  "PREREQ_PM" => {
    "Class::Method::Modifiers" => 0,
    "Data::Perl" => "0.002006",
    "Module::Runtime" => 0,
    "Moo" => "1.002000",
    "Role::Tiny" => 0
  },
  "VERSION" => "0.001002",
  "test" => {
    "TESTS" => "t/*.t t/from-moose/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



