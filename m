Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC7C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F57910E5C6;
	Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ih4IA6ps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE6410E57F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=NQ4NqbVGJ/qtlof36unk/Ip6CZ4NH5zEsme1ZYqyNPg=;
 b=ih4IA6psLM75pKSIARvN25aR6bDVpGriRTCI2GCPcd5lWuS8Q4uBviP+
 0dJEIllptP+P56/79IlWkz+dfpC7EIov49PsCekSuCx+8uE7MCz1BMX1O
 FImTyyeGvkA9mNRPcmGlIQ9lRWd/BVHaqP+S1njqrYdlMLeclr3P7AFH1
 qeuxNBhkLS53GBSBaBP5dzcSOs0rv2VKoWD2XwkuCf8k8emZ/gLxDlMm3
 4bikIr/5EXljmiQHkhi1PfyF4E9O9cMF0hllAyGNBDgd8RFAiaEF4697A
 JqOw4XmolcmmJUqu/UsKWAu4o0mwkpXpqcjb+HpLDoi2kz0yahI++nnee A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038592"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038592"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480342"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BA03B580BF0
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JB4-37ep for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 02/17] scripts/code_cov_parse_info: do some renames to make it
 more coherent
Date: Thu, 15 Feb 2024 11:27:11 +0100
Message-ID: <765b6e2a3c28d1387552ec6e3dac2b870da3ad3d.1707992666.git.mchehab@kernel.org>
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
2.43.0

