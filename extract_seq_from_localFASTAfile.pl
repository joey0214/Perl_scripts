#!usr/bin/local/perl -w
use strict;
use Bio::SeqIO;
use Bio::Seq;
use Bio::DB::GenBank;
use Bio::Seq::RichSeq;

open(FILE,"namelist.txt")|| die ("can not open file:$!");
my @acc=<FILE>;
print @acc;
open (FILE2,"k07.fasta") || die("can not open file:$!");
my @db=<FILE2>;
#print @db;
eval {
my $allseq=@db->get_Seq_by_acc([@acc]);
while(my $seq=$allseq->next_seq){
        my $output = new Bio::SeqIO(-file=>">>output2222.fasta",-format=>"fasta");

        if($seq){
                $output->write_seq($seq);
        }
        else{
                print STDERR "cannot find sequence for accession number:@acc! for:$! \n";
        }
        $output ->close();
}
close(FILE);
};
if ($@) {
print "error:$@";
}
