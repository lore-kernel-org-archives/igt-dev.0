Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE28310FCA7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 08:59:25 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 12 Apr 2022 10:59:11 +0200
Message-Id: <9a0552078e4e27744894799bad47920f8c145dec.1649753814.git.mchehab@kernel.org>
In-Reply-To: <cover.1649753814.git.mchehab@kernel.org>
References: <cover.1649753814.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 12/12] code_cov_parse_info: add support for
 generating html reports
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

While lcov has already its own report generator, it is interesting
to be able to deal with multiple files exposing each input in
separate.

So, add new command line parameters to allow it to generate html
reports. Also add some command lines to setup html title, add a
css file and include a prolog/epilog at the html body.

The title option can also be useful to rename the titles when
merging multiple info files.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1649753814.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 442 +++++++++++++++++++++++++++++++-----
 1 file changed, 388 insertions(+), 54 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 7336f2be7978..d6ec5695a358 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -9,6 +9,8 @@ use Pod::Man;
 
 my $prefix = qr ".*?(linux)\w*/";
 
+my $title = "";
+
 my %used_func;
 my %all_func;
 my %all_branch;
@@ -307,8 +309,12 @@ sub write_filtered_file($)
 
 	my $filtered = "";
 
-	foreach my $testname(sort keys %test_names) {
-		$filtered .= "TN:$testname\n";
+	if ($title eq "") {
+		foreach my $testname(sort keys %test_names) {
+			$filtered .= "TN:$testname\n";
+		}
+	} else {
+		$filtered .= "TN:$title\n";
 	}
 
 	# Generates filtered data
@@ -413,68 +419,80 @@ sub print_code_coverage($$$)
 	}
 }
 
