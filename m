Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19AFC28B30
	for <igt-dev@archiver.kernel.org>; Thu, 20 Mar 2025 09:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC5410E18B;
	Thu, 20 Mar 2025 09:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lzsnUcOE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A37E10E18B
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Mar 2025 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742461687; x=1773997687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oqanEQ5TWuU6bHHkYNzzLVVmfnPiv+bXMZQqLa+N3i4=;
 b=lzsnUcOE3zwnwVI7eHOUmbjmgMImTRq8gke9sirwp64NCySjl07NT+7z
 0YIDAEZSmvEOYAM7wa42Ip6ToTYH8GOGALd96ESp82E5WmrOj5Kjox4Fo
 syhvS9dKhoJ7NFkmCiO8jv27IJvxV2NvR0YDqlsN39sGgqdy4OQT3DQ/C
 F/H4gRSHcLjuQezv97/PUYiwlcyVXwAaPBIF7oT/XhpV012B3naKSqqlG
 eufWi4EdqR9veqOi+ZjJX8QJkXiAzysDiBUd633bpN8iV0a5YHV2pOUeh
 ao/QEq4n30t27Wlboe1YDVZyAD4yRwz7ujWTWVCkDltWWgSgKrYc7N8q2 g==;
X-CSE-ConnectionGUID: 86Ukxm4bTgyGWUBSQAWAoQ==
X-CSE-MsgGUID: UggPagPMSjazZhLklb+Tsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47457147"
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="47457147"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 02:08:07 -0700
X-CSE-ConnectionGUID: m4PGJjAfQJ6calEdjxzBnw==
X-CSE-MsgGUID: 2fccTs87TYeAD8YHAzH+KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,261,1736841600"; d="scan'208";a="123493633"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 20 Mar 2025 02:08:04 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/kms: Simplify DRM debug mask update
Date: Thu, 20 Mar 2025 14:37:55 +0530
Message-Id: <20250320090755.482723-3-pranay.samala@intel.com>
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

This fixes directly sends the debug mask to be updated.
User can use bitmask option during execution and update
it as per the requirement. If user doesn't passes any
mask during the execution then it will update the debug
mask as 0x4 and at the end of the test, exit handler will
set the debug mask to the original value.

v2: Implementated to allow flexible bitmask usage during execution. (Jani)

Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 40 ++++++++++++++++++-------
 tests/kms_atomic_transition.c           | 25 +++++++++-------
 tests/kms_cursor_legacy.c               | 38 ++++++++++++++++-------
 3 files changed, 72 insertions(+), 31 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 6a872efd2..f827b9479 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -608,12 +608,33 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 	return ran;
 }
 
-igt_main
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "bitmask", .has_arg = true, .val = 'b', },
+	{}
+};
+
+static const char help_str[] =
+	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
+
+igt_main_args("", long_opts, help_str, opt_handler, NULL)
 {
 	data_t data = {};
 
 	igt_fixture {
-		int dir, current_log_level;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
@@ -621,18 +642,17 @@ igt_main
 		igt_display_require_output(&data.display);
 		for_each_pipe(&data.display, data.pipe)
 			data.n_pipes++;
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir >= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level > 10)
-				igt_drm_debug_level_update(10);
-		}
 		/*
 		 * Some environments may have environment
 		 * variable set to ignore long hpd, disable it for this test
 		 */
+
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
+
 		igt_assert_f(igt_ignore_long_hpd(data.drm_fd, false),
 			     "Unable to disable ignore long hpd\n");
 	}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 0342af206..9973ff263 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1093,6 +1093,9 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1101,6 +1104,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'e':
 		data->extended = true;
 		break;
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
 	}
 
 	return IGT_OPT_HANDLER_SUCCESS;
@@ -1108,11 +1114,13 @@ static int opt_handler(int opt, int opt_index, void *_data)
 
 static const struct option long_opts[] = {
 	{ .name = "extended", .has_arg = false, .val = 'e', },
+	{ .name = "bitmask", .has_arg = true, .val = 'b', },
 	{}
 };
 
 static const char help_str[] =
-	"  --extended\t\tRun the extended tests\n";
+	"  --extended\t\tRun the extended tests\n"
+	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
 
 static data_t data;
 
@@ -1171,8 +1179,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int pipe_count = 0;
 
 	igt_fixture {
-		int dir, current_log_level;
-
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1185,14 +1191,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 44f031e7b..2985e4852 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1823,7 +1823,29 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
 
-igt_main
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "bitmask", .has_arg = true, .val = 'b', },
+	{}
+};
+
+static const char help_str[] =
+	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
+
+igt_main_args("", long_opts, help_str, opt_handler, NULL)
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
@@ -1839,7 +1861,6 @@ igt_main
 	};
 
 	igt_fixture {
-		int dir, current_log_level;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -1851,14 +1872,11 @@ igt_main
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
+		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.34.1

