Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EE510E2FD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id B94BF580DFD
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba1P-2Y
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:04 +0100
Message-Id: <20230117140607.2759816-10-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/12] code_cov_parse_info: better handle
 branch filtering
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

Add an option to filter out branches that aren't associated with
any functions inside the file (e. g. they came from #inline
directives).

While here, also address some issues at the branch report.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 71 ++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index c2a8020f461b..5a6a4a407359 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -25,6 +25,8 @@ my @func_exclude_regexes;
 my %test_names;
 my @src_include_regexes;
 my @src_exclude_regexes;
+my $can_filter_lines = 1;
+my $ignore_lines_without_functions = 1;
 
 my $verbose = 0;
 my $ignore_unused = 0;
@@ -161,12 +163,6 @@ sub parse_json_gcov_v1($$)
 
 			my $func = $line_ref->{'function_name'};
 			if (!$func) {
-				# Ignore DA/BRDA that aren't associated with
-				# functions. Those are present on header files
-				# (maybe defines?)
-				next if (@func_include_regexes);
-
-				# Otherwise place them in separate
 				$func = $before_sf;
 			} else {
 				next if is_function_excluded($func);
@@ -188,9 +184,17 @@ sub parse_json_gcov_v1($$)
 
 			my $i = 0;
 			for my $branch_ref (@{$line_ref->{'branches'}}) {
-				my $taken = $branch_ref->{'count'};
 				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
 
+				if ($func eq $before_sf) {
+					# Ignore DA/BRDA that aren't associated with
+					# functions. Those are present on header files
+					# (maybe defines?)
+					next if ($ignore_lines_without_functions);
+				} else {
+					$all_branch{$source}{$where}{func} = $func;
+				}
+
 				# Negative gcov results are possible, as
 				# reported at:
 				# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
@@ -206,7 +210,8 @@ sub parse_json_gcov_v1($$)
 					}
 				}
 
-				$all_branch{$source}{$where}{count} += $taken;
+				$all_branch{$source}{$where}{count} += $branch_ref->{'count'};
+
 				$i++;
 			}
 			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
@@ -382,6 +387,10 @@ sub read_info($)
 	my $func = $before_sf;
 	my $cur_test = "";
 
+	# Info files don't contain functions for lines. So, they can't
+	# be used to filter lines and branches used inside functions.
+	$can_filter_lines = 0;
+
 	# First step: parse data
 
 	# For details on .info file format, see "man geninfo"
@@ -1229,18 +1238,15 @@ sub check_source_branches($)
 				return;
 			}
 
+			my $func_ln;
 			my $func = $all_branch{$source}{$where}{func};
-			my $func_ln = $all_branch{$source}{$where}{func_ln};
-
-			print "Branch $source:$ln, ";
 			if ($func) {
-				if ($func_ln) {
-					print "func: $func, ";
-				} else {
-					print "func: $func:$func_ln, ";
-				}
+				$func_ln = $all_func{$func}{$source}->{ln};
 			}
-			print "block $block, branch $branch not taken:\n";
+
+			print "Branch $branch on $source:$ln";
+			print ", function: $func" if ($func);
+			print " not taken:\n";
 
 			if ($func_ln) {
 				$ctx_lines = $ln - $func_ln;
@@ -1248,14 +1254,14 @@ sub check_source_branches($)
 				$ctx_lines = 10;
 			}
 
-
 			# Search for up to $ctx_lines before the occurrence
 			my $context = "";
 			my $has_if;
 			$ln-- if ($ln > 0);
 			my $delim = "->";
 			for (my $if_ln = $ln; $if_ln >= 0 && (($ln - $if_ln) < $ctx_lines); $if_ln--) {
-				$context = "$if_ln$delim\t$lines[$if_ln]" . $context;
+				my $cur_ln = $if_ln + 1;
+				$context = "$cur_ln$delim\t$lines[$if_ln]" . $context;
 				$delim = "";
 				if ($lines[$if_ln] =~ m/(\bif\b|#if)/) {
 					$has_if = 1;
@@ -1265,7 +1271,8 @@ sub check_source_branches($)
 			if ($has_if) {
 				print $context;
 			} else {
-				print "$ln->\t$lines[$ln]";
+				my $cur_ln = $ln + 1;
+				print "$cur_ln->\t$lines[$ln]";
 			}
 		}
 	}
@@ -1306,6 +1313,7 @@ GetOptions(
 	"source-filters|S=s" => \$src_filters,
 	"include-source=s" => \@src_include_regexes,
 	"exclude-source=s" => \@src_exclude_regexes,
+	"ignore-lines-without-functions!" => \$ignore_lines_without_functions,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
@@ -1426,6 +1434,10 @@ print_summary() if ($stat);
 if ($has_filter) {
 	my $percent = 100. * $stats{"used_files"} / $stats{"all_files"};
 
+	if (!$can_filter_lines) {
+		printf "Warning......: Function filters won't work with lines/branches\n";
+	}
+
 	printf "Filters......:%s.\n", $filter_str;
 	printf "Source files.: %.2f%% (%d of %d total)",
 		$percent, $stats{"used_files"}, $stats{"all_files"};
@@ -1677,6 +1689,25 @@ report and decrease the code coverage statistics.
 
 This option is automaticaly enabled when B<--func-filters> is used.
 
+=item B<--ignore-lines-without-functions>
+
+This option works only when the input file is in JSON format.
+
+Basically, include files may contain several lines of codes that aren't
+assigned to any functions inside a source file. This is a common behavior
+for macros and inlined functions inside headers.
+
+When this option is selected, the branches stat won't contain any such code.
+
+Please notice that this is enabled by default.
+
+Use B<--no-ignore-lines-without-functions> to disable it.
+
+=item B<--no-ignore-lines-without-functions>
+
+Disables filtering out branches that are not associated with any functions
+inside the source file, but were imported via includes.
+
 =back
 
 =item B<--show-files> or B<--show_files>
-- 
2.39.0
