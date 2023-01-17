Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E6610E547
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:21 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C70B3580E26
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba1b-2k
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:06:07 +0100
Message-Id: <20230117140607.2759816-13-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 12/12] code_cov_parse_info: add support for
 filtering Xe driver data
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

Just like it does for i915, add an option to get code coverage
data from Xe driver.

For now, it won't be taking DRM core stuff into account; just
the Xe driver code itself.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 2c3283cc1119..d133ef1a18d4 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -1387,6 +1387,7 @@ my $branch_filters;
 my $show_files;
 my $show_lines;
 my $only_i915;
+my $only_xe;
 my $only_drm;
 my $check_branches;
 
@@ -1399,6 +1400,7 @@ GetOptions(
 	"verbose|v" => \$verbose,
 	"ignore-unused|ignore_unused" => \$ignore_unused,
 	"only-i915|only_i915" => \$only_i915,
+	"only-xe|only_xe" => \$only_xe,
 	"only-drm|only_drm" => \$only_drm,
 	"func-filters|f=s" => \$func_filters,
 	"include-func=s" => \@func_include_regexes,
@@ -1448,6 +1450,14 @@ if ($only_i915) {
 	push @src_include_regexes, "drm/vgem";
 }
 
+if ($only_xe) {
+	# Please keep in sync with the documentation
+	push @src_exclude_regexes, "selftest";
+	push @src_include_regexes, "drm/xe";
+#	push @src_include_regexes, "drm/ttm";
+#	push @src_include_regexes, "drm/vgem";
+}
+
 if ($only_drm) {
 	# Please keep in sync with the documentation
 	push @src_exclude_regexes, "trace.*\.h\$";
@@ -1493,7 +1503,9 @@ foreach my $f (@ARGV) {
 
 	if ($gen_report) {
 		$f =~ s,.*/,,;
+		$f =~ s/\.gz$//;
 		$f =~ s/\.info$//;
+		$f =~ s/\.json$//;
 
 		gen_stats();
 
@@ -1694,6 +1706,19 @@ Excluding files that match:
 
 	- selftest
 
+=item B<--only-xe> or B<--only_xe>
+
+Filters out C files and headers outside drm core and drm/i915.
+
+E. g. code coverage results will include only the files that that match
+the following regular expressions:
+
+	- drm/xe/
+
+Excluding files that match:
+
+	- selftest
+
 =item B<--func-filters>  B<[filter's file]> or B<-f>  B<[filter's file]>
 
 Use a file containing regular expressions (regex) to filter functions.
-- 
2.39.0
