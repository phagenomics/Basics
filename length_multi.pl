$file = $ARGV[0];

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
	if ($line =~ />(.+)?/) {
		$name = $1;
		$read{$name}='';

	}
	else{
		$read{$name}=$read{$name}.$line;
	}
}
close($FH);

foreach $key ( keys %read) {
	$ln = length($read{$key});
        print "$key\t$ln\n";

}


