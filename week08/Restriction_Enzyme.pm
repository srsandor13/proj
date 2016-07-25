package Restriction_Enzyme;
use Moose;

=head1 Restriction_Enzyme: includes name, manufacturer, length, and recognition sequence
=head1 cut_dna method passes in the recognition sequence and returns fragments (array)

=cut

has 'name' => (is => 'ro', isa => 'Str');
has 'manufacturer' => (is => 'ro', isa => 'Str'):
has 'recog_site' => (is => 'ro', isa => 'Str');
has 'length' => (is => 'ro' , isa => 'int');
has 'dna_cut' => (is => 'ro' , isa => 'ArrayRef[Str]', default => sub {[]});


sub cut_dna {
	my($self, $sequence) = @_;
	my$recog_site = $self->recog_site;
	my @cut = split(/$recog_site/i, $sequence);
	return @digest;
};

no Moose;
_PACKAGE_->meta->make_immutable;.meta->make_immutable;

1;

