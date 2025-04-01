Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876A9C3601B
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:20:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B59B10E525;
	Tue,  1 Apr 2025 09:20:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCOJO/Zw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49A10E52F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743499239; x=1775035239;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5u3kFHHk3C30ig9uec1jsfQYQWqhrCF0euMwp9JULCA=;
 b=YCOJO/ZwijjMSsAbKFCbSJCnEjn6nguZSD9W/d5NaseyX4BMsKSMc13p
 2Q/LRNUqu9oYO3p0uFkn+qduNz3mBcVYi02B8h49kmwZm7ji1eWIN9x9c
 +ikSzvriCpjixMXf3Nje07+l4OR2uciHopQaRrj8ZSI1BOM9Ks664V44V
 26hvHfo3hP8wpMhMhSWa6nWQh79rX9lAvH3boo8Izoh9zvGMuirYBSJIL
 OUr6ybTtcxoi99zTu3wZvGq/YIoL/9PRwCAY6H9HOgI2OOt3hhwAqb4MR
 1BORC0vPONd/a0puzoLDcNs3XW6vnhlb/NS7JSZXoNSsOImfoGNZafV7f Q==;
X-CSE-ConnectionGUID: GMkeEXr7RDih4Fc3rJJ/VA==
X-CSE-MsgGUID: eOxGUqHAStWna10YPKO0ZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62211765"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62211765"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:20:34 -0700
X-CSE-ConnectionGUID: ySi78z/1SNu6y/j+Xc2RTw==
X-CSE-MsgGUID: +X0ILyyXQ92YIoQloVPEHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126166464"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 01 Apr 2025 02:20:31 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v3 4/5] tests/kms: Add parse_bitmask support for user
Date: Tue,  1 Apr 2025 14:50:14 +0530
Message-Id: <20250401092015.818465-5-pranay.samala@intel.com>
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

The user can dynamically provide a mask during execution, giving them
more control over the debug mask. This is useful in scenarios where
different masks are needed for different tests or configurations without
modifying the code itself.

If the user does not provide a mask, the system defaults to 0x04. This
ensures that the test can still run without requiring any extra input.

Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dp_linktrain_fallback.c | 37 +++++++++++++++++++------
 tests/kms_atomic_transition.c           | 24 ++++++++--------
 tests/kms_cursor_legacy.c               | 37 ++++++++++++++++++-------
 3 files changed, 68 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 6a872efd2..a6f7b586f 100644
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
@@ -621,14 +642,12 @@ igt_main
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
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
+
 		/*
 		 * Some environments may have environment
 		 * variable set to ignore long hpd, disable it for this test
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 2b64424ce..a92edc2b1 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1096,6 +1096,9 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1104,6 +1107,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'e':
 		data->extended = true;
 		break;
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
 	}
 
 	return IGT_OPT_HANDLER_SUCCESS;
@@ -1111,11 +1117,13 @@ static int opt_handler(int opt, int opt_index, void *_data)
 
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
 
@@ -1174,8 +1182,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	int pipe_count = 0;
 
 	igt_fixture {
-		int dir, current_log_level;
-
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1188,14 +1194,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 44f031e7b..09d511935 100644
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
 
@@ -1851,14 +1872,10 @@ igt_main
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
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.34.1

