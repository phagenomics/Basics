$file = $ARGV[0];
$max = $ARGV[1];

$counter = 0;
$ct =1;


$output = "Partial"."_"."$ct".".fasta";

open ($OUT, '>', $output);
open ($FH, '<', $file) or die "Cannot open $file\n";
while ($line = <$FH>) {
	chomp ($line);
    if ($counter == $max ){
		$ct++;
		$counter=0;
		$output = "Partial"."_"."$ct".".fasta";
		open ($OUT, '>', $output);
	}
	if ($line =~ />/) {
		$counter++;
	}
	print $OUT "$line\n";
}
close($FH);

