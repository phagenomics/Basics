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

$file2 = $ARGV[1];

open ($FH, '<', $file2) or die "Cannot open $file2\n";
while ($line = <$FH>) {
	chomp ($line);
	foreach $key (keys %read) {
		if ($key=~ /$line/) { 
			print ">$key\n$read{$key}\n";
		}
	}
}
close($FH);