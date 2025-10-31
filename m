Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C7ACCF9EB
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:59:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAE510EABC;
	Fri, 31 Oct 2025 07:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cZ2r/dux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C885510EABC
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897539; x=1793433539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DdVX4J01yKJ2vf9oq4TRnQByHXBl7ECxSl+QsGwNxKk=;
 b=cZ2r/duxR9hBb07bSZLWXt8rcIvP1jEL69ejoHLsJOG4vIktL+U44BAe
 DhFSP4BHQgiFAFN5eyABWfYpiULDdjHki3kKjC0fg0TN1wSPkfoNAC0Lu
 xwRQ4iYZ7ckFp60evDBSE2ob+gYmAuA1+k4BpvYPr4unWeMeQi2/m1gce
 c+/hA2Cmxc7oQw5rk3N+CgG3PpJmW3hOUdttieJ1bSSlXmVTJdZPs8Gwc
 NMWmYhuvS6WtDaRyl2LitJxNeWxCe7oxJYchqxqwQDztReIpjK5DmvvBI
 C9NXYImbx7BcadGs7E+jm6N1Pfm6FR8FI4Jnsojyh3IbicCqbXQPpktjh A==;
X-CSE-ConnectionGUID: 5/N4zTUXRbmewRr8S9AwDg==
X-CSE-MsgGUID: fMxaIw6rQOiJUPahMarFFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75169880"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75169880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:58:58 -0700
X-CSE-ConnectionGUID: siXINRdiShaIC2fTvK/rkg==
X-CSE-MsgGUID: 7Qkef+ZGSNq/0BVtQyPsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287327"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:58:57 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v11 03/10] tests/kms_sharpness_filter: Add adaptive sharpness basic
 filter tests
Date: Fri, 31 Oct 2025 13:35:27 +0530
Message-Id: <20251031080534.880321-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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

Add new test to validate adaptive sharpness filter on LNL platform.
Add various test cases to validate this feature. Mark these as
non-CRC based tests requiring manual verification.

Pipe scaler is repurposed to perform a portion of this work.
This means pipe scaling will be disabled while the sharpening
function is in use. Use the other scaler for plane scaling.

Add 5 subtests:
	-basic: verify basic functionality
	-modifiers: verify casf with different modifiers
	-rotation: verify casf with different rotation
	-formats: verify casf with different formats
	-strength: vary strength and check difference in sharpness

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
v8: -Optimize tap-filter subtest (Ankit)
v9: -Logically split tests (Ankit)
    -Fix alignment (Ankit)
v10: -Use imperative mood for commit message (Ankit)
     -Fix condition for rotation test (Ankit)
     -Change iterator from k to i (Ankit)
