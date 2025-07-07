Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBDDC83F03
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 03:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF5910E304;
	Mon,  7 Jul 2025 03:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Naccu1u0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF9810E304
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 03:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751858723; x=1783394723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+r1I96Dz46vWbHDtCUIs/FghY7SKP0FfuVSuLRWo1p0=;
 b=Naccu1u0/Wkw9/eXqtfSNMxLogNzksAHWzy0AJ/zqgNwZyyAco/hCJKp
 4MLwrT2K/P1a73cTOcAiMMqBg2FbbkUoMeHBwz05dGR8t8XmGPu4Mywjp
 Vbbl+IO/cHzbAsjIF/V1tFT3YNCdGBzBHYT8xTBJV7QOJkdZ99ZPHqeX4
 Lm5X4+ltDf3s3KP/vG0+4B1/O5715r0tHP4qzGLYjIdv3bqHt6ZjbvFvw
 qH7nzB9YJGjrWeMCXoB0tVvYH7Nztn/aiVPgYgB2p9NpmH00tVmNggpb4
 v8s5X5RVF6F+3UtHlZsppzDcQvYbzRkhJDn2x2osEtYSt8IfKsu/BH1Yo w==;
X-CSE-ConnectionGUID: nK03Fz6OS2+FpuYfCWVGzw==
X-CSE-MsgGUID: TyWunIDqTn6Ca14X6nCuog==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65134982"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65134982"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:25:23 -0700
X-CSE-ConnectionGUID: 32EN3gueTxy8coJzJ6M12g==
X-CSE-MsgGUID: 3diJh77vRYGqaZpb2H7A3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="192288748"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 20:25:20 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 2/5] lib/igt_sysfs: Rename debug level APIs/variables
 to debug mask
Date: Mon,  7 Jul 2025 09:02:43 +0530
Message-Id: <20250707033246.751156-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707033246.751156-1-pranay.samala@intel.com>
References: <20250707033246.751156-1-pranay.samala@intel.com>
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

v5:
- Solve the compilation issue (Rama)

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/igt_sysfs.c                         | 36 ++++++++++++-------------
 lib/igt_sysfs.h                         |  6 ++---
 tests/intel/kms_dp_linktrain_fallback.c |  4 +--
 tests/kms_atomic_transition.c           |  4 +--
 tests/kms_cursor_legacy.c               |  4 +--
 5 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 23fe4ac45..2863f537a 100644
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
 
-	igt_debug("Restoring DRM debug level to %d\n", saved_drm_debug_mask);
+	igt_debug("Restoring DRM debug mask to %d\n", saved_drm_debug_mask);
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
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index f8ef0cac4..96e2836a8 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -607,11 +607,11 @@ igt_main
 			data.n_pipes++;
 		dir = igt_sysfs_drm_module_params_open();
 		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
+			current_log_level = igt_drm_debug_mask_get(dir);
 			close(dir);
 
 			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
+				igt_drm_debug_mask_update(10);
 		}
 		/*
 		 * Some environments may have environment
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 2b64424ce..56a696f86 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1190,11 +1190,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		dir = igt_sysfs_drm_module_params_open();
 		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
+			current_log_level = igt_drm_debug_mask_get(dir);
 			close(dir);
 
 			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
+				igt_drm_debug_mask_update(10);
 		}
 	}
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 44f031e7b..c8970f9f6 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1853,11 +1853,11 @@ igt_main
 
 		dir = igt_sysfs_drm_module_params_open();
 		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
+			current_log_level = igt_drm_debug_mask_get(dir);
 			close(dir);
 
 			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
+				igt_drm_debug_mask_update(10);
 		}
 	}
 
-- 
2.34.1

