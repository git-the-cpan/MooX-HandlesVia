
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "NativeTrait-like behavior for Moo.",
  "AUTHOR" => "Matthew Phillips <mattp\@cpan.org>",
  "BUILD_REQUIRES" => {},
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
    "Moo" => "1.003000",
    "Role::Tiny" => 0
  },
  "TEST_REQUIRES" => {
    "MooX::Types::MooseLike::Base" => "0.23",
    "Test::Exception" => 0,
    "Test::More" => 0
  },
  "VERSION" => "0.001004",
  "test" => {
    "TESTS" => "t/*.t t/from-moose/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

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



