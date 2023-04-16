#!/usr/bin/perl

use strict;
use warnings;

my $filename = "transcript.json";

open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";

my @text_lines;
my @simple_text_lines;

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /\"text\"/) {
        push @text_lines, $line;
    }
    if ($line =~ /\"simpleText\"/) {
        push @simple_text_lines, $line;
    }
}

close($fh);

my $combined_output = "";
my $max_lines = scalar(@text_lines) > scalar(@simple_text_lines) ? scalar(@text_lines) : scalar(@simple_text_lines);

for (my $i = 0; $i < $max_lines; $i++) {
    if ($i < scalar(@simple_text_lines)) {
        $combined_output .= $simple_text_lines[$i] . "\n";
    }
    if ($i < scalar(@text_lines)) {
        $combined_output .= $text_lines[$i] . "\n";
    }
}

print $combined_output;
