Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE54BE77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD8A10E57C;
	Mon, 30 Dec 2024 18:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M5zoHKlE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA910E57B
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585093; x=1767121093;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hZFpueLF7m91Mhpve0hAVEb8KPgnybzAhS3sB1coEIw=;
 b=M5zoHKlEamVe8Dgwcpdx/kqigPx/OS/4xVAWPfimSmG4JKO1xKyjD1/q
 O+5d5avDoj+BDgmnxWTLjElqLbURAFNC3hrGsOlbtc9XhsSM28sshqY8r
 50t5G1nYwHQBcLD4ItMnHsrqaeR0Vr/uzk2bSUjTisR22mFm/rD97AQE5
 1Qf4MXP2zSYthCCaYcyVqaaOpX4Vz8TEayY4SfQW7GwfPBgQ5etTdNSjA
 IKpDPNNcYSEMITESttIZpAV0+btxMXUqdMLnjMMiWGraG/6xZokesTsIq
 fPH8qUI9AuM8Eyg8nR3rV2yRLbsl4ZTU46eLHHgxc8DynQWIA6DU/egUk w==;
X-CSE-ConnectionGUID: oyy8P8vOTLCINYJ83Sy6QA==
X-CSE-MsgGUID: s7G5XYJLRQGLTkvJ9Y7ovg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803539"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803539"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:12 -0800
X-CSE-ConnectionGUID: HFEjAVHXRgmkI8mHK6LhAw==
X-CSE-MsgGUID: fvo4+sfiTtiHm+zm11SI7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728910"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:10 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func
Date: Tue, 31 Dec 2024 00:33:10 +0530
Message-Id: <20241230190315.48821-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241230190315.48821-1-swati2.sharma@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
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

Functions returning highest and lowest mode are added to lib.
Corresponding changes are done in relevant binaries.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c             | 34 +++++++++++++++++
 lib/igt_kms.h             |  2 +
 tests/intel/kms_cdclk.c   | 77 +++++++++++++++++----------------------
 tests/intel/kms_dsc.c     | 14 +------
 tests/kms_display_modes.c | 14 +------
 5 files changed, 72 insertions(+), 69 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a67d17c4f..4f2a5ca0f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4851,6 +4851,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t *output)
 		return &output->config.default_mode;
 }
 
+/**
+ * igt_output_get_highres_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the highest mode
+ */
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *highest_mode = NULL;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+	highest_mode = &connector->modes[0];
+
+	return highest_mode;
+}
+
+/**
+ * igt_output_get_lowres_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the lowest mode
+ */
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *lowest_mode = NULL;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
+	lowest_mode = &connector->modes[0];
+
+	return lowest_mode;
+}
+
 /**
  * igt_output_override_mode:
  * @output: Output of which the mode will be overridden
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 1e2a927ab..18c480ce5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -546,6 +546,8 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
 void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 382b3e9d1..f1a019eb7 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -110,24 +110,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 	return data_rate;
 }
 
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-	drmModeModeInfo *highest_mode = NULL;
-	drmModeConnector *connector = output->config.connector;
-	int j;
-
-	for (j = 0; j < connector->count_modes; j++) {
-		if (connector->modes[j].vdisplay == VDISPLAY_4K &&
-		    connector->modes[j].hdisplay == HDISPLAY_4K &&
-		    connector->modes[j].vrefresh == VREFRESH) {
-			highest_mode = &connector->modes[j];
-			break;
-		}
-	}
-
-	return highest_mode;
-}
-
 static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
 {
 	drmModeModeInfo *lowest_mode = NULL;
@@ -172,7 +154,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 	int scaling = 50;
 	int ret;
 	bool test_complete = false;
@@ -182,14 +164,17 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		mode = get_highres_mode(output);
-		igt_require(mode != NULL);
-		igt_output_override_mode(output, mode);
+		mode = *igt_output_get_highres_mode(output);
+		igt_require_f(mode.hdisplay == HDISPLAY_4K && mode.vdisplay == VDISPLAY_4K &&
+			      mode.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+			      igt_output_name(output));
+
+		igt_output_override_mode(output, &mode);
 
 		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_create_color_pattern_fb(display->drm_fd,
-					    mode->hdisplay, mode->vdisplay,
+					    mode.hdisplay, mode.vdisplay,
 					    DRM_FORMAT_XRGB8888,
 					    DRM_FORMAT_MOD_LINEAR,
 					    0.0, 0.0, 0.0, &fb);
@@ -225,18 +210,20 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
-	drmModeModeInfo *mode_hi, *mode_lo, *mode;
+	drmModeModeInfo mode_hi, mode_lo, *mode;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
 	mode = igt_output_get_mode(output);
-	mode_lo = get_lowres_mode(output);
-	mode_hi = get_highres_mode(output);
-	igt_require(mode_hi != NULL);
+	mode_lo = *get_lowres_mode(output);
+	mode_hi = *igt_output_get_highres_mode(output);
+	igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
+		      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+		      igt_output_name(output));
 
-	igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay,
+	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
 		      "Highest and lowest mode resolutions are same; no transition\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -248,13 +235,13 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 				    0.0, 0.0, 0.0, &fb);
 
 	/* switch to lower resolution */
