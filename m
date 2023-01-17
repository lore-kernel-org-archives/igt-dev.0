Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359010E548
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BC055580E1F
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba1T-2c
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:05 +0100
Message-Id: <20230117140607.2759816-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/12] code_cov_parse_info: filter out
 branches from headers by default
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

It is really tricky to handle branches on header files at the Linux
Kernel. Filter them out by default, allowing the user to override it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 5a6a4a407359..4aed3d67bd98 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -27,6 +27,7 @@ my @src_include_regexes;
 my @src_exclude_regexes;
 my $can_filter_lines = 1;
 my $ignore_lines_without_functions = 1;
+my $ignore_branches_on_headers = 1;
 
 my $verbose = 0;
 my $ignore_unused = 0;
@@ -182,6 +183,10 @@ sub parse_json_gcov_v1($$)
 			}
 			$all_line{$source}{$ln} += $line_ref->{'count'};
 
+			if ($ignore_branches_on_headers) {
+				next if ($source =~ m/.h$/);
+			}
+
 			my $i = 0;
 			for my $branch_ref (@{$line_ref->{'branches'}}) {
 				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
@@ -527,6 +532,10 @@ sub read_info($)
 			my $branch = $3;
 			my $taken = $4;
 
+			if ($ignore_branches_on_headers) {
+				next if ($source =~ m/.h$/);
+			}
+
 			if ($block != 0) {
 				print "Warning: unexpected block $block at line $.\n";
 			}
@@ -1314,6 +1323,7 @@ GetOptions(
 	"include-source=s" => \@src_include_regexes,
 	"exclude-source=s" => \@src_exclude_regexes,
 	"ignore-lines-without-functions!" => \$ignore_lines_without_functions,
+	"ignore-branches-on-headers!" => \$ignore_branches_on_headers,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
@@ -1708,6 +1718,30 @@ Use B<--no-ignore-lines-without-functions> to disable it.
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
-- 
2.39.0
