Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD313D3DEAC
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 19:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDE410E975;
	Fri, 18 Oct 2024 19:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJi09lwC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8CC10E975
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729278229; x=1760814229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7XQ812YNB6L1JMB4pcb1XTO7g3FMDVSn53AtjTTRPlE=;
 b=SJi09lwCOJxJw/BbWdQ14FGI7/PI5kA6hQwFbNal0ZYbjI/Pt09brCk5
 +wJORvN4HPizjyx75NjmhgMP7ZghjICYCnroJpIMOcyEAvlu0AMvnBsYE
 WN49Zrf1IgpRIvsz1gwSB5lX5Aq16+LGU7YaNa3qNestPO+prRWlqxymC
 3Msq8H2LiwBtNVFDMCRi1O6GXcIkhtdgMne6mWq5LtzLNlVZsSd1XXHim
 jgbY7oGftalf2VxDyJu2ic3x5hwL9sh2kX/0xCH8uIjddKDaQRfVY8luW
 ZWIiLTb8g0ayz1YJc/5UL+o/i+PwO05uEqUgf9/DNRDU1gxK7smfKor6Z A==;
X-CSE-ConnectionGUID: jpnkiYZlTeKraT25iZvVpQ==
X-CSE-MsgGUID: FbrOccYZQraSwJ5TwTQgYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40218786"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="40218786"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 12:03:49 -0700
X-CSE-ConnectionGUID: TivxAQzBTTC5RVXGUDf8pw==
X-CSE-MsgGUID: WmKzmK9qS7ub4Ph/bsT2gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="102247823"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:03:47 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v7 3/4] tests/kms_sharpness_filter: Add adaptive
 sharpness filter test
Date: Sat, 19 Oct 2024 00:36:26 +0530
Message-Id: <20241018190627.1367970-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241018190627.1367970-1-swati2.sharma@intel.com>
References: <20241018190627.1367970-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

New test is added to validate adaptive sharpness filter on
LNL platform. Various testcases are added to validate this
feature. These are non CRC based tests and manual verification
is required.

Pipe scaler is repurposed to perform a portion of this work.
This means pipe scaling will be unavailable while the sharpening
function is being used. The other scaler can be used for plane
scaler.

15 subtests are added:
	-basic: verify basic functionality
	-toggle: switch between enable and disable
	-tap: verify different taps selected based on resolution
	-modifiers: verify casf with different modifiers
	-rotation: verify casf with different rotation
	-formats: verify casf with different formats
	-dpms: verify casf with dpms
	-suspend: verify casf with suspend
	-upscale: apply plane scaler and casf together
	-downscale: apply plane scaler and casf together
	-strength: vary strength and check difference in sharpness
	-invalid filter with scaler: enable scaler on 2 planes and attempt
				     is made to enable casf
	-invalid filter with plane: enable 2 NV12 planes and attempt
				    is made to enable casf
	-invalid plane with filter: enable 1 NV12 plane and casf and attempt
				    is made to enable 2nd NV12 plane
	-invalid filter with scaling mode: enable scaling_mode property and attempt
					   is made to enable casf

TODO: -Enable casf with varying output formats (YCBCR/RGB)

v2: -Updated modifier type to uint64_t.
    -Replaced IGT_CRTC_SHARPENESS_STRENGTH with IGT_CRTC_SHARPNESS_STRENGTH.
v3: -Updated setup_fb with height and width.
v4: -Renamed tests/intel/kms_sharpness_filter.c -> tests/kms_sharpness_filter.c (Ankit)
    -Added subtest invalid filter with connector. (Ankit)
    -Updated documentation. (Bhanu)
    -Used driver_close_driver instead close. (Bhanu)
    -Added check to avoid debug print for invalid tests and filter strength = 0. (Ankit)
v5: -Instead of using default strength as MAX, use MID value strength.
    -Add relevant debug print for test skip.
    -Fix indentation.
    -Renamed invalid-filter-with-connector -> invalid-filter-with-scaling-mode
    -Reworked on invalid-filter-with-scaling-mode(), added provision to
     validate other scaling modes.
