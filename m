Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0A810E71E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 08:27:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.31.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id A6BE6580A5D
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 00:26:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pNrPI-00AIeB-26
 for igt-dev@lists.freedesktop.org; Fri, 03 Feb 2023 09:26:52 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Feb 2023 09:26:50 +0100
Message-Id: <20230203082650.2454081-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
References: <20230203082650.2454081-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] scripts: add a parser to produce
 documentation from Kernel C file metatags
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

On a similar approach to Kernel's kernel-doc script, add a parser
that will produce documentation from special-purpose documentation
tags inside IGT tests.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt-doc | 647 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 647 insertions(+)
 create mode 100755 scripts/igt-doc

diff --git a/scripts/igt-doc b/scripts/igt-doc
new file mode 100755
index 000000000000..3ed2be144e61
--- /dev/null
+++ b/scripts/igt-doc
@@ -0,0 +1,647 @@
+#!/usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0
+
+## Copyright (C) 2023    Intel Corporation                 ##
+## Author: Mauro Carvalho Chehab <mchehab@kernel.org>      ##
+## Inspired on Linux kernel-doc script                     ##
+
+use warnings;
+use strict;
+use Getopt::Long;
+use Pod::Usage qw/pod2usage/;
+
+my $igt_build_path = "build/";
+my $igt_runner = "/runner/igt_runner";
+
+# Fields that mat be inside TEST and SUBTEST macros
+my @fields = (
+	# Hardware building block / Software building block / ...
+	"Category",
+
+	# waitfence / dmabuf/ sysfs / debugfs / ...
+	"Sub-category",
+
+	# functionality test / pereformance / stress
+	"Test type",
+
+	# BAT / workarouds / developer-specific / ...
+	"Run type",
+
+	# Bug tracker issue(s)
+	"Issues?",
+
+	# all / DG1 / DG2 / TGL / MTL / PVC / ATS-M / ...
+	"Platforms?",
+
+	# Any other specific platform requirements
+	"Platform requirements?",
+
+	# some other IGT test, like igt@test@subtest
+	"Depends on",
+
+	# other non-platform requirements
+	"Requirements?",
+
+	# Description of the test
+	"Description",
+);
+
+my %doc;
+my $min_test_prefix;
+
+my $out = "";
+
+sub print_subtest($$$)
+{
+	my $fname = shift;
+	my $test = shift;
+	my $key = shift;
+
+	my $name = $fname;
+	$name =~ s,.*tests/,,;
+	$name =~ s/.[ch]$//;
+
+	my $test_name = "igt\@" . $name;
+
+	my $summary = $test_name . "@" . $doc{$test}{"subtest"}{$key}{"Summary"};
+
+	return if (!$summary);
+
+	my $num_vars = $summary =~ tr/%//;
+
+	# Trivial case: no variables at the subtest
+	if ($num_vars == 0) {
+		printf "\n\n$summary\n";
+		printf '=' x length($summary);
+		printf "\n\n";
+
+		foreach my $k (sort keys %{$doc{$test}{"subtest"}{$key}}) {
+			next if ($k eq "Summary");
+			next if ($k eq "arg");
+
+			next if ($doc{$test}{"subtest"}{$key}{$k} eq $doc{$test}{$k});
+
+			printf ":$k: %s\n", $doc{$test}{"subtest"}{$key}{$k};
+		}
+		print "\n";
+
+		return;
+	}
+
+	# Convert arguments into an array
+	my @arg_array;
+	my $arg_ref = $doc{$test}{"subtest"}{$key}{"arg"};
+
+	foreach my $n (keys %{$arg_ref}) {
+		next if ($n >= $num_vars);
+		foreach my $el (sort keys %{$arg_ref->{$n}}) {
+			push @{$arg_array[$n]}, $el;
+		}
+	}
+
+	my $size = scalar @arg_array;
+
+	if ($size < $num_vars) {
+		printf STDERR
+			"$fname: subtest '%s' subtest needs %d arguments but only %d are defined.\n",
+			$summary, $num_vars, $size;
+		exit 1;
+	}
+
+	for (my $j = 0; $j < $num_vars; $j++) {
+		if (!defined($arg_array[$j][0])) {
+			printf STDERR
+				"$fname: subtest '%s' needs arg[%d], but this is not defined.\n",
+				$summary, $j+1;
+			exit 1;
+		}
+	}
+
+	# convert numeric wildcards to string ones
+	$summary =~ s/%(d|ld|lld|i|u|lu|llu)/%s/;
+
+	my @pos = map { 0 } 1..$num_vars;
+	my @args;
+	my @arg_map;
+
+	while (1) {
+		for (my $j = 0; $j < $num_vars; $j++) {
+			my $a = $arg_array[$j][$pos[$j]];
+			$args[$j] = $a;
+
+			if (defined($arg_ref->{$j}{$a})) {
+				$arg_map[$j] = $arg_ref->{$j}{$a};
+			} else {
+				$arg_map[$j] = $a;
+			}
+			if ($arg_ref->{$j}{$a} =~ m/\<.*\>/) {
+				$args[$j] = "<$a>";
+			}
+		}
+
+		my $arg_summary = sprintf $summary, @args;
+
+		# Output the elements
+
+		printf "\n\n$arg_summary\n";
+		printf '=' x length($arg_summary);
+		printf "\n\n";
+
+		foreach my $k (sort keys %{$doc{$test}{"subtest"}{$key}}) {
+			next if ($k eq "Summary");
+			next if ($k eq "arg");
+
+
+			my $str = $doc{$test}{"subtest"}{$key}{$k};
+
+			$str =~ s/\%?\barg\[(\d+)\]/$arg_map[$1 - 1]/g;
+
+			next if ($str eq $doc{$test}{$k});
+
+			printf ":$k: %s\n", $str;
+		}
+		print "\n";
+
+		# Increment variable inside the array
+
+		my $p = 0;
+		while (!defined(@{$arg_array[$p]}[$pos[$p] + 1])) {
+			$pos[$p] = 0;
+			$p++;
+		    last if ($p >= $num_vars);
+		}
+		last if ($p >= $num_vars);
+		$pos[$p]++;
+	}
+}
+
+sub print_test()
+{
+	foreach my $test (sort {$a <=> $b} keys %doc) {
+		my $fname = $doc{$test}{"File"};
+		my $name = $fname;
+
+		$name =~ s,.*tests/,,;
+		$name =~ s/.[ch]$//;
+
+		my $test_name = "igt\@" . $name;
+
+
+		print '=' x length($test_name);
+		print "\n$test_name\n";
+		print '=' x length($test_name);
+		print "\n\n";
+
+		foreach my $k (sort keys %{$doc{$test}}) {
+			next if ($k eq "subtest");
+
+			printf ":$k: %s\n", $doc{$test}{$k};
+		}
+
+		foreach my $key (sort {$a <=> $b} keys %{$doc{$test}{"subtest"}}) {
+			print_subtest($fname, $test, $key);
+		}
+	}
+}
+
+sub get_subtests()
+{
+	my @subtests;
+
+	foreach my $test (keys %doc) {
+		my $fname = $doc{$test}{"File"};
+		my $name = $fname;
+
+		$name =~ s,.*tests/,,;
+		$name =~ s/.[ch]$//;
+
+		my $test_name = "igt\@" . $name;
+
+		foreach my $key (keys %{$doc{$test}{"subtest"}}) {
+			my $summary = $test_name . "@" . $doc{$test}{"subtest"}{$key}{"Summary"};
+
+			next if (!$summary);
+
+			my $num_vars = $summary =~ tr/%//;
+
+			# Trivial case: no variables at the subtest
+			if ($num_vars == 0) {
+				push @subtests, $summary;
+			} else {
+				# Convert arguments into an array
+				my @arg_array;
+				my $arg_ref = $doc{$test}{"subtest"}{$key}{"arg"};
+
+				foreach my $n (keys %{$arg_ref}) {
+					next if ($n >= $num_vars);
+					foreach my $el (sort keys %{$arg_ref->{$n}}) {
+						push @{$arg_array[$n]}, $el;
+					}
+				}
+
+				my $size = scalar @arg_array;
+
+				if ($size < $num_vars) {
+					printf STDERR
+					       "$fname: subtest '%s' subtest needs %d arguments but only %d are defined.\n",
+					       $summary, $num_vars, $size;
+					exit 1;
+				}
+
+				for (my $j = 0; $j < $num_vars; $j++) {
+					if (!defined($arg_array[$j][0])) {
+						printf STDERR
+						       "$fname: subtest '%s' needs arg[%d], but this is not defined.\n",
+						       $summary, $j+1;
+						exit 1;
+					}
+				}
+
+				# convert numeric wildcards to string ones
+				$summary =~ s/%(d|ld|lld|i|u|lu|llu)/%s/;
+				my @pos = map { 0 } 1..$num_vars;
+				my @args;
+
+				while (1) {
+					for (my $j = 0; $j < $num_vars; $j++) {
+						my $a = $arg_array[$j][$pos[$j]];
+						$args[$j] = $a;
+						if ($arg_ref->{$j}{$a} =~ m/\<.*\>/) {
+							$args[$j] = "<$a>";
+						}
+					}
+
+					my $arg_summary = sprintf $summary, @args;
+
+					push @subtests, $arg_summary;
+
+					# Increment variable inside the array
+
+					my $p = 0;
+					while (!defined(@{$arg_array[$p]}[$pos[$p] + 1])) {
+						$pos[$p] = 0;
+						$p++;
+					    last if ($p >= $num_vars);
+					}
+					last if ($p >= $num_vars);
+					$pos[$p]++;
+				}
+			}
+		}
+	}
+
+	return @subtests;
+}
+
+sub check_testlist()
+{
+	my @doc_subtests = get_subtests();
+
+	# Get a list of tests from
+	my @run_subtests;
+
+	open TESTLIST, "$igt_build_path/$igt_runner -L -t '$min_test_prefix' $igt_build_path/tests |" or die "Can't run igt_runner";
+	while (<TESTLIST>) {
+		s/\n//;
+		push @run_subtests, $_;
+	}
+	close TESTLIST;
+
+	# Compare arrays
+
+	my @run_missing;
+	my @doc_uneeded;
+
+	foreach my $t1 (@doc_subtests) {
+		my $re = $t1;
+		$re =~ s,\<[^\>]+\>,\\d+,g;
+
+		my $match = 0;
+		foreach my $t2 (sort @run_subtests) {
+			if ($t2 =~ m/^$re$/) {
+				$match = 1;
+			}
+		}
+		push @doc_uneeded, $t1 if (!$match);
+	}
+
+	foreach my $t2 (sort @run_subtests) {
+		my $found = 0;
+		foreach my $t1 (@doc_subtests) {
+			my $re = $t1;
+			$re =~ s,\<[^\>]+\>,\\d+,g;
+			if ($t2 =~ m/^$re$/) {
+				$found = 1;
+			}
+		}
+		push @run_missing, $t2 if (!$found);
+	}
+
+	if (@doc_uneeded) {
+		printf "Unused documentation:\n";
+		foreach my $t (@doc_uneeded) {
+			print "\t$t\n";
+		}
+	}
+
+	if (@run_missing) {
+		printf "Missing documentation:\n";
+		foreach my $t (@run_missing) {
+			print "\t$t\n";
+		}
+	}
+}
+
+
+
+#
+# Main: parse the files and fill %doc struct
+#
+
+my $rest;
+my $show_subtests;
+my $check_testlist;
+my $help;
+my $man;
+
+GetOptions(
+	"show-subtests" => \$show_subtests,
+	"igt-build-path" => \$igt_build_path,
+	"check-testlist" => \$check_testlist,
+	"rest|rst" => \$rest,
+	'help|?' => \$help,
+	man => \$man
+) or pod2usage(2);
+
+pod2usage(1) if $help;
+pod2usage(-exitstatus => 0, -verbose => 2) if $man;
+
+my $current_test;
+my $current_subtest;
+
+my $handle_section = "";
+my $current_field = "";
+my $cur_arg = -1;
+my $cur_arg_element = 0;
+my $test_number = 0;
+
+my  $field_re = join '|', @fields;
+
+while ($ARGV[0]) {
+	my $fname = $ARGV[0];
+	shift @ARGV;
+
+	# Dynamically build a test prefix from the file name
+
+	my $prefix = $fname;
+
+	$prefix =~ s,.*tests/,,;
+	$prefix =~ s,(.*/).*,$1,;
+	$prefix = "igt\@" . $prefix;
+
+	if (!$min_test_prefix) {
+		$min_test_prefix = $prefix;
+	} elsif (length($prefix) < length($min_test_prefix)) {
+		$min_test_prefix = $prefix;
+	}
+
+	open IN, $fname or die "Can't open $fname";
+
+	my $arg_ref;
+
+	$current_test = "";
+	my $subtest_number = 0;
+
+	while (<IN>) {
+		my $ln = $_;
+
+		next if ($ln =~ m/^\s*\*$/);
+
+		if ($ln =~ m,^\s*\*/$,) {
+			$handle_section = "";
+			undef($current_subtest);
+			undef($arg_ref);
+			$cur_arg = -1;
+
+			next;
+		}
+
+		if ($ln =~ m,^\s*/\*\*$,) {
+			$handle_section = "1";
+			next;
+		}
+
+		next if (!$handle_section);
+
+		$ln =~ s/^\s*\*\s*//;
+
+		# Handle only known sections
+		if ($handle_section eq "1") {
+			$current_field = "";
+			if ($ln =~ m/^TEST:\s*(.*)/) {
+				$current_test = $test_number;
+				$handle_section = "test";
+				$test_number++;
+
+				$doc{$current_test} = ();
+				$doc{$current_test}{"Summary"} = $1;
+				$doc{$current_test}{"File"} = $fname;
+				undef($current_subtest);
+
+				next;
+			}
+		}
+
+		if ($ln =~ m/^SUBTESTS?:\s*(.*)/) {
+			$current_field = "";
+			$handle_section = "subtest";
+			$current_subtest = $subtest_number++;
+
+			$doc{$current_test}{"subtest"}{$current_subtest} = ();
+
+			$doc{$current_test}{"subtest"}{$current_subtest}{"Summary"} = $1;
+			$doc{$current_test}{"subtest"}{$current_subtest}{"Description"} = "";
+
+			if (!defined($arg_ref)) {
+				my %new_arg = ();
+
+				$arg_ref = \%new_arg;
+			}
+			$doc{$current_test}{"subtest"}{$current_subtest}{"arg"} = $arg_ref;
+		}
+
+		# It is a known section. Parse its contents
+
+		if ($ln =~ m/($field_re):\s*(.*)/i) {
+			$current_field = lc $1;
+			my $v = $2;
+
+			$current_field =~ s/^([a-z])/\U$1/;
+			if ($handle_section eq "test") {
+				$doc{$current_test}{$current_field} = $v;
+			} else {
+				$doc{$current_test}{"subtest"}{$current_subtest}{$current_field} = $v;
+			}
+
+			$cur_arg = -1;
+			next;
+		}
+
+		# Use hashes for arguments to avoid duplication
+		if ($ln =~ m/arg\[(\d+)\]:\s*(.*)/) {
+			$current_field = "";
+			if (!defined($arg_ref)) {
+				die "$fname:$.: arguments should be defined after one or more subtests, at the same comment\n";
+			}
+
+			$cur_arg = $1 - 1;
+			$cur_arg_element = $2;
+
+			# Should be used only for numeric values
+			$arg_ref->{$cur_arg}{$cur_arg_element} = "<$2>" if ($2);
+			next;
+		}
+		if ($cur_arg >= 0 && $ln =~ m/\@(\S+):\s*(.*)/) {
+			$current_field = "";
+			if (!defined($arg_ref)) {
+				die "$fname:$.: arguments should be defined after one or more subtests, at the same comment\n";
+			}
+
+			$cur_arg_element = $1;
+			$arg_ref->{$cur_arg}{$cur_arg_element} = $2;
+			next;
+		}
+		if ($ln =~ m/\@(\S+):\s*(.*)/) {
+			$current_field = "";
+			if (!defined($arg_ref)) {
+				die "$fname:$.: arguments should be defined after one or more subtests, at the same comment\n";
+			}
+
+			printf "$fname:$.: Warning: invalid argument: \@$1: $2\n";
+		}
+
+		# Handle multi-line field contents
+		if ($current_field) {
+			if (m/\s*\*?\s*(.*)/) {
+				if ($handle_section eq "test") {
+					$doc{$current_test}{$current_field} .= " $1";
+				} else {
+					$doc{$current_test}{"subtest"}{$current_subtest}{$current_field} .= " $1";
+				}
+			}
+		}
+
+		# Handle multi-line argument contents
+		if ($cur_arg >= 0) {
+			if (m/\s*\*?\s*(.*)/) {
+				my $v = $1;
+				if ($arg_ref->{$cur_arg}{$cur_arg_element} =~ m/(.*)>$/) {
+					$arg_ref->{$cur_arg}{$cur_arg_element} = "$1 $v>";
+				} else {
+					$arg_ref->{$cur_arg}{$cur_arg_element} .= " $v";
+				}
+			}
+		}
+	}
+	close IN;
+}
+
+# Now all files were read, do some output
+my $run = 0;
+
+if ($show_subtests) {
+	$run = 1;
+	my @subtests = get_subtests();
+
+	for my $subtest (sort @subtests) {
+		print "$subtest\n";
+	}
+}
+
+if ($check_testlist) {
+	$run = 1;
+
+	check_testlist;
+}
+
+if (!$run || $rest) {
+	print_test;
+}
+
+# Script documentation
+
+__END__
+
+=head1 NAME
+
+igt-doc - Print formatted kernel documentation to stdout
+
+=head1 SYNOPSIS
+
+ igt-doc [options] FILES
+
+ Where [options] can be:
+
+	--rest			- Produces documentation in ReST format
+	--show-subtests		- Shows a list of documented subtests
+	--check-testlist	- Audit if the documentation is aligned with
+				  the sources
+	--man			- Shows a man-style page
+	--help			- Shows help
+
+=head1 DESCRIPTION
+
+This script looks for special documentation markups inside the IGT
+source code and produces documents in ReST format from them.
+
+=head1 OPTIONS
+
+=over 8
+
+=item B<--rest>
+
+Generate documentation from the source files, in ReST file format.
+
+Called by default if no other output mode parameter is used.
+
+=item B<--show-subtests>
+
+Shows the name of the documented subtests in alphabetical order.
+
+=item B<--igt-build-path>
+
+Path where the IGT runner is sitting. Used by B<--check-testlist>.
+
+Default: build/
+
+=item B<--check-testlist>
+
+Check the documentation against the testlist as identified by IGT runner,
+identifying documentation gaps.
+
+=item B<--help>
+
+Displays a help message.
+
+=item B<--man>
+
+Displays a man-style message.
+
+=back
+
+=head1 BUGS
+
+Report bugs to Mauro Carvalho Chehab <mchehab@kernel.org>
+
+=head1 COPYRIGHT
+
+Authored 2023 by Mauro Carvalho Chehab <mchehab@kernel.org>
+
+Copyright (c) 2023 Intel Corporation
+
+License GPLv2: GNU GPL version 2 <http://gnu.org/licenses/gpl.html>.
+
+This is free software: you are free to change and redistribute it.
+There is NO WARRANTY, to the extent permitted by law.
+
+=cut
-- 
2.39.0
