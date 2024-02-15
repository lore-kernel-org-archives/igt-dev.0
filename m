Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42303C48BF0
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D9A10E5EA;
	Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bob5sonE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF9810E5C2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=2IKYZiINn7n+OrP9uGs3zMa+6sCPoOD+FER/MTfB7nA=;
 b=Bob5sonEfgVruML1sOvoigiyY30HkDdHvCG4IaDxBTQFpep9P9+E+9f0
 yS/wmkPKPPtvHF8ODx9ceQHPK2AggW72qoveeBUpAJAkhDUQtuR2ZZ1Ml
 5erBUZU7luCg2oYqddaXapAvhRwONE8oI9AVagTPRIwA6dEGw050QeeVA
 n3BD7KNQOiJ/wx4qUpfqNvNTZ0dSpFNau3TKcc9v5+ICBGBsflN9ux1gU
 pxQROVlKpXfR73FYhQ2SsBxNQdkl2+Jstsv77JY1o8XxhqidcejVcRJyn
 vwzhocXlQFTxbw1Vl+yIochAeR2RBWLA/Zr4r8wDtptx7inaEBM1nj8qZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038599"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038599"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480349"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id ECB0C580E92
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JB7-3BVD for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 03/17] scripts/code_cov_parse_info: better handle include
 regexes
Date: Thu, 15 Feb 2024 11:27:12 +0100
Message-ID: <384e42d3f04aee9b3b489f29cee0d64c7e13150d.1707992666.git.mchehab@kernel.org>
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

When there are both exclude and include regexes, the include ones
may be overriding the more generic excluded ones. So, handle them
first.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 38 ++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index d3739211b68a..ceea67a13d5a 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -34,17 +34,24 @@ sub is_function_excluded($)
 
 	my $func = shift;
 
+	# Handle includes first, as, when there are both include and exclude
+	# includes should take preference, as they can be overriding exclude
+	# rules
+	foreach my $r (@func_include_regexes) {
+	    return 0 if ($func =~ m/$r/);
+	}
+
 	foreach my $r (@func_exclude_regexes) {
 		return 1 if ($func =~ m/$r/);
 	}
 
-	return 0 if (!@func_include_regexes);
-
-	foreach my $r (@func_include_regexes) {
-		return 0 if ($func =~ m/$r/);
+	# If there are no exclude regexes, only include functions that are
+	# explicitly included.
+	if ($#func_exclude_regexes == 0) {
+		return 1;
 	}
 
-	return 1;
+	return 0;
 }
 
 sub is_file_excluded($)
@@ -1178,9 +1185,10 @@ Each line at B<[filter's file]> may contain a new regex:
 
 =back
 
-When both include and exclude regexes are found, exclude regexes are
-applied first and any functions that don't match the include regular
-expressions from the B<[filter's file]> will be ignored.
+Include regexes are handled first, as they can override an exclude regex.
+
+When just include regexes are used, any functions that don't match the
+include regular expressions from the B<[filter's file]> will be ignored.
 
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
@@ -1189,7 +1197,8 @@ automaticaly enabled, as the final goal is to report per-function usage.
 
 Include B<regex> to the function filter. Can be used multiple times.
 
-When used together with B<--func-filters>, regexes here are handled first.
+When used together with B<--func-filters> or B<--exclude-func>, regexes
+here are handled first.
 
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
@@ -1198,8 +1207,6 @@ automaticaly enabled, as the final goal is to report per-function usage.
 
 Include B<regex> to the function filter. Can be used multiple times.
 
-When used together with B<--func-filters>, regexes here are handled first.
-
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
 
@@ -1229,22 +1236,19 @@ Each line at B<[filter's file]> may contain a new regex:
 
 =back
 
-When both include and exclude regexes are found, exclude regexes are
-applied first and any functions that don't match the include regular
-expressions from the B<[filter's file]> will be ignored.
+Include regexes are handled first, as they can override an exclude regex.
 
 =item B<--include-src> B<regex>
 
 Include B<regex> to the sources filter. Can be used multiple times.
 
-When used together with B<--src-filters>, regexes here are handled first.
+When used together with B<--src-filters> and B<--exclude-src>, regexes
+here are handled first.
 
 =item B<--exclude-src> B<regex>
 
 Include B<regex> to the sources filter. Can be used multiple times.
 
-When used together with B<--src-filters>, regexes here are handled first.
-
 =item B<--ignore-unused> or B<--ignore_unused>
 
 Filters out unused C files and headers from the code coverage results.
-- 
2.43.0

