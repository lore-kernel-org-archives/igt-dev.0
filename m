Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47B4C3ABB6
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 07:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6113210E756;
	Wed,  7 May 2025 07:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7hks2Z7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1389F10E756
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 07:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746603047; x=1778139047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8zEGLycSRZ3h/TQa8Ohm+z/J4nfhmwjrldSpu+NTO+E=;
 b=X7hks2Z7x8t55LHLklf59rd8n9FGAs3cPx8ecaUL5GT4NNrBax5a//6N
 nfVp4O4rNdcRaBWJW7n5cwmhlU2+4EpXDWDuZ22nYHZKdeoyTPVLaxxtF
 TFUT3x5ZHWO5p/1Yi0SiIQEQOmidiy3NgHjNKIKleARxrhWc/Td7NQkH5
 ROX2TE7XaEBlOf67Y2YhUhtCD0pRbQfTd3AVkHTA74y4STV1cKlW5cTQ3
 uUdHwBcAFQnGitMCWKVAYJwcmwWkG7Lqah9MYD+IQpund6o9fZsV6mGCA
 oN9Ng3Kp6+UoySRvKq8Dtqac6NkaZtoTYSgHTIYiWvCrbw+zgzytO8w5M w==;
X-CSE-ConnectionGUID: GMEELYpVQDixcP+GsGMbAg==
X-CSE-MsgGUID: GINnirZvQ/mj88PNYOngEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47565684"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="47565684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 00:30:46 -0700
X-CSE-ConnectionGUID: zg8s3dE4SxCel7ec91Ze4Q==
X-CSE-MsgGUID: 66KLOlkFS8y4bX56F4HuOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="136807960"
Received: from unknown (HELO thasleem.iind.intel.com) ([10.190.216.203])
 by orviesa008.jf.intel.com with ESMTP; 07 May 2025 00:30:45 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Refine FBC test
 conditions for BMG variants
Date: Wed,  7 May 2025 13:00:15 +0530
Message-ID: <20250507073015.1006511-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
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

This update stops skipping fbc-* tests based on the BMG platform.
Instead, tests are excluded only for specific unsupported BMG variants.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 lib/igt_kms.c                          | 30 ++++++++++++++++++++++++++
 lib/igt_kms.h                          |  1 +
 tests/intel/kms_frontbuffer_tracking.c |  7 +++---
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f3bc481f2..668da5915 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -61,6 +61,7 @@
 #include "igt_device.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
+#include "xe/xe_query.h"
 #ifdef HAVE_CHAMELIUM
 #include "igt_chamelium.h"
 #endif
@@ -7442,3 +7443,32 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * igt_read_debugfs_wa:
+ * @drm_fd:	A drm file descriptor
+ * @check_wa:	Wa to be checked
+ */
+bool igt_read_debugfs_wa(int drm_fd, const char *check_wa)
+{
+	char buf[4096];
+	bool found = false;
+	char name[PATH_MAX];
+	unsigned int xe, debugfs_fd;
+
+	debugfs_fd = igt_debugfs_dir(drm_fd);
+
+	xe_for_each_gt(drm_fd, xe) {
+		sprintf(name, "gt%d/workarounds", xe);
+		igt_require(igt_debugfs_exists(drm_fd, name, O_RDONLY));
+
+		if (igt_debugfs_simple_read(debugfs_fd, name, buf, sizeof(buf)) > 0) {
+			if (strstr(buf, check_wa)) {
+				found = true;
+				break;
+			}
+		}
+	}
+
+	return found;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 0381c82ad..cd83a56e7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1279,5 +1279,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 			   char *link_rate, char *lane_count);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
+bool igt_read_debugfs_wa(int drm_fd, const char *check_wa);
 
 #endif /* __IGT_KMS_H__ */
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 0809352cb..56d6c6f74 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -781,6 +781,7 @@
  */
 
 #define TIME SLOW_QUICK(1000, 10000)
+#define CHECK_WA "16023588340"
 
 IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
 		     "its related features: FBC, PSR and DRRS");
@@ -2610,7 +2611,7 @@ static void prepare_subtest_data(const struct test_mode *t,
 static void prepare_subtest_screens(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+	igt_skip_on_f((igt_read_debugfs_wa(drm.fd, CHECK_WA) && t->feature == FEATURE_FBC),
 		      "FBC isn't supported on BMG\n");
 
 	if (t->pipes == PIPE_DUAL)
@@ -2658,7 +2659,7 @@ static void prepare_subtest(const struct test_mode *t,
 static void rte_subtest(const struct test_mode *t)
 {
 	/* FBC disabled: Wa_16023588340 */
-	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+	igt_skip_on_f((igt_read_debugfs_wa(drm.fd, CHECK_WA) && t->feature == FEATURE_FBC),
 		      "FBC isn't supported on BMG\n");
 
 	prepare_subtest_data(t, NULL);
@@ -4157,7 +4158,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.tiling = opt.tiling;
 
 			/* FBC disabled: Wa_16023588340 */
-			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
+			igt_skip_on_f((igt_read_debugfs_wa(drm.fd, CHECK_WA) && t.feature == FEATURE_FBC),
 				      "FBC isn't supported on BMG\n");
 
 			for_each_pipe(&drm.display, pipe) {
-- 
2.34.1

