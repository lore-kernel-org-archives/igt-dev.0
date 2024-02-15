Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6782C48BF2
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0472910E5C2;
	Thu, 15 Feb 2024 10:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tp1d4eu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73F810E57A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=lsAjzmzJSFCwBP0M8B+brIsENzKdyGe72nhJYTb0dG0=;
 b=Tp1d4eu9A67BOXm1Cvm/uoda/YFwlfiLLp7ywFHCM30vtMSqLgCAq25M
 n3pBZDcueaMe+ybZmNrd6Nsq+P9nPfRuba5mNn26mnBAj6ZRaBXPwVI0P
 UmLY+q1ufZL35f45f6sgHcZBrlNy0+8OPk7cfZ2yygflCtP6QLbq7xYoO
 Tp0SyxRX3cumjQB/nDTk1DVjOaOeeySLK0yFRFAMXDmdQ5PYNbWeeqeU7
 wc7oG8kcctdglE6tjQoPKvtlQpTu+2ki9jqip/mmXoBzlXD2w56on37ZQ
 bZNbq9su2XqgS3IGHAObYVdw9++PaKrey71qBCMJsghvr4fQ+mOJbcNEE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199372"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199372"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981609"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id F0DAB580EA3
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBq-3u9r for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 15/17] scripts/code_cov_parse_info: add support for filtering
 branches
Date: Thu, 15 Feb 2024 11:27:24 +0100
Message-ID: <93faec6442d392a2266fabf6d72dc36a7c6b0ba0.1707992666.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707992666.git.mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Add support for passing regexes to be used to filter branches.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 208 +++++++++++++++++++++++++++++++++---
 1 file changed, 192 insertions(+), 16 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 57bc4c2f0b4b..3ce26e545aee 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -22,11 +22,16 @@ my %record;
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
+my $ignore_branches_on_headers = 1;
+my $has_branch_filter;
 
 my $verbose = 0;
 my $ignore_unused = 0;
@@ -87,6 +92,32 @@ sub is_file_excluded($)
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
 
@@ -115,6 +146,7 @@ sub parse_json_gcov_v1($$)
 	# Store test name at the record
 	$record{tests}{$cur_test} = 1;
 
+	my %cached;
 	for my $file_ref (@{$json->{'files'}}) {
 		my $source = $file_ref->{'file'};
 
@@ -182,16 +214,40 @@ sub parse_json_gcov_v1($$)
 			}
 			$all_line{$source}{$ln} += $line_ref->{'count'};
 
+			if ($ignore_branches_on_headers) {
+				next if ($source =~ m/.h$/);
+			}
+
 			my $i = 0;
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
 
@@ -232,6 +288,7 @@ sub parse_json_internal_format_v1($$)
 	my $was_used = 0;
 	my $has_func = 0;
 	my $ignore = 0;
