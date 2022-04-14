Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F2610FC53
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 12:25:11 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Apr 2022 14:25:01 +0200
Message-Id: <a77b585c64a5926fd301ffe3b86f5798126b0a75.1649939026.git.mchehab@kernel.org>
In-Reply-To: <cover.1649939026.git.mchehab@kernel.org>
References: <cover.1649939026.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 11/12] code_cov_parse_info: add support for
 exclude filters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It is interesting to have support not only for including, but
also for excluding functions and files. Also, it is trivial to
have support for it.

When either one or both source/function filters are enabled, it
will print at the console the regular expressions that are applied
to functions and sources (if any), e. g.:

$ cat << END >f1
+i915
gem

-  display
-selftest
END
$ cat << END >f2
	-/selftests
END
$ code_cov_parse_info dg1.info dg2.info --func-filters f1 --source-filters f2 --stat
  lines......: 72.1% (176 of 244 lines)
  functions..: 77.3% (17 of 22 functions)
  branches...: 50.0% (68 of 136 branches)
Filters......: function regex (not match: m`display` m`selftest` and match: m`i915` m`gem`), source regex (match: m`/selftest`) and ignored source files where none of its code ran.
Source files.: 0.99% (7 of 710 total), 77.78% (7 of 9 filtered)

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/12] at: https://lore.kernel.org/all/cover.1649939026.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 250 +++++++++++++++++++++++++-----------
 1 file changed, 178 insertions(+), 72 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 0d9bac38cea9..206145ef4925 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -17,21 +17,27 @@ my %used_source;
 my %record;
 my %files;
 my @func_regexes;
+my @func_exclude_regexes;
 my %test_names;
 my @src_regexes;
+my @src_exclude_regexes;
 
 my $verbose = 0;
 my $ignore_unused = 0;
