$file = $ARGV[0];

$tag = 'XXX';

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
	@blast= split (/\t/, $line);
	if ($blast[0] ne $tag) {
        print "$line\n";

	}
	$tag = $blast[0];
}
close($FH);