+	my %cached;
 
 	# Store the common JSON data into the record
 	for my $key (keys %$json) {
@@ -308,17 +365,30 @@ sub parse_json_internal_format_v1($$)
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
 					next if (!$record{files}{$source}{line}{$ln}{branches});
@@ -387,6 +457,7 @@ sub read_info($)
 	my $source = $before_sf;
 	my $func = $before_sf;
 	my $cur_test = "";
+	my %cached;
 
 	# Info files don't contain functions for lines. So, they can't
 	# be used to filter lines and branches used inside functions.
@@ -528,6 +599,25 @@ sub read_info($)
 			my $branch = $3;
 			my $taken = $4;
 
+			if ($ignore_branches_on_headers) {
+				next if ($source =~ m/.h$/);
+			}
+
+			# Filter out branches
+			if ($has_branch_filter) {
+				if (!$cached{$source}) {
+					open IN, "$source_dir/$source" || die "File $source_dir/$source not found. Can't filter branches\n";
+					push @{$cached{$source}}, <IN>;
+					close IN;
+				}
+				my $nlines = scalar(@{$cached{$source}});
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
@@ -1217,7 +1307,10 @@ sub check_source_branches()
 		next if (!$used_source{$source});
 		next if (is_file_excluded($source));
 
-		my @lines;
+		open IN, "$source_dir/$source" || die "File $source_dir/$source not found. Can't check branches\n";
+		my @lines = <IN>;
+		close IN;
+
 		foreach my $where (sort keys %{$all_branch{$source}}) {
 			my $taken = $all_branch{$source}{$where}{count};
 			next if ($taken > 0);
@@ -1229,13 +1322,7 @@ sub check_source_branches()
 			$block = $2;
 			$branch = $3;
 
-			if (!@lines) {
-				open IN, "$source" || die "File $source not found. Can't check branches\n";
-				@lines = <IN>;
-				close IN;
-			}
-
-			if ($ln >= $#lines) {
+			if ($ln > $#lines) {
 				die "$source:$ln line is bigger than the number of lines at the file ($#lines lines)\n";
 				return;
 			}
@@ -1292,6 +1379,7 @@ my $help;
 my $man;
 my $func_filters;
 my $src_filters;
+my $branch_filters;
 my $show_files;
 my $show_lines;
 my $only_i915;
@@ -1304,6 +1392,7 @@ GetOptions(
 	"print-unused|u" => \$print_unused,
 	"stat|statistics" => \$stat,
 	"output|o=s" => \$output_file,
+	"source-dir|source_dir=s" => \$source_dir,
 	"verbose|v" => \$verbose,
 	"ignore-unused|ignore_unused" => \$ignore_unused,
 	"only-i915|only_i915" => \$only_i915,
@@ -1312,14 +1401,18 @@ GetOptions(
 	"func-filters|f=s" => \$func_filters,
 	"include-func=s" => \@func_include_regexes,
 	"exclude-func=s" => \@func_exclude_regexes,
+	"branch-filters|f=s" => \$branch_filters,
+	"include-branch=s" => \@branch_include_regexes,
+	"exclude-branch=s" => \@branch_exclude_regexes,
 	"source-filters|S=s" => \$src_filters,
 	"include-source=s" => \@src_include_regexes,
 	"exclude-source=s" => \@src_exclude_regexes,
 	"ignore-lines-without-functions!" => \$ignore_lines_without_functions,
+	"ignore-branches-on-headers!" => \$ignore_branches_on_headers,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
-	"check-branches" => \$check_branches,
+	"check-branches|check_branches" => \$check_branches,
 	"css-file|css|c=s" => \$css_file,
 	"title|t=s" => \$title,
 	"html-prolog|prolog=s" => \$html_prolog,
@@ -1381,6 +1474,14 @@ if ($str) {
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
@@ -1567,6 +1668,12 @@ Produce an output file merging all input files.
 
 The generated output file is affected by the applied filters.
 
+=item B<--source-dir> or B<--source_dir>
+
+Sets the source directory baseline. This is used together with other
+options that require to parse the source files (currently, only
+B<--check-branches).
+
 =item B<--only-drm> or B<--only_drm>
 
 Filters out includes outside the DRM subsystem, plus trace files.
@@ -1656,6 +1763,51 @@ Include B<regex> to the function filter. Can be used multiple times.
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
@@ -1727,6 +1879,30 @@ Use B<--no-ignore-lines-without-functions> to disable it.
 Disables filtering out branches that are not associated with any functions
 inside the source file, but were imported via includes.
 
+See B<--ignore-lines-without-functions> for more details.
+
+=item B<--ignore-branches-on-headers>
+
+Branches on header files are really tricky to parse, as they depend
+on how gcc optimizes the output code. That's specially hard to use on
+Linux Kernel, as there are lots of complex macros that can be optimized
+on different ways. There are even some cases where the same macro sometimes
+have zero branches, while on other cases it can contain dozen ones.
+
+When this option is selected, all branches inside header files will be
+ignored.
+
+Please notice that this is enabled by default.
+
+Use B<--no-ignore-branches-on-headers> to disable this filter, preserving
+data from all branches.
+
+=item B<--no-ignore-branches-on-headers>
+
+Disables filtering out branches that are inside header files.
+
+See B<--ignore-branches-on-headers> for more details.
+
 =back
 
 =item B<--show-files> or B<--show_files>
@@ -1734,7 +1910,7 @@ inside the source file, but were imported via includes.
 Shows the list of files that were used to produce the code coverage
 results.
 
-=item B<--check-branches>
+=item B<--check-branches> or B<--check_branches>
 
 Checks at the Linux Kernel source files what's the contents of the
 branches that weren't taken. The directory should match what's
-- 
2.43.0

