$file = $ARGV[0];

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
	if ($line =~ />(.+)/) {
		$name = $1;

		$read{$name}='';
	}
	else{
		$read{$name}=$read{$name}.$line;
	}
}
close($FH);

foreach $key (keys %read) {
	$output = "$key".".fasta";
	open ($OUT, '>', $output);
	print $OUT ">$key\n$read{$key}\n";
	
	
}