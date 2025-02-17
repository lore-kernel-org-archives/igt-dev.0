Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30076C021AB
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 21:30:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E031910E5E5;
	Mon, 17 Feb 2025 21:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hg8KMoUm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 093F210E5E5
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 21:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739827817; x=1771363817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7q79/5VD7bf+WBmzuYBVGkTciu6KiqbNA4Mr4eR3yqQ=;
 b=hg8KMoUmi3aBFRxs8LxKWYE5uXqpzqbR+7FDLLUBage2qpx/Af2aMavc
 MHnyfX9BBfSx6vJ+hbN3n3mlHZMWk3juvdJsomzhPlKbDuQu5hPA1gLFN
 NpXXviovIrJCCUpZjY3Kb8ZLbJ+ee4RbRtAOxS+AWP9ogGzC+8oT1Gydd
 HQzv4jHPRSp19qdpykBukZVIiC2TnfpeC2OStZixrSgIMTnZ9kEfUzg59
 oogUvRWHSiNkgnT+2UaStRjehXuB4XgcSTBQo1rmCVmR7APqBD31nHl61
 g30dprJqqv+3E7+mpSwxRCHxlWOfZaHTm1RG5GX+d7PpAjMnfwRU1SWUK A==;
X-CSE-ConnectionGUID: b1PbbkI4S3iCSQT7NvYD9g==
X-CSE-MsgGUID: WC8oSp9PQB+BldLdAUIw6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39750686"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39750686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:17 -0800
X-CSE-ConnectionGUID: +MlgZiQRQnOpc3E1itfyxQ==
X-CSE-MsgGUID: BHwt49xRT56xJz7+3+GQbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114411202"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:15 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/5] lib/igt_kms: Add func() to read and parse cdclk
 debugfs
Date: Tue, 18 Feb 2025 03:05:27 +0530
Message-Id: <20250217213531.402162-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250217213531.402162-1-swati2.sharma@intel.com>
References: <20250217213531.402162-1-swati2.sharma@intel.com>
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

Add a common function to read and parse CDCLK information from
the debugfs interface. The function retrieves the current CD
clock frequency, maximum CD clock frequency, and maximum pixel
clock frequency by parsing the contents of:

	/sys/kernel/debug/dri/0/i915_cdclk_info

Example content:
	Current CD clock frequency: 268800 kHz
	Max CD clock frequency: 652800 kHz
	Max pixel clock frequency: 1305600 kHz

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c           | 76 ++++++++++++++++++++++++++++++-----------
 lib/igt_kms.h           |  2 ++
 tests/intel/kms_cdclk.c | 46 ++++---------------------
 3 files changed, 65 insertions(+), 59 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 0ba1afb08..9d49095d5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6303,29 +6303,20 @@ bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 	return false;
 }
 
-/**
- * igt_get_max_dotclock:
- * @fd: A drm file descriptor
- *
- * Get the Max pixel clock frequency from intel specific debugfs
- * "i915_frequency_info".
- *
- * Returns: Max supported pixel clock frequency.
- */
-int igt_get_max_dotclock(int fd)
+static int read_and_parse_cdclk_debugfs(int fd, const char *check_str)
 {
 	char buf[4096];
 	char *s;
-	int dir, res, max_dotclock = 0;
+	int dir, res, clk = 0;
 	drmModeRes *resources;
 
 	if (!is_intel_device(fd))
-		return max_dotclock;
+		return 0;
 
-	/* If there is no display, then no point to check for dotclock. */
+	/* If there is no display, then no point to check further. */
 	resources = drmModeGetResources(fd);
 	if (!resources)
-		return max_dotclock;
+		return 0;
 
 	drmModeFreeResources(resources);
 
@@ -6346,14 +6337,61 @@ int igt_get_max_dotclock(int fd)
 
 	igt_require(res > 0);
 
-	igt_assert(s = strstr(buf, "Max pixel clock frequency:"));
-	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
+	igt_assert(s = strstr(buf, check_str));
+	s += strlen(check_str);
+	igt_assert_eq(sscanf(s, "%d kHz", &clk), 1);
+
+	return clk;
+}
+
+/**
+ * igt_get_max_dotclock:
+ * @fd: A drm file descriptor
+ *
+ * Get the Max pixel clock frequency from intel specific debugfs
+ * "i915_frequency_info"/"i915_cdclk_info".
+ *
+ * Returns: Max supported pixel clock frequency, otherwise 0.
+ */
+int igt_get_max_dotclock(int fd)
+{
+	int max_dotclock = read_and_parse_cdclk_debugfs(fd, "Max pixel clock frequency:");
 
 	/* 100 Mhz to 5 GHz seem like reasonable values to expect */
-	igt_assert_lt(max_dotclock, 5000000);
-	igt_assert_lt(100000, max_dotclock);
+	if (max_dotclock > 0) {
+		igt_assert_lt(max_dotclock, 5000000);
+		igt_assert_lt(100000, max_dotclock);
+	}
+
+	return max_dotclock > 0 ? max_dotclock : 0;
+}
 
