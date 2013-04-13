#!/usr/bin/perl
#@author:joey
#@version:2012-06-13
use strict;
use warnings;
use Bio::SeqIO;
if (@ARGV != 3) {
  print "Usage: perl $0 seq_id_file Seq_file Save_file \n";
	exit;
}
my ($seqid,$seqfile,$savefile) = @ARGV;
open my $FH,"<$seqid";
open OUT,">$savefile";
my @ins= <$FH>;
my $in = Bio::SeqIO->new( -format => 'fasta', -file => "<$seqfile" );
while ( my $seq = $in->next_seq ) {
	my $id = $seq->id;
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
