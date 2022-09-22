Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DD210E3ED
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 08:46:24 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.59.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CC5B4580971
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:46:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.95)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1obHqf-00CcSb-8S
 for igt-dev@lists.freedesktop.org; Thu, 22 Sep 2022 10:46:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 10:46:18 +0200
Message-Id: <28ffa8b7cd50fe747b9a6a6a45e12d04a0c5c225.1663836123.git.mchehab@kernel.org>
In-Reply-To: <cover.1663836123.git.mchehab@kernel.org>
References: <cover.1663836123.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 6/6] scripts/code_cov_parse_info: print common
 coverage and extra per function
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

While analyzing the data, it is nice to have a quick summary about
how much each set of the analyzed data contributes to the total.

So, generate a function summary report with the interception of
all the sets ("common function coverage"), plus the difference
that an individual test group contributes.

This is useful to provide a quick feedback on several situations:

- When comparing FULL with BAT:
	- how many functions are added on FULL?
	- are there functions that are only on BAT?

- When comparing different machines:
	- How many functions each individual machine has over
	  the common group?

- When comparing a group of tests:
	- How many functions an individual test adds for the
	  coverage that weren't covered at the common group yet?

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/6] at: https://lore.kernel.org/all/cover.1663836123.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 81 +++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 7f3e1f9ef116..72a1e8c2b0ad 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -574,6 +574,8 @@ sub generate_report($)
 	%used_source = ();
 	%files = ();
 	%test_names = ();
+	my @all_func_keys;
+	my %info_files_with_func;
 
 	foreach my $f (@info_files) {
 		foreach my $source (keys(%{$report{$f}{"all_line"}})) {
@@ -586,6 +588,14 @@ sub generate_report($)
 			foreach my $file (keys(%{$report{$f}{"all_func"}{$func}})) {
 				$all_func{$func}{$file}->{ln} = $report{$f}{"all_func"}{$func}{$file}->{ln};
 				$used_func{$func}->{$file} = 1 if ($report{$f}{"used_func"}{$func}->{$file});
+				if ($report{$f}{"used_func"}{$func}->{$file}) {
+					$used_func{$func}->{$file} = 1;
+					if (!$info_files_with_func{"$file $func"}) {
+						$info_files_with_func{"$file $func"} = 1;
+					} else {
+						$info_files_with_func{"$file $func"}++;
+					}
+				}
 			}
 		}
 		foreach my $source (keys(%{$report{$f}{"all_branch"}})) {
@@ -603,6 +613,25 @@ sub generate_report($)
 	}
 	gen_stats();
 
+	# Gen code coverage set comparision counters
+	my $common_func_count = 0;
+	foreach my $k (keys %info_files_with_func) {
+		$common_func_count++ if ($info_files_with_func{$k} == scalar (@info_files));
+	}
+	foreach my $f (@info_files) {
+		$report{$f}{"more_func"} = 0;
+		$report{$f}{"uniq_func"} = 0;
+		foreach my $func (keys(%{$report{$f}{"all_func"}})) {
+			foreach my $file (keys(%{$report{$f}{"all_func"}{$func}})) {
+				next if (!$report{$f}{"used_func"}{$func}->{$file});
+				next if ($info_files_with_func{"$file $func"} == scalar (@info_files));
+
+				$report{$f}{"more_func"}++;
+				$report{$f}{"uniq_func"}++ if ($info_files_with_func{"$file $func"} == 1);
+			}
+		}
+	}
+
 	# Colors for the html output
 
 	my $red    = "style=\"background-color:#ffb3b3\"";
@@ -720,6 +749,58 @@ sub generate_report($)
 	}
 	print OUT "  </tr>\n</table><p/>\n\n";
 
+	# Print function diff
+	print OUT "  <h2>Differences on function coverage</h2>\n";
+	print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
+	print OUT "    <th></th>\n";
+	print OUT "    <th>Common to all</th>\n";
+	foreach my $f (@info_files) {
+		print OUT "    <th>$f</th>\n";
+	}
+	print OUT "    <th>TOTAL</th>\n";
+
+	print OUT "  </tr><tr>\n";
+	print OUT "    <td>#Functions per category</td>\n";
+
+	printf OUT "    <td>%d</td>\n", $common_func_count;
+
+	foreach my $f (@info_files) {
+		my %st = %{$report{$f}{"stats"}};
+		if ($st{"func_count"}) {
+			printf OUT "    <td>%d</td>\n", $st{"func_used"};
+
+		}
+	}
+	print OUT "    <td>" . $stats{"func_count"} . "</td>\n";
+
+	print OUT "  </tr><tr>\n";
+	print OUT "    <td>#functions not in common</td>\n";
+	print OUT "    <td></td>\n";
+	foreach my $f (@info_files) {
+		my %st = %{$report{$f}{"stats"}};
+		if ($st{"func_count"}) {
+			printf OUT "    <td>%d</td>\n", $report{$f}{"more_func"};
+
+		}
+	}
+	print OUT "    <td></td>\n";
+
+	print OUT "  </tr><tr>\n";
+	print OUT "    <td>Unique functions</td>\n";
+	print OUT "    <td></td>\n";
+	foreach my $f (@info_files) {
+		my %st = %{$report{$f}{"stats"}};
+		if ($st{"func_count"}) {
+			printf OUT "    <td>%d</td>\n", $report{$f}{"uniq_func"};
+
+		}
+	}
+	print OUT "    <td></td>\n";
+
+	print OUT "  </tr>\n</table><p/>\n\n";
+
+	# Print the filters applied when generating the report
+
 	if ($filter_str ne "") {
 		printf OUT "<p>Filters: %s.</p>\n", $filter_str;
 	} else {
-- 
2.37.2
