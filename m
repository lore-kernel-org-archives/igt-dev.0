Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C86C021AA
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 21:30:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED3610E5E6;
	Mon, 17 Feb 2025 21:30:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZW8VnXyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9E10E5E6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 21:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739827819; x=1771363819;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ypJmjCNePvz/nmjgRAWSUSmaGXPlLhsBtRo7pTxznQ0=;
 b=ZW8VnXyB9fWPQT0tBbTVypiv4JmzmZz879f3llSXmb4q9vHPPcKtkztP
 9EuLoWBjJJtXKtkbj8OuBlCvE5eLNfI7UfUDWpCFoSmx4pAZ5iYv3DX/W
 T9ZGaq8TuXs/+VoVOO49l57HXoJNJCYE4xCKnz89g2VsCQdb8dTI56uvd
 fCk5X2bXiS229zyJYCeWt5XVkoiZRqPZKLaiO4k8MaFsuX/E9/UvAi4Ey
 AQjefs/+NCvYbh8pL+a8o6jP1ZbwHdc4yVK7Eayc3lp96jqMl+fPjV2Tk
 2nf/N8Xwr9AmmU9yUC87p9QoOMw+7gEpJyywsKuBpSfPuqe8KjT/HPTjT A==;
X-CSE-ConnectionGUID: od3xHCYrRHiXT7ULup4LoA==
X-CSE-MsgGUID: ttRVrgT/TsOtsjzmzQmiJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39750687"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="39750687"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:19 -0800
X-CSE-ConnectionGUID: dcm26NHLRZCvA9amHDTAQA==
X-CSE-MsgGUID: I72U1N21QAWnnM++AbwwZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="114411210"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 13:30:17 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t 2/5] lib/igt_kms: Add highres() and lowres() func
Date: Tue, 18 Feb 2025 03:05:28 +0530
Message-Id: <20250217213531.402162-3-swati2.sharma@intel.com>
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

Add functions to return highest and lowest modes in lib, update
relevant binaries.

Addresses two key issues:

1. Remove strict 4K selection and choose the highest mode instead.
Previously, the code always selected 4K, even if an 8K mode was
available. Update this logic to align with cdclk transition requirements
for resolutions above 4K.

2. Optimize mode selection by sorting modes once instead of iterating
through the list multiple times, improving efficiency.

v2: Add func for skip (Ankit)

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 lib/igt_kms.c             | 34 ++++++++++++++++++
 lib/igt_kms.h             |  2 ++
 tests/intel/kms_cdclk.c   | 73 ++++++++++++++++++---------------------
 tests/intel/kms_dsc.c     | 14 +-------
 tests/kms_display_modes.c | 14 +-------
 5 files changed, 71 insertions(+), 66 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9d49095d5..d7a4bbdfc 100644
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
index d4731af9c..8ec9fec83 100644
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
index b89b2f345..64c95043a 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -81,22 +81,10 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 	return data_rate;
 }
 
-static drmModeModeInfo *get_highres_mode(igt_output_t *output)
+static bool is_4k(drmModeModeInfo mode)
 {
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
+	return (mode.hdisplay >= HDISPLAY_4K && mode.vdisplay >= VDISPLAY_4K &&
+	        mode.vrefresh >= VREFRESH);
 }
 
 static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
@@ -142,7 +130,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
-	drmModeModeInfo *mode;
+	drmModeModeInfo mode;
 	int scaling = 50;
 	int ret;
 	bool test_complete = false;
@@ -152,14 +140,16 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 		igt_display_reset(display);
 
 		igt_output_set_pipe(output, pipe);
-		mode = get_highres_mode(output);
-		igt_require(mode != NULL);
-		igt_output_override_mode(output, mode);
+		mode = *igt_output_get_highres_mode(output);
+		igt_require_f(is_4k(mode), "Mode >= 4K not found on output %s\n",
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
@@ -194,18 +184,19 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
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
+	igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
+	              igt_output_name(output));
 
-	igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay,
+	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
 		      "Highest and lowest mode resolutions are same; no transition\n");
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -217,13 +208,13 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 				    0.0, 0.0, 0.0, &fb);
 
 	/* switch to lower resolution */
-	igt_output_override_mode(output, mode_lo);
+	igt_output_override_mode(output, &mode_lo);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	cdclk_ref = igt_get_current_cdclk(data->drm_fd);
 
 	/* switch to higher resolution */
-	igt_output_override_mode(output, mode_hi);
+	igt_output_override_mode(output, &mode_hi);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	cdclk_new = igt_get_current_cdclk(data->drm_fd);
@@ -241,7 +232,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	drmModeModeInfo *mode, mode_hi, mode_lo;
 	igt_output_t *output;
 	int valid_outputs = 0;
 	int cdclk_ref, cdclk_new;
@@ -265,11 +256,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+		mode_hi = *igt_output_get_highres_mode(output);
+		igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
+			      igt_output_name(output));
 
 		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, mode_hi);
+		igt_output_override_mode(output, &mode_hi);
 		i++;
 	}
 	igt_require(intel_pipe_output_combo_valid(display));
@@ -288,12 +280,12 @@ static void test_mode_transition_on_all_outputs(data_t *data)
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
 
@@ -311,13 +303,14 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+		mode_hi = *igt_output_get_highres_mode(output);
+		igt_require_f(is_4k(mode_hi), "Mode >= 4K not found on output %s\n",
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
index 117f82325..ad0651e4d 100644
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
@@ -346,7 +334,7 @@ igt_main
 		igt_require_f(dp_mst_outputs > 1, "MST not found more then one\n");
 
 		memcpy(&data.mode_mst[0], get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
-		memcpy(&data.mode_mst[1], get_highres_mode(data.mst_output[1]),
+		memcpy(&data.mode_mst[1], igt_output_get_highres_mode(data.mst_output[1]),
 				sizeof(drmModeModeInfo));
 		igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
 			       data.mode_mst[1].vdisplay >= VDISPLAY_4K), "4k panel not found\n");
-- 
2.25.1

