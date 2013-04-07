#!/local/bin/perl
#@author: joey
#@version: 2013-04-07
#@aim: get pdb file name list for MUSTANG.

use strict;
use warnings;

if (@ARGV != 2){
  print "uasge: perl $0 you_dir output_list_file"
}

opendir (DIR,$ARGV[0]) || die "can not open the directory ARGV[0]! \n";
my @dirs=readdir(DIR);
open (OUTPUT, ">$ARGV[1]");
foreach my $name(@dirs){
	if ($name ne "."){
		if ($name ne ".."){
			print OUTPUT "+".$name."\n";
		}
	}
}
close OUTPUT;
closedir DIR;
