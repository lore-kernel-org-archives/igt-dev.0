Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A335A10FCC8
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 08:59:25 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 12 Apr 2022 10:59:10 +0200
Message-Id: <44750fbf7c569f1da80a8f443b07df963730e28f.1649753814.git.mchehab@kernel.org>
In-Reply-To: <cover.1649753814.git.mchehab@kernel.org>
References: <cover.1649753814.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 11/12] code_cov_parse_info: add support for
 exclude filters
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
$ code_cov_parse_info dg1.info dg2.info --func-filter f1 --source-filters f2 --stat
  lines......: 72.1% (176 of 244 lines)
  functions..: 77.3% (17 of 22 functions)
  branches...: 50.0% (68 of 136 branches)
Filters......: function regex (not match: m`display` m`selftest` and match: m`i915` m`gem`), source regex (match: m`/selftest`) and ignored source files where none of its code ran.
Source files.: 0.99% (7 of 710 total), 77.78% (7 of 9 filtered)

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1649753814.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 172 +++++++++++++++++++++++++-----------
 1 file changed, 122 insertions(+), 50 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 0d9bac38cea9..7336f2be7978 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -17,8 +17,10 @@ my %used_source;
 my %record;
 my %files;
 my @func_regexes;
+my @func_exclude_regexes;
 my %test_names;
 my @src_regexes;
+my @src_exclude_regexes;
 
 my $verbose = 0;
 my $ignore_unused = 0;
@@ -28,10 +30,16 @@ my $skip_func = 0;
 
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
@@ -64,10 +72,14 @@ sub filter_file($)
 		}
 	}
 
+	return 0 if (!@src_regexes && !@src_exclude_regexes);
+
+	foreach my $r (@src_exclude_regexes) {
+		return 1 if ($s =~ m/$r/);
+	}
+
 	return 0 if (!@src_regexes);
 
-	my $func = shift;
-
 	foreach my $r (@src_regexes) {
 		return 0 if ($s =~ m/$r/);
 	}
@@ -468,6 +480,46 @@ sub print_summary()
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
+
+	open IN, $fname or die "Can't open $fname";
+	while (<IN>) {
+		s/^\s+//;
+		s/\s+$//;
+		next if (m/^#/ || m/^$/);
+		if (m/^([+\-])\s*(.*)/) {
+			if ($1 eq "+") {
+				$match_str .= sprintf "m`$2` ";
+				push @{$include}, qr /$2/;
+			} else {
+				$not_match_str .= sprintf "m`$2` ";
+				push @{$exclude}, qr /$2/;
+			}
+		} else {
+			$match_str .= sprintf "m`$_` ";
+			push @{$include}, qr /$_/;
+		}
+	}
+	close IN;
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
@@ -515,62 +567,35 @@ my $filter_str = "";
 my $has_filter;
 
 if ($func_filters) {
-	open IN, $func_filters or die "Can't open $func_filters";
-	while (<IN>) {
-		s/^\s+//;
-		s/\s+$//;
-		next if (m/^#/ || m/^$/);
-		push @func_regexes, qr /$_/;
-	}
-	close IN;
+	my $str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " function regex ($str)";
+	$has_filter = 1;
 }
 
 if ($src_filters) {
-	open IN, $src_filters or die "Can't open $src_filters";
-	while (<IN>) {
-		s/^\s+//;
-		s/\s+$//;
-		next if (m/^#/ || m/^$/);
-		push @src_regexes, qr /$_/;
-	}
-	close IN;
+	my $str = open_filter_file($src_filters, \@src_regexes, \@src_exclude_regexes);
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " source regex ($str)";
+	$has_filter = 1;
 }
 
-$ignore_unused = 1 if (@func_regexes);
+$ignore_unused = 1 if (@func_regexes || @func_exclude_regexes);
 
 if ($only_i915) {
-	$filter_str = " non-i915 files";
+	$filter_str = " ignored non-i915 files";
 	$has_filter = 1;
 }
 
 if ($only_drm) {
 	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " non-drm headers";
-	$has_filter = 1;
-}
-
-if (@func_regexes) {
-	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " unmatched functions";
-	foreach my $r (@func_regexes) {
-		$filter_str .= " m/$r/";
-	}
-
-	$has_filter = 1;
-}
-
-if (@src_regexes) {
-	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " unmatched source files";
-	foreach my $r (@src_regexes) {
-		$filter_str .= " m/$r/";
-	}
+	$filter_str .= " ignored non-drm headers";
 	$has_filter = 1;
 }
 
 if ($ignore_unused) {
 	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " source files where none of its code ran";
+	$filter_str .= " ignored source files where none of its code ran";
 	$has_filter = 1;
 }
 
@@ -594,7 +619,7 @@ if ($has_filter) {
 	my $percent = 100. * $used_files / $all_files;
 
 	$filter_str =~ s/(.*),/$1 and/;
-	printf "Ignored......:%s.\n", $filter_str;
+	printf "Filters......:%s.\n", $filter_str;
 	printf "Source files.: %.2f%% (%d of %d total)",
 		$percent, $used_files, $all_files;
 
@@ -699,16 +724,63 @@ Excluding files that match:
 
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
 
 =item B<--ignore-unused> or B<--ignore_unused>
 
-- 
2.35.1
