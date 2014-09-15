package App::pmdir;
# ABSTRACT: returns the directory of a specific Perl module

use strict;
use warnings;
use Module::Runtime qw( require_module );
use File::Spec;

sub pmdir {
  my ( $module ) = @_;
  my $dir;
  eval {
    require_module($module);
    my $filename = $module;
    $filename =~ s!::!/!g;
    $filename .= '.pm';
    my $file = $INC{$filename};
    return undef unless $file;
    my @return = File::Spec->splitpath($file);
    $dir = $return[1];
  };
  return undef if $@ || !$dir;
  return $dir;
}

1;

=head1 DESCRIPTION

See L<pmdir>.

=head1 SUPPORT

IRC

  Join #sycontent on irc.perl.org. Highlight Getty for fast reaction :).

Repository

  https://github.com/Getty/p5-app-pmdir
  Pull request and additional contributors are welcome
 
Issue Tracker

  https://github.com/Getty/p5-app-pmdir/issues