-sub print_summary()
+my %stats;
+
+sub gen_stats()
 {
-	# Output per-line coverage statistics
-	my $line_count = 0;
-	my $line_reached = 0;
+	# per-line coverage statistics
+	$stats{"line_count"} = 0;
+	$stats{"line_reached"} = 0;
 
 	foreach my $source (keys(%all_line)) {
 		next if (!$used_source{$source});
 
 		foreach my $where (keys(%{$all_line{$source}})) {
-			$line_count++;
-			$line_reached++ if ($all_line{$source}{$where} != 0);
+			$stats{"line_count"}++;
+			$stats{"line_reached"}++ if ($all_line{$source}{$where} != 0);
 		}
 	}
-	if ($line_count) {
-		my $percent = 100. * $line_reached / $line_count;
-		printf "  lines......: %.1f%% (%d of %d lines)\n",
-			$percent, $line_reached, $line_count;
-	} else {
-		print "No line coverage data.\n";
-	}
 
-	# Output per-function coverage statistics
-	my $func_count = 0;
-	my $func_used = 0;
+	# per-function coverage statistics
+	$stats{"func_count"} = 0;
+	$stats{"func_used"} = 0;
 
 	foreach my $func (keys(%all_func)) {
 		foreach my $file (keys(%{$all_func{$func}})) {
-			$func_count++;
+			$stats{"func_count"}++;
 			if ($used_func{$func}) {
 				if ($used_func{$func}->{$file}) {
-					$func_used++;
+					$stats{"func_used"}++;
 				}
 			}
 		}
 	}
 
-	if ($func_count) {
-		my $percent = 100. * $func_used / $func_count;
+	# per-branch coverage statistics
+	$stats{"branch_count"} = 0;
+	$stats{"branch_reached"} = 0;
+
+	foreach my $source (keys(%all_branch)) {
+		next if (!$used_source{$source});
+
+		foreach my $where (keys(%{$all_branch{$source}})) {
+			$stats{"branch_count"}++;
+			$stats{"branch_reached"}++ if ($all_branch{$source}{$where} != 0);
+		}
+	}
+
+	# per-file coverage stats
+	$stats{"all_files"} = scalar keys(%files);
+	$stats{"filtered_files"} = scalar keys(%record);
+	$stats{"used_files"} = scalar keys(%used_source);
+}
+
+sub print_summary()
+{
+	if ($stats{"line_count"}) {
+		my $percent = 100. * $stats{"line_reached"} / $stats{"line_count"};
+		printf "  lines......: %.1f%% (%d of %d lines)\n",
+			$percent, $stats{"line_reached"}, $stats{"line_count"};
+	} else {
+		print "No line coverage data.\n";
+	}
+
+	if ($stats{"func_count"}) {
+		my $percent = 100. * $stats{"func_used"} / $stats{"func_count"};
 		printf "  functions..: %.1f%% (%d of %d functions)\n",
-			$percent, $func_used, $func_count;
+			$percent, $stats{"func_used"}, $stats{"func_count"};
 	} else {
 		print "No functions reported. Wrong filters?\n";
 		return;
 	}
 
-	# Output per-branch coverage statistics
-	my $branch_count = 0;
-	my $branch_reached = 0;
-
-	foreach my $source (keys(%all_branch)) {
-		next if (!$used_source{$source});
-
-		foreach my $where (keys(%{$all_branch{$source}})) {
-			$branch_count++;
-			$branch_reached++ if ($all_branch{$source}{$where} != 0);
-		}
-	}
-	if ($branch_count) {
-		my $percent = 100. * $branch_reached / $branch_count;
+	if ($stats{"branch_count"}) {
+		my $percent = 100. * $stats{"branch_reached"} / $stats{"branch_count"};
 		printf "  branches...: %.1f%% (%d of %d branches)\n",
-			$percent, $branch_reached, $branch_count;
+			$percent, $stats{"branch_reached"}, $stats{"branch_count"};
 	} else {
 		print "No branch coverage data.\n";
 	}
@@ -520,6 +538,254 @@ sub open_filter_file($$$)
 	return $filter;
 }
 
+my $gen_report;
+my $css_file;
+my $html_prolog;
+my $html_epilog;
+my %report;
+
+sub generate_report()
+{
+	my $percent;
+	my $prolog = "";
+	my $epilog = "";
+	my @info_files = sort(keys %report);
+
+	$title = "Code coverage results" if ($title eq "");
+
+	if ($html_prolog) {
+		open IN, $html_prolog or die "Can't open prolog file";
+		$prolog .= $_ while (<IN>);
+		close IN;
+	}
+
+	if ($html_epilog) {
+		open IN, $html_epilog or die "Can't open epilog file";
+		$epilog .= $_ while (<IN>);
+		close IN;
+	}
+
+	# Re-generate the hashes used to report stats in order to procuce the
+	# Total results
+
+	%used_func = ();
+	%all_func = ();
+	%all_branch = ();
+	%all_line = ();
+	%used_source = ();
+	%files = ();
+	%test_names = ();
+
+	foreach my $f (@info_files) {
+		foreach my $source (keys(%{$report{$f}{"all_line"}})) {
+			$used_source{$source} = 1 if ($report{$f}{"used_source"});
+			foreach my $where (keys(%{$report{$f}{"all_line"}{$source}})) {
+				$all_line{$source}{$where} += $report{$f}{"all_line"}{$source}{$where};
+			}
+		}
+		foreach my $func (keys(%{$report{$f}{"all_func"}})) {
+			foreach my $file (keys(%{$report{$f}{"all_func"}{$func}})) {
+				$all_func{$func}{$file}->{ln} = $report{$f}{"all_func"}{$func}{$file}->{ln};
+				$used_func{$func}->{$file} = 1 if ($report{$f}{"used_func"}{$func}->{$file});
+			}
+		}
+		foreach my $source (keys(%{$report{$f}{"all_branch"}})) {
+			foreach my $where (keys(%{$report{$f}{"all_branch"}{$source}})) {
+				$all_branch{$source}{"$where"} += $report{$f}{"all_branch"}{$source}{$where};
+			}
+		}
+		for my $source(keys(%{$report{$f}{"files"}})) {
+			$files{$source} = 1;
+			$used_source{$source} = 1 if ($report{$f}{"used_source"}{$source});
+		}
+		for my $test(keys(%{$report{$f}{"test_names"}})) {
+			$test_names{$test} = 1;
+		}
+	}
+	gen_stats();
+
+	# Colors for the html output
+
+	my $red    = "style=\"background-color:#ffb3b3\"";
+	my $yellow = "style=\"background-color:#ffffb3\"";
+	my $green  = "style=\"background-color:#d9ffd9\"";
+
+	# Open report file
+
+	open OUT, ">$gen_report" or die "Can't open $gen_report";
+
+	print OUT "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n";
+
+	print OUT "<html lang=\"en\">\n\n";
+	print OUT "<head>\n";
+	print OUT "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n";
+	print OUT "  <title>$title</title>\n";
+	print OUT "  <link rel=\"stylesheet\" type=\"text/css\" href=\"$css_file\">\n" if ($css_file);
+	print OUT "</head>\n\n<body>\n$prolog";
+
+	print OUT "  <h1>$title</h1>\n";
+
+	print OUT "  <h2>Summary</h2>\n";
+	# Generates a table containing the code coverage statistics per input
+
+	print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
+	print OUT "    <th></th>\n";
+	foreach my $f (@info_files) {
+		print OUT "    <th>$f</th>\n";
+	}
+	print OUT "    <th>TOTAL</th>\n";
+	print OUT "    <th>Total count</th>\n";
+	print OUT "  </tr><tr>\n";
+
+	print OUT "    <td><b>Functions</b></td>\n";
+	foreach my $f (@info_files) {
+		my %st = %{$report{$f}{"stats"}};
+		if ($st{"func_count"}) {
+			$percent = 100. * $st{"func_used"} / $st{"func_count"};
+
+			printf OUT "    <td>%.1f%%</td>\n", $percent;
+		} else {
+			print OUT "    <td>N. A.</td>\n";
+		}
+	}
+	if ($stats{"func_count"}) {
+		$percent = 100. * $stats{"func_used"} / $stats{"func_count"};
+
+		printf OUT "    <td>%.1f%%</td>\n", $percent;
+	} else {
+		print OUT "    <td>N. A.</td>\n";
+	}
+	print OUT "  <td>" . $stats{"func_count"} . "</td>";
+	print OUT "  </tr><tr>\n";
+
+	print OUT "    <td><b>Branches</b></td>\n";
+	foreach my $f (@info_files) {
+		my %st = %{$report{$f}{"stats"}};
+		if ($st{"branch_count"}) {
+			$percent = 100. * $st{"branch_reached"} / $st{"branch_count"};
+
+			printf OUT "    <td>%.1f%%</td>\n", $percent;
+		} else {
+			print OUT "    <td>N. A.</td>\n";
+		}
+	}
+	if ($stats{"branch_count"}) {
+		$percent = 100. * $stats{"branch_reached"} / $stats{"branch_count"};
+
+		printf OUT "    <td>%.1f%%</td>\n", $percent;
+	} else {
+		print OUT "    <td>N. A.</td>\n";
+	}
+	print OUT "  <td>" . $stats{"branch_count"} . "</td>";
+	print OUT "  </tr><tr>\n";
+
+	print OUT "    <td><b>Lines</b></td>\n";
+	foreach my $f (@info_files) {
+		my %st = %{$report{$f}{"stats"}};
+
+		if ($st{"line_count"}) {
+			$percent = 100. * $st{"line_reached"} / $st{"line_count"};
+
+			printf OUT "    <td>%.1f%%</td>\n", $percent;
+		} else {
+			print OUT "    <td>N. A.</td>\n";
+		}
+	}
+	if ($stats{"line_count"}) {
+		$percent = 100. * $stats{"line_reached"} / $stats{"line_count"};
+
+		printf OUT "    <td>%.1f%%</td>\n", $percent;
+	} else {
+		print OUT "    <td>N. A.</td>\n";
+	}
+	print OUT "  <td>" . $stats{"line_count"} . "</td>";
+
+	# If there are more than one tests per file, report them
+	my $total = scalar(keys %test_names);
+	if ($total > 1) {
+		print OUT "  </tr><tr>\n";
+		print OUT "    <td><b>Number of tests</b></td>\n";
+		foreach my $f (@info_files) {
+			my $count = scalar(keys %{$report{$f}{"test_names"}});
+
+			if ($count == 0) {
+				print OUT "    <td $red>$count</td>\n";
+			} elsif ($count < $total) {
+				print OUT "    <td $yellow>$count</td>\n";
+			} else {
+				print OUT "    <td $green>$count</td>\n";
+			}
+		}
+		print OUT "    <td $green\>$total</td>\n";
+
+	}
+	print OUT "  </tr>\n</table><p/>\n\n";
+
+	if ($total > 1) {
+		print OUT "<h2>Tests coverage</h2>\n";
+
+		print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
+		print OUT "    <th>Test name</th>\n";
+		foreach my $f (@info_files) {
+			print OUT "    <th>$f</th>\n";
+		}
+
+		foreach my $t (sort keys(%test_names)) {
+			print OUT "  </tr><tr>\n";
+			printf OUT "    <td>%s</td>\n", $t;
+			foreach my $f (@info_files) {
+				if (%{$report{$f}{"test_names"}}{$t}) {
+					print OUT "    <td $green>YES</td>\n";
+				} else {
+					print OUT "    <td $red>NO</td>\n";
+				}
+			}
+		}
+		print OUT "</tr></table>\n";
+	}
+
+
+	# Generates a table containing per-function detailed data
+
+	print OUT "<h2>Functions coverage</h2>\n";
+	print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
+	print OUT "    <th>Function</th>\n";
+	print OUT "    <th>Used?</th>\n";
+	foreach my $f (@info_files) {
+		print OUT "    <th>$f</th>\n";
+	}
+	print OUT "    <th>File</th>\n";
+
+	foreach my $func (sort keys(%all_func)) {
+		my @keys = sort keys(%{$all_func{$func}});
+		foreach my $file (@keys) {
+			print OUT "  </tr><tr>\n";
+			print OUT "    <td>$func</td>\n";
+			if ($used_func{$func}->{$file}) {
+				print OUT "    <td $green>YES</td>\n";
+			} else {
+				print OUT "    <td $red>NO</td>\n";
+			}
+			foreach my $f (@info_files) {
+				if ($report{$f}{"used_func"}{$func}->{$file}) {
+					print OUT "    <td $green>YES</td>\n";
+				} else {
+					print OUT "    <td $red>NO</td>\n";
+				}
+			}
+			$file =~ s,$prefix,linux/,;
+			print OUT "    <td>$file</td>\n";
+		}
+	}
+	print OUT "</tr></table>\n";
+
+	print OUT "$epilog</body>\n";
+
+	# Close the file and exit
+
+	close OUT;
+}
+
 #
 # Argument handling
 #
@@ -548,6 +814,11 @@ GetOptions(
 	"source-filters|S=s" => \$src_filters,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
+	"report|r=s" => \$gen_report,
+	"css-file|css|c=s" => \$css_file,
+	"title|t=s" => \$title,
+	"html-prolog|prolog=s" => \$html_prolog,
+	"html-epilog|epilog=s" => \$html_epilog,
 	"help" => \$help,
 	"man" => \$man,
 ) or pod2usage(2);
@@ -561,7 +832,9 @@ if ($#ARGV < 0) {
 }
 
 # At least one action should be specified
-pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused);
+pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report);
+
+pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
 
 my $filter_str = "";
 my $has_filter;
