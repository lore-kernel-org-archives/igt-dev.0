Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA0C83F09
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 03:25:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE9A10E30A;
	Mon,  7 Jul 2025 03:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kVAMC+9H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FD110E306
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 03:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751858730; x=1783394730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ay9RkIuNs/VUDVbYfjsnXdqifby4rFgaUUiznkPPQlQ=;
 b=kVAMC+9H3uz3ZzX+RCUV61nD55Ej3ob34XCpQQDK/d2UDt5ZgsvGFzdy
 OT/2Q0HufTdDlkIYte3wo8y3p3htBclBA+evLCP24xKQuI/Skj/iD90VW
 fEEFjNr0rmiIIFRUvBUBKjVLx3HY7LcM0P1hQPn8erCvcriuK7tKm80h9
 3Hhf27ep46Pm+h+LQxlEv+mmG0MAP+jj/oLJrSMvflJ3IN/mlwhWziAhv
 /GTzq1ry76waBQShgPI3SECa2nYyPLv8PkCEV9BCM6CJog/2FlQbP7C1l
 fgH2GK4C9SkZWc7WX5CqPKQSIDFFDbjuQlaKCwcPFd9kZtlVd9I7ygCOs A==;
X-CSE-ConnectionGUID: TXJ7Qq1xSzyjisIdV07ZTA==
X-CSE-MsgGUID: 7EnADHknQ1iinjnSDS19YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65134988"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65134988"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2025 20:25:30 -0700
X-CSE-ConnectionGUID: whS5e7j6QVaxWuJn1AwcZA==
X-CSE-MsgGUID: 6wkaAGmLSgCEOHzQI9VTxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="192288773"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa001.jf.intel.com with ESMTP; 06 Jul 2025 20:25:28 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com,
 Jan Sokolowski <jan.sokolowski@intel.com>
Subject: [PATCH i-g-t v5 4/5] tests/kms: Use CI environment variable
Date: Mon,  7 Jul 2025 09:02:45 +0530
Message-Id: <20250707033246.751156-5-pranay.samala@intel.com>
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

When running under CI (detected via the IGT_CI_RUN environment variable),
reduce the DRM debug mask to DRM_UT_KMS to avoid excessive debug output
and improve log readability. This replaces the previous logic that set the
debug level to 10 if it was higher, and makes the behavior CI-specific.

This helps keep CI logs concise and focused on relevant KMS debug messages
during automated test runs.
As per the test requirements, this level can be changed in the future if
deeper debug information is needed for troubleshooting.

v3:
- Refactored for readability and address logical comment.

v4:
- Remove custom command-line option handler (Jani & Kunal)
- Have different masks documented (Kunal)
- Use an environment variable for CI jobs where disk space is tight (Kunal)

v5:
- Move function to shared lib to avoid code duplication (Rama)

Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
---
 lib/igt_sysfs.c                         | 10 ++++++++++
 lib/igt_sysfs.h                         | 14 ++++++++++++++
 tests/intel/kms_dp_linktrain_fallback.c | 10 ++--------
 tests/kms_atomic_transition.c           | 12 ++----------
 tests/kms_cursor_legacy.c               | 11 ++---------
 5 files changed, 30 insertions(+), 27 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 5693747a2..3331d46d0 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -538,6 +538,16 @@ void igt_drm_debug_mask_update(unsigned int mask_to_set)
 	igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
 }
 
+void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
+{
+	const char *ci_run = getenv("IGT_CI_RUN");
+
+	if (ci_run && ci_run[0] == '1') {
+		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
+		igt_drm_debug_mask_update(debug_mask_if_ci);
+	}
+}
+
 /**
  * igt_sysfs_write:
  * @dir: sysfs directory
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 892682344..b86ceb63d 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -147,6 +147,20 @@ void igt_drm_debug_mask_update(unsigned int new_log_level);
 void igt_drm_debug_mask_reset(void);
 int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
+void update_debug_mask_if_ci(unsigned int debug_mask_if_ci);
+
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
 
 /**
  * igt_sysfs_rw_attr:
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 96e2836a8..e67c29f86 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -597,7 +597,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		int dir, current_log_level;
+		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
@@ -605,14 +605,8 @@ igt_main
 		igt_display_require_output(&data.display);
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_mask_get(dir);
-			close(dir);
+		update_debug_mask_if_ci(debug_mask_if_ci);
 
-			if (current_log_level > 10)
-				igt_drm_debug_mask_update(10);
-		}
 		/*
 		 * Some environments may have environment
 		 * variable set to ignore long hpd, disable it for this test
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 56a696f86..0829133a1 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1174,8 +1174,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int pipe_count = 0;
 
 	igt_fixture {
-		int dir, current_log_level;
-
+		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1188,14 +1187,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_mask_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_mask_update(10);
-		}
+		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index c8970f9f6..5973dcaed 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1839,7 +1839,7 @@ igt_main
 	};
 
 	igt_fixture {
-		int dir, current_log_level;
+		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -1851,14 +1851,7 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_mask_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_mask_update(10);
-		}
+		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.34.1

