#!usr/bin/local/perl -w
use strict;
use Bio::SeqIO;

#usage:"perl spilt.pl yourFileName.fasta"
#      this script is to spilt a Fasta file contains multiple sequences into 
#     fasta file name by its display name contains single sequence.

my $seqInFasta =  Bio::SeqIO -> new (-file => $ARGV[0], -format => 'fasta');
while (my $seqObj = $seqInFasta -> next_seq){
  my $outfileName = $seqObj->display_name;
	#print $outfileName;
	my $output = new Bio::SeqIO(-file=>">$outfileName.fasta",-format=>"fasta");
	if($seqObj){
		$output->write_seq($seqObj);
	}
	else{
		print STDERR "Error \n";
	}
	$output ->close();
	
}
