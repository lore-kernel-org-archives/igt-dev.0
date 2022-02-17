Return-path: <SRS0=aXFB=TA=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1F610EB89
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Feb 2022 11:58:50 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Feb 2022 17:28:12 +0530
Message-Id: <20220217115812.4141-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6] tests/kms_display_modes: Add test for
 extended mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add test for validation of extended mode.

v2: - make subtest dynamic
    - rename testname
    - rename and delete unsed variable

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_display_modes.c | 162 ++++++++++++++++++++++++++++++++++++++
 tests/meson.build         |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 tests/kms_display_modes.c

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
new file mode 100644
index 00000000..0a826648
--- /dev/null
+++ b/tests/kms_display_modes.c
@@ -0,0 +1,162 @@
+/*
+ * Copyright © 2022 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ *
+ * Author:
+ *  Jeevan B <jeevan.b@intel.com>
+ */
+
+#include "igt.h"
+
+IGT_TEST_DESCRIPTION("Test Display Modes");
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	int n_pipes;
+} data_t;
+
+static void run_extendedmode_basic(data_t *data, int pipe_id)
+{
+	struct igt_fb fb, fbs[2];
+	drmModeModeInfo *mode[2];
+	igt_output_t *output, *extended_output[2];
+	igt_display_t *display = &data->display;
+	igt_plane_t *plane[2];
+	igt_pipe_crc_t *pipe_crc[2] = { 0 };
+	igt_crc_t ref_crc[2], crc[2];
+	int count = 0, width, height;
+	cairo_t *cr;
+
+	for_each_connected_output(display, output) {
+		extended_output[count] = output;
+		count++;
+	}
+
+	igt_output_set_pipe(extended_output[0], pipe_id);
+	igt_output_set_pipe(extended_output[1], pipe_id + 1);
+
+	mode[0] = igt_output_get_mode(extended_output[0]);
+	mode[1] = igt_output_get_mode(extended_output[1]);
+
+	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe_id, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe_id + 1, INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
+			     DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
+	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
+			     DRM_FORMAT_XRGB8888, 0, 0, 0, 1, &fbs[1]);
+
+	plane[0] = igt_pipe_get_plane_type(&display->pipes[pipe_id], DRM_PLANE_TYPE_PRIMARY);
+	plane[1] = igt_pipe_get_plane_type(&display->pipes[pipe_id + 1], DRM_PLANE_TYPE_PRIMARY);
+
+	igt_plane_set_fb(plane[0], &fbs[0]);
+	igt_fb_set_size(&fbs[0], plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
+	igt_plane_set_size(plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
+
+	igt_plane_set_fb(plane[1], &fbs[1]);
+	igt_fb_set_size(&fbs[1], plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
+	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
+	igt_pipe_crc_collect_crc(pipe_crc[1], &ref_crc[1]);
+
+	/*Create a big framebuffer and display it on 2 monitors*/
+	width = mode[0]->hdisplay + mode[1]->hdisplay;
+	height = max(mode[0]->vdisplay, mode[1]->vdisplay);
+
+	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888, 0, &fb);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb);
+	igt_paint_color(cr, 0, 0, mode[0]->hdisplay, mode[0]->vdisplay, 1, 0, 0);
+	igt_paint_color(cr, mode[0]->hdisplay, 0, width, height, 0, 0, 1);
+	igt_put_cairo_ctx(cr);
+
+	igt_plane_set_fb(plane[0], &fb);
+	igt_fb_set_position(&fb, plane[0], 0, 0);
+	igt_fb_set_size(&fb, plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
+
+	igt_plane_set_fb(plane[1], &fb);
+	igt_fb_set_position(&fb, plane[1], mode[0]->hdisplay, 0);
+	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]);
+	igt_pipe_crc_collect_crc(pipe_crc[1], &crc[1]);
+
+	/*Clean up*/
+	igt_remove_fb(data->drm_fd, &fbs[0]);
+	igt_remove_fb(data->drm_fd, &fbs[1]);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	igt_pipe_crc_free(pipe_crc[0]);
+	igt_pipe_crc_free(pipe_crc[1]);
+
+	igt_output_set_pipe(extended_output[0], PIPE_NONE);
+	igt_output_set_pipe(extended_output[1], PIPE_NONE);
+
+	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe_id],
+			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe_id + 1],
+			  DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	/*Compare CRC*/
+	igt_assert_crc_equal(&crc[0], &ref_crc[0]);
+	igt_assert_crc_equal(&crc[1], &ref_crc[1]);
+}
+
+igt_main
+{
+	data_t data;
+	int valid_output = 0, i;
+	igt_output_t *output;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+
+		for_each_connected_output(&data.display, output)
+			valid_output++;
+
+		igt_require_f(valid_output > 1, "No valid Second output found\n");
+
+		data.n_pipes = 0;
+		for_each_pipe(&data.display, i)
+			data.n_pipes++;
+	}
+
+	igt_describe("Test for validating display extended mode with a pair of connected displays");
+	igt_subtest_with_dynamic("extended-mode-basic") {
+		for (i = 0; i < data.n_pipes - 1; i++) {
+			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(i),
+					kmstest_pipe_name(i + 1));
+			run_extendedmode_basic(&data, i);
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7003d064..3dbba7a1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -26,6 +26,7 @@ test_progs = [
 	'kms_cursor_edge_walk',
 	'kms_cursor_legacy',
 	'kms_dither',
+	'kms_display_modes',
 	'kms_dp_aux_dev',
 	'kms_dp_tiled_display',
 	'kms_flip',
-- 
2.17.1
