Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B5010E549
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BAE92580DA6
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba1L-2U
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:03 +0100
Message-Id: <20230117140607.2759816-9-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 08/12] code_cov_parse_info: allow specifying
 the source directory
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

Some options may require parsing the source files. Currently,
only --check-branches use it, but other functions will be added
on other patches.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index d38ee9ee6a69..c2a8020f461b 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -1200,13 +1200,19 @@ sub generate_report($)
 	close OUT;
 }
 
-sub check_source_branches()
+sub check_source_branches($)
 {
+	my $source_dir = shift;
+	my $cached = "";
+
 	foreach my $source (sort keys(%all_branch)) {
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
@@ -1218,13 +1224,7 @@ sub check_source_branches()
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
@@ -1288,12 +1288,14 @@ my $show_lines;
 my $only_i915;
 my $only_drm;
 my $check_branches;
+my $source_dir = ".";
 
 GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
 	"print-unused|u" => \$print_unused,
 	"stat|statistics" => \$stat,
 	"output|o=s" => \$output_file,
+	"source-dir|source_dir=s" => \$source_dir,
 	"verbose|v" => \$verbose,
 	"ignore-unused|ignore_unused" => \$ignore_unused,
 	"only-i915|only_i915" => \$only_i915,
@@ -1307,7 +1309,7 @@ GetOptions(
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
-	"check-branches" => \$check_branches,
+	"check-branches|check_branches" => \$check_branches,
 	"css-file|css|c=s" => \$css_file,
 	"title|t=s" => \$title,
 	"html-prolog|prolog=s" => \$html_prolog,
@@ -1412,7 +1414,7 @@ gen_stats();
 
 
 if ($check_branches) {
-	check_source_branches();
+	check_source_branches($source_dir);
 }
 
 die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
@@ -1541,6 +1543,12 @@ Produce an output file merging all input files.
 
 The generated output file is affected by the applied filters.
 
+=item B<--source-dir> or B<--source_dir>
+
+Sets the source directory baseline. This is used together with other
+options that require to parse the source files (currently, only
+B<--check-branches).
+
 =item B<--only-drm> or B<--only_drm>
 
 Filters out includes outside the DRM subsystem, plus trace files.
@@ -1676,7 +1684,7 @@ This option is automaticaly enabled when B<--func-filters> is used.
 Shows the list of files that were used to produce the code coverage
 results.
 
-=item B<--check-branches>
+=item B<--check-branches> or B<--check_branches>
 
 Checks at the Linux Kernel source files what's the contents of the
 branches that weren't taken. The directory should match what's
-- 
2.39.0
