Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C5A10E546
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id E69FA5805CB
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba1X-2h
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:06 +0100
Message-Id: <20230117140607.2759816-12-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 11/12] code_cov_parse_info: add support for
 filtering branches
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

Add support for passing regexes to be used to filter branches.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 178 ++++++++++++++++++++++++++++++++----
 1 file changed, 159 insertions(+), 19 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 4aed3d67bd98..2c3283cc1119 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -22,12 +22,16 @@ my %record;
 my %files;
 my @func_include_regexes;
 my @func_exclude_regexes;
+my @branch_include_regexes;
+my @branch_exclude_regexes;
 my %test_names;
 my @src_include_regexes;
 my @src_exclude_regexes;
+my $source_dir = ".";
 my $can_filter_lines = 1;
 my $ignore_lines_without_functions = 1;
 my $ignore_branches_on_headers = 1;
+my $has_branch_filter;
 
 my $verbose = 0;
 my $ignore_unused = 0;
@@ -88,6 +92,32 @@ sub is_file_excluded($)
 	return 1;
 }
 
+sub is_branch_excluded($)
+{
+	return 0 if (!@branch_include_regexes && !@branch_exclude_regexes);
+
+	my $branch = shift;
+
+	# Handle includes first, as, when there are both include and exclude
+	# includes should take preference, as they can be overriding exclude
+	# rules
+	foreach my $r (@branch_include_regexes) {
+	    return 0 if ($branch =~ m/$r/);
+	}
+
+	foreach my $r (@branch_exclude_regexes) {
+		return 1 if ($branch =~ m/$r/);
+	}
+
+	# If there are no exclude regexes, only include branches that are
+	# explicitly included.
+	if ($#branch_exclude_regexes == 0) {
+		return 1;
+	}
+
+	return 0;
+}
+
 # Use something that comes before any real function
 my $before_sf = "!!!!";
 
@@ -96,7 +126,6 @@ sub parse_json_gcov_v1($$)
 	my $file = shift;
 	my $json = shift;
 
-	my $was_used = 0;
 	my $has_func = 0;
 	my $ignore = 0;
 
@@ -116,8 +145,10 @@ sub parse_json_gcov_v1($$)
 	# Store test name at the record
 	$record{tests}{$cur_test} = 1;
 
+	my %cached;
 	for my $file_ref (@{$json->{'files'}}) {
 		my $source = $file_ref->{'file'};
+		my $was_used = 0;
 
 		$files{$source} = 1;
 		next if is_file_excluded($source);
@@ -150,8 +181,6 @@ sub parse_json_gcov_v1($$)
 				$was_used = 1;
 			}
 		}
-		next if ($ignore_unused && !$was_used);
-		$used_source{$source} = 1;
 
 		# Parse lines and branches
 		for my $line_ref (@{$file_ref->{'lines'}}) {
@@ -191,12 +220,32 @@ sub parse_json_gcov_v1($$)
 			for my $branch_ref (@{$line_ref->{'branches'}}) {
 				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
 
+				# Filter out branches
+				if ($has_branch_filter) {
+					if (!$cached{$source}) {
+						open IN, "$source_dir/$source" || die "File $source_dir/$source not found. Can't filter branches\n";
+						push @{$cached{$source}}, <IN>;
+						close IN;
+					}
+					my $nlines = scalar(@{$cached{$source}});
+					if ($ln > $nlines) {
+						die "$source:$ln line is bigger than the number of lines at the file ($nlines lines)\n";
+						return;
+					}
+					next if (is_branch_excluded($cached{$source}[$ln - 1]));
+				}
+
 				if ($func eq $before_sf) {
 					# Ignore DA/BRDA that aren't associated with
 					# functions. Those are present on header files
 					# (maybe defines?)
 					next if ($ignore_lines_without_functions);
+
+					# Otherwise place them in separate
+					$func = $before_sf;
 				} else {
+					next if is_function_excluded($func);
+
 					$all_branch{$source}{$where}{func} = $func;
 				}
 
@@ -216,6 +265,7 @@ sub parse_json_gcov_v1($$)
 				}
 
 				$all_branch{$source}{$where}{count} += $branch_ref->{'count'};
+				$was_used = 1 if ($branch_ref->{'count'} > 0);
 
 				$i++;
 			}
@@ -223,6 +273,8 @@ sub parse_json_gcov_v1($$)
 				@{$record{files}{$source}{line}{$ln}{branches}} = ();
 			}
 		}
