Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB122C48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:22:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2C710E829;
	Wed, 21 Feb 2024 16:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nllOWeLI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE8410E81E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708532565; x=1740068565;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jggx+M99Sa1JB1pl673OQlfUsvBWLGlhHteprU7Ii1A=;
 b=nllOWeLIwl8RAyotIb2ZfaOaVNpYjXarI95dXPOnPmhUP7lLE3tBm5NN
 MSidB+Zh/RsxK2mgkx4OTubf5TnCVRnJWhY0cNI9CTjK0MqEI/f7Shsvr
 o9vjAXyUiPm2f55TOz95UjkIyKNysxoSFogoQLuX9VLlEQjdwfdkb6ft3
 viU3SDwBerDMZsb2NYjjlGK82LeSR7/DsgG7D6DG2/Tpf/64IYqC0O7Af
 oKnjsWBWbAaKnWZh3cZ9gER7/yCWkN1gy46XJaz+JZxjKXvRke6GLKT01
 Ifz6EgUwoAhW4zMlCrYThRbviGJHd9U4eb2YS6XDlAZq+ZHGXloVI2rTR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="6531431"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="6531431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:22:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="827374042"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="827374042"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orsmga001-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 08:22:36 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [RFC][PATCH i-g-t 3/3] tests/kms_sharpness_filter: Add new test
Date: Wed, 21 Feb 2024 21:53:57 +0530
Message-Id: <20240221162357.394355-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221162357.394355-1-swati2.sharma@intel.com>
References: <20240221162357.394355-1-swati2.sharma@intel.com>
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

14 subtests are added:
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

TODO: -Enable casf with pipe scaler enabled
      -Enable casf with varying output formats (YCBCR/RGB)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 666 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 2 files changed, 667 insertions(+)
 create mode 100644 tests/kms_sharpness_filter.c

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
new file mode 100644
index 000000000..25fa19c02
--- /dev/null
+++ b/tests/kms_sharpness_filter.c
@@ -0,0 +1,666 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+
+#define TAP_3				3
+#define TAP_5				5
+#define TAP_7				7
+#define DISABLE_FILTER			0
+#define MIN_FILTER_STRENGTH		1
+#define MID_FILTER_STRENGTH		128
+#define MAX_FILTER_STRENGTH		255
+#define HDISPLAY_4K			3840
+#define VDISPLAY_4K			2160
+#define HDISPLAY_FHD			1920
+#define VDISPLAY_FHD			1080
+#define NROUNDS				10
+
+/**
+ * TEST: kms sharpness filter
+ * Category: Display
+ * Description: Test to validate content adaptive sharpness filter
+ * Driver requirement: xe
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ * Functionality: casf
+ *
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
+ */
+
+IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
+
+/*
+ * Until the CRC support is added test needs to be invoked with
+ * --interactive|--i to manually verify if "sharpened" image
+ * is seen without corruption for each subtest.
+ */
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
+	IGT_ROTATION_90,
+	IGT_ROTATION_180,
+	IGT_ROTATION_270,
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
+} data_t;
+
+static void set_filter_strength_on_pipe(data_t *data)
+{
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,
+				IGT_CRTC_SHARPENESS_STRENGTH,
+				data->filter_strength);
+}
+
+static drmModeModeInfo *get_mode(igt_output_t *output, int tap)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *mode = NULL;
+
+	/*
+	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
+	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
+	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
+	 */
+	switch (tap) {
+	case TAP_3:
+		for (int i = 0; i < connector->count_modes; i++) {
+			if (connector->modes[i].hdisplay <= HDISPLAY_FHD &&
+			    connector->modes[i].vdisplay <= VDISPLAY_FHD) {
+				mode = &connector->modes[i];
+				break;
+			}
+		}
+		break;
+	case TAP_5:
+		for (int i = 0; i < connector->count_modes; i++) {
+			if (connector->modes[i].hdisplay > HDISPLAY_FHD &&
+			    connector->modes[i].hdisplay < HDISPLAY_4K &&
+			    connector->modes[i].vdisplay > VDISPLAY_FHD &&
+			    connector->modes[i].vdisplay < VDISPLAY_4K) {
+				mode = &connector->modes[i];
+				break;
+			}
+		}
+		break;
+	case TAP_7:
+		for (int i = 0; i < connector->count_modes; i++) {
+			if (connector->modes[i].hdisplay >= HDISPLAY_4K &&
+			    connector->modes[i].vdisplay >= VDISPLAY_4K) {
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
+	const char *file = "2160p.png";
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
+		     uint32_t modifier, struct igt_fb *fb)
+{
+	int fb_id;
+
+	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
+	igt_assert(fb_id);
+
+	paint_image(fb);
+}
+
+static void cleanup(data_t *data)
+{
+	for (int i = 0; i < ARRAY_SIZE(data->fb); i++)
+		igt_remove_fb(data->drm_fd, &data->fb[i]);
+
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void set_planes(data_t *data, enum test_type type)
+{
+	drmModeModeInfo *mode = data->mode;
+
+	data->plane[1] = igt_output_get_plane(data->output, 1);
+	data->plane[2] = igt_output_get_plane(data->output, 2);
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
+}
+
+static void test_sharpness_filter(data_t *data,  enum test_type type)
+{
+	igt_output_t *output = data->output;
+	drmModeModeInfo *mode = data->mode;
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
+	setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[0]);
+	igt_plane_set_fb(data->plane[0], &data->fb[0]);
+
+	if (igt_plane_has_rotation(data->plane[0], data->rotation))
+		igt_plane_set_rotation(data->plane[0], data->rotation);
+	else
+		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+
+	if (type == TEST_FILTER_UPSCALE  ||
+	    type == TEST_FILTER_DOWNSCALE ||
+            type == TEST_INVALID_FILTER_WITH_SCALER ||
+            type == TEST_INVALID_FILTER_WITH_PLANE) {
+		set_planes(data, type);
+	}
+
+	/* Set filter strength property */
+	set_filter_strength_on_pipe(data);
+	igt_debug("Sharpened image should be observed for filter strength > 0\n");
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
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
+	if (type == TEST_INVALID_FILTER_WITH_SCALER ||
+	    type == TEST_INVALID_FILTER_WITH_PLANE ||
+	    type == TEST_INVALID_PLANE_WITH_FILTER) {
+		igt_assert_eq(ret, -EINVAL);
+		return;
+	} else {
+		igt_assert_eq(ret, 0);
+	}
+
+	cleanup(data);
+}
+
+static bool has_sharpness_filter(igt_pipe_t *pipe)
+{
+	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPENESS_STRENGTH);
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
+		data->output = output;
+		data->pipe_id = pipe;
+		data->pipe = &display->pipes[data->pipe_id];
+		data->mode = igt_output_get_mode(data->output);
+
+		if (!has_sharpness_filter(data->pipe))
+			continue;
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
+		igt_require(data.drm_fd >= 0);
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
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
+			data.filter_strength = MAX_FILTER_STRENGTH;
+
+			run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
+		}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index d107d16fa..6111f259b 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -57,6 +57,7 @@ test_progs = [
 	'kms_selftest',
 	'kms_sequence',
 	'kms_setmode',
+	'kms_sharpness_filter',
 	'kms_sysfs_edid_timing',
 	'kms_tiled_display',
 	'kms_tv_load_detect',
-- 
2.25.1

