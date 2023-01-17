Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA4410E546
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 14:06:20 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 93482580DD6
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 06:06:19 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pHmbR-00Ba10-26
 for igt-dev@lists.freedesktop.org; Tue, 17 Jan 2023 15:06:17 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 15:05:57 +0100
Message-Id: <20230117140607.2759816-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 02/12] code_cov_parse_info: do some renames
 to make it more coherent
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

Let the regex array to be clearer about include regexes, and
coherent with exclude ones.

While here, also rename the file exclude check function, to
have a name closer to its functions counterpart.

No functional changes.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 38 ++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 1498bd09cdba..d3739211b68a 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -18,10 +18,10 @@ my %all_line;
 my %used_source;
 my %record;
 my %files;
-my @func_regexes;
+my @func_include_regexes;
 my @func_exclude_regexes;
 my %test_names;
-my @src_regexes;
+my @src_include_regexes;
 my @src_exclude_regexes;
 
 my $verbose = 0;
@@ -30,7 +30,7 @@ my $skip_func = 0;
 
 sub is_function_excluded($)
 {
-	return 0 if (!@func_regexes && !@func_exclude_regexes);
+	return 0 if (!@func_include_regexes && !@func_exclude_regexes);
 
 	my $func = shift;
 
@@ -38,28 +38,28 @@ sub is_function_excluded($)
 		return 1 if ($func =~ m/$r/);
 	}
 
-	return 0 if (!@func_regexes);
+	return 0 if (!@func_include_regexes);
 
-	foreach my $r (@func_regexes) {
+	foreach my $r (@func_include_regexes) {
 		return 0 if ($func =~ m/$r/);
 	}
 
 	return 1;
 }
 
-sub filter_file($)
+sub is_file_excluded($)
 {
 	my $s = shift;
 
-	return 0 if (!@src_regexes && !@src_exclude_regexes);
+	return 0 if (!@src_include_regexes && !@src_exclude_regexes);
 
 	foreach my $r (@src_exclude_regexes) {
 		return 1 if ($s =~ m/$r/);
 	}
 
-	return 0 if (!@src_regexes);
+	return 0 if (!@src_include_regexes);
 
-	foreach my $r (@src_regexes) {
+	foreach my $r (@src_include_regexes) {
 		return 0 if ($s =~ m/$r/);
 	}
 
@@ -107,7 +107,7 @@ sub parse_info_data($)
 			$files{$source} = 1;
 
 			# Just ignore files explictly set as such
-			$ignore = filter_file($source);
+			$ignore = is_file_excluded($source);
 			next;
 		}
 
@@ -189,7 +189,7 @@ sub parse_info_data($)
 
 		# Ignore DA/BRDA that aren't associated with functions
 		# Those are present on header files (maybe defines?)
-		next if (@func_regexes && !$has_func);
+		next if (@func_include_regexes && !$has_func);
 
 		# FNF:<number of functions found>
 		if (m/^FNF:(-?\d+)/) {
@@ -899,10 +899,10 @@ GetOptions(
 	"only-i915|only_i915" => \$only_i915,
 	"only-drm|only_drm" => \$only_drm,
 	"func-filters|f=s" => \$func_filters,
-	"include-func=s" => \@func_regexes,
+	"include-func=s" => \@func_include_regexes,
 	"exclude-func=s" => \@func_exclude_regexes,
 	"source-filters|S=s" => \$src_filters,
-	"include-source=s" => \@src_regexes,
+	"include-source=s" => \@src_include_regexes,
 	"exclude-source=s" => \@src_exclude_regexes,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
@@ -935,9 +935,9 @@ my $str;
 if ($only_i915) {
 	# Please keep in sync with the documentation
 	push @src_exclude_regexes, "selftest";
-	push @src_regexes, "drm/i915";
-	push @src_regexes, "drm/ttm";
-	push @src_regexes, "drm/vgem";
+	push @src_include_regexes, "drm/i915";
+	push @src_include_regexes, "drm/ttm";
+	push @src_include_regexes, "drm/vgem";
 }
 
 if ($only_drm) {
@@ -946,21 +946,21 @@ if ($only_drm) {
 	push @src_exclude_regexes, "^/drm/";
 }
 
-$str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
+$str = open_filter_file($func_filters, \@func_include_regexes, \@func_exclude_regexes);
 if ($str) {
 	$filter_str .= "," if ($filter_str ne "");
 	$filter_str .= " function regex ($str)";
 	$has_filter = 1;
 }
 
-$str = open_filter_file($src_filters, \@src_regexes, \@src_exclude_regexes);
+$str = open_filter_file($src_filters, \@src_include_regexes, \@src_exclude_regexes);
 if ($str) {
 	$filter_str .= "," if ($filter_str ne "");
 	$filter_str .= " source regex ($str)";
 	$has_filter = 1;
 }
 
-$ignore_unused = 1 if (@func_regexes || @func_exclude_regexes);
+$ignore_unused = 1 if (@func_include_regexes || @func_exclude_regexes);
 
 if ($ignore_unused) {
 	$filter_str .= "," if ($filter_str ne "");
-- 
2.39.0
