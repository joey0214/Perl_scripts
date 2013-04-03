#!/local/bin/perl -w
#@author: joey
#@version: 2013-04-03
#usage: perl extractInfoGB.pl yourFile.gb outputFile
#better to output as a textfile, so you can open it as excel file.
#bugReport: joey0576@163.com

use strict;
use Bio::SeqIO;
use Bio::SeqFeatureI;

my $fileName = $ARGV[0];
my $outputFileName = $ARGV[1];
open(OUTFILE,">$outputFileName");
my $seqInGenbank =  Bio::SeqIO -> new (-file => $fileName, -format => 'genbank');
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
	print OUTFILE $accessionNumber."\t".$seqLength."\t".$organism."\t".$mol_type."\t".$strain."\t".$isolate."\t".$isolation_source."\t".$host."\t".$country."\t".$collection_date."\t".$taxon."\t".$note."\n";
}
close OUTFILE;
