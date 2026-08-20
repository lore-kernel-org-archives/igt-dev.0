Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7293CC5DF86
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 19:51:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C04110F184;
	Thu, 20 Aug 2026 19:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5dUABP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C68C10E5FF
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 19:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787255466; x=1818791466;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HncejuSz2E9K9ZKZe7NQ4/8MN0JcMO6NutWiMT9gSXY=;
 b=J5dUABP9INf71HkjCzSvou5M5n+GQOds8sfSKIpGSwF2sz1+ebi2/5rg
 2Rxj2jPjhdRsGavPwlw0Q3W3RnjdaBq3/TkY5gEFgXGv9WcnbJW00oYec
 YqDs2Yxwm2Q3oAHDC2wMj9p/3mE0BoJF9ujrL4y0dJl4n3ogwScGSdV/X
 5saxeQ+fRPcOT4Pp/mSC9oPjqKE+rv1Ck4rLiYh1r0mDWwLuJsBZM0A8R
 A62wy016cVyar8kjVU/AIAgrk1gBhr8F7juQmEotWqqtkVu1WOxFwqlFE
 rM/y71+MhljPH4AsNYf3pjplxD8bP2FWBqnBVA/yRPQxYSmYUiQbtbfAP w==;
X-CSE-ConnectionGUID: Vr//pSedQiuQSy3v/xYrug==
X-CSE-MsgGUID: rPCl9CLHSC+uiMZrLE7m8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87823583"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87823583"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 12:51:05 -0700
X-CSE-ConnectionGUID: 1LHMbLuoQRKycqPx2SLPwA==
X-CSE-MsgGUID: JPuUOcqOQLiFAoZ8wWf9Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="262852763"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.85])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 12:51:04 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_sysfs_edid_timing: Create basic subtest
Date: Thu, 20 Aug 2026 21:50:54 +0200
Message-ID: <20260820195054.186450-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Create a basic subtest for probing connectors, also adding
an info about which connectors were probed. There is also a
change when no GPU cards or drivers were present, in which case
instead of failing test will skip.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/kms_sysfs_edid_timing.c | 37 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 6dbd762e4..c04d286c2 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -37,7 +37,7 @@
 #include <sys/stat.h>
 
 /**
- * SUBTEST:
+ * SUBTEST: basic
  * Description: This test checks the time it takes to reprobe each connector and
  *              fails if either the time it takes for one reprobe is too long or
  *              if the mean time it takes to reprobe one connector is too long.
@@ -57,32 +57,29 @@ IGT_TEST_DESCRIPTION("This test checks the time it takes to reprobe each "
 		     "make sure that the mean time for all connectors is "
 		     "not too long.");
 
-int igt_simple_main()
+static void reprobe_connectors(DIR *dirp)
 {
-	DIR *dirp;
 	struct dirent *de;
 	struct igt_mean all_mean;
 
-	dirp = opendir("/sys/class/drm");
-	igt_assert(dirp != NULL);
-
 	igt_mean_init(&all_mean);
-
 	while ((de = readdir(dirp))) {
 		struct igt_mean mean = {};
 		struct stat st;
 		char path[PATH_MAX];
+		bool checked;
 		int i;
 
 		if (*de->d_name == '.')
-			continue;;
+			continue;
 
 		snprintf(path, sizeof(path), "/sys/class/drm/%s/status",
-				de->d_name);
+			de->d_name);
 
 		if (stat(path, &st))
 			continue;
 
+		checked = false;
 		igt_mean_init(&mean);
 		for (i = 0; i < CHECK_TIMES; i++) {
 			struct timespec ts = {};
@@ -92,6 +89,7 @@ int igt_simple_main()
 			if ((fd = open(path, O_WRONLY)) < 0)
 				continue;
 
+			checked = true;
 			igt_kmsg(KMSG_DEBUG "%s: start detect\n", path);
 			igt_nsec_elapsed(&ts);
 			igt_ignore_warn(write(fd, "detect\n", 7));
@@ -111,6 +109,9 @@ int igt_simple_main()
 				de->d_name, i, current/1e6,  mean.max/1e6, mean.min/1e6);
 		}
 
+		if (checked)
+			igt_info("Probed connector: %s\n", de->d_name);
+
 		igt_debug("%s: mean.max %.2fns, %.2fus, %.2fms, "
 			  "mean.avg %.2fns, %.2fus, %.2fms\n",
 			  de->d_name,
@@ -134,6 +135,22 @@ int igt_simple_main()
 		     "Mean of all connector means exceeds %dms, max=%.2fms, mean=%.2fms\n",
 		     THRESHOLD_ALL_CONNECTORS_MEAN, all_mean.max / 1e6,
 		     all_mean.mean / 1e6);
+}
 
-	closedir(dirp);
+int igt_main()
+{
+	DIR *dirp;
+
+	igt_fixture() {
+		dirp = opendir("/sys/class/drm");
+		igt_require_f(dirp, "No DRM devices present\n");
+	}
+
+	igt_subtest("basic")
+		reprobe_connectors(dirp);
+
+	igt_fixture() {
+		if (dirp)
+			closedir(dirp);
+	}
 }
-- 
2.55.0

