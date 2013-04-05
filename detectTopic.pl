#!/local/bin/perl -w
#@author: joey
#@version: 2013-04-05
#@bug report to: joey0576@163.com

use strict;
use warnings;

if (@ARGV != 2){
  print "Usage: perl $0 infile outfile \n";
	exit;
}
my ($infile, $outfile) =@ARGV; 
open(OUTFILE, ">$outfile");
open (FILE, "<$infile");
my @fileContent =<FILE>;
my $wholeString ="";
foreach my $_(@fileContent) {
	chop($_);
	$wholeString=$wholeString.$_;	
}
my @words=split(/\b/,$wholeString);
my (%count, $word);
foreach $word(@words){
	$count{$word} +=1;
}
foreach $word(sort keys %count){
	print OUTFILE "$word \t $count{$word}\n";
}
close FILE;
close OUTFILE;
