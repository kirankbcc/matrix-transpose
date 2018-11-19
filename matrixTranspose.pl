#!/usr/bin/perl

##########################################
# FileName: matrixTranspose.pl
# Description: Generate matrix Transpose
#
# CreatedBy: Kiran Babu Chinnam on 20-11-2018
# ModifiedBy: Kiran Babu Chinnam on 20-11-2018
##########################################

use strict;
use warnings;
use POSIX;

print "enter value for M:";
chomp(my $m = <>);
print "enter value for N:";
chomp(my $n = <>);

my $num = $m*$n;

if($m < 1 || $n < 1 || $m > 100 || $n >100){
	
	print "value of m and n should be between 1 and 100.\n";
	exit(2);
}

#########################################
# M x N Matrix assignment  
#########################################
my @mat;
my %mhash;
my $i = 0;
my $key = 0;
for my $v (0..$num){
	
	$i++;
	push @mat,floor(rand($num));
	
	if($i == $n){
		push @{$mhash{$key}},@mat;
		@mat = ();
		$i = 0;
		$key++;
	}
}

#########################################
# print M x N Matrix 
#########################################
print "\nThe base Matrix is:\n";
print "[  ", join "  ",@{$mhash{$_}}, "]\n" for (sort {$a <=> $b} keys %mhash);


#########################################
# Print Transpose of a Matrix 
#########################################
my @trans;
print "\nTranspose of given matrix is:\n";
for(my $a=0;$a<$n;$a++){
	
	my $c = 0;
	print "[  ";
	for(my $b=0;$b<$m; $b++){
	
		$c++;
		push @trans,$mhash{$b}->[$a];
		
		if($c == $m){ 
			print join "  ", @trans, "]\n";
			@trans = ();
			$c = 0;
		}
	}
}