@@ -601,39 +874,67 @@ if ($ignore_unused) {
 
 foreach my $f (@ARGV) {
 	parse_info_data($f);
+
+	if ($gen_report) {
+		$f =~ s,.*/,,;
+		$f =~ s/\.info$//;
+
+		gen_stats();
+
+		$report{$f}{"stats"} = { %stats };
+		$report{$f}{"all_func"} = { %all_func };
+		$report{$f}{"used_func"} = { %used_func };
+		$report{$f}{"all_branch"} = { %all_branch };
+		$report{$f}{"all_line"} = { %all_line };
+		$report{$f}{"used_source"} = { %used_source };
+		$report{$f}{"files"} = { %files };
+		$report{$f}{"test_names"} = { %test_names };
+
+		%used_func = ();
+		%all_func = ();
+		%all_branch = ();
+		%all_line = ();
+		%used_source = ();
+		%files = ();
+		%test_names = ();
+	}
 }
 
+if ($gen_report) {
+	generate_report();
+	exit 0;
+}
+
+gen_stats();
+
+die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
+
 print_code_coverage($print_used, $print_unused, $show_lines);
 
 print_summary() if ($stat);
 
-my $all_files = scalar keys(%files);
-
-die "Nothing counted. Wrong input files?" if (!$all_files);
-
 if ($has_filter) {
-	my $all_files = scalar keys(%files);
-	my $filtered_files = scalar keys(%record);
-	my $used_files = scalar keys(%used_source);
-
-	my $percent = 100. * $used_files / $all_files;
+	my $percent = 100. * $stats{"used_files"} / $stats{"all_files"};
 
 	$filter_str =~ s/(.*),/$1 and/;
 	printf "Filters......:%s.\n", $filter_str;
 	printf "Source files.: %.2f%% (%d of %d total)",
-		$percent, $used_files, $all_files;
+		$percent, $stats{"used_files"}, $stats{"all_files"};
 
-	if ($used_files != $filtered_files) {
-		my $percent_filtered = 100. * $used_files / $filtered_files;
+	if ($stats{"used_files"} != $stats{"filtered_files"}) {
+		my $percent_filtered = 100. * $stats{"used_files"} / $stats{"filtered_files"};
 
 		printf ", %.2f%% (%d of %d filtered)",
-			$percent_filtered, $used_files, $filtered_files;
+			$percent_filtered, $stats{"used_files"}, $stats{"filtered_files"};
 	}
 	print "\n";
 } else {
 	printf "Source files: %d\n", scalar keys(%files) if($stat);
 }
 
+my $ntests=scalar(%test_names);
+printf "Number of tests: %d\n", $ntests if ($ntests > 1);
+
 if ($show_files) {
 	for my $f(sort keys %used_source) {
 		print "\t$f\n";
@@ -654,8 +955,10 @@ Parses lcov data from .info files.
 
 code_cov_parse_info <options> [input file(s)]
 
-At least one of the options B<--stat>, B<--print> and/or B<--output>
-should be used.
+At least one of the output options should be used, e g.
+B<--stat>, B<--print>, B<--print-unused>, B<--report> and/or B<--output>.
+
+Also, B<--report> can't be used together with other output options.
 
 =head1 OPTIONS
 
@@ -684,6 +987,37 @@ Prints the functions that were never reached.
 
 The function coverage report is affected by the applied filters.
 
+=item B<--report>  B<[output file]> or B<-r>  B<[output file]>
+
+Generates an html report containing per-test and total statistics.
+
+The function coverage report is affected by the applied filters.
+
+=item B<--css-file> B<[css file]> or B<--css> B<[css file]> or B<-c> B<[css file]
+
+Adds an optional css file to the html report.
+Used only with B<--report>.
+
+=item B<--title> B<[title] or B<-t> B<[title]
+
+If used with B<--report>, it defines the title for the for the html report.
+
+If used with B<--output>, it replaces the test names with the title. This
+is useful when merging reports from multiple tests into a summarized file.
+If not used, the B<[output file]> will contain all test names on its
+beginning.
+
+Used with B<--report> AND B<--output>.
+
+=item B<--html-prolog> B<[html file] or B<--prolog> B<[html file]
+
+Adds a prolog at the beginning of the body of the html report.
+Used only with B<--report>.
+
+=item B<--html-epilog>  B<[html file] or B<--epilog>  B<[html file]
+
+Adds an epilog before the end of the body of the html report.
+Used only with B<--report>.
 
 =item B<--show-lines> or B<--show_lines>
 
-- 
2.35.1
