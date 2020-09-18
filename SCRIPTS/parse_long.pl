$file = $ARGV[0];

$sw = 0;

open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
	if ($line =~ /^Query\=(.+)/) {
		@name = split (/ \# /, $1);
		$sw = 1;
	}
    if ($sw == 1  and $line =~ /^>/ and $line !~ /hypothetical/) {
		$def = $line;
        $ts = 1;
	}
    if ($ts==1 and $line !~ /hypothetical/ ){
     $def= $def.$line;
    }
	if ($ts == 1  and $line =~ /^Length\=(\d+)/) {
		$ln = $1;
		$definition =$def;
	}
	if ($ts == 1 and $line =~ /Expect \= (.+?)\,/) {
		$ev = $1;
	}
	if ($ts == 1  and $line =~ /^Sbjct/) {
		print "$name[0]\t$name[1]\t$name[2]\t$name[3]\t$definition\t$ln\t$ev\n";
		$sw = 0;
		$def="";
        $ts= 0;
	}


}
close($FH);
