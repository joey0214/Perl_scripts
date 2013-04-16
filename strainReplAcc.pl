#!local/bin/perl -w
#@author :joey zhong
#@version:2013-04-16
#Usage:perl $0 GBinfile FASTAoutfile
#Extension: if you want to choose other information as the sequence's name,
#           edit the line 100.
#           this script just choose strain as sequence name.
#BugReport to : joey0576@163.com 

use strict;
use Bio::SeqIO;

if (@ARGV !=2){
  print "Usage: perl $0 GBinfile FASTAoutfile\n";
	exit;
}
my($infileName, $ourfileName)=@ARGV;
my $seqInGenbank =  Bio::SeqIO -> new (-file => $infileName, -format => 'genbank');
while (my $seqObj = $seqInGenbank -> next_seq)
{
  my $displayName =  $seqObj-> display_name;
	my $desc = $seqObj-> desc;
	my $seqLength = $seqObj -> length;
	my $accessionNumber = $seqObj -> accession_number; ##
	my $display_id = $seqObj -> display_id;
	my $seqString = $seqObj -> seq;
	my $proSeqString = $seqObj-> translate;

	my $organism ="null";
	my $mol_type="null";
	my $isolate="null";
	my $isolation_source="null";
	my $host="null";
	my $country="null";
	my $collection_date="null";
	my $note="null";
	my $strain="null";
	my $taxon="null";
	my $seqOutObj = Bio::SeqIO->new(-file=> ">$ourfileName",-format=>'fasta');
	for my $feat($seqObj -> get_SeqFeatures)
	{
		#get organism information
		if ($feat ->has_tag('organism'))
		{
			$organism =${[$feat ->get_tag_values('organism')]}[0];
		}
		#get mol_type information
		if ($feat ->has_tag('mol_type'))
		{
			$mol_type =${[$feat ->get_tag_values('mol_type')]}[0];
		}
		#get isolate information
		if ($feat ->has_tag('isolate'))
		{
			$isolate =${[$feat ->get_tag_values('isolate')]}[0];
		}
		#get isolation_source information
		if ($feat ->has_tag('isolation_source'))
		{
			$isolation_source =${[$feat ->get_tag_values('isolation_source')]}[0];
		}
		#get host information
		if ($feat ->has_tag('host'))
		{
			$host =${[$feat ->get_tag_values('host')]}[0];
		}
		#get country information
		if ($feat ->has_tag('country'))
		{
			$country =${[$feat ->get_tag_values('country')]}[0];
		}
		#get collection_date information
		if ($feat ->has_tag('collection_date'))
		{
			$collection_date =${[$feat ->get_tag_values('collection_date')]}[0];
		}
		#get note information
		if ($feat ->has_tag('note'))
		{
			$note =${[$feat ->get_tag_values('note')]}[0];
		}
		#get strain information
		if ($feat ->has_tag('strain'))
		{
			$strain =${[$feat ->get_tag_values('strain')]}[0];
		}
		#get taxon information
		if ($feat -> has_tag('db_xref'))
		{
			$taxon=${[$feat -> get_tag_values('db_xref')]}[0];
		}
	}
	#if strain information do not find in genbank file, 
	#choose accession number as sequence's name
	my $seqOut ="null";
	if ($strain eq "null"){
		$seqOut=Bio::Seq->new(-seq=>$seqString,-display_id=>$accessionNumber);
	}
	else {
		$seqOut=Bio::Seq->new(-seq=>$seqString,-display_id=>$strain);
	}
	$seqOutObj ->write_seq($seqOut);
}

