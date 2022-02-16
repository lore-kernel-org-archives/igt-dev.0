Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DC510E6F3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 07:20:47 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 16 Feb 2022 12:50:07 +0530
Message-Id: <20220216072007.18230-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] tests/kms_extended: Add test for
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add test for validation of extended mode.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_extended.c | 164 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 165 insertions(+)
 create mode 100644 tests/kms_extended.c

diff --git a/tests/kms_extended.c b/tests/kms_extended.c
new file mode 100644
index 00000000..40afbabd
--- /dev/null
+++ b/tests/kms_extended.c
@@ -0,0 +1,164 @@
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
+IGT_TEST_DESCRIPTION("Test extended mode");
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	struct igt_fb fb;
+	int n_pipes;
+
+	struct output_data {
+		uint32_t id;
+	} extended_outputs[2];
+} data_t;
+
+static void run_extendedmode_basic(data_t *data)
+{
+	struct igt_fb fb, fbs[2];
+	drmModeModeInfo *mode[2];
+	igt_output_t *output, *extended_output[2];
+	igt_display_t *display = &data->display;
+	igt_plane_t *plane[2];
+	igt_pipe_crc_t *pipe_crc[2] = { 0 };
+	igt_crc_t ref_crc[2], crc[2];
+	int count = 0, hdisplay, vdisplay;
+	cairo_t *cr;
+
+	for_each_connected_output(display, output) {
+		if (data->extended_outputs[count].id == output->id) {
+			extended_output[count] = output;
+			count++;
+		}
+		if (count > 1)
+			break;
+	}
+
+	igt_output_set_pipe(extended_output[0], 0);
+	igt_output_set_pipe(extended_output[1], 1);
+
+	mode[0] = igt_output_get_mode(extended_output[0]);
+	mode[1] = igt_output_get_mode(extended_output[1]);
+
+	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
+			    DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
+	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
+			    DRM_FORMAT_XRGB8888, 0, 0, 0, 1, &fbs[1]);
+
+	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, 0, INTEL_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, 1, INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	plane[0] = igt_pipe_get_plane_type(&display->pipes[0], DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(plane[0], &fbs[0]);
+	igt_fb_set_size(&fbs[0], plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
+	igt_plane_set_size(plane[0], mode[0]->hdisplay, mode[0]->vdisplay);
+
+	plane[1] = igt_pipe_get_plane_type(&display->pipes[1], DRM_PLANE_TYPE_PRIMARY);
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
+	hdisplay = mode[0]->hdisplay + mode[1]->hdisplay;
+	vdisplay = max(mode[0]->vdisplay, mode[1]->vdisplay);
+
+	igt_create_fb(data->drm_fd, hdisplay, vdisplay, DRM_FORMAT_XRGB8888, 0, &fb);
+	cr = igt_get_cairo_ctx(data->drm_fd, &fb);
+	igt_paint_color(cr, 0, 0, hdisplay, vdisplay, 1, 0, 0);
+	igt_paint_color(cr, mode[0]->hdisplay, 0, hdisplay, vdisplay, 0, 0, 1);
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
+	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[0], DRM_PLANE_TYPE_PRIMARY), NULL);
+	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[1], DRM_PLANE_TYPE_PRIMARY), NULL);
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
+	igt_output_t *output;
+	int valid_output = 0, count = 0;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		kmstest_set_vt_graphics_mode();
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+
+		for_each_connected_output(&data.display, output) {
+			if (count < 2) {
+				data.extended_outputs[count].id = output->id;
+				count++;
+			}
+			valid_output++;
+		}
+	}
+
+	igt_subtest("extended_mode_basic") {
+		igt_require_f(valid_output > 1, "No valid Second output found\n");
+		run_extendedmode_basic(&data);
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 7003d064..15825a4a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -28,6 +28,7 @@ test_progs = [
 	'kms_dither',
 	'kms_dp_aux_dev',
 	'kms_dp_tiled_display',
+	'kms_extended',
 	'kms_flip',
 	'kms_flip_event_leak',
 	'kms_force_connector_basic',
-- 
2.17.1