+		next if ($ignore_unused && !$was_used);
+		$used_source{$source} = 1;
 	}
 
 	# As the record was changed, we need to use a different format name
@@ -234,9 +286,9 @@ sub parse_json_internal_format_v1($$)
 	my $file = shift;
 	my $json = shift;
 
-	my $was_used = 0;
 	my $has_func = 0;
 	my $ignore = 0;
+	my %cached;
 
 	# Store the common JSON data into the record
 	for my $key (keys %$json) {
@@ -253,6 +305,8 @@ sub parse_json_internal_format_v1($$)
 
 	for my $source (keys %{$json->{'files'}}) {
 		$files{$source} = 1;
+		my $was_used = 0;
+
 		next if is_file_excluded($source);
 
 		my $file_ref = \%{$json->{'files'}{$source}};
@@ -280,8 +334,6 @@ sub parse_json_internal_format_v1($$)
 				$was_used = 1;
 			}
 		}
-		next if ($ignore_unused && !$was_used);
-		$used_source{$source} = 1;
 
 		# Parse lines and branches
 		for my $ln (keys %{$file_ref->{line}}) {
@@ -313,19 +365,33 @@ sub parse_json_internal_format_v1($$)
 			}
 			$all_line{$source}{$ln} += $line_ref->{'count'};
 
+			if ($ignore_branches_on_headers) {
+				next if ($source =~ m/.h$/);
+			}
+
 			my $i = 0;
 			for my $branch_ref (@{$line_ref->{'branches'}}) {
 				my $taken = $branch_ref->{'count'};
 				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
 
-				# Negative gcov results are possible, as
-				# reported at:
-				# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
-				# Lcov ignores those. So, let's do the same
-				# here.
-				$branch_ref->{'count'} = 0 if ($branch_ref->{'count'} < 0);
+
+				# Filter out branches
+				if ($has_branch_filter) {
+					if (!$cached{$source}) {
+						open IN, "$source_dir/$source" || die "File $source_dir/$source not found. Can't filter branches\n";
+						push @{$cached{$source}}, <IN>;
+						close IN;
+					}
+					my $nlines = scalar(@{$cached{$source}});
+					if ($ln > $nlines) {
+						die "$source:$ln line is bigger than the number of lines at the file ($nlines lines)\n";
+						return;
+					}
+					next if (is_branch_excluded($cached{$source}[$ln - 1]));
+				}
 
 				for my $key (keys %$branch_ref) {
+					next if (!$record{files}{$source}{line}{$ln}{branches});
 					if ($key eq "count") {
 						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
 					} else {
@@ -334,12 +400,15 @@ sub parse_json_internal_format_v1($$)
 				}
 
 				$all_branch{$source}{$where}{count} += $taken;
+				$was_used = 1 if ($taken > 0);
 				$i++;
 			}
 			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
 				@{$record{files}{$source}{line}{$ln}{branches}} = ();
 			}
 		}
+		next if ($ignore_unused && !$was_used);
+		$used_source{$source} = 1;
 	}
 }
 
@@ -391,6 +460,7 @@ sub read_info($)
 	my $source = $before_sf;
 	my $func = $before_sf;
 	my $cur_test = "";
+	my %cached;
 
 	# Info files don't contain functions for lines. So, they can't
 	# be used to filter lines and branches used inside functions.
@@ -536,6 +606,22 @@ sub read_info($)
 				next if ($source =~ m/.h$/);
 			}
 
+			# Filter out branches
+			if ($has_branch_filter) {
+				if (!$cached{$source}) {
+					open IN, "$source_dir/$source" || die "File $source_dir/$source not found. Can't filter branches\n";
+					push @{$cached{$source}}, <IN>;
+					close IN;
+				}
+				my $nlines = scalar(@{$cached{$source}});
+				die "File $source_dir/$source not found or it is empty. Can't filter branches\n" if (!$nlines);
+				if ($ln > $nlines) {
+					die "$source:$ln line is bigger than the number of lines at the file ($nlines lines)\n";
+					return;
+				}
+				next if (is_branch_excluded($cached{$source}[$ln - 1]));
+			}
+
 			if ($block != 0) {
 				print "Warning: unexpected block $block at line $.\n";
 			}
