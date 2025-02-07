Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C1BC0219D
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 23:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F5D310EBB9;
	Fri,  7 Feb 2025 23:13:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOXg74pz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5391410E335
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738969870; x=1770505870;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=1AAR2qnV5S5oN2dvWDDTTGmTh/2Xqr+aFhRwvSPGD40=;
 b=JOXg74pzEfxX3PajTB59uO0W1D8sbFZ2k1HgaB9OC8C4Rv/TvHZtXBlV
 2P6Ce9OaVIRxuufe3vwn+DKhTiQI24QKk5eMADoYXyDKL3MMx8Wtxmbag
 nStaWEXwC/l4Shpx4KVT8FoQgnsOMjCopJifNGMmSMx3wUa3xlN0L4gA/
 aBCYG3NEtSVVhK4RxgFy6/3owHAQUN7sRFmFcbBbvTLRw958AC0w3NWjb
 T54Bf8ZHtyR1InWXIDjXyylnNFk6ZOxJLjdJNOixS32GVFS9ajuS+Ys9c
 V+TKAbcpxB3u9n5K12jLsngDDMDUILiWEisjkTW7cBg7q43ObR2wrFX1D A==;
X-CSE-ConnectionGUID: X4VWlooQSO6hEYVekC/EHw==
X-CSE-MsgGUID: 0vld9I4gR6+Gr5XLrkPXXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43281773"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="43281773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
X-CSE-ConnectionGUID: O7IlsNoySXyk2sac++YOrQ==
X-CSE-MsgGUID: DkxFOltERlab79NEQVE+Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="111425864"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:11:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 04/10] runner/settings: Use wrapper macros for each type
Date: Fri,  7 Feb 2025 15:09:38 -0800
Message-ID: <20250207231039.2883195-6-lucas.demarchi@intel.com>
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

Simplify assigning the variables by using functions called by wrapper
macros. This avoids calling atoi() on every iteration and will help
future refactors on functions parsing the values.

The pointer to the value is passed to the parse function since it will
be useful later when parsing a string and leaking it to the settings
struct rather than duplicating.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 runner/settings.c | 78 +++++++++++++++++++++++++++++------------------
 1 file changed, 48 insertions(+), 30 deletions(-)

diff --git a/runner/settings.c b/runner/settings.c
index 89df4990e..340d3802a 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -1153,43 +1153,59 @@ bool serialize_settings(struct settings *settings)
 #undef SERIALIZE_LINE
 }
 
-bool read_settings_from_file(struct settings *settings, FILE *f)
+static int parse_int(char **val)
+{
+	return atoi(*val);
+}
+
+static unsigned long parse_ul(char **val)
 {
-#define PARSE_LINE(s, name, val, field, write)	\
+	return strtoul(*val, NULL, 10);
+}
+
+static char *parse_str(char **val)
+{
+	return *val ? strdup(*val) : NULL;
+}
+
+#define PARSE_LINE(s, name, val, field, _f)	\
 	if (!strcmp(name, #field)) {		\
-		s->field = write;		\
+		s->field = _f(val);		\
 		goto cleanup;			\
 	}
-
+#define PARSE_INT(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_int)
+#define PARSE_UL(s, name, val, field)  PARSE_LINE(s, name, &val, field, parse_ul)
+#define PARSE_STR(s, name, val, field) PARSE_LINE(s, name, &val, field, parse_str)
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
@@ -1211,9 +1227,11 @@ cleanup:
 	free(val);
 
 	return true;
-
-#undef PARSE_LINE
 }
+#undef PARSE_STR
+#undef PARSE_UL
+#undef PARSE_INT
+#undef PARSE_LINE
 
 /**
  * read_env_vars_from_file() - load env vars from a file
-- 
2.48.1

