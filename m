Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7306010E546
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ACDF3580DFC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba19-2I
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:00 +0100
Message-Id: <20230117140607.2759816-6-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 05/12] code_cov_parse_info: add a tool to
 analyze branch coverage
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

Branch coverage is trickier than functions. Add a tool that displays
the starting line that it is not being covered, together with up
to 10 context lines before.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 85 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 3a503423861d..3982dbd513c4 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -894,6 +894,76 @@ sub generate_report($)
 	close OUT;
 }
 
+sub check_source_branches()
+{
+	foreach my $source (sort keys(%all_branch)) {
+		next if (!$used_source{$source});
+		next if (is_file_excluded($source));
+
+		my @lines;
+		foreach my $where (sort keys %{$all_branch{$source}}) {
+			my $taken = $all_branch{$source}{$where};
+			next if ($taken > 0);
+
+			next if !($where =~ m/^(-?\d+),(-?\d+),(-?\d+)/);
+
+			my ($ln, $block, $branch, $ctx_lines);
+			$ln = $1;
+			$block = $2;
+			$branch = $3;
+
+			if (!@lines) {
+				open IN, "$source";
+				@lines = <IN>;
+				close IN;
+			}
+
+			if ($ln >= $#lines) {
+				print "Error: $ln is bigger than $#lines. Can't print branch!\n";
+			}
+
+			my $func = $all_branch{$source}{$where}{func};
+			my $func_ln = $all_branch{$source}{$where}{func_ln};
+
+			print "Branch $source:$ln, ";
+			if ($func) {
+				if ($func_ln) {
+					print "func: $func, ";
+				} else {
+					print "func: $func:$func_ln, ";
+				}
+			}
+			print "block $block, branch $branch not taken:\n";
+
+			if ($func_ln) {
+				$ctx_lines = $ln - $func_ln;
+			} else {
+				$ctx_lines = 10;
+			}
+
+
+			# Search for up to $ctx_lines before the occurrence
+			my $context = "";
+			my $has_if;
+			$ln-- if ($ln > 0);
+			my $delim = "->";
+			for (my $if_ln = $ln; $if_ln >= 0 && (($ln - $if_ln) < $ctx_lines); $if_ln--) {
+				$context = "$if_ln$delim\t$lines[$if_ln]" . $context;
+				$delim = "";
+				if ($lines[$if_ln] =~ m/(\bif\b|#if)/) {
+					$has_if = 1;
+					last;
+				}
+			}
+			if ($has_if) {
+				print $context;
+			} else {
+				print "$ln->\t$lines[$ln]";
+			}
+		}
+	}
+}
+
 #
 # Argument handling
 #
@@ -910,6 +980,7 @@ my $show_files;
 my $show_lines;
 my $only_i915;
 my $only_drm;
+my $check_branches;
 
 GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
@@ -929,6 +1000,7 @@ GetOptions(
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
+	"check-branches" => \$check_branches,
 	"css-file|css|c=s" => \$css_file,
 	"title|t=s" => \$title,
 	"html-prolog|prolog=s" => \$html_prolog,
@@ -946,7 +1018,7 @@ if ($#ARGV < 0) {
 }
 
 # At least one action should be specified
-pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report);
+pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report && !$check_branches);
 
 pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
 
@@ -1027,6 +1099,11 @@ if ($gen_report) {
 
 gen_stats();
 
+
+if ($check_branches) {
+	check_source_branches();
+}
+
 die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
 
 print_code_coverage($print_used, $print_unused, $show_lines);
@@ -1284,6 +1361,12 @@ This option is automaticaly enabled when B<--func-filters> is used.
 Shows the list of files that were used to produce the code coverage
 results.
 
+=item B<--check-branches>
+
+Checks at the Linux Kernel source files what's the contents of the
+branches that weren't taken. The directory should match what's
+stored inside the info files.
+
 =item B<--verbose> or B<-v>
 
 Prints the name of each parsed file.
-- 
2.39.0
