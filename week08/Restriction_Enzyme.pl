package Restriction_Enzyme;

my %_enzyme = (
	_name => '';
	_manufacturer => '';
	_recog_site => '';
	_length => '';
);


sub new {
	my($class, %_enzyme) = (@_);
	my $obj = {
		_name => $enzyme{name} || die("need a 'name'"),
		_manufacturer => $enzyme{manufacturer} || die("need a 'manufacturer' "),
		_recog_site => $enzyme{recog_site} || die( "need a 'recog_site' "),
		_length => $enzyme{length} || die(" need a 'length' "),
	};
	return bless $obj, $class;

sub cut_dna{
	my($self, $enzyme, $sequence) = @_;
	my $recog_site = $_enyzme{$enzyme};
	my @run = split(/$recog_site/i, $sequence);
	return @run;