-	igt_output_override_mode(output, mode_lo);
+	igt_output_override_mode(output, &mode_lo);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
 
 	/* switch to higher resolution */
-	igt_output_override_mode(output, mode_hi);
+	igt_output_override_mode(output, &mode_hi);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
@@ -273,7 +260,7 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
-	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	drmModeModeInfo *mode, mode_hi, mode_lo;
 	igt_output_t *output;
 	int valid_outputs = 0;
 	int cdclk_ref, cdclk_new;
@@ -297,11 +284,13 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+		mode_hi = *igt_output_get_highres_mode(output);
+		igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
+			      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+			      igt_output_name(output));
 
 		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, mode_hi);
+		igt_output_override_mode(output, &mode_hi);
 		i++;
 	}
 	igt_require(intel_pipe_output_combo_valid(display));
@@ -320,12 +309,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		mode_lo = get_lowres_mode(output);
+		mode_lo = *get_lowres_mode(output);
 
-		igt_output_override_mode(output, mode_lo);
+		igt_output_override_mode(output, &mode_lo);
 		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
+		igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisplay);
+		igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);
 		i++;
 	}
 
@@ -343,13 +332,15 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+		mode_hi = *igt_output_get_highres_mode(output);
+		igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && mode_hi.vdisplay == VDISPLAY_4K &&
+			      mode_hi.vrefresh == VREFRESH, "4K mode not found on output %s.\n",
+			      igt_output_name(output));
 
-		igt_output_override_mode(output, mode_hi);
+		igt_output_override_mode(output, &mode_hi);
 		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
+		igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisplay);
+		igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);
 		j++;
 	}
 
diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 5508e7a9e..1392e1cd4 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -94,18 +94,6 @@ static inline void manual(const char *expected)
 	igt_debug_interactive_mode_check("all", expected);
 }
 
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-	drmModeConnector *connector = output->config.connector;
-	drmModeModeInfo *highest_mode = NULL;
-
-	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
-
-	highest_mode = &connector->modes[0];
-
-	return highest_mode;
-}
-
 static drmModeModeInfo *get_next_mode(igt_output_t *output, int index)
 {
 	drmModeConnector *connector = output->config.connector;
@@ -184,7 +172,7 @@ static void update_display(data_t *data, uint32_t test_type)
 	igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
 		    DRM_FORMAT_MOD_LINEAR));
 
-	mode = get_highres_mode(output);
+	mode = igt_output_get_highres_mode(output);
 
 	do {
 		if (data->output_format != DSC_FORMAT_RGB && index > 0)
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e41c60cc0..6ea44944a 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -60,18 +60,6 @@ typedef struct {
 	int n_pipes;
 } data_t;
 
-/* Get higher mode supported by panel. */
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
-{
-	drmModeConnector *connector = output->config.connector;
-	drmModeModeInfo *highest_mode = NULL;
-
-	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
-	highest_mode = &connector->modes[0];
-
-	return highest_mode;
-}
-
 /* Get the 4k or less then 4k mode of connected panel. */
 static drmModeModeInfo *get_mode(igt_output_t *output)
 {
@@ -344,7 +332,7 @@ igt_main
 		igt_require_f(dp_mst_outputs > 1, "MST not found more then one\n");
 
 		memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
-		memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[1]),
+		memcpy(&data.mode_mst[1], igt_output_get_highres_mode(data.mst_output[1]),
 				sizeof(drmModeModeInfo));
 		igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
 			       data.mode_mst[1].vdisplay >= VDISPLAY_4K), "4k panel not found\n");
-- 
2.25.1

