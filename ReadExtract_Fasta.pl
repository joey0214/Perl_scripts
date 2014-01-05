#usage:perl ReadExtract_Fasta.pl file1.fasta file2.txt
#read sequences from file2,then extract sequences from file1 using those names.
#and save into output.fasta
#$ARGV[0]=file1.fasta, $ARGV[1]=file2


use strict;
use Bio::SeqIO;
use Bio::DB::GenBank;
use Bio::DB::Fasta;
use Bio::PrimarySeq;

open(FILE2,$ARGV[1])|| die("can not open namelist file :$! \n");
my @name=<FILE2>;
print @name;
my $seq_db=Bio::DB::Fasta->new($ARGV[0]);
foreach my $id(@name){
	chomp($id);
	my $seq_obj=$seq_db->get_Seq_by_acc($id);	
}
#my $seq_obj=$seq_db->get_Seq_by_acc([@name]);
my $seqout=Bio::SeqIO->new(-file=>">>output.fasta",-format=>"fasta");
my $seq=$seq_obj->next_seq();
$seqout->write_seq($seq);
close(FILE2);
