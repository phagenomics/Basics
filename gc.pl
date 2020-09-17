
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
	 $count_A = ($read{$key} =~ s/A/A/g);
	 $count_T = ($read{$key} =~ s/T/T/g);
	 $count_G = ($read{$key} =~ s/G/G/g);
	 $count_C = ($read{$key} =~ s/C/C/g);
	 
	 $gc = int(($count_C + $count_C) * 100 / ($count_A + $count_T +$count_G + $count_C));
	 
	 print "$key\t$gc\n";
}
