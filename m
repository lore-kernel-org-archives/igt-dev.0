Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E889C36000
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 09:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0243310E158;
	Thu, 20 Mar 2025 09:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aT342vmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5319910E064
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 09:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742461684; x=1773997684;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s0O/cdmRy9eoE/w1Z66hqTh/rsY37PjYNRq3nSDCplc=;
 b=aT342vmE2co+d9+tVIhfs4Vnhqu1kPBFPgJtIzu8SDbUdEHdEIHSmxwS
 g0roe8TBX3HLohyzCPj9VXB8ez0a7NC1sEO4t4UkbBSP0PUcV1SdKCNEZ
 AUuBOT+gT22PvZVR9HtEF27KbU0qgMdIz08PVrWV1ga88hU53Hk2VxMFj
 pPqnrO339Bl6TNWCeFWFU1LLP0/MZRGi9Nj/UORXb/3+mW1iJvSFl2hOK
 lwIHoduTy1CdPZ9m+mySLVyGMXHTgFzChklp4M3mTuzaJpYk6SO57ajQ4
 FX/7gtjtRFYmywcwC9FfW3TekrumY8KScpCpFPbYU4gMPH3icvo1jsJi3 w==;
X-CSE-ConnectionGUID: hL26UL3XQ+yiswGJdpr/qQ==
X-CSE-MsgGUID: ek5bOjgjTtiGU1J37RUFNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47457139"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="47457139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 02:08:04 -0700
X-CSE-ConnectionGUID: XYzkG63pS3q3JJ1MGH8OeA==
X-CSE-MsgGUID: d06Es51tQOyTT+iNl6/Gww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123493624"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2025 02:08:00 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Leo Li <sunpeng.li@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>,
 Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_sysfs: Update DRM debug mask handling
 for verbosity control
Date: Thu, 20 Mar 2025 14:37:54 +0530
Message-Id: <20250320090755.482723-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320090755.482723-1-pranay.samala@intel.com>
References: <20250320090755.482723-1-pranay.samala@intel.com>
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

Modified the DRM debug logic to use a mask passed by
the test to control the debug mask.

Once the test is completed, the exit handler will update
the debug mask with the original value, even if function
is called multiple times.

v2:
- Update the commit message (Jani)
- Using mask to update instead of a single category (Jani)
- To handle nested updates, exit_handler is set before the
  update process (Jani)

Cc: Leo Li <sunpeng.li@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Ramanaidu Naladala <ramanaidu.naladala@intel.com>
Cc: Sameer Lattannavar <sameer.lattannavar@intel.com>

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.c | 61 +++++++++++++++++++++++++++----------------------
 lib/igt_sysfs.h | 20 +++++++++++++---
 2 files changed, 51 insertions(+), 30 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2e4c2ee63..af4b6c71d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -443,69 +443,72 @@ int igt_sysfs_drm_module_params_open(void)
 	return open(path, O_RDONLY);
 }
 
-static int log_level = -1;
+static int original_debug_mask = -1;
 
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
+ * The current log mask, or -1 on error.
  */
-int igt_drm_debug_level_get(int dir)
+int igt_drm_debug_mask_get(int dir)
 {
 	char buf[20];
 
-	if (log_level >= 0)
-		return log_level;
+	if (original_debug_mask >= 0)
+		return original_debug_mask;
 
-	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
+	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf)) < 0)
 		return -1;
 
 	return atoi(buf);
 }
 
 /**
- * igt_drm_debug_level_reset:
+ * igt_drm_debug_mask_reset:
  *
- * This modifies the current debug log level of the machine
+ * This modifies the current debug mask
  * to the default value post-test.
  *
  */
-void igt_drm_debug_level_reset(void)
+void igt_drm_debug_mask_reset(void)
 {
 	char buf[20];
 	int dir;
 
-	if (log_level < 0)
+	if (original_debug_mask < 0)
 		return;
 
 	dir = igt_sysfs_drm_module_params_open();
 	if (dir < 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", log_level);
-	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_debug("Resetting DRM debug severity to 0x%x\n", original_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
 }
 
-static void igt_drm_debug_level_reset_exit_handler(int sig)
+void igt_drm_debug_mask_reset_exit_handler(int sig)
 {
-	igt_drm_debug_level_reset();
+	igt_drm_debug_mask_reset();
 }
 
 /**
- * igt_drm_debug_level_update:
- * @debug_level: new debug level to set
+ * igt_drm_debug_mask_update:
+ * @mask_to_set: new debug mask to set
  *
- * This modifies the current drm debug log level to the new value.
+ * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_level_update(unsigned int new_log_level)
+
+void igt_drm_debug_mask_update(unsigned int mask_to_set)
 {
+	unsigned int new_debug_mask;
+	static bool update_flag = true;
 	char buf[20];
 	int dir;
 
@@ -513,14 +516,19 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir < 0)
 		return;
 
-	log_level = igt_drm_debug_level_get(dir);
-	if (log_level < 0) {
-		close(dir);
-		return;
+	if (update_flag) {
+		update_flag = false;
+		original_debug_mask = igt_drm_debug_mask_get(dir);
+		if (original_debug_mask < 0) {
+			close(dir);
+			return;
+		}
 	}
 
-	igt_debug("Setting DRM debug level to %d\n", new_log_level);
-	snprintf(buf, sizeof(buf), "%d", new_log_level);
+	new_debug_mask = mask_to_set;
+
+	igt_debug("Setting DRM debug severity to 0x%x\n", new_debug_mask);
+	snprintf(buf, sizeof(buf), "%d", new_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -529,7 +537,6 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	 * TODO: Check whether multiple exit handlers will get installed,
 	 * if we call this api multiple times
 	 */
-	igt_install_exit_handler(igt_drm_debug_level_reset_exit_handler);
 }
 
 /**
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 86345f3d1..b181fda35 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -143,9 +143,23 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
-void igt_drm_debug_level_update(unsigned int new_log_level);
-void igt_drm_debug_level_reset(void);
-int igt_drm_debug_level_get(int dir);
+enum drm_debug_category {
+	DRM_UT_CORE      = 1 << 0,
+	DRM_UT_DRIVER    = 1 << 1,
+	DRM_UT_KMS       = 1 << 2,
+	DRM_UT_PRIME     = 1 << 3,
+	DRM_UT_ATOMIC    = 1 << 4,
+	DRM_UT_VBL       = 1 << 5,
+	DRM_UT_STATE     = 1 << 6,
+	DRM_UT_LEASE     = 1 << 7,
+	DRM_UT_DP        = 1 << 8,
+	DRM_UT_DRMRES    = 1 << 9,
+};
+
+void igt_drm_debug_mask_reset_exit_handler(int sig);
+void igt_drm_debug_mask_update(unsigned int mask_to_set);
+void igt_drm_debug_mask_reset(void);
+int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
 
 /**
-- 
2.34.1