-my $only_i915 = 0;
-my $only_drm = 0;
 my $skip_func = 0;
 
 sub is_function_excluded($)
 {
+	return 0 if (!@func_regexes && !@func_exclude_regexes);
+
+	my $func = shift;
+
+	foreach my $r (@func_exclude_regexes) {
+		return 1 if ($func =~ m/$r/);
+	}
+
 	return 0 if (!@func_regexes);
 
-	my $func = shift;
-
 	foreach my $r (@func_regexes) {
 		return 0 if ($func =~ m/$r/);
 	}
@@ -43,31 +49,14 @@ sub filter_file($)
 {
 	my $s = shift;
 
-	if ($only_drm) {
-		# Please keep --only-drm doc updated with any changes her
-		if ($s =~ m/\.h$/) {
-			if ($s =~ m/trace/ || !($s =~ m/drm/)) {
-				return 1;
-			}
-		}
-	}
+	return 0 if (!@src_regexes && !@src_exclude_regexes);
 
-	if ($only_i915) {
-		# Please keep --only-i915 doc updated with any changes here
-		if ($s =~ m/selftest/) {
-			return 1;
-		}
-
-		# Please keep --only-i915 doc updated with any changes here
-		if (!($s =~ m#drm/i915/# || $s =~ m#drm/ttm# || $s =~ m#drm/vgem#)) {
-			return 1;
-		}
+	foreach my $r (@src_exclude_regexes) {
+		return 1 if ($s =~ m/$r/);
 	}
 
 	return 0 if (!@src_regexes);
 
-	my $func = shift;
-
 	foreach my $r (@src_regexes) {
 		return 0 if ($s =~ m/$r/);
 	}
@@ -468,6 +457,63 @@ sub print_summary()
 	}
 }
 
+sub open_filter_file($$$)
+{
+	my $fname = shift;
+	my $include = shift;
+	my $exclude = shift;
+	my $match_str = "";
+	my $not_match_str = "";
+	my $filter = "";
+	my $i;
+
+	# Handle regexes that came from command line params
+
+	for ($i = 0;$i < scalar(@{$include}); $i++) {
+		my $op = @{$include}[$i];
+		$match_str .= sprintf "m`$op` ";
+		@{$include}[$i] = qr /$op/;
+	}
+
+	for ($i = 0;$i < scalar(@{$exclude}); $i++) {
+		my $op = @{$exclude}[$i];
+		$not_match_str .= sprintf "m`$op` ";
+		@{$exclude}[$i] = qr /$op/;
+	}
+
+	if ($fname) {
+		open IN, $fname or die "Can't open $fname";
+		while (<IN>) {
+			s/^\s+//;
+			s/\s+$//;
+			next if (m/^#/ || m/^$/);
+			if (m/^([+\-])\s*(.*)/) {
+				if ($1 eq "+") {
+					$match_str .= sprintf "m`$2` ";
+					push @{$include}, qr /$2/;
+				} else {
+					$not_match_str .= sprintf "m`$2` ";
+					push @{$exclude}, qr /$2/;
+				}
+			} else {
+				$match_str .= sprintf "m`$_` ";
+				push @{$include}, qr /$_/;
+			}
+		}
+		close IN;
+	}
+
+	$filter .= "not match: $not_match_str" if ($not_match_str);
+	if ($match_str) {
+		$filter .= "and " if ($filter ne "");
+		$filter .= "match: $match_str";
+	}
+
+	$filter =~ s/\s+$//;
+
+	return $filter;
+}
+
 #
 # Argument handling
 #
@@ -482,6 +528,8 @@ my $func_filters;
 my $src_filters;
 my $show_files;
 my $show_lines;
+my $only_i915;
+my $only_drm;
 
 GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
@@ -493,7 +541,11 @@ GetOptions(
 	"only-i915|only_i915" => \$only_i915,
 	"only-drm|only_drm" => \$only_drm,
 	"func-filters|f=s" => \$func_filters,
+	"include-func=s" => \@func_regexes,
+	"exclude-func=s" => \@func_exclude_regexes,
 	"source-filters|S=s" => \$src_filters,
+	"include-source=s" => \@src_regexes,
+	"exclude-source=s" => \@src_exclude_regexes,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"help" => \$help,
@@ -513,64 +565,41 @@ pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused);
 
 my $filter_str = "";
 my $has_filter;
-
-if ($func_filters) {
-	open IN, $func_filters or die "Can't open $func_filters";
-	while (<IN>) {
-		s/^\s+//;
-		s/\s+$//;
-		next if (m/^#/ || m/^$/);
-		push @func_regexes, qr /$_/;
-	}
-	close IN;
-}
-
-if ($src_filters) {
-	open IN, $src_filters or die "Can't open $src_filters";
-	while (<IN>) {
-		s/^\s+//;
-		s/\s+$//;
-		next if (m/^#/ || m/^$/);
-		push @src_regexes, qr /$_/;
-	}
-	close IN;
-}
-
-$ignore_unused = 1 if (@func_regexes);
+my $str;
 
 if ($only_i915) {
-	$filter_str = " non-i915 files";
-	$has_filter = 1;
+	# Please keep in sync with the documentation
+	push @src_exclude_regexes, "selftest";
+	push @src_regexes, "drm/i915";
+	push @src_regexes, "drm/ttm";
+	push @src_regexes, "drm/vgem";
 }
 
 if ($only_drm) {
-	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " non-drm headers";
-	$has_filter = 1;
+	# Please keep in sync with the documentation
+	push @src_exclude_regexes, "trace.*\.h";
+	push @src_exclude_regexes, "drm.*\.h";
 }
 
-if (@func_regexes) {
+$str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
+if ($str) {
 	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " unmatched functions";
-	foreach my $r (@func_regexes) {
-		$filter_str .= " m/$r/";
-	}
-
+	$filter_str .= " function regex ($str)";
 	$has_filter = 1;
 }
 
-if (@src_regexes) {
+$str = open_filter_file($src_filters, \@src_regexes, \@src_exclude_regexes);
+if ($str) {
 	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " unmatched source files";
-	foreach my $r (@src_regexes) {
-		$filter_str .= " m/$r/";
-	}
+	$filter_str .= " source regex ($str)";
 	$has_filter = 1;
 }
 
+$ignore_unused = 1 if (@func_regexes || @func_exclude_regexes);
+
 if ($ignore_unused) {
 	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " source files where none of its code ran";
+	$filter_str .= " ignored source files where none of its code ran";
 	$has_filter = 1;
 }
 
@@ -594,7 +623,7 @@ if ($has_filter) {
 	my $percent = 100. * $used_files / $all_files;
 
 	$filter_str =~ s/(.*),/$1 and/;
-	printf "Ignored......:%s.\n", $filter_str;
+	printf "Filters......:%s.\n", $filter_str;
 	printf "Source files.: %.2f%% (%d of %d total)",
 		$percent, $used_files, $all_files;
 
@@ -699,16 +728,93 @@ Excluding files that match:
 
 =item B<--func-filters>  B<[filter's file]> or B<-f>  B<[filter's file]>
 
-Take into account only the code coverage for the functions that match
-the regular expressions contained at the B<[filter's file]>.
+Use a file containing regular expressions (regex) to filter functions.
 
-When this filter is used, B<--ignore-unused> will be automaticaly enabled,
-as the final goal is to report per-function usage, and not per-file.
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
+When both include and exclude regexes are found, exclude regexes are
+applied first and any functions that don't match the include regular
+expressions from the B<[filter's file]> will be ignored.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-function usage.
+
+=item B<--include-func> B<regex>
+
+Include B<regex> to the function filter. Can be used multiple times.
+
+When used together with B<--func-filters>, regexes here are handled first.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-function usage.
+
+=item B<--exclude-func> B<regex>
+
+Include B<regex> to the function filter. Can be used multiple times.
+
+When used together with B<--func-filters>, regexes here are handled first.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-function usage.
 
 =item B<--source-filters>  B<[filter's file]> or B<-S>  B<[filter's file]>
 
-Takes into account only the code coverage for the source files that match
-the regular expressions contained at the B<[filter's file]>.
+Use a file containing regular expressions to filter source files.
+
+Each line of the file will be handled as a new regular expressions.
+Blank lines and lines starting with B<#> will be ignored.
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
+When both include and exclude regexes are found, exclude regexes are
+applied first and any functions that don't match the include regular
+expressions from the B<[filter's file]> will be ignored.
+
+=item B<--include-src> B<regex>
+
+Include B<regex> to the sources filter. Can be used multiple times.
+
+When used together with B<--src-filters>, regexes here are handled first.
+
+=item B<--exclude-src> B<regex>
+
+Include B<regex> to the sources filter. Can be used multiple times.
+
+When used together with B<--src-filters>, regexes here are handled first.
 
 =item B<--ignore-unused> or B<--ignore_unused>
 
-- 
2.35.1
