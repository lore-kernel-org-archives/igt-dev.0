Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36057C021A6
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75F210EBC3;
	Fri,  7 Feb 2025 23:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GC3/v2ws";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3810E348
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=iMuJ4L1Mv7jeE+qHZmYBkqpuxd6F3Cs6grSuBwf7u8g=;
 b=GC3/v2wso5x3IFyWWd8mMfhEVfuRJZa4pVOn42fx3I/8b7be206N+3ww
 IlVKFFT3yFCyVtdw3JGvgMwimkgeso2bzBqeQli2HWgW5l6G9BiaKimNl
 tiBE5OR6FaO8q1fcZ+53dzqWTcLN0Kip1FjGK+FHlUhaRnnh7kx9vHOkL
 1ABV2LPjEB36vj+cWtKp9sfpH6lSKImuV38/YKR2naw9glbBZUajdL6MY
 57FJzBqMOy1crA5fTkeDBtbvmaSVJ1U1IWJOm+DdpEid4e3VD0jvBUSVi
 NcSWktAOQO9u1uqUKDZbpnctCiyMpUJhx1Gbk2C7Wezt2mzNq1s/6WvaP g==;
X-CSE-ConnectionGUID: 9Xpa8Tv7ToC/miua/uQGeQ==
X-CSE-MsgGUID: zacS6eHOR+ef2RuDKI1VdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281774"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: DtAjAyw4RUaicsaOtWzFEA==
X-CSE-MsgGUID: HO7ce4SbQAiMSYGUh/E3QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425867"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 05/10] runner/settings: Match serialization to parse
Date: Fri,  7 Feb 2025 15:09:39 -0800
Message-ID: <20250207231039.2883195-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207231039.2883195-2-lucas.demarchi@intel.com>
References: <20250207231039.2883195-2-lucas.demarchi@intel.com>
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

Use similarly named macros on both sides of serialize/parse.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 58 +++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 27 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 340d3802a..73d8aa13d 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1052,10 +1052,12 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
 	return true;
 }
 
+#define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
+#define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
+#define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
+#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
 bool serialize_settings(struct settings *settings)
 {
-#define SERIALIZE_LINE(f, s, name, format) fprintf(f, "%s : " format "\n", #name, s->name)
-
 	FILE *f;
 	int dirfd, covfd;
 	char path[PATH_MAX];
@@ -1097,31 +1099,31 @@ bool serialize_settings(struct settings *settings)
 		return false;
 	}
 
-	SERIALIZE_LINE(f, settings, abort_mask, "%d");
-	SERIALIZE_LINE(f, settings, disk_usage_limit, "%zd");
+	SERIALIZE_INT(f, settings, abort_mask);
+	SERIALIZE_UL(f, settings, disk_usage_limit);
 	if (settings->test_list)
-		SERIALIZE_LINE(f, settings, test_list, "%s");
+		SERIALIZE_STR(f, settings, test_list);
 	if (settings->name)
-		SERIALIZE_LINE(f, settings, name, "%s");
-	SERIALIZE_LINE(f, settings, dry_run, "%d");
-	SERIALIZE_LINE(f, settings, allow_non_root, "%d");
-	SERIALIZE_LINE(f, settings, facts, "%d");
-	SERIALIZE_LINE(f, settings, sync, "%d");
-	SERIALIZE_LINE(f, settings, log_level, "%d");
-	SERIALIZE_LINE(f, settings, overwrite, "%d");
-	SERIALIZE_LINE(f, settings, multiple_mode, "%d");
-	SERIALIZE_LINE(f, settings, inactivity_timeout, "%d");
-	SERIALIZE_LINE(f, settings, per_test_timeout, "%d");
-	SERIALIZE_LINE(f, settings, overall_timeout, "%d");
-	SERIALIZE_LINE(f, settings, use_watchdog, "%d");
-	SERIALIZE_LINE(f, settings, piglit_style_dmesg, "%d");
-	SERIALIZE_LINE(f, settings, dmesg_warn_level, "%d");
-	SERIALIZE_LINE(f, settings, prune_mode, "%d");
-	SERIALIZE_LINE(f, settings, test_root, "%s");
-	SERIALIZE_LINE(f, settings, results_path, "%s");
-	SERIALIZE_LINE(f, settings, enable_code_coverage, "%d");
-	SERIALIZE_LINE(f, settings, cov_results_per_test, "%d");
-	SERIALIZE_LINE(f, settings, code_coverage_script, "%s");
+		SERIALIZE_STR(f, settings, name);
+	SERIALIZE_INT(f, settings, dry_run);
+	SERIALIZE_INT(f, settings, allow_non_root);
+	SERIALIZE_INT(f, settings, facts);
+	SERIALIZE_INT(f, settings, sync);
+	SERIALIZE_INT(f, settings, log_level);
+	SERIALIZE_INT(f, settings, overwrite);
+	SERIALIZE_INT(f, settings, multiple_mode);
+	SERIALIZE_INT(f, settings, inactivity_timeout);
+	SERIALIZE_INT(f, settings, per_test_timeout);
+	SERIALIZE_INT(f, settings, overall_timeout);
+	SERIALIZE_INT(f, settings, use_watchdog);
+	SERIALIZE_INT(f, settings, piglit_style_dmesg);
+	SERIALIZE_INT(f, settings, dmesg_warn_level);
+	SERIALIZE_INT(f, settings, prune_mode);
+	SERIALIZE_STR(f, settings, test_root);
+	SERIALIZE_STR(f, settings, results_path);
+	SERIALIZE_INT(f, settings, enable_code_coverage);
+	SERIALIZE_INT(f, settings, cov_results_per_test);
+	SERIALIZE_STR(f, settings, code_coverage_script);
 
 	if (settings->sync) {
 		fflush(f);
@@ -1149,9 +1151,11 @@ bool serialize_settings(struct settings *settings)
 
 	close(dirfd);
 	return true;
-
-#undef SERIALIZE_LINE
 }
+#undef SERIALIZE_STR
+#undef SERIALIZE_UL
+#undef SERIALIZE_INT
+#undef SERIALIZE_LINE
 
 static int parse_int(char **val)
 {
-- 
2.48.1

