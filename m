Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF396E961
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 19:28:09 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
Date: Mon, 4 Oct 2021 15:28:03 -0400
Message-ID: <20211004192803.2821789-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v5] tests/kms_bw: Add generic commit test
 for bandwidth validation
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
Cc: rodrigo.siqueira@amd.com
List-ID: <igt-dev@lists.freedesktop.org>

Add linear tiling mode tests

Changes in v5:
	Changes to test_init so that test invalid pipes are not
	used if certain pipes dont exist in chronological order

	Added comment explaining use of explicit for loop over
	IGT_MAX_PIPES instead of for_each_pipe_static()

Changes in v4:
        Removed igt_skip_on_simulation from main function.
Changes in v3:
        This version implements array of test modes in igt_main,
        global IGT_MAX_PIPE and other comments from Mark.
Changes in v2:
        Test added as generic IGT.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Bindu R <bindu.r@amd.com>
---
 tests/kms_bw.c    | 228 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 tests/kms_bw.c

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
new file mode 100644
index 00000000..a4553cde
--- /dev/null
+++ b/tests/kms_bw.c
@@ -0,0 +1,228 @@
+/*
+ * Copyrights 2021 Advanced Micro Devices, Inc.
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
+#include "drm_mode.h"
+#include "igt.h"
+#include "drm.h"
+#include <stdio.h>
+#include <xf86drmMode.h>
+
+/* Common test data. */
+typedef struct data {
+        igt_display_t display;
+        igt_plane_t *primary[IGT_MAX_PIPES];
+        igt_output_t *output[IGT_MAX_PIPES];
+        igt_pipe_t *pipe[IGT_MAX_PIPES];
+        igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
+        drmModeModeInfo mode[IGT_MAX_PIPES];
+        enum pipe pipe_id[IGT_MAX_PIPES];
+        int w[IGT_MAX_PIPES];
+        int h[IGT_MAX_PIPES];
+        int fd;
+} data_t;
+
+static drmModeModeInfo test_mode[] = {
+	{ 173000,
+	1920, 2048, 2248, 2576, 0,
+	1080, 1083, 1088, 1120, 0,
+	60,
+	DRM_MODE_FLAG_NHSYNC,
+	0x40,
+	"1920x1080p\0",
+	}, /* test_mode_1 */
+
+	{ 312250,
+	2560, 2752, 3024, 3488, 0,
+	1440, 1443, 1448, 1493, 0,
+	60,
+	DRM_MODE_FLAG_NHSYNC,
+	0x40,
+	"2560x1440p\0",
+	}, /* test_mode_2 */
+
+	{ 533000,
+	3840, 3888, 3920, 4000, 0,
+	2160, 2163, 2168, 2222, 0,
+	60,
+	DRM_MODE_FLAG_NHSYNC,
+	0x40,
+	"3840x2160p\0",
+	}, /* test_mode_3 */
+
+};
+
+static void test_init(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	int i, max_pipes = display->n_pipes;
+	igt_output_t *output;
+
+	for_each_pipe(display, i) {
+		data->pipe_id[i] = i;
+		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
+		data->primary[i] = igt_pipe_get_plane_type(
+			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[i] =
+			igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
+	}
+
+	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
+		if (!data->pipe[i])
+			continue;
+
+		output = &display->outputs[i];
+
+		data->output[i] = output;
+
+		/* Only allow physically connected displays for the tests. */
+		if (!igt_output_is_connected(output))
+			continue;
+
+		igt_assert(kmstest_get_connector_default_mode(
+			data->fd, output->config.connector, &data->mode[i]));
+
+		data->w[i] = data->mode[i].hdisplay;
+		data->h[i] = data->mode[i].vdisplay;
+	}
+
+
+	igt_require(data->output[0]);
+	igt_display_reset(display);
+}
+
+static void test_fini(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	int i;
+
+	for_each_pipe(display, i) {
+		if (data->pipe_crc[i])
+			igt_pipe_crc_free(data->pipe_crc[i]);
+	}
+
+	igt_display_reset(display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+}
+
+/* Forces a mode for a connector. */
+static void force_output_mode(data_t *d, igt_output_t *output,
+			      const drmModeModeInfo *mode)
+{
+	/* This allows us to create a virtual sink. */
+	if (!igt_output_is_connected(output)) {
+		kmstest_force_edid(d->fd, output->config.connector,
+				   igt_kms_get_4k_edid());
+
+		kmstest_force_connector(d->fd, output->config.connector,
+					FORCE_CONNECTOR_DIGITAL);
+	}
+
+	igt_output_override_mode(output, mode);
+}
+
+static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode) {
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	struct igt_fb buffer[IGT_MAX_PIPES];
+	igt_crc_t zero, captured[IGT_MAX_PIPES];
+	int i = 0, num_pipes = 0;
+	enum pipe p;
+
+	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
+	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
+	for_each_pipe(display, p) num_pipes++;
+
+	igt_skip_on_f(pipe > num_pipes,
+                      "ASIC does not have %d pipes\n", pipe);
+
+	test_init(data);
+
+	/* create buffers */
+	for (i = 0; i <= pipe; i++) {
+		output = data->output[i];
+		if (!output) {
+			continue;
+		}
+
+		force_output_mode(data, output, mode);
+
+		igt_create_color_fb(display->drm_fd, test_mode[0].hdisplay,
+				    test_mode[0].vdisplay, DRM_FORMAT_XRGB8888,
+				    DRM_FORMAT_MOD_NONE, 1.f, 0.f, 0.f,
+				    &buffer[i]);
+
+		igt_output_set_pipe(output, i);
+
+		igt_plane_set_fb(data->primary[i], &buffer[i]);
+	}
+
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	for (i = 0; i <= pipe; i++) {
+		output = data->output[i];
+		if (!output) {
+			continue;
+		}
+
+		igt_pipe_crc_collect_crc(data->pipe_crc[i], &captured[i]);
+		igt_assert_f(!igt_check_crc_equal(&zero, &captured[i]),
+			     "CRC is zero\n");
+		igt_remove_fb(display->drm_fd, &buffer[i]);
+	}
+
+	test_fini(data);
+}
+
+igt_main
+{
+	data_t data;
+	int i = 0, j = 0;
+
+	memset(&data, 0, sizeof(data));
+
+	igt_fixture
+	{
+		data.fd = drm_open_driver_master(DRIVER_ANY);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.fd);
+		igt_require(&data.display.is_atomic);
+		igt_display_require_output(&data.display);
+
+	}
+
+	/* We're not using for_each_pipe_static because we need the
+	 * _amount_ of pipes */
+	for (i = 0; i < IGT_MAX_PIPES; i++) {
+		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
+			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
+			      test_mode[j].name)
+			run_test_linear_tiling(&data, i, &test_mode[j]);
+		}
+	}
+
+	igt_fixture
+	{
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 8ad52596..c4cbe229 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -19,6 +19,7 @@ test_progs = [
 	'kms_atomic',
 	'kms_atomic_interruptible',
 	'kms_atomic_transition',
+	'kms_bw',
 	'kms_concurrent',
 	'kms_content_protection',
 	'kms_cursor_crc',
-- 
2.30.2
