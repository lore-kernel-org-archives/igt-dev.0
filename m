Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B710DD5CC91
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 00:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C74610E2C8;
	Thu, 31 Oct 2024 00:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPovaAIc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89C810E076
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730334726; x=1761870726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rt07EeGibTqH92Fl/3JDE3GcbPPpE0GLl79Prmxp1uA=;
 b=bPovaAIcsFXQUiR5QoXKWKk5el3vKqTrfoc1Pw0tTfN2QrhkVqI1Seqr
 EKNGP+zfPLcMMa00E8c3ySVvQdSwCT/oH3K0VLqEOAL5JtlIV70XKT/Kk
 5Bgd2q667PJ5ykFnq9v5h3KxTOLrNeuWx2upjMwmrWRBeCQa6+RE5bpon
 jTYwv9nUBO+0GEVwUoKjsiHPkT5OKLLw85n35wgnpWkyVs6HsOTNSQazS
 dENTtptt+LaMLdv3aAiI8x+pv8bOIHLZ//49nH9vF4hDWgX6y6lQI/Xsq
 EGag1vLfb7O2gd0VVI+EifsZ+O7x/3vxRTChNii4bnb//2Sry2K54Qx51 g==;
X-CSE-ConnectionGUID: utJszJiqR+mM0yiHMCQlRA==
X-CSE-MsgGUID: eLHsoRnVQXCbmF2Vjk9UOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="47537563"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="47537563"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 17:32:04 -0700
X-CSE-ConnectionGUID: vgZVqA0HTlyWFMZVO20GIA==
X-CSE-MsgGUID: s3AIvRimQ/qAi87LbkiXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87262195"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 17:32:04 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/2] lib/igt_kmod: Simplify kunit_set_filtering()
Date: Wed, 30 Oct 2024 17:31:42 -0700
Message-ID: <20241031003142.863437-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031003142.863437-1-lucas.demarchi@intel.com>
References: <20241031003142.863437-1-lucas.demarchi@intel.com>
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

igt_sysfs_set() already supports setting a 0-length value since commit
1c0b492a0b5c ("lib/igt_sysfs: make sure to write empty strings").
Remove workaround in kunit_set_filtering() and simplify.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 40 +++++-----------------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 4cb9e886d..5fd500384 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -939,7 +939,7 @@ static bool kunit_set_filtering(const char *filter_glob, const char *filter,
 				const char *filter_action)
 {
 	int params;
-	bool ret;
+	bool ret = true;
 
 	params = open_parameters("kunit");
 	if (igt_debug_on(params < 0))
@@ -952,41 +952,11 @@ static bool kunit_set_filtering(const char *filter_glob, const char *filter,
 	 * As a workaround, we use non-NULL strings that exhibit
 	 * the same behaviour as if default NULLs were in place.
 	 */
-	ret = !igt_debug_on(!igt_sysfs_set(params, "filter_glob",
-					   filter_glob ?: "*"));
-	if (!ret)
-		goto close;
+	if (igt_debug_on(!igt_sysfs_set(params, "filter_glob", filter_glob ?: "*")) ||
+	    igt_debug_on(!igt_sysfs_set(params, "filter", filter ?: "module!=none")) ||
+	    igt_debug_on(!igt_sysfs_set(params, "filter_action", filter_action ?: "")))
+		ret = false;
 
-	ret = !igt_debug_on(!igt_sysfs_set(params, "filter",
-					   filter ?: "module!=none"));
-	if (!ret)
-		goto close;
-
-	ret = !igt_debug_on(!igt_sysfs_set(params, "filter_action",
-					   filter_action ?: ""));
-
-	/*
-	 * TODO: Drop the extra check below as soon as igt_sysfs_set()
-	 *	 can correctly process empty strings which we are using
-	 *	 as filter_action NULL equivalent.
-	 *
-	 * We need this check only when NULL is requested for "filter_action"
-	 * and not for "filter" parameter, otherwise, even if "filter_action"
-	 * was previously set to "skip", we don't care since our
-	 * "module!=none" default filter guarantees that no test cases are
-	 * filtered out to be processed as "filter_action" says.
-	 */
-	if (ret && !filter_action && filter) {
-		filter_action = igt_sysfs_get(params, "filter_action");
-
-		ret = !(igt_debug_on_f(!filter_action,
-				       "open() failed\n") ||
-			igt_debug_on_f(strlen(filter_action),
-				       "empty string not applied\n"));
-		free((char *)filter_action);
-	}
-
-close:
 	close(params);
 
 	return ret;
-- 
2.47.0

