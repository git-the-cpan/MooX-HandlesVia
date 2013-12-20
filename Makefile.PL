
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
  "VERSION" => "0.001005",
  "test" => {
    "TESTS" => "t/*.t t/from-moose/*.t t/unimport/*.t"
  }
);


my %FallbackPrereqs = (
  "Class::Method::Modifiers" => 0,
  "Data::Perl" => "0.002006",
  "Module::Runtime" => 0,
  "Moo" => "1.003000",
  "MooX::Types::MooseLike::Base" => "0.23",
  "Role::Tiny" => 0,
  "Test::Exception" => 0,
  "Test::More" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



