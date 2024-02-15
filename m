Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C50C48BEF
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DD210E5DF;
	Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+T41ZCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC24110E5A9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=vKRhMFa1nHJxW4Zi0mbbhmYzhGCo5OnTbf/0I6WK4Y8=;
 b=A+T41ZCfkxxG//r1dTgGEGgW0Ous58s5bdfRn0YMapq2ytslGDkbiIUZ
 JhivPBnjFQCvR8Ylro/jfMKqEL+0NqvBB+Hj2NgiLBozVVqJKkpUAj6ug
 fogSsjRFB2Dji44GKFYe0MN0RlNk6drzIgg6fpwjL/qQJNWDStviLmcbu
 SjPFPIg4Hca72beiZp6ssHuHw13U334C9s4SwmmuMJyda61dAygYBmOP2
 i4aMYBgpSFrQtGt1Jhq6LM85oA1hv/gW2JDaLlqkwAcyvYSz1aAtpjwJW
 JI8w/JQ0NLuVDtwJL4U7XavM5pqszB7cWIN/qQvCHImmCj580sIepft40 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038600"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038600"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480351"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1A406580EA5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBl-3q7k for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 14/17] scripts/code_cov_parse_info: better handle branch
 filtering
Date: Thu, 15 Feb 2024 11:27:23 +0100
Message-ID: <c631ab5862020e74b2b9ddfd3f9e74d41e39f298.1707992666.git.mchehab@kernel.org>
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

Add an option to filter out branches that aren't associated with
any functions inside the file (e. g. they came from #inline
directives).

While here, also address some issues at the branch report.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 71 ++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index ea4f64b34d2f..57bc4c2f0b4b 100755
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
@@ -383,6 +388,10 @@ sub read_info($)
 	my $func = $before_sf;
 	my $cur_test = "";
 
+	# Info files don't contain functions for lines. So, they can't
+	# be used to filter lines and branches used inside functions.
+	$can_filter_lines = 0;
+
 	# First step: parse data
 
 	# For details on .info file format, see "man geninfo"
@@ -1231,18 +1240,15 @@ sub check_source_branches()
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
@@ -1250,14 +1256,14 @@ sub check_source_branches()
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
@@ -1267,7 +1273,8 @@ sub check_source_branches()
 			if ($has_if) {
 				print $context;
 			} else {
-				print "$ln->\t$lines[$ln]";
+				my $cur_ln = $ln + 1;
+				print "$cur_ln->\t$lines[$ln]";
 			}
 		}
 	}
@@ -1308,6 +1315,7 @@ GetOptions(
 	"source-filters|S=s" => \$src_filters,
 	"include-source=s" => \@src_include_regexes,
 	"exclude-source=s" => \@src_exclude_regexes,
+	"ignore-lines-without-functions!" => \$ignore_lines_without_functions,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
@@ -1438,6 +1446,10 @@ print_summary() if ($stat);
 if ($has_filter) {
 	my $percent = 100. * $stats{"used_files"} / $stats{"all_files"};
 
+	if (!$can_filter_lines) {
+		printf "Warning......: Function filters won't work with lines/branches\n";
+	}
+
 	printf "Filters......:%s.\n", $filter_str;
 	printf "Source files.: %.2f%% (%d of %d total)",
 		$percent, $stats{"used_files"}, $stats{"all_files"};
@@ -1696,6 +1708,25 @@ report and decrease the code coverage statistics.
 
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
2.43.0