v6: -Skip test if ret=-EINVAL for downscaling test.
    -Change if() for tap subtest.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_sharpness_filter.c | 750 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 2 files changed, 751 insertions(+)
 create mode 100644 tests/kms_sharpness_filter.c

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
new file mode 100644
index 000000000..5640b40d2
--- /dev/null
+++ b/tests/kms_sharpness_filter.c
@@ -0,0 +1,750 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+/**
+ * TEST: kms sharpness filter
+ * Category: Display
+ * Description: Test to validate content adaptive sharpness filter
+ * Driver requirement: xe
+ * Functionality: casf
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+
+/**
+ * SUBTEST: filter-basic
+ * Description: Verify basic content adaptive sharpness filter.
+ *
+ * SUBTEST: filter-tap
+ * Description: Verify that following a resolution change, distict taps are selected.
+ *
+ * SUBTEST: filter-strength
+ * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
+ *
+ * SUBTEST: filter-toggle
+ * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
+ *
+ * SUBTEST: filter-modifiers
+ * Description: Verify content adaptive sharpness filter with varying modifiers.
+ * Functionality: casf, tiling
+ *
+ * SUBTEST: filter-rotations
+ * Description: Verify content adaptive sharpness filter with varying rotations.
+ * Functionality: casf, rotation
+ *
+ * SUBTEST: filter-formats
+ * Description: Verify content adaptive sharpness filter with varying formats.
+ * Functionality: casf, pixel-format
+ *
+ * SUBTEST: filter-dpms
+ * Description: Verify content adaptive sharpness filter with DPMS.
+ * Functionality: casf, dpms
+ *
+ * SUBTEST: filter-suspend
+ * Description: Verify content adaptive sharpness filter with suspend.
+ * Functionality: casf, suspend
+ *
+ * SUBTEST: filter-scaler-upscale
+ * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
+ * Functionality: casf, scaling
+ *
+ * SUBTEST: filter-scaler-downscale
+ * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
+ * Functionality: casf, scaling
+ *
+ * SUBTEST: invalid-filter-with-scaler
+ * Description: Negative check for content adaptive sharpness filter
+ * 		when 2 plane scalers have already been enabled and
+ * 		attempt is made to enable sharpness filter.
+ * Functionality: casf, scaling
+ *
+ * SUBTEST: invalid-filter-with-plane
+ * Description: Negative check for content adaptive sharpness filter
+ * 		when 2 NV12 planes have already been enabled and attempt is
+ * 		made to enable the sharpness filter.
+ * Functionality: casf, plane
+ *
+ * SUBTEST: invalid-plane-with-filter
+ * Description: Negative check for content adaptive sharpness filter
+ * 		when 1 NV12 plane and sharpness filter have already been enabled
+ * 		and attempt is made to enable the second NV12 plane.
+ * Functionality: casf, plane
+ *
+ * SUBTEST: invalid-filter-with-scaling-mode
+ * Description: Negative check for content adaptive sharpness filter
+ *              when scaling mode is already enabled and attempt is made to enable
+ *              sharpness filter.
+ * Functionality: casf, scaling
+*/
+
+IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
+
+/*
+ * Until the CRC support is added test needs to be invoked with
+ * --interactive|--i to manually verify if "sharpened" image
+ * is seen without corruption for each subtest.
+ */
+
+#define TAP_3				3
+#define TAP_5				5
+#define TAP_7				7
+#define DISABLE_FILTER			0
+#define MIN_FILTER_STRENGTH		1
+#define MID_FILTER_STRENGTH		128
+#define MAX_FILTER_STRENGTH		255
+#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
+#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
+#define NROUNDS				10
+#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
+		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
+		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
+		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
+#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
+		||  (type == TEST_FILTER_DOWNSCALE) \
+		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
+		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
+		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
+
+enum test_type {
+	TEST_FILTER_TAP,
+	TEST_FILTER_BASIC,
+	TEST_FILTER_TOGGLE,
+	TEST_FILTER_MODIFIERS,
+	TEST_FILTER_ROTATION,
+	TEST_FILTER_FORMATS,
+	TEST_FILTER_DPMS,
+	TEST_FILTER_SUSPEND,
+	TEST_FILTER_UPSCALE,
+	TEST_FILTER_DOWNSCALE,
+	TEST_FILTER_STRENGTH,
+	TEST_INVALID_FILTER_WITH_SCALER,
+	TEST_INVALID_FILTER_WITH_PLANE,
+	TEST_INVALID_PLANE_WITH_FILTER,
+	TEST_INVALID_FILTER_WITH_SCALING_MODE,
+};
+
+const int filter_strength_list[] = {
+	MIN_FILTER_STRENGTH,
+	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
+	MID_FILTER_STRENGTH,
+	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
+	MAX_FILTER_STRENGTH,
+};
+const int filter_tap_list[] = {
+	TAP_3,
+	TAP_5,
+	TAP_7,
+};
+static const struct {
+	uint64_t modifier;
+	const char *name;
+} modifiers[] = {
+	{ DRM_FORMAT_MOD_LINEAR, "linear", },
+	{ I915_FORMAT_MOD_X_TILED, "x-tiled", },
+	{ I915_FORMAT_MOD_4_TILED, "4-tiled", },
+};
+static const int formats[] = {
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR16161616F,
+};
+static const igt_rotation_t rotations[] = {
+	IGT_ROTATION_0,
+	IGT_ROTATION_180,
+};
+static const uint32_t scaling_modes[] = {
+	DRM_MODE_SCALE_FULLSCREEN,
+	DRM_MODE_SCALE_CENTER,
+	DRM_MODE_SCALE_ASPECT,
+};
+
+typedef struct {
+	int drm_fd;
+	bool limited;
+	enum pipe pipe_id;
+	struct igt_fb fb[4];
+	igt_pipe_t *pipe;
+	igt_display_t display;
+	igt_output_t *output;
+	igt_plane_t *plane[4];
+	drmModeModeInfo *mode;
+	int filter_strength;
+	int filter_tap;
+	uint64_t modifier;
+	const char *modifier_name;
+	uint32_t format;
+	igt_rotation_t rotation;
+	uint32_t scaling_mode;
+} data_t;
+
+static void set_filter_strength_on_pipe(data_t *data)
+{
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,
+				IGT_CRTC_SHARPNESS_STRENGTH,
+				data->filter_strength);
+}
+
+static bool has_scaling_mode(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_SCALING_MODE);
+}
+
+static drmModeModeInfo *get_mode(igt_output_t *output, int tap)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *mode = NULL;
+	uint64_t total_pixels = 0;
+
+	/*
+	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
+	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
+	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
+	 */
+	switch (tap) {
+	case TAP_3:
+		for (int i = 0; i < connector->count_modes; i++) {
+			total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
+
+			if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER) {
+				mode = &connector->modes[i];
+				break;
+			}
+		}
+		break;
+	case TAP_5:
+		for (int i = 0; i < connector->count_modes; i++) {
+			total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
+
+			if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
+			    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER) {
+				mode = &connector->modes[i];
+				break;
+			}
+		}
+		break;
+	case TAP_7:
+		for (int i = 0; i < connector->count_modes; i++) {
+			total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
+
+			if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER) {
+				mode = &connector->modes[i];
+				break;
+			}
+		}
+		break;
+	default:
+		igt_assert(0);
+	}
+
+	return mode;
+}
+
+static void paint_image(igt_fb_t *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+	int img_x, img_y, img_w, img_h;
+	const char *file = "1080p-left.png";
+
+	img_x = img_y = 0;
+	img_w = fb->width;
+	img_h = fb->height;
+
+	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
+
+	igt_put_cairo_ctx(cr);
+}
+
+static void setup_fb(int fd, int width, int height, uint32_t format,
+		     uint64_t modifier, struct igt_fb *fb)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
+	igt_assert(fb_id);
+
+	paint_image(fb);
+}
+
+static void cleanup_fbs(data_t *data)
+{
+	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
+		igt_remove_fb(data->drm_fd, &data->fb[i]);
+}
+
+static void cleanup(data_t *data)
+{
+	igt_display_reset(&data->display);
+
+	cleanup_fbs(data);
+}
+
+static void set_planes(data_t *data, enum test_type type)
+{
+	int ret;
+	drmModeModeInfo *mode = data->mode;
+	igt_output_t *output = data->output;
+
+	data->plane[1] = igt_output_get_plane(output, 1);
+	data->plane[2] = igt_output_get_plane(output, 2);
+
+	if (type == TEST_FILTER_UPSCALE) {
+		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
+	}
+
+	if (type == TEST_FILTER_DOWNSCALE) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
+	}
+
+	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
+		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
+		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_fb(data->plane[2], &data->fb[2]);
+		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
+	}
+
+	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_fb(data->plane[2], &data->fb[2]);
+	}
+
+	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+	}
+
+	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		setup_fb(data->drm_fd, 640, 480, data->format, data->modifier, &data->fb[2]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_fb(data->plane[2], &data->fb[2]);
+
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_assert_eq(ret, 0);
+
+		mode->hdisplay = 640;
+		mode->vdisplay = 480;
+
+		igt_output_override_mode(data->output, mode);
+		igt_plane_set_fb(data->plane[2], NULL);
+		igt_plane_set_fb(data->plane[1], &data->fb[2]);
+
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_SCALING_MODE, data->scaling_mode);
+	}
+}
+
+static void test_sharpness_filter(data_t *data,  enum test_type type)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
+	int height = mode->hdisplay;
+	int width =  mode->vdisplay;
+	int ret;
+
+	igt_display_reset(&data->display);
+	igt_output_set_pipe(output, data->pipe_id);
+
+	if (type == TEST_FILTER_TAP) {
+		mode = get_mode(output, data->filter_tap);
+		igt_require(mode != NULL);
+		igt_output_override_mode(output, mode);
+	}
+
+	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
+		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+
+	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
+	igt_plane_set_fb(data->plane[0], &data->fb[0]);
+
+	if (igt_plane_has_rotation(data->plane[0], data->rotation))
+		igt_plane_set_rotation(data->plane[0], data->rotation);
+	else
+		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+
+	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
+		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
+
+	if (SET_PLANES)
+		set_planes(data, type);
+
+	/* Set filter strength property */
+	set_filter_strength_on_pipe(data);
+
+	if (!INVALID_TEST && data->filter_strength != 0)
+		igt_debug("Sharpened image should be observed for filter strength > 0\n");
+
+	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
+		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
+	else
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+
+	if (type == TEST_FILTER_DPMS) {
+		kmstest_set_connector_dpms(data->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->drm_fd,
+					   output->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+
+	if (type == TEST_FILTER_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+
+	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
+		data->plane[3] = igt_output_get_plane(data->output, 3);
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
+		igt_plane_set_fb(data->plane[3], &data->fb[3]);
+
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	if (type == TEST_FILTER_DOWNSCALE)
+		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+			      "Scaling op not supported, cdclk limits might be exceeded.\n");
+
+	if (INVALID_TEST)
+		igt_assert_eq(ret, -EINVAL);
+	else
+		igt_assert_eq(ret, 0);
+
+	cleanup(data);
+}
+
+static bool has_sharpness_filter(igt_pipe_t *pipe)
+{
+	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
+}
+
+static void
+run_sharpness_filter_test(data_t *data, enum test_type type)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	enum pipe pipe;
+	char name[40];
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
+		data->output = output;
+		data->pipe_id = pipe;
+		data->pipe = &display->pipes[data->pipe_id];
+		data->mode = igt_output_get_mode(data->output);
+
+		if (!has_sharpness_filter(data->pipe)) {
+			igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
+			kmstest_pipe_name(pipe));
+			continue;
+		}
+
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
+		switch (type) {
+		case TEST_FILTER_BASIC:
+			snprintf(name, sizeof(name), "-basic");
+			break;
+		case TEST_FILTER_TAP:
+			snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
+			break;
+		case TEST_FILTER_TOGGLE:
+			snprintf(name, sizeof(name), "-toggle");
+			break;
+		case TEST_FILTER_MODIFIERS:
+			snprintf(name, sizeof(name), "-%s", data->modifier_name);
+			break;
+		case TEST_FILTER_ROTATION:
+			snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
+			break;
+		case TEST_FILTER_FORMATS:
+			snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
+			break;
+		case TEST_FILTER_DPMS:
+			snprintf(name, sizeof(name), "-dpms");
+			break;
+		case TEST_FILTER_SUSPEND:
+			snprintf(name, sizeof(name), "-suspend");
+			break;
+		case TEST_FILTER_UPSCALE:
+			snprintf(name, sizeof(name), "-upscale");
+			break;
+		case TEST_FILTER_DOWNSCALE:
+			snprintf(name, sizeof(name), "-downscale");
+			break;
+		case TEST_INVALID_FILTER_WITH_SCALER:
+			snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
+			break;
+		case TEST_INVALID_FILTER_WITH_PLANE:
+			snprintf(name, sizeof(name), "-invalid-filter-with-plane");
+			break;
+		case TEST_INVALID_PLANE_WITH_FILTER:
+			snprintf(name, sizeof(name), "-invalid-plane-with-filter");
+			break;
+		case TEST_FILTER_STRENGTH:
+			snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
+			break;
+		case TEST_INVALID_FILTER_WITH_SCALING_MODE:
+			snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
+			break;
+		default:
+			igt_assert(0);
+		}
+
+		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
+			test_sharpness_filter(data, type);
+
+		if (data->limited)
+			break;
+	}
+}
+
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'l':
+		data->limited = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const char help_str[] =
+	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
+
+data_t data = {};
+
+igt_main_args("l", NULL, help_str, opt_handler, &data)
+{
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Verify basic content adaptive sharpness filter.");
+	igt_subtest_with_dynamic("filter-basic") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
+		}
+
+	igt_describe("Verify that following a resolution change, "
+		     "distict taps are selected.");
+	igt_subtest_with_dynamic("filter-tap") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int k = 0; k < ARRAY_SIZE(filter_tap_list); k++) {
+			data.filter_tap = filter_tap_list[k];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_TAP);
+		}
+	}
+
+	igt_describe("Verify that varying strength(0-255), affects "
+		     "the degree of sharpeness applied.");
+	igt_subtest_with_dynamic("filter-strength") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+
+		for (int k = 0; k < ARRAY_SIZE(filter_strength_list); k++) {
+			data.filter_strength = filter_strength_list[k];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
+		}
+	}
+
+	igt_describe("Verify toggling between enabling and disabling "
+		     "content adaptive sharpness filter.");
+	igt_subtest_with_dynamic("filter-toggle") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+
+		for (int k = 0; k < NROUNDS; k++) {
+			data.filter_strength = DISABLE_FILTER;
+			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
+			data.filter_strength = MAX_FILTER_STRENGTH;
+			run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter with "
+		     "varying modifiers.");
+	igt_subtest_with_dynamic("filter-modifiers") {
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int k = 0; k < ARRAY_SIZE(modifiers); k++) {
+			data.modifier = modifiers[k].modifier;
+			data.modifier_name = modifiers[k].name;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter with "
+		     "varying rotations.");
+	igt_subtest_with_dynamic("filter-rotations") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int k = 0; k < ARRAY_SIZE(rotations); k++) {
+			data.rotation = rotations[k];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter with "
+		     "varying formats.");
+	igt_subtest_with_dynamic("filter-formats") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int k = 0; k < ARRAY_SIZE(formats); k++) {
+			data.format = formats[k];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with DPMS.");
+	igt_subtest_with_dynamic("filter-dpms") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
+		}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with suspend.");
+	igt_subtest_with_dynamic("filter-suspend") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
+		}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with 1 plane scaler enabled.");
+	igt_subtest_with_dynamic("filter-scaler-upscale") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
+		}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with 1 plane scaler enabled.");
+	igt_subtest_with_dynamic("filter-scaler-downscale") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
+		}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when 2 plane scalers have already been enabled and "
+		     "attempt is made to enable sharpness filter.");
+	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
+		}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when 2 NV12 planes have already been enabled and attempt is "
+		     "made to enable the sharpness filter.");
+	igt_subtest_with_dynamic("invalid-filter-with-plane") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_NV12;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
+		}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when 1 NV12 plane and sharpness filter have already been enabled "
+		     "and attempt is made to enable the second NV12 plane.");
+	igt_subtest_with_dynamic("invalid-plane-with-filter") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_NV12;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
+		}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when scaling mode is already enabled and attempt is made "
+		     "to enable sharpness filter.");
+	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
+			data.modifier = DRM_FORMAT_MOD_LINEAR;
+			data.rotation = IGT_ROTATION_0;
+			data.format = DRM_FORMAT_XRGB8888;
+			data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
+			data.scaling_mode = scaling_modes[k];
+
+			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index e5d8852f3..7f5bc68d3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -58,6 +58,7 @@ test_progs = [
 	'kms_sequence',
 	'kms_setmode',
 	'kms_sysfs_edid_timing',
+	'kms_sharpness_filter',
 	'kms_tiled_display',
 	'kms_tv_load_detect',
 	'kms_universal_plane',
-- 
2.25.1

