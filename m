Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90298EB7EB2
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 09:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8B610E1BE;
	Wed,  4 Mar 2026 09:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikNzdYiw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAD310E1BE
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772616526; x=1804152526;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=63SwFDgxo5GpcrbuEemWZWxLeJVjRc4t3CmZDlowJUY=;
 b=ikNzdYiwil7W0HzNXRc2aJQ+BoTY1PIzQfUHAPABa7NUHQZnw0+EOvpz
 RinELocKoTP6AWcLOo+mJXFvcz9CuVykhzbQmMVKv2g+fpSLVKZ2Kaamg
 cPWo70Q0R62koqNXefEeKPHoQiiWROzw9paPxK5iR4RtKz/8GqJHV018W
 vG6YChFZHYBoe1Iyd7pfwwvaOce1fB3q3ztwtICwtnmkMXBmguUDJ74Ay
 F7zXLanXG5I1/thMdy0zj0RRls8GGkO7PHj9kAagaLJBQrBfYf8K44HFL
 J1nPgxc3sdJhdiXlUZPNGK35FzvM72nEk9GTKpCLAoC+6IVFQVQp1E/Dc w==;
X-CSE-ConnectionGUID: oIayhuxhTZSJ6E4M2LF+qQ==
X-CSE-MsgGUID: RDMkmp2nSau3v3sqSD/L8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73580531"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="73580531"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 01:28:46 -0800
X-CSE-ConnectionGUID: n3PamX1NTOC+iGI1v9VemA==
X-CSE-MsgGUID: LU6fexhxQViOg+l7/DH29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="218239006"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 01:28:44 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_chamelium_color_pipeline: Add plane color
 pipeline validation
Date: Wed,  4 Mar 2026 15:07:18 +0530
Message-Id: <20260304093718.513512-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add a Chamelium-backed test to validate DRM plane colorops
using frame capture instead of pipe CRC comparison.

The test generates a software reference framebuffer by
applying the expected color transformation in bypass mode.
It then enables the plane color pipeline in hardware,
renders the input framebuffer, and captures the output
signal using Chamelium.

The test passes if the captured frame matches the
software reference framebuffer within the allowed tolerance.

The test fails if the captured frame differs from the
reference, indicating incorrect color transformation,
pipeline misconfiguration, or hardware output mismatch.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 .../chamelium/kms_chamelium_color_pipeline.c  | 401 ++++++++++++++++++
 tests/meson.build                             |   2 +
 2 files changed, 403 insertions(+)
 create mode 100644 tests/chamelium/kms_chamelium_color_pipeline.c

diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
new file mode 100644
index 000000000..19828c5f3
--- /dev/null
+++ b/tests/chamelium/kms_chamelium_color_pipeline.c
@@ -0,0 +1,401 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: kms chamelium color pipeline
+ * Category: Display
+ * Description: Test to validate DRM colorops at plane level using Chamelium to verify instead of CRC
+ * Driver requirement: i915, xe
+ * Mega feature: Color Management
+ */
+
+#include "kms_chamelium_helper.h"
+#include "kms_color_helper.h"
+#include "kms_colorop_helper.h"
+
+#define MAX_COLOROPS	5
+
+/**
+ * SUBTEST: plane-%s
+ * Description: Test plane color pipeline with colorops: %arg[1].
+ *
+ * arg[1]:
+ *
+ * @lut1d:			1D LUT
+ * @lut1d-pre-ctm3x4:		1D LUT PRE CTM 3x4
+ * @lut1d-post-ctm3x4:		1D LUT POST CTM 3x4
+ * @ctm3x4:			3X4 CTM
+ * @lut1d-ctm3x4:		1D LUT --> 3X4 CTM
+ * @ctm3x4-lut1d:		3X4 CTM --> 1D LUT
+ * @lut1d-lut1d:		1D LUT --> 1D LUT
+ * @lut1d-ctm3x4-lut1d:		1D LUT --> 3X4 CTM --> 1D LUT
+ * @lut3d-green-only:		3D LUT
+ */
+
+IGT_TEST_DESCRIPTION("Test DRM colorops at plane level using Chamelium to verify instead of CRC");
+
+static void test_cleanup(data_t *data)
+{
+	igt_output_set_crtc(data->output, NULL);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+static int test_setup(data_t *data, igt_crtc_t *crtc)
+{
+	int i;
+
+	igt_require(crtc);
+	igt_require(crtc->n_planes > 0);
+
+	igt_output_set_crtc(data->output, crtc);
+
+	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+	data->mode = igt_output_get_mode(data->output);
+	igt_require(data->mode);
+
+	/* Disable pipe color props. */
+	disable_ctm(crtc);
+	disable_degamma(crtc);
+	disable_gamma(crtc);
+
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	/* Find matching chamelium port */
+	for (i = 0; i < data->port_count; i++) {
+		if (!strcmp(data->output->name,
+		    chamelium_port_get_name(data->ports[i])))
+		return i;
+	}
+
+	return -1;
+}
+
+static bool ctm_colorop_only(kms_colorop_t *colorops[])
+{
+	int i;
+
+	if (!colorops[0])
+		return false;
+
+	for (i = 0; colorops[i]; i++) {
+		if (colorops[i]->type != KMS_COLOROP_CTM_3X4)
+			return false;
+	}
+
+	return true;
+}
+
+static void _test_plane_colorops(data_t *data,
+				 igt_plane_t *plane,
+				 const color_t *fb_colors,
+				 const color_t *exp_colors,
+				 kms_colorop_t *colorops[],
+				 struct chamelium_port *port)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode = data->mode;
+	igt_colorop_t *color_pipeline;
+	struct igt_fb fb, fbref;
+	struct chamelium_frame_dump *frame;
+	bool ret;
+
+	color_pipeline = get_color_pipeline(display, plane, colorops);
+	igt_skip_on(!color_pipeline);
+
+	/* Create HW framebuffer */
+	igt_assert(igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fb));
+
+	/* Create reference framebuffer */
+	igt_assert(igt_create_fb(data->drm_fd,
+				 mode->hdisplay,
+				 mode->vdisplay,
+				 DRM_FORMAT_XRGB8888,
+				 DRM_FORMAT_MOD_LINEAR,
+				 &fbref));
+
+	/* ---- Software reference ---- */
+	set_color_pipeline_bypass(plane);
+	paint_rectangles(data, mode, exp_colors, &fbref);
+
+	/* ---- Hardware path ---- */
+	set_color_pipeline(display, plane, colorops, color_pipeline);
+
+	if (ctm_colorop_only(colorops))
+		paint_rectangles(data, mode, fb_colors, &fb);
+	else
+		paint_gradient_rectangles(data, mode, fb_colors, &fb);
+
+	igt_plane_set_fb(plane, &fb);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+
+	frame = chamelium_read_captured_frame(data->chamelium, 0);
+
+	ret = chamelium_frame_match_or_dump(data->chamelium,
+					    port,
+					    frame,
+					    &fbref,
+					    CHAMELIUM_CHECK_ANALOG);
+
+	igt_assert(ret);
+
+	/* Cleanup */
+	set_color_pipeline_bypass(plane);
+	reset_colorops(colorops);
+
+	igt_plane_set_fb(plane, NULL);
+	igt_display_commit_atomic(&data->display, 0, NULL);
+
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fbref);
+}
+
+static void
+test_plane_colorops(data_t *data, igt_crtc_t *crtc,
+		    const color_t *fb_colors,
+		    const color_t *exp_colors,
+		    kms_colorop_t *colorops[],
+		    int port_idx)
+{
+	int n_planes = crtc->n_planes;
+	igt_output_t *output = data->output;
+	igt_plane_t *plane;
+
+	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
+		plane = igt_output_get_plane(output, plane_id);
+
+		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+			continue;
+
+		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)
+			_test_plane_colorops(data, plane, fb_colors,
+					     exp_colors, colorops,
+					     data->ports[port_idx]);
+	}
+}
+
+static void
+run_tests_for_plane(data_t *data)
+{
+	igt_crtc_t *crtc;
+	igt_output_t *output = NULL;
+	int port_idx = 0;
+	static const color_t colors_rgb[] = {
+	        { 1.0, 0.0, 0.0 },
+	        { 0.0, 1.0, 0.0 },
+	        { 0.0, 0.0, 1.0 },
+	};
+	static const color_t colors_red_to_blue[] = {
+		{ 0.0, 0.0, 1.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
+	static const color_t colors_red_and_green[] = {
+		{ 1.0, 1.0, 0.0 },
+		{ 1.0, 1.0, 0.0 },
+		{ 1.0, 1.0, 0.0 }
+	};
+	static const color_t colors_only_green[] = {
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 1.0, 0.0 }
+	};
+	const igt_matrix_3x4_t ctm_red_to_blue = { {
+		0.0, 0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0, 0.0,
+		1.0, 0.0, 1.0, 0.0,
+	} };
+	const igt_matrix_3x4_t ctm_linear = { {
+		1.0, 0.0, 0.0, 0.0,
+		0.0, 1.0, 0.0, 0.0,
+		0.0, 0.0, 1.0, 0.0,
+	} };
+	kms_colorop_t lut1d_linear = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.name = "Pre/Post CSC GAMMA (linear LUT)",
+		.lut1d = &igt_1dlut_linear,
+		.transform = &igt_color_linear,
+	};
+	kms_colorop_t lut1d_max = {
+		.type = KMS_COLOROP_CUSTOM_LUT1D,
+		.lut1d = &igt_1dlut_max,
+		.name = "Pre/Post CSC GAMMA (max LUT)",
+		.transform = &igt_color_max,
+	};
+	kms_colorop_t lut3d = {
+		.type = KMS_COLOROP_LUT3D,
+		.lut3d = &igt_3dlut_17_green_only,
+		.lut3d_info = {
+			.size = 17,
+			.interpolation = DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
+		},
+		.name = "3dlut passing only green channel (RGB order)",
+		.transform = NULL,
+	};
+	kms_colorop_t ctm_3x4 = {
+		.type = KMS_COLOROP_CTM_3X4,
+		.name = "CTM 3X4 (red to blue)",
+		.matrix_3x4 = &ctm_red_to_blue,
+	};
+	kms_colorop_t ctm_3x4_linear = {
+		.type = KMS_COLOROP_CTM_3X4,
+		.name = "CTM 3X4 (linear)",
+		.matrix_3x4 = &ctm_linear,
+	};
+
+	struct {
+		const char *name;
+		const color_t *fb_colors;
+		const color_t *exp_colors;
+		kms_colorop_t *colorops[MAX_COLOROPS];
+	} plane_colorops_tests[] = {
+		{ .name = "lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-pre-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_max, &ctm_3x4_linear, NULL },
+		},
+		{ .name = "lut1d-post-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &ctm_3x4_linear, &lut1d_max, NULL },
+		},
+		{ .name = "ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &ctm_3x4, NULL },
+		},
+		{ .name = "lut1d-ctm3x4",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &lut1d_max, &ctm_3x4, NULL },
+		},
+		{ .name = "ctm3x4-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &ctm_3x4, &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_rgb,
+		  .colorops = { &lut1d_linear, &lut1d_max, NULL },
+		},
+		{ .name = "lut1d-ctm3x4-lut1d",
+		  .fb_colors = colors_rgb,
+		  .exp_colors = colors_red_to_blue,
+		  .colorops = { &lut1d_linear, &ctm_3x4, &lut1d_max, NULL },
+		},
+		{ .name = "lut3d-green-only",
+		  .fb_colors = colors_red_and_green,
+		  .exp_colors = colors_only_green,
+		  .colorops = { &lut3d, NULL },
+		},
+	};
+
+	for (int i = 0; i < ARRAY_SIZE(plane_colorops_tests); i++) {
+		igt_describe_f("Test plane color pipeline with colorops: %s", plane_colorops_tests[i].name);
+		igt_subtest_with_dynamic_f("plane-%s", plane_colorops_tests[i].name) {
+			for_each_crtc_with_single_output(&data->display, crtc,
+							 output) {
+				data->output = output;
+
+				if (!pipe_output_combo_valid(data, crtc))
+					continue;
+
+				port_idx = test_setup(data, crtc);
+				igt_require(port_idx >= 0);
+
+				data->color_depth = 8;
+				data->drm_format = DRM_FORMAT_XRGB8888;
+
+				test_plane_colorops(data, crtc,
+						    plane_colorops_tests[i].fb_colors,
+						    plane_colorops_tests[i].exp_colors,
+						    plane_colorops_tests[i].colorops,
+						    port_idx);
+
+				test_cleanup(data);
+			}
+		}
+	}
+}
+
+int igt_main()
+{
+	int i;
+	int has_plane_color_pipeline = 0;
+	data_t data = {};
+
+	igt_fixture() {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+
+		/*
+		 * Plane color pipeline support requires atomic modesetting.
+		 * The atomic capability is enabled here as a prerequisite;
+		 * igt_display_require() will reinitialize the display state.
+		 */
+		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) == 0)
+			data.display.is_atomic = 1;
+
+		if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
+			has_plane_color_pipeline = 1;
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		data.display.has_plane_color_pipeline = has_plane_color_pipeline;
+		igt_require(data.display.is_atomic);
+
+		/* Chamelium init */
+		data.chamelium = chamelium_init(data.drm_fd, &data.display);
+		igt_require(data.chamelium);
+
+		data.ports = chamelium_get_ports(data.chamelium,
+						 &data.port_count);
+
+		if (!data.port_count)
+			igt_skip("No ports connected\n");
+
+		/*
+		 * The behavior differs based on the availability of port mappings:
+		 * - When using port mappings (chamelium_read_port_mappings),
+		 *   ports are not plugged
+		 * - During autodiscovery, all ports are plugged at the end.
+		 *
+		 * This quick workaround (unplug, plug, and re-probe the connectors)
+		 * prevents any ports from being unintentionally skipped in test_setup.
+		 */
+		for (i = 0; i < data.port_count; i++) {
+			chamelium_unplug(data.chamelium, data.ports[i]);
+			chamelium_plug(data.chamelium, data.ports[i]);
+			chamelium_wait_for_conn_status_change(&data.display,
+							      data.chamelium,
+							      data.ports[i],
+							      DRM_MODE_CONNECTED);
+			igt_assert_f(chamelium_reprobe_connector(&data.display,
+								 data.chamelium,
+								 data.ports[i]) == DRM_MODE_CONNECTED,
+								 "Output not connected\n");
+		}
+	}
+
+	igt_subtest_group()
+		run_tests_for_plane(&data);
+
+	igt_fixture() {
+		igt_display_fini(&data.display);
+		drm_close_driver(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7f356de9b..3f50a3b92 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -359,6 +359,7 @@ endif
 chamelium_progs = [
 	'kms_chamelium_audio',
 	'kms_chamelium_color',
+	'kms_chamelium_color_pipeline',
 	'kms_chamelium_edid',
 	'kms_chamelium_frames',
 	'kms_chamelium_hpd',
@@ -387,6 +388,7 @@ extra_sources = {
 	'kms_colorop':  [ 'kms_colorop_helper.c' ],
 	'kms_chamelium_audio': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_color':  [ 'kms_color_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
+	'kms_chamelium_color_pipeline': [ 'kms_color_helper.c', 'kms_colorop_helper.c', join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
 	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
-- 
2.25.1

