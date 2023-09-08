Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8534910E8EF
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 15:04:23 +0000 (UTC)
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 11:03:15 -0400
Message-ID: <20230908150315.75977-8-harry.wentland@amd.com>
In-Reply-To: <20230908150315.75977-1-harry.wentland@amd.com>
References: <20230908150315.75977-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 7/7] tests/kms_colorop: Add kms_colorop tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <shashank.sharma@amd.com>, Simon Ser <contact@emersion.fr>,
 Alexander Goins <agoins@nvidia.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>, Victoria
 Brekenfeld <victoria@system76.com>, Joshua Ashton <joshua@froggi.es>,
 Daniel Vetter <daniel@ffwll.ch>, Aleix Pol <aleixpol@kde.org>,
 Naseer Ahmed <quic_naseer@quicinc.com>,
 Christopher Braga <quic_cbraga@quicinc.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This tests the color pipeline API, exposed via the
COLOR PIPELINE plane property and drm_colorop objects.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
---
 tests/kms_colorop.c | 424 ++++++++++++++++++++++++++++++++++++++++++++
 tests/kms_colorop.h |  79 +++++++++
 tests/meson.build   |   1 +
 3 files changed, 504 insertions(+)
 create mode 100644 tests/kms_colorop.c
 create mode 100644 tests/kms_colorop.h

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
new file mode 100644
index 000000000000..48c5aaf49955
--- /dev/null
+++ b/tests/kms_colorop.c
@@ -0,0 +1,424 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include "igt_color.h"
+#include "sw_sync.h"
+
+#include "kms_colorop.h"
+
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
+				    drmModeModeInfo override_mode)
+{
+	igt_fb_t input_fb, output_fb;
+	igt_plane_t *plane;
+	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
+	int width, height, ret;
+
+	igt_output_override_mode(output, &override_mode);
+
+	width = override_mode.hdisplay;
+	height = override_mode.vdisplay;
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
+	igt_assert(ret >= 0);
+
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    writeback_format, modifier, &output_fb);
+	igt_assert(ret >= 0);
+
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(plane, &input_fb);
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
+					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	igt_plane_set_fb(plane, NULL);
+	igt_remove_fb(display->drm_fd, &input_fb);
+	igt_remove_fb(display->drm_fd, &output_fb);
+
+	return !ret;
+}
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+typedef struct {
+	bool builtin_mode;
+	bool custom_mode;
+	bool list_modes;
+	bool dump_check;
+	int mode_index;
+	drmModeModeInfo user_mode;
+} data_t;
+
+static data_t data;
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static igt_output_t *kms_writeback_get_output(igt_display_t *display)
+{
+	int i;
+	enum pipe pipe;
+
+	drmModeModeInfo override_mode = {
+		.clock = 25175,
+		.hdisplay = 640,
+		.hsync_start = 656,
+		.hsync_end = 752,
+		.htotal = 800,
+		.hskew = 0,
+		.vdisplay = 480,
+		.vsync_start = 490,
+		.vsync_end = 492,
+		.vtotal = 525,
+		.vscan = 0,
+		.vrefresh = 60,
+		.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.name = {"640x480-60"},
+	};
+
+	for (i = 0; i < display->n_outputs; i++) {
+		igt_output_t *output = &display->outputs[i];
+
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
+			continue;
+
+		for_each_pipe(display, pipe) {
+			igt_output_set_pipe(output, pipe);
+
+			if (data.custom_mode)
+				override_mode = data.user_mode;
+			if (data.builtin_mode)
+				override_mode = output->config.connector->modes[data.mode_index];
+
+			if (check_writeback_config(display, output, override_mode)) {
+				igt_debug("Using connector %u:%s on pipe %d\n",
+					  output->config.connector->connector_id,
+					  output->name, pipe);
+				return output;
+			}
+		}
+
+		igt_debug("We found %u:%s, but this test will not be able to use it.\n",
+			  output->config.connector->connector_id, output->name);
+
+		/* Restore any connectors we don't use, so we don't trip on them later */
+		kmstest_force_connector(display->drm_fd, output->config.connector, FORCE_CONNECTOR_UNSPECIFIED);
+	}
+
+	return NULL;
+}
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static uint64_t get_writeback_fb_id(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+}
+
+/* TODO move to lib for kms_writeback and kms_colorop (and other future) use */
+static void detach_crtc(igt_display_t *display, igt_output_t *output)
+{
+	if (get_writeback_fb_id(output) == 0)
+		return;
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+static void get_and_wait_out_fence(igt_output_t *output)
+{
+	int ret;
+
+	igt_assert(output->writeback_out_fence_fd >= 0);
+
+	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
+	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd = -1;
+}
+
+static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_colorop_t *desired)
+{
+	switch (desired->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE) {
+			return true;
+		}
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_CTM:
+	case KMS_COLOROP_LUT3D:
+	default:
+		return false;
+	}
+}
+
+/**
+ * Iterate color pipeline that begins with colorop and try to map
+ * colorops[] to it.
+ */
+static bool map_to_pipeline(igt_display_t *display,
+			    igt_colorop_t *colorop,
+			    kms_colorop_t colorops[],
+			    int num_colorops)
+{
+	igt_colorop_t *next = colorop;
+	int i = 0;
+	int prop_val = 0;
+
+	while (next) {
+		if (can_use_colorop(display, next, &colorops[i])) {
+			colorops[i].colorop = next;
+			i++;
+			if (i >= num_colorops)
+				break;
+		}
+		prop_val = igt_colorop_get_prop(display, colorop,
+						IGT_COLOROP_NEXT);
+		next = igt_find_colorop(display, prop_val);
+	}
+
+	if (i < num_colorops) {
+		/* we failed to map the pipeline */
+
+		/* clean up colorops[i].colorop mappings */
+		for (i = 0; i < num_colorops; i++)
+			colorops[i].colorop = NULL;
+
+		return false;
+	}
+
+	return true;
+}
+
+static igt_colorop_t *get_color_pipeline(igt_display_t *display,
+					 igt_plane_t *plane,
+					 kms_colorop_t colorops[],
+					 int num_colorops)
+{
+	igt_colorop_t *colorop;
+	int i;
+
+	igt_assert(num_colorops > 0);
+
+	/* go through all color pipelines */
+	for (i = 0; i < plane->num_color_pipelines; ++i) {
+		colorop = plane->color_pipelines[i];
+		if (map_to_pipeline(display, colorop, colorops, num_colorops))
+			break;
+	}
+	igt_assert(colorop);
+
+	return colorop;
+}
+
+static void set_colorop(igt_display_t *display,
+			kms_colorop_t *colorop)
+{
+	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, colorop->colorop ? 0 : 1);
+
+	/* TODO set to desired value from kms_colorop_t */
+	switch (colorop->type) {
+	case KMS_COLOROP_ENUMERATED_LUT1D:
+		switch (colorop->enumerated_lut1d_info.tf) {
+		case KMS_COLOROP_LUT1D_SRGB_EOTF:
+			igt_colorop_set_prop_enum(display, colorop->colorop, IGT_COLOROP_CURVE_1D_TYPE, "sRGB EOTF");
+			break;
+		case KMS_COLOROP_LUT1D_SRGB_INV_EOTF:
+		case KMS_COLOROP_LUT1D_PQ_EOTF:
+		case KMS_COLOROP_LUT1D_PQ_INV_EOTF:
+		default:
+			igt_fail(IGT_EXIT_FAILURE);
+		}
+		break;
+	case KMS_COLOROP_CUSTOM_LUT1D:
+	case KMS_COLOROP_CTM:
+	case KMS_COLOROP_LUT3D:
+	default:
+		igt_fail(IGT_EXIT_FAILURE);
+	}
+}
+
+static void set_color_pipeline(igt_display_t *display,
+			       igt_plane_t *plane,
+			       kms_colorop_t colorops[],
+			       int num_colorops,
+			       igt_colorop_t *colorop)
+{
+	int i;
+
+	igt_plane_set_color_pipeline(plane, colorop);
+
+	for (i = 0; i < num_colorops; i++) {
+		set_colorop(display, &colorops[i]);
+	}
+}
+
+static void set_color_pipeline_bypass(igt_plane_t *plane)
+{
+	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+}
+
+static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
+{
+	return igt_cmp_fb_pixels(in, out, 1, 0);
+}
+
+#define DUMP_FBS 0
+
+static void colorop_plane_test(igt_display_t *display,
+			       kms_colorop_t colorops[],
+			       int num_colorops,
+			       transform_fb transform,
+			       compare_fb_t compare)
+{
+	igt_colorop_t *colorop = NULL;
+	igt_output_t *output;
+	igt_plane_t *plane;
+	igt_fb_t input_fb;
+	igt_fb_t sw_transform_fb;
+	igt_fb_t output_fb;
+	drmModeModeInfo mode;
+	unsigned int fb_id;
+	igt_crc_t input_crc, output_crc;
+
+	output = kms_writeback_get_output(display);
+	igt_require(output);
+
+	if (output->use_override_mode)
+		memcpy(&mode, &output->override_mode, sizeof(mode));
+	else
+		memcpy(&mode, &output->config.default_mode, sizeof(mode));
+
+	/* create input fb */
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_assert(plane);
+
+	fb_id = igt_create_color_pattern_fb(display->drm_fd,
+					mode.hdisplay, mode.vdisplay,
+					DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					0.2, 0.2, 0.2, &input_fb);
+
+	igt_assert(fb_id >= 0);
+	igt_plane_set_fb(plane, &input_fb);
+#if DUMP_FBS
+	igt_dump_fb(display, &input_fb, ".", "input");
+#endif
+
+	/* create output fb */
+	fb_id = igt_create_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
+				DRM_FORMAT_XRGB8888,
+				igt_fb_mod_to_tiling(0),
+				&output_fb);
+	igt_require(fb_id > 0);
+
+
+	igt_fb_get_fnv1a_crc(&input_fb, &input_crc);
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
+
+	/* reset color pipeline*/
+
+	/* TODO do we need this? might be good sanity anyways */
+	set_color_pipeline_bypass(plane);
+
+	/* Commit */
+	igt_plane_set_fb(plane, &input_fb);
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	igt_display_commit_atomic(output->display,
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	get_and_wait_out_fence(output);
+
+	/* Compare input and output buffers. They should be equal here. */
+	igt_fb_get_fnv1a_crc(&output_fb, &output_crc);
+
+	igt_assert_crc_equal(&input_crc, &output_crc);
+
+	/* create sw transformed buffer */
+
+	igt_copy_fb(display->drm_fd, &input_fb, &sw_transform_fb);
+	igt_assert(igt_cmp_fb_pixels(&input_fb, &sw_transform_fb, 0, 0));
+	transform(&sw_transform_fb);
+#if DUMP_FBS
+	igt_dump_fb(display, &sw_transform_fb, ".", "sw_transform");
+#endif
+	/* discover and set COLOR PIPELINE */
+
+	/* get COLOR_PIPELINE enum */
+	colorop = get_color_pipeline(display, plane, colorops, num_colorops);
+
+	set_color_pipeline(display, plane, colorops, num_colorops, colorop);
+
+	igt_output_set_writeback_fb(output, &output_fb);
+
+	/* commit COLOR_PIPELINE */
+	igt_display_commit_atomic(display,
+				DRM_MODE_ATOMIC_ALLOW_MODESET,
+				NULL);
+	get_and_wait_out_fence(output);
+#if DUMP_FBS
+	igt_dump_fb(display, &output_fb, ".", "output");
+#endif
+
+	/* compare sw transformed and KMS transformed FBs */
+	igt_assert(compare(&sw_transform_fb, &output_fb));
+
+	/* cleanup */
+	detach_crtc(display, output);
+	igt_remove_fb(display->drm_fd, &input_fb);
+	igt_remove_fb(display->drm_fd, &output_fb);
+}
+
+
+igt_main
+{
+	igt_display_t display;
+
+
+	igt_fixture {
+		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		igt_display_require(&display, display.drm_fd);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&display, display.drm_fd);
+
+		igt_require(display.is_atomic);
+
+	}
+
+	igt_describe("Tests getting and setting COLOR_PIPELINE property on plane");
+	igt_subtest("colorop-plane") {
+		kms_colorop_t colorops[] = { kms_colorop_srgb_eotf };
+
+		colorop_plane_test(&display, colorops, 1, igt_color_transform_srgb_eotf, compare_with_bracket);
+	}
+
+	igt_fixture {
+
+		igt_display_fini(&display);
+	}
+}
+
diff --git a/tests/kms_colorop.h b/tests/kms_colorop.h
new file mode 100644
index 000000000000..0d0d2e83ebd2
--- /dev/null
+++ b/tests/kms_colorop.h
@@ -0,0 +1,79 @@
+/*
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#ifndef __KMS_COLOROP_H__
+#define __KMS_COLOROP_H__
+
+/* Test version definitions */
+typedef enum kms_colorop_type {
+	KMS_COLOROP_ENUMERATED_LUT1D,
+	KMS_COLOROP_CUSTOM_LUT1D,
+	KMS_COLOROP_CTM,
+	KMS_COLOROP_LUT3D
+} kms_colorop_type_t;
+
+typedef enum kms_colorop_lut1d_tf {
+	KMS_COLOROP_LUT1D_SRGB_EOTF,
+	KMS_COLOROP_LUT1D_SRGB_INV_EOTF,
+	KMS_COLOROP_LUT1D_PQ_EOTF,
+	KMS_COLOROP_LUT1D_PQ_INV_EOTF,
+} kms_colorop_lut1d_tf_t;
+
+typedef struct kms_colorop_enumerated_lut1d_info {
+	kms_colorop_lut1d_tf_t tf;
+} kms_colorop_enumerated_lut1d_info_t;
+
+typedef struct kms_colorop {
+	kms_colorop_type_t type;
+
+	union {
+		kms_colorop_enumerated_lut1d_info_t enumerated_lut1d_info;
+	};
+
+	const char *name;
+
+	/* Mapped colorop */
+	igt_colorop_t *colorop;
+
+} kms_colorop_t;
+
+kms_colorop_t kms_colorop_srgb_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_EOTF
+	},
+	.name = "srgb-eotf"
+};
+
+kms_colorop_t kms_colorop_srgb_inf_eotf = {
+	.type = KMS_COLOROP_ENUMERATED_LUT1D,
+	.enumerated_lut1d_info = {
+		.tf = KMS_COLOROP_LUT1D_SRGB_INV_EOTF
+	},
+	.name = "srgb-inv-eotf"
+};
+
+typedef bool (*compare_fb_t)(igt_fb_t *in, igt_fb_t *out);
+
+typedef int (*transform_fb)(igt_fb_t *in);
+
+#endif /* __KMS_COLOROP_H__ */
diff --git a/tests/meson.build b/tests/meson.build
index 38f080f7c26e..e24f3efc9078 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -22,6 +22,7 @@ test_progs = [
 	'kms_atomic_transition',
 	'kms_bw',
 	'kms_concurrent',
+	'kms_colorop',
 	'kms_content_protection',
 	'kms_cursor_crc',
 	'kms_cursor_edge_walk',
-- 
2.42.0
