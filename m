Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38CAC5B552
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 05:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6035E10E261;
	Wed,  4 Jun 2025 05:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lfCRvm6P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571D810E261
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 05:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014637; x=1780550637;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DBhYg0gJfmSeUjndj5pVaxnPqGYd3H5NRZlGiVO2zUQ=;
 b=lfCRvm6PMTcN5g2fgW/3BSM1DoE5hzubjqdJg5OSgwHPq7TKiM/vhPSA
 urnMVQYY/QfWlruAl6YIy4PcuEuCQ2tqEPa9+0ecZOPMN1yV3K7YN38MB
 CPCSs8DlQjzUnapgloPIZw90aNOzSAvZqADY87nYB4DkjzByc1iyuQXQi
 DgWIsdNQzhbbQubAXUrM72mQVRpm4Ouo9UmPoieKuvaritUZ4xRzJfNsW
 4r/DzdqYHYMOEc0dPAWOcArmyVzUk0z7j6jc3qdS4kmVFjFV6fNEj7vZv
 M2sDX/GEKbNcFdb8APV1175xYGNqUSd7nGmpDuebf2+j/Y+0vH/r6h71S Q==;
X-CSE-ConnectionGUID: BReXhweCSPmxEVoaB/hpjw==
X-CSE-MsgGUID: /dS0Lc4USGqQ/p8IrHKFSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54738317"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="54738317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:23:57 -0700
X-CSE-ConnectionGUID: c6moPatXRSWKBUQYFQAnIA==
X-CSE-MsgGUID: bTu/b9USRqeebOLX03Qq9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="145551516"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jun 2025 22:23:55 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 4/5] tests/kms: Use CI environment variable
Date: Wed,  4 Jun 2025 11:00:45 +0530
Message-Id: <20250604053046.1702233-5-pranay.samala@intel.com>
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

Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 lib/igt_sysfs.h                         | 13 +++++++++++++
 tests/intel/kms_dp_linktrain_fallback.c | 21 +++++++++++++--------
 tests/kms_atomic_transition.c           | 22 ++++++++++++----------
 tests/kms_cursor_legacy.c               | 21 ++++++++++++---------
 4 files changed, 50 insertions(+), 27 deletions(-)

diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 892682344..06badaf0e 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -148,6 +148,19 @@ void igt_drm_debug_mask_reset(void);
 int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
 
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
 /**
  * igt_sysfs_rw_attr:
  * @dir: file descriptor for parent directory
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index f8ef0cac4..9cd6f3d54 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -592,12 +592,22 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 	return ran;
 }
 
+static void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
+{
+	const char *ci_run = getenv("IGT_CI_RUN");
+
+	if (ci_run && ci_run[0] == '1') {
+		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
+		igt_drm_debug_mask_update(debug_mask_if_ci);
+	}
+}
+
 igt_main
 {
 	data_t data = {};
 
 	igt_fixture {
-		int dir, current_log_level;
+		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
@@ -605,14 +615,9 @@ igt_main
 		igt_display_require_output(&data.display);
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
 
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
+		update_debug_mask_if_ci(debug_mask_if_ci);
+
 		/*
 		 * Some environments may have environment
 		 * variable set to ignore long hpd, disable it for this test
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 2b64424ce..3202ab668 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1119,6 +1119,16 @@ static const char help_str[] =
 
 static data_t data;
 
+static void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
+{
+	const char *ci_run = getenv("IGT_CI_RUN");
+
+	if (ci_run && ci_run[0] == '1') {
+		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
+		igt_drm_debug_mask_update(debug_mask_if_ci);
+	}
+}
+
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	igt_output_t *output;
@@ -1174,8 +1184,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int pipe_count = 0;
 
 	igt_fixture {
-		int dir, current_log_level;
-
+		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1188,14 +1197,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for_each_connected_output(&data.display, output)
 			count++;
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
+		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 44f031e7b..281812a4d 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1823,6 +1823,16 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
 
+static void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
+{
+	const char *ci_run = getenv("IGT_CI_RUN");
+
+	if (ci_run && ci_run[0] == '1') {
+		igt_debug("Currently under CI execution, reducing the DRM debug mask to 0x4\n");
+		igt_drm_debug_mask_update(debug_mask_if_ci);
+	}
+}
+
 igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
@@ -1839,7 +1849,7 @@ igt_main
 	};
 
 	igt_fixture {
-		int dir, current_log_level;
+		unsigned int debug_mask_if_ci = DRM_UT_KMS;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -1851,14 +1861,7 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
+		update_debug_mask_if_ci(debug_mask_if_ci);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.34.1

