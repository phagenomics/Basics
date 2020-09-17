# Basics
This contains a set of dependency-free perl scripts to run some basic bioinformatics commands. Everything from scratch.

[translate.pl](SCRIPTS/translate.pl)

Takes a multifasta file and returns a multifasta of the translated sequences, the advantage is that you can play around with the genetic code if you suspect the organism (as in many cases in viruses) doesn't follow the genetic code. 

gc.pl

Takes a multifasta file and returns a list with the header and their corresponding GC content for each fasta entry (it could be a read, it could be a genome)

length_multi.pl 

Takes a multifasta file and returns a list with the header and their corresponding size for each fasta entry (it could be a read, it could be a genome)

break_multi.pl

Takes a multifasta file and a number as a second integer where the number is the maximum number of individual fasta perl file are to be broken into, it is good first step if you wish to "parallelize" something by running multiple small batches of something.

get_from_list_anyword.pl

Takes a list and a multifasta file. It will return the number a smaller multifasta file, if the header of any of them is included in the list.

