Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35438C5B552
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 05:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C19810E253;
	Wed,  4 Jun 2025 05:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqK0lYeX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7410E678
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 05:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014631; x=1780550631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=70GxE0/Z+yQC/FNQGRtrcl69OyKw2U8dWs1Yh3HpAIY=;
 b=dqK0lYeXp5hLncu/HRxh9Nh3Y5vW+JcEn1oWd6QJYPnltF+A3kykCrOm
 palMNVL9EiTm0/+HQaNqiHBW1uja9kyNU3HCdzfmnd3A5pDBleLI79EKT
 qtq2TeXltb+WTXI2wZ3xnlD/nidLiIvpEUxhRYrFMT2Q278ED3Yb2GpMn
 NT3JNd6K9PyAW08Uvtuv/vqYev51ST8Fh9cITY9rbkIqF7h1H7jJlER6d
 kqNkYoagboKWXtGMVI1KPMUcAWipr6mbrT5gIBS/ae1Cj1b1L5Dzad0kr
 NhmGLxNqODKuvpEc1xvST9FmCWL5SBG9RXJPZlXJqL+LZWhvIs78bhZPW A==;
X-CSE-ConnectionGUID: xABZ9B8HRaC5zUvgY3gpyw==
X-CSE-MsgGUID: tAxPPJOSToeb7WSuzdzSbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54738313"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="54738313"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:23:51 -0700
X-CSE-ConnectionGUID: /47nd2EDTJiwPyQ75V1kkg==
X-CSE-MsgGUID: TMJ/UONGRimpU89qR2osPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145551503"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 22:23:50 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 2/5] lib/igt_sysfs: Rename debug level APIs/variables
 to debug mask
Date: Wed,  4 Jun 2025 11:00:43 +0530
Message-Id: <20250604053046.1702233-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604053046.1702233-1-pranay.samala@intel.com>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
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

v3:
- Refactored for readability and address logical comment.

v4:
- Rename debug_level parameter to mask (Kunal)

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 36 ++++++++++++++++++------------------
 lib/igt_sysfs.h |  6 +++---
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index b7ca1f2b6..ceb776b8d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -446,15 +446,15 @@ int igt_sysfs_drm_module_params_open(void)
 static int saved_drm_debug_mask = -1;
 
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
 
-	igt_debug("Resetting DRM debug level to %d\n", saved_drm_debug_mask);
+	igt_debug("Resetting DRM debug mask to %d\n", saved_drm_debug_mask);
 	snprintf(buf, sizeof(buf), "%d", saved_drm_debug_mask);
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
+ * @debug_mask: new debug mask to set
  *
- * This modifies the current drm debug log level to the new value.
+ * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_level_update(unsigned int new_log_level)
+void igt_drm_debug_mask_update(unsigned int new_mask)
 {
 	char buf[20];
 	int dir;
@@ -513,14 +513,14 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	saved_drm_debug_mask = igt_drm_debug_level_get(dir);
+	saved_drm_debug_mask = igt_drm_debug_mask_get(dir);
 	if (saved_drm_debug_mask < 0) {
 		close(dir);
 		return;
 	}
 
-	igt_debug("Setting DRM debug level to %d\n", new_log_level);
-	snprintf(buf, sizeof(buf), "%d", new_log_level);
+	igt_debug("Setting DRM debug mask to %d\n", new_mask);
+	snprintf(buf, sizeof(buf), "%d", new_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -529,7 +529,7 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	 * TODO: Check whether multiple exit handlers will get installed,
 	 * if we call this api multiple times
 	 */
-	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
+	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 }
 
 /**
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 265f77d4d..892682344 100644
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

