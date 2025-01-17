Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F2D3C02185
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4685A10E3E4;
	Fri, 17 Jan 2025 23:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W4HopGgT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F2710E3E4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737155890; x=1768691890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=faz33rkTv4eChT+9iOw47HQeiHOs2B2zzvy6mEaddWs=;
 b=W4HopGgTdFWTBmMhiDolCj3OIINTNabj1TSyzIaXc4jV2PbdtVJ2iTnt
 86mMlk9RLFsetC8Yn2hy0cry4IRhO9EBt7rnfP4UHwVxpQdFJ6Y+oKZx/
 l2Ea8oUiL+t1GY4Q/7gP7g7J/wAp++9s6gfevYFcRTAW2np6nCDto6yKX
 +3k8zrevaU5B4DQGHyMgfqy2CjVVgvVXQtKJbdoptyNG5stTkOXTqY1io
 rcHC9Iz9zDjwg0EtXhmwM3d0RVdlTaUQiD+AvPyL+N0ifkk2foS/SolXM
 L1DnkB+aaT389TQ9hUkj/kFiV1Cecuv/V5oUjQfc1KbfiiuH41BDsqz/i A==;
X-CSE-ConnectionGUID: +m2edp3MQKqUWNnYSt61hg==
X-CSE-MsgGUID: KkY7ZhyjRlOxTyGLH3bWlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37627813"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37627813"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
X-CSE-ConnectionGUID: W3rrACX6SGa0ZqoAJ8yxZw==
X-CSE-MsgGUID: Qr74kwmtT8C53UYj+30AFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106819359"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:18:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/5] runner/settings: Use wrapper functions for each type
Date: Fri, 17 Jan 2025 15:17:43 -0800
Message-ID: <20250117231751.429703-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250117231751.429703-1-lucas.demarchi@intel.com>
References: <20250117231751.429703-1-lucas.demarchi@intel.com>
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

Simplify assigning the variables by using wrapper functions. This avoids
calling atoi() on every iteration and will allow to simplify the
strdup() calls in future.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 74 ++++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 29 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 80d95be5b..13694a51c 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1152,43 +1152,60 @@ bool serialize_settings(struct settings *settings)
 #undef SERIALIZE_LINE
 }
 
-bool read_settings_from_file(struct settings *settings, FILE *f)
+static int parse_int(char **pval)
+{
+	return atoi(*pval);
+}
+
+static unsigned long parse_ul(char **pval)
+{
+	return strtoul(*pval, NULL, 10);
+}
+
+static char *parse_str(char **pval)
 {
-#define PARSE_LINE(s, name, val, field, write)	\
+	return *pval ? strdup(*pval) : NULL;
+}
+
+#define PARSE_LINE(s, name, val, field, _f)	\
 	if (!strcmp(name, #field)) {		\
-		s->field = write;		\
+		s->field = _f(&val);		\
 		goto cleanup;			\
 	}
+#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, val, field, parse_int)
+#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, val, field, parse_ul)
+#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, val, field, parse_str)
 
+bool read_settings_from_file(struct settings *settings, FILE *f)
+{
 	char *name = NULL, *val = NULL;
 
 	settings->dmesg_warn_level = -1;
 
 	while (fscanf(f, "%ms : %m[^\n]", &name, &val) == 2) {
-		int numval = atoi(val);
-		PARSE_LINE(settings, name, val, abort_mask, numval);
-		PARSE_LINE(settings, name, val, disk_usage_limit, strtoul(val, NULL, 10));
-		PARSE_LINE(settings, name, val, test_list, val ? strdup(val) : NULL);
-		PARSE_LINE(settings, name, val, name, val ? strdup(val) : NULL);
-		PARSE_LINE(settings, name, val, dry_run, numval);
-		PARSE_LINE(settings, name, val, allow_non_root, numval);
-		PARSE_LINE(settings, name, val, facts, numval);
-		PARSE_LINE(settings, name, val, sync, numval);
-		PARSE_LINE(settings, name, val, log_level, numval);
-		PARSE_LINE(settings, name, val, overwrite, numval);
-		PARSE_LINE(settings, name, val, multiple_mode, numval);
-		PARSE_LINE(settings, name, val, inactivity_timeout, numval);
-		PARSE_LINE(settings, name, val, per_test_timeout, numval);
-		PARSE_LINE(settings, name, val, overall_timeout, numval);
-		PARSE_LINE(settings, name, val, use_watchdog, numval);
-		PARSE_LINE(settings, name, val, piglit_style_dmesg, numval);
-		PARSE_LINE(settings, name, val, dmesg_warn_level, numval);
-		PARSE_LINE(settings, name, val, prune_mode, numval);
-		PARSE_LINE(settings, name, val, test_root, val ? strdup(val) : NULL);
-		PARSE_LINE(settings, name, val, results_path, val ? strdup(val) : NULL);
-		PARSE_LINE(settings, name, val, enable_code_coverage, numval);
-		PARSE_LINE(settings, name, val, cov_results_per_test, numval);
-		PARSE_LINE(settings, name, val, code_coverage_script, val ? strdup(val) : NULL);
+		PARSE_INT(settings, name, val, abort_mask);
+		PARSE_UL(settings, name, val, disk_usage_limit);
+		PARSE_STR(settings, name, val, test_list);
+		PARSE_STR(settings, name, val, name);
+		PARSE_INT(settings, name, val, dry_run);
+		PARSE_INT(settings, name, val, allow_non_root);
+		PARSE_INT(settings, name, val, facts);
+		PARSE_INT(settings, name, val, sync);
+		PARSE_INT(settings, name, val, log_level);
+		PARSE_INT(settings, name, val, overwrite);
+		PARSE_INT(settings, name, val, multiple_mode);
+		PARSE_INT(settings, name, val, inactivity_timeout);
+		PARSE_INT(settings, name, val, per_test_timeout);
+		PARSE_INT(settings, name, val, overall_timeout);
+		PARSE_INT(settings, name, val, use_watchdog);
+		PARSE_INT(settings, name, val, piglit_style_dmesg);
+		PARSE_INT(settings, name, val, dmesg_warn_level);
+		PARSE_INT(settings, name, val, prune_mode);
+		PARSE_STR(settings, name, val, test_root);
+		PARSE_STR(settings, name, val, results_path);
+		PARSE_INT(settings, name, val, enable_code_coverage);
+		PARSE_INT(settings, name, val, cov_results_per_test);
+		PARSE_STR(settings, name, val, code_coverage_script);
 
 		printf("Warning: Unknown field in settings file: %s = %s\n",
 		       name, val);
@@ -1210,9 +1227,8 @@ cleanup:
 	free(val);
 
 	return true;
-
-#undef PARSE_LINE
 }
+#undef PARSE_LINE
 
 /**
  * read_env_vars_from_file() - load env vars from a file
-- 
2.48.0

