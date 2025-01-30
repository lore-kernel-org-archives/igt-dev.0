Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9288CC02198
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 17:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B5C10E9B9;
	Thu, 30 Jan 2025 17:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L6mgVZyi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6244410E37B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738257735; x=1769793735;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qJyQmozWrwfRtBNYfUEiaQIHgTY6Fm/atHSCZlGyodI=;
 b=L6mgVZyirFvkC9mG06fRL8kivOtPbg/OcQiS9ApjR6yx0VfIlJYDzpEn
 MZoCsAiRvZs+cuqMwUrsXNr85gig6pt8du0PqrwcVz0r1LixMgiK753u1
 VgcOZmbQ/p9+9AYjLlRrJkBxyQrimfU2FJo9/XK351FV2Zz2pIfTXNDOU
 MhS7Xa5D9oV/bJJsEGH2p44hXhm1Qx3y3im4zMRjkVuvqIJ081UERRMpu
 DK5ayy8bA3sXU04OP0uMd4gmWXa4aAc6ymOKa0KKzsrYnN3jT/Vew6zng
 NZ6oni9rX+aluSn7ktbJ2IdDX73/580KU0FRimjorotMYTb1plUYKy/Wp w==;
X-CSE-ConnectionGUID: eqt85FSwTDazmCIPnlURTQ==
X-CSE-MsgGUID: Hkjcg3szS0i0Cy98Xg8o1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42567077"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="42567077"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
X-CSE-ConnectionGUID: mV6UV+nrQUmVThiDJOtnTw==
X-CSE-MsgGUID: S67DGenFQKuI+aVLwtb+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="109539658"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 09:22:12 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 05/10] runner/settings: Match serialization to parse
Date: Thu, 30 Jan 2025 09:21:44 -0800
Message-ID: <20250130172149.3657144-6-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250130172149.3657144-1-lucas.demarchi@intel.com>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
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
2.48.0

