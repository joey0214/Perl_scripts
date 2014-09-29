#!/usr/bin/perl
use strict;
use warnings;
use Bio::SeqIO;
if (@ARGV != 3) {
	print "Usage: perl $0 seq_file start_number end_number \n";
	exit;
}
my ($seq_file_name,$start_number,$end_number) = @ARGV;
open my $FH,"<$seq_file_name";
open OUT,">primer.fasta";
my @ins= <$FH>;
my $in = Bio::SeqIO->new( -format => 'fasta', -file => "<$seqfile" );
foreach (@ins){
	
}
while ( my $seq = $in->next_seq ) {
	my $id = ($seq->id)."5terminalPrimer";
	my $seqs = $seq ->seq;
	foreach (@ins) {
		chomp;
		s/>//;
		if ($id =~ m/$_/){
			print OUT ">$id\n$seqs\n" ;
		print "Find $id \n";
		}
	last if ($id =~ m/$_/);
	}

}
close $FH;