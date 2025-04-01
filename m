Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A35C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E758910E52F;
	Tue,  1 Apr 2025 09:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DVU6t/h1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4AA10E52D
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499239; x=1775035239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QJ/vCOmuvG+iP7w77LogiQ/SNI8R7/jDac7SKq1qVlU=;
 b=DVU6t/h1r2xXwT5HH6gEGrg+6rVlNzZaE/uEva+RsDSM7VjtOvRZmzTk
 C3UUWXkiEiaCFr0mJE06RJ0ZQlLzr4GWUVK2BNxgHITgQBTGnDixqdWHA
 S3C1wcoTllAlrLKgsB2D2Td5L3LrTgz2iIkk0KDJyAkMhFVDlsoAyJ/4o
 Z/cOeKz8Gv5yuoaWwPJsCC77PW6QTnREl0A1CvOHs8geROt41vKZTw9CN
 a5aB36gFx3DZXYCgAS+46ivwQXNS0w5Bi1EvtJLsZMhpkMIRn+Ql59dDp
 CJAIF/PNnBgkrfGhc5Km4DZWhcvQ8kErGUOe7WFLiHDVQ4Nxy9Runp3Au w==;
X-CSE-ConnectionGUID: HeMkvl2dSn20r6eSsz4AWw==
X-CSE-MsgGUID: MwFOOpuqTfO+s0nlz0guyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62211753"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62211753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:20:26 -0700
X-CSE-ConnectionGUID: xHNSxofqTyS7PwBYT18+yw==
X-CSE-MsgGUID: 1Aes0F4+STav1FuyIZZLow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126166456"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 02:20:23 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 2/5] lib/igt_sysfs: Rename debug level APIs/variables
 to debug mask
Date: Tue,  1 Apr 2025 14:50:12 +0530
Message-Id: <20250401092015.818465-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401092015.818465-1-pranay.samala@intel.com>
References: <20250401092015.818465-1-pranay.samala@intel.com>
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

The debug log mask is a mask rather than level. Rename each level
occurance to mask.

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 32 ++++++++++++++++----------------
 lib/igt_sysfs.h |  6 +++---
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9643aab43..e6058a1dd 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -446,15 +446,15 @@ int igt_sysfs_drm_module_params_open(void)
 static int original_debug_mask = -1;
 
 /**
- * igt_drm_debug_level_get:
+ * igt_drm_debug_mask_get:
  *
- * This reads the current debug log level of the machine on
+ * This reads the current debug mask of the machine on
  * which the test is currently executing.
  *
  * Returns:
- * The current log level, or -1 on error.
+ * The current debug mask, or -1 on error.
  */
-int igt_drm_debug_level_get(int dir)
+int igt_drm_debug_mask_get(int dir)
 {
 	char buf[20];
 
@@ -468,13 +468,13 @@ int igt_drm_debug_level_get(int dir)
 }
 
 /**
- * igt_drm_debug_level_reset:
+ * igt_drm_debug_mask_reset:
  *
- * This modifies the current debug log level of the machine
+ * This modifies the current debug mask of the machine
  * to the default value post-test.
  *
  */
-void igt_drm_debug_level_reset(void)
+void igt_drm_debug_mask_reset(void)
 {
 	char buf[20];
 	int dir;
@@ -486,25 +486,25 @@ void igt_drm_debug_level_reset(void)
 	if (dir < 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", original_debug_mask);
+	igt_debug("Resetting DRM debug mask to %d\n", original_debug_mask);
 	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
 }
 
-static void igt_drm_debug_level_reset_exit_handler(int sig)
+static void igt_drm_debug_mask_reset_exit_handler(int sig)
 {
-	igt_drm_debug_level_reset();
+	igt_drm_debug_mask_reset();
 }
 
 /**
- * igt_drm_debug_level_update:
- * @debug_level: new debug level to set
+ * igt_drm_debug_mask_update:
+ * @debug_level: new debug mask to set
  *
- * This modifies the current drm debug log level to the new value.
+ * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_level_update(unsigned int new_log_level)
+void igt_drm_debug_mask_update(unsigned int new_log_level)
 {
 	char buf[20];
 	int dir;
@@ -513,13 +513,13 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	original_debug_mask = igt_drm_debug_level_get(dir);
+	original_debug_mask = igt_drm_debug_mask_get(dir);
 	if (original_debug_mask < 0) {
 		close(dir);
 		return;
 	}
 
-	igt_debug("Setting DRM debug level to %d\n", new_log_level);
+	igt_debug("Setting DRM debug mask to %d\n", new_log_level);
 	snprintf(buf, sizeof(buf), "%d", new_log_level);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 86345f3d1..2f4d25bf6 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -143,9 +143,9 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
-void igt_drm_debug_level_update(unsigned int new_log_level);
-void igt_drm_debug_level_reset(void);
-int igt_drm_debug_level_get(int dir);
+void igt_drm_debug_mask_update(unsigned int new_log_level);
+void igt_drm_debug_mask_reset(void);
+int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
 
 /**
-- 
2.34.1

