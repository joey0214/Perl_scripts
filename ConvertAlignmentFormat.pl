#!local/bin/perl -w
#@author: joey
#@version:2012-03-22
###description:input a alignment in FASTA format(*.fasta)
###convert to other type and save it as output.***(the format you choose)
###usage:perl Convert_alignment_format.pl 2aln file1
###$ARGV[0]=2aln, $ARGV[1]=file1
###2aln: convert to aln, a clustal file
###2phy: convert to phylip
###2meg: convert to mega format

use strict;
use Bio::AlignIO;
use Bio::SeqIO;

my $seqin=Bio::AlignIO->new(-file=>$ARGV[1], -format=>"fasta");
if ($ARGV[0] eq '2aln'){
  my $seqout=Bio::AlignIO->new(-file=>">output.aln", -format=>"clustalw"); 
	while(my $aln=$seqin->next_aln){
		$seqout-> write_aln($aln);
	}
}
elsif($ARGV[0] eq '2phy'){
	my $seqout=Bio::AlignIO->new(-file=>">output.phy", -format=>"phylip"); 
	while(my $aln=$seqin->next_aln){
		$seqout-> write_aln($aln);
	}
}
elsif ($ARGV[0] eq '2nex'){
	my $seqout=Bio::AlignIO->new(-file=>">output.nex", -format=>"nexus"); 
	while(my $aln=$seqin->next_aln){
		$seqout-> write_aln($aln);
	}
}
elsif ($ARGV[0] eq '2meg'){
	my $seqout=Bio::AlignIO->new(-file=>">output.meg", -format=>"mega"); 
	while(my $aln=$seqin->next_aln){
		$seqout-> write_aln($aln);
	}
}
elsif ($ARGV[0] eq '2stockholm'){
	my $seqout=Bio::AlignIO->new(-file=>">output.stockholm", -format=>"stockholm"); 
	while(my $aln=$seqin->next_aln){
		$seqout-> write_aln($aln);
	}
}
else{
	print "ERROR: $!+ unknown conversion format! \n";
}
