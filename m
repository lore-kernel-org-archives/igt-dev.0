Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F110C0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 11:03:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15B410EA58;
	Thu, 13 Feb 2025 11:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e8lJ3kgz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCC4F10EA58
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 11:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444631; x=1770980631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfyfjO+eKpxiP96b0T6PHzkO3p0J/yFRbbs1ndbPEw4=;
 b=e8lJ3kgzhGIHddkLzDqhTIse0tzfU7zV3thvKv5DuPDTFTj2yzlKLE1K
 ZU66ImUX3J9c+wWVmvkbv62mC0jAFhj3h7l7geDMTZbo/3pbxsKSGVI8C
 3KOmTZaFL6NhndCW9hFv7dsSN1a8ydRAPaqDb90aZHdGKzgeEcj4ZkF2V
 1GAlYT5kgpjye9zBrY7oSxXeKrIdK3xuyRG7C/GrjxHQd5s5SODfv7kBH
 Kddc2EMOfSGynUdaUiYmOdKF0yP9X/LYEc+OEMKoQNxRk+JXe33BS3ihZ
 +wOCT/5DYBZkTKbNVmHL+X2cbZRlCyDHwJKQDMOHFQi3Y3sHz0uW1YEdR g==;
X-CSE-ConnectionGUID: xXhAY8WIQZqkxk02dyY9tg==
X-CSE-MsgGUID: /qAYoEN5Q/yBv4OxbwChaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62609478"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62609478"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:51 -0800
X-CSE-ConnectionGUID: U+Rj7v8IQSC5WsYN0f4RCw==
X-CSE-MsgGUID: PcjVcZmmTFGCVezEtTNUag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113094045"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:48 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t 1/5] lib/igt_kms: Add highres() and lowres() func
Date: Thu, 13 Feb 2025 16:38:10 +0530
Message-Id: <20250213110814.351186-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213110814.351186-1-swati2.sharma@intel.com>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
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

Add functions to return highest and lowest modes in lib, update
relevant binaries.

Addresses two key issues:

1. Remove strict 4K selection and choose the highest mode instead.
Previously, the code always selected 4K, even if an 8K mode was
available. Update this logic to align with cdclk transition requirements
for resolutions above 4K.

2. Optimize mode selection by sorting modes once instead of iterating
through the list multiple times, improving efficiency.

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c             | 34 +++++++++++++++++
 lib/igt_kms.h             |  2 +
 tests/intel/kms_cdclk.c   | 77 +++++++++++++++++----------------------
 tests/intel/kms_dsc.c     | 14 +------
 tests/kms_display_modes.c | 14 +------
 5 files changed, 72 insertions(+), 69 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 90f44b4d3..8220cc0eb 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -4845,6 +4845,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t *output)
 		return &output->config.default_mode;
 }
 
+/**
+ * igt_output_get_highres_mode:
+ * @output: Target output
+ *
+ * Returns: A #drmModeModeInfo struct representing the highest mode, NULL otherwise.
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
+ * Returns: A #drmModeModeInfo struct representing the lowest mode, NULL otherwise.
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
index 8810123fb..5cf0b89d3 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -543,6 +543,8 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
+drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
 void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 382b3e9d1..e78d22e1d 100644
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
+		igt_require_f(mode.hdisplay >= HDISPLAY_4K && mode.vdisplay >= VDISPLAY_4K &&
+			      mode.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
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
+	igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
+		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
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
+		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
+			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
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
+		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
+			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
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

