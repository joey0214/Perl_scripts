#!usr/bin/local/perl -w
#usage: perl get_multi_seq_fromNCBI_by_acc.pl acc_file.txt
#use this program,can get seq by accession number from NCBI,and name it by acc.
#$ARGV[0]=acc.txt

use strict;
use Bio::DB::GenBank;
use Bio::SeqIO;
use Bio::Seq::RichSeq;

open(FILE,$ARGV[0])|| die ("can  not open file:$!");
my @acc=<FILE>;

my $db=new Bio::DB::GenBank();
my $allseq=$db->get_Stream_by_acc([@acc]);
my $output = new Bio::SeqIO(-file=>">>output.gb",-format=>"genbank");
while(my $seq=$allseq->next_seq){
	#my $filename=$seq->accession;
	#my $output = new Bio::SeqIO(-file=>">>output.fasta",-format=>"fasta");
	#if you want fasta seq,can use next
	
	if($seq){
		$output->write_seq($seq);
	}
	else{
		print STDERR "cannot find sequence for accession number:@acc \n";
	}
	$output ->close();
}
close(FILE);