v11: -Update documenattion

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 343 +++++++++++++++++++++++++++++++++++
 tests/meson.build            |   1 +
 2 files changed, 344 insertions(+)
 create mode 100644 tests/kms_sharpness_filter.c

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
new file mode 100644
index 000000000..1c8f0b5ce
--- /dev/null
+++ b/tests/kms_sharpness_filter.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms sharpness filter
+ * Category: Display
+ * Description: Test to validate content adaptive sharpness filter
+ * Driver requirement: xe
+ * Mega feature: General Display Features
+ */
+
+#include "igt.h"
+#include "igt_kms.h"
+
+/**
+ * SUBTEST: filter-basic
+ * Description: Verify basic content adaptive sharpness filter.
+ *
+ * SUBTEST: filter-strength
+ * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
+ *
+ * SUBTEST: filter-modifiers
+ * Description: Verify content adaptive sharpness filter with varying modifiers.
+ *
+ * SUBTEST: filter-rotations
+ * Description: Verify content adaptive sharpness filter with varying rotations.
+ *
+ * SUBTEST: filter-formats
+ * Description: Verify content adaptive sharpness filter with varying formats.
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
+#define MIN_FILTER_STRENGTH		1
+#define MID_FILTER_STRENGTH		128
+#define MAX_FILTER_STRENGTH		255
+
+enum test_type {
+	TEST_FILTER_BASIC,
+	TEST_FILTER_MODIFIERS,
+	TEST_FILTER_ROTATION,
+	TEST_FILTER_FORMATS,
+	TEST_FILTER_STRENGTH,
+};
+
+const int filter_strength_list[] = {
+	MIN_FILTER_STRENGTH,
+	(MIN_FILTER_STRENGTH + MID_FILTER_STRENGTH) / 2,
+	MID_FILTER_STRENGTH,
+	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
+	MAX_FILTER_STRENGTH,
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
+	uint64_t modifier;
+	const char *modifier_name;
+	uint32_t format;
+	igt_rotation_t rotation;
+} data_t;
+
+static void set_filter_strength_on_pipe(data_t *data)
+{
+	igt_pipe_set_prop_value(&data->display, data->pipe_id,
+				IGT_CRTC_SHARPNESS_STRENGTH,
+				data->filter_strength);
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
+static void test_sharpness_filter(data_t *data,  enum test_type type)
+{
+	drmModeModeInfo *mode = data->mode;
+	int height = mode->hdisplay;
+	int width =  mode->vdisplay;
+	int ret;
+
+	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
+		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+
+	setup_fb(data->drm_fd, height, width, data->format, data->modifier, &data->fb[0]);
+	igt_plane_set_fb(data->plane[0], &data->fb[0]);
+
+	if (type == TEST_FILTER_ROTATION) {
+		if (igt_plane_has_rotation(data->plane[0], data->rotation))
+			igt_plane_set_rotation(data->plane[0], data->rotation);
+		else
+			igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
+	}
+
+	set_filter_strength_on_pipe(data);
+
+	if (data->filter_strength != 0)
+		igt_debug("Sharpened image should be observed for filter strength > 0\n");
+
+	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_assert_eq(ret, 0);
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
+	for_each_connected_output(display, output) {
+		for_each_pipe(display, pipe) {
+			igt_display_reset(display);
+
+			data->output = output;
+			data->pipe_id = pipe;
+			data->pipe = &display->pipes[data->pipe_id];
+			data->mode = igt_output_get_mode(data->output);
+
+			if (!has_sharpness_filter(data->pipe)) {
+				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
+				kmstest_pipe_name(data->pipe_id));
+				continue;
+			}
+
+			igt_output_set_pipe(data->output, data->pipe_id);
+
+			if (!intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(data->output, PIPE_NONE);
+				continue;
+			}
+
+			switch (type) {
+			case TEST_FILTER_BASIC:
+				snprintf(name, sizeof(name), "-basic");
+				break;
+			case TEST_FILTER_MODIFIERS:
+				snprintf(name, sizeof(name), "-%s", data->modifier_name);
+				break;
+			case TEST_FILTER_ROTATION:
+				snprintf(name, sizeof(name), "-%srot", igt_plane_rotation_name(data->rotation));
+				break;
+			case TEST_FILTER_FORMATS:
+				snprintf(name, sizeof(name), "-%s", igt_format_str(data->format));
+				break;
+			case TEST_FILTER_STRENGTH:
+				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
+				break;
+			default:
+				igt_assert(0);
+			}
+
+			igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe_id), data->output->name, name)
+				test_sharpness_filter(data, type);
+
+			if (data->limited)
+				break;
+		}
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
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
+	}
+
+	igt_describe("Verify that varying strength(0-255), affects "
+		     "the degree of sharpeness applied.");
+	igt_subtest_with_dynamic("filter-strength") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+
+		for (int i = 0; i < ARRAY_SIZE(filter_strength_list); i++) {
+			data.filter_strength = filter_strength_list[i];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter with "
+		     "varying modifiers.");
+	igt_subtest_with_dynamic("filter-modifiers") {
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+			data.modifier = modifiers[i].modifier;
+			data.modifier_name = modifiers[i].name;
+
+			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter with "
+		     "varying rotations.");
+	igt_subtest_with_dynamic("filter-rotations") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
+			data.rotation = rotations[i];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
+		}
+	}
+
+	igt_describe("Verify content adaptive sharpness filter with "
+		     "varying formats.");
+	igt_subtest_with_dynamic("filter-formats") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
+			data.format = formats[i];
+
+			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 73edd3e71..8204aac5c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -62,6 +62,7 @@ test_progs = [
 	'kms_sequence',
 	'kms_setmode',
 	'kms_sysfs_edid_timing',
+	'kms_sharpness_filter',
 	'kms_tiled_display',
 	'kms_tv_load_detect',
 	'kms_universal_plane',
-- 
2.25.1

