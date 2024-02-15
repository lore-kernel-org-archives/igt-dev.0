Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2027C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8571210E5D4;
	Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CKaHlrgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF8710E5A9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=Yi9YelhEnzPVnNSMt0F8WKkGqeK0Gca05gP49/l8o5M=;
 b=CKaHlrgwH4v4z5PdGAhBNhyUxKXDADC10NV++hrCYfVdT7eFQ+ok4pT3
 vGfE+EeiiHVVX/s+psnq3jGHU5tLGAhp1HHhU+1UwbDRaKJ7bQTiolBc1
 KdyIsrcrG9eJMutqCiQ0AnbUwWsQaLwBkH+eZxuOsR8ufCukItIa6WXnJ
 rIKp8HMQA8DhXtxCtim+lf/A95Te5vH24yFWfLqmJfYaNBPG4Anyr0vN4
 qCiI/O1C3tTHwCzJNNn+dgXBMeIOq5YhH/DQWg8SYdRa7gdMv0zLBDy2V
 8ApnnlOVrUcl8U7ogdrk17sz2j4pnc3Iux6iYXYuD7yxu4dlphMmkoL82 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038597"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480347"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C8CC6580DF1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBA-3F7U for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 04/17] scripts/code_cov_parse_info: add support for filtering
 Xe driver data
Date: Thu, 15 Feb 2024 11:27:13 +0100
Message-ID: <39fdccf5425ca61282e90874a87138ad6a1f462c.1707992666.git.mchehab@kernel.org>
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

Just like it does for i915, add an option to get code coverage
data from Xe driver.

For now, it won't be taking DRM core stuff into account; just
the Xe driver code itself.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index ceea67a13d5a..f0fb5716a6ca 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -894,6 +894,7 @@ my $src_filters;
 my $show_files;
 my $show_lines;
 my $only_i915;
+my $only_xe;
 my $only_drm;
 
 GetOptions(
@@ -904,6 +905,7 @@ GetOptions(
 	"verbose|v" => \$verbose,
 	"ignore-unused|ignore_unused" => \$ignore_unused,
 	"only-i915|only_i915" => \$only_i915,
+	"only-xe|only_xe" => \$only_xe,
 	"only-drm|only_drm" => \$only_drm,
 	"func-filters|f=s" => \$func_filters,
 	"include-func=s" => \@func_include_regexes,
@@ -947,6 +949,14 @@ if ($only_i915) {
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
@@ -980,7 +990,9 @@ foreach my $f (@ARGV) {
 
 	if ($gen_report) {
 		$f =~ s,.*/,,;
+		$f =~ s/\.gz$//;
 		$f =~ s/\.info$//;
+		$f =~ s/\.json$//;
 
 		gen_stats();
 
@@ -1162,6 +1174,19 @@ Excluding files that match:
 
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
2.43.0