-	return max_dotclock;
+/**
+ * igt_get_max_cdclk:
+ * @fd: A drm file descriptor
+ *
+ * Get the max CD clock frequency from intel specific debugfs
+ * "i915_frequency_info"/"i915_cdclk_info".
+ *
+ * Returns: Max supported CD clk frequency.
+ */
+int igt_get_max_cdclk(int fd)
+{
+	return read_and_parse_cdclk_debugfs(fd, "Max CD clock frequency:");
+}
+
+/**
+ * igt_get_current_cdclk:
+ * @fd: A drm file descriptor
+ *
+ * Get the current CD clock frequency from intel specific debugfs
+ * "i915_frequency_info"/"i915_cdclk_info".
+ *
+ * Returns: Current supported CD clock frequency.
+ */
+int igt_get_current_cdclk(int fd)
+{
+	return read_and_parse_cdclk_debugfs(fd, "Current CD clock frequency:");
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 7227f0b0e..d4731af9c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1242,6 +1242,8 @@ void igt_sort_connector_modes(drmModeConnector *connector,
 bool igt_max_bpc_constraint(igt_display_t *display, enum pipe pipe,
 		igt_output_t *output, int bpc);
 int igt_get_max_dotclock(int fd);
+int igt_get_max_cdclk(int fd);
+int igt_get_current_cdclk(int fd);
 bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock);
 bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
 			  int max_dotclock, drmModeModeInfo *mode);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 382b3e9d1..b89b2f345 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -63,7 +63,6 @@ enum {
 
 typedef struct {
 	int drm_fd;
-	int debugfs_fd;
 	uint32_t devid;
 	igt_display_t display;
 } data_t;
@@ -76,34 +75,6 @@ static bool hardware_supported(data_t *data)
 	return false;
 }
 
-static int get_current_cdclk_freq(int debugfs_fd)
-{
-	int cdclk_freq_current;
-	char buf[1024];
-	char *start_loc;
-	int res;
-
-	/*
-	 * Display specific clock frequency info is moved to i915_cdclk_info,
-	 * On older kernels if this debugfs is not found, fallback to read from
-	 * i915_frequency_info.
-	 *
-	 * FIXME: As of now, XE debugfs is still using i915 namespace, once the
-	 * Kernel changes are landed, update this to use the XE specific debugfs.
-	 */
-	res = igt_debugfs_simple_read(debugfs_fd, "i915_cdclk_info",
-				      buf, sizeof(buf));
-	if (res <= 0)
-		res = igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
-					      buf, sizeof(buf));
-	igt_require(res > 0);
-
-	igt_assert(start_loc = strstr(buf, "Current CD clock frequency: "));
-	igt_assert_eq(sscanf(start_loc, "Current CD clock frequency: %d", &cdclk_freq_current), 1);
-
-	return cdclk_freq_current;
-}
-
 static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 {
 	__u64 data_rate = (__u64)mode->hdisplay * (__u64)mode->vdisplay * (__u64)mode->vrefresh;
@@ -168,7 +139,6 @@ static void do_cleanup_display(igt_display_t *dpy)
 static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	int debugfs_fd = data->debugfs_fd;
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
@@ -197,11 +167,11 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 
 		/* downscaling */
 		igt_plane_set_size(primary, ((fb.width * scaling) / 100), ((fb.height * scaling) / 100));
-		cdclk_ref = get_current_cdclk_freq(debugfs_fd);
+		cdclk_ref = igt_get_current_cdclk(data->drm_fd);
 		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		if (ret != -EINVAL) {
 			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-			cdclk_new = get_current_cdclk_freq(debugfs_fd);
+			cdclk_new = igt_get_current_cdclk(data->drm_fd);
 			igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 			/* cdclk should bump */
@@ -221,7 +191,6 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	int debugfs_fd = data->debugfs_fd;
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
@@ -251,13 +220,13 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_output_override_mode(output, mode_lo);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
+	cdclk_ref = igt_get_current_cdclk(data->drm_fd);
 
 	/* switch to higher resolution */
 	igt_output_override_mode(output, mode_hi);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	cdclk_new = get_current_cdclk_freq(debugfs_fd);
+	cdclk_new = igt_get_current_cdclk(data->drm_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
@@ -272,7 +241,6 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int debugfs_fd = data->debugfs_fd;
 	drmModeModeInfo *mode, *mode_hi, *mode_lo;
 	igt_output_t *output;
 	int valid_outputs = 0;
@@ -330,7 +298,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
-	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
+	cdclk_ref = igt_get_current_cdclk(data->drm_fd);
 
 	j = 0;
 	for_each_connected_output(display, output) {
@@ -354,7 +322,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
-	cdclk_new = get_current_cdclk_freq(debugfs_fd);
+	cdclk_new = igt_get_current_cdclk(data->drm_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
 
 	/* cdclk should bump */
@@ -394,8 +362,6 @@ igt_main
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		igt_require(data.drm_fd >= 0);
-		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
-		igt_require(data.debugfs_fd);
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_require_f(hardware_supported(&data),
-- 
2.25.1