@@ -681,6 +767,7 @@ sub write_info_file($)
 
 		foreach my $ln(sort { $a <=> $b } keys %{ $record{files}{$source}{line} }) {
 			$data .= "DA:$ln," . $record{files}{$source}{line}{$ln}{count} . "\n";
+			next if (!$record{files}{$source}{line}{$ln}{branches});
 			for (my $i = 0; $i < scalar @{$record{files}{$source}{line}{$ln}{branches}}; $i++) {
 				my $taken = $record{files}{$source}{line}{$ln}{branches}[$i]{count};
 				$taken = "-" if (!$taken);
@@ -793,7 +880,7 @@ sub gen_stats()
 
 	# per-file coverage stats
 	$stats{"all_files"} = scalar keys(%files);
-	$stats{"filtered_files"} = scalar keys(%record);
+	$stats{"filtered_files"} = scalar keys(%{$record{files}});
 	$stats{"used_files"} = scalar keys(%used_source);
 }
 
@@ -1218,11 +1305,8 @@ sub generate_report($)
 	close OUT;
 }
 
-sub check_source_branches($)
+sub check_source_branches()
 {
-	my $source_dir = shift;
-	my $cached = "";
-
 	foreach my $source (sort keys(%all_branch)) {
 		next if (!$used_source{$source});
 		next if (is_file_excluded($source));
@@ -1299,12 +1383,12 @@ my $help;
 my $man;
 my $func_filters;
 my $src_filters;
+my $branch_filters;
 my $show_files;
 my $show_lines;
 my $only_i915;
 my $only_drm;
 my $check_branches;
-my $source_dir = ".";
 
 GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
@@ -1319,6 +1403,9 @@ GetOptions(
 	"func-filters|f=s" => \$func_filters,
 	"include-func=s" => \@func_include_regexes,
 	"exclude-func=s" => \@func_exclude_regexes,
+	"branch-filters|f=s" => \$branch_filters,
+	"include-branch=s" => \@branch_include_regexes,
+	"exclude-branch=s" => \@branch_exclude_regexes,
 	"source-filters|S=s" => \$src_filters,
 	"include-source=s" => \@src_include_regexes,
 	"exclude-source=s" => \@src_exclude_regexes,
@@ -1381,6 +1468,14 @@ if ($str) {
 	$has_filter = 1;
 }
 
+$str = open_filter_file($branch_filters, \@branch_include_regexes, \@branch_exclude_regexes);
+if ($str) {
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " branch regex ($str)";
+	$has_filter = 1;
+	$has_branch_filter = 1;
+}
+
 $ignore_unused = 1 if (@func_include_regexes || @func_exclude_regexes);
 
 if ($ignore_unused) {
@@ -1432,7 +1527,7 @@ gen_stats();
 
 
 if ($check_branches) {
-	check_source_branches($source_dir);
+	check_source_branches();
 }
 
 die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
@@ -1647,6 +1742,51 @@ Include B<regex> to the function filter. Can be used multiple times.
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
 
+=item B<--branch-filters>  B<[filter's file]> or B<-f>  B<[filter's file]>
+
+Use a file containing regular expressions (regex) to filter branches.
+
+Each line at B<[filter's file]> may contain a new regex:
+
+=over 4
+
+- Blank lines and lines starting with B<#> will be ignored;
+
+- Each line of the file will be handled as a new regex;
+
+- If B<+regex> is used, the filter will include B<regex> to the matches;
+
+- If B<-regex> is used, the filter will exclude B<regex> from the matches;
+
+- If the line doesn't start with neither B<+> nor B<->, containing just
+  B<regex>, the filter will include B<regex> to the matches.
+
+- Any whitespace/tab before or after B<regex> will be ignored.
+
+=back
+
+Include regexes are handled first, as they can override an exclude regex.
+
+When just include regexes are used, any branches that don't match the
+include regular expressions from the B<[filter's file]> will be ignored.
+
+=item B<--include-branch> B<regex>
+
+Include B<regex> to the branch filter. Can be used multiple times.
+
+When used together with B<--branch-filters> or B<--exclude-branch>, regexes
+here are handled first.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-branch usage.
+
+=item B<--exclude-branch> B<regex>
+
+Include B<regex> to the branchtion filter. Can be used multiple times.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-branch usage.
+
 =item B<--source-filters>  B<[filter's file]> or B<-S>  B<[filter's file]>
 
 Use a file containing regular expressions to filter source files.
-- 
2.39.0
