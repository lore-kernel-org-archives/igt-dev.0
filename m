Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DC410E0E8
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 19:54:01 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 3 Aug 2023 15:53:58 -0400
Message-ID: <20230803195358.612810-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: Add test for MALL static screen
 cache scanout
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

MALL stands for memory access at last level.

This test is to verify that the display scanout is triggered from MALL cache instead
of GPU VRAM when the contents of the screen is idle for some time.

Requires UMR userspace utility from
https://gitlab.freedesktop.org/tomstdenis/umr to read MALL register
value.

This test commits a test pattern FB, sleeps for some
time, and then reads back the MALL status register to check if display
refresh from static screen is triggered.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_mall.c  | 158 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 159 insertions(+)
 create mode 100644 tests/amdgpu/amd_mall.c

diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
new file mode 100644
index 000000000..0b899f736
--- /dev/null
+++ b/tests/amdgpu/amd_mall.c
@@ -0,0 +1,158 @@
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
+#include "igt_core.h"
+#include <fcntl.h>
+
+IGT_TEST_DESCRIPTION("Test display refresh from MALL cache");
+
+#define MALL_SETTLE_DELAY 10
+
+/* Common test data. */
+typedef struct data {
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_pipe_t *pipe;
+	igt_pipe_crc_t *pipe_crc;
+	drmModeModeInfo *mode;
+	enum pipe pipe_id;
+	int fd;
+	int w;
+	int h;
+} data_t;
+
+struct line_check {
+	int found;
+	const char *substr;
+};
+
+/* Common test setup. */
+static void test_init(data_t *data)
+{
+	igt_display_t *display = &data->display;
+
+	/* It doesn't matter which pipe we choose on amdpgu. */
+	data->pipe_id = PIPE_A;
+	data->pipe = &data->display.pipes[data->pipe_id];
+
+	igt_display_reset(display);
+
+	/* find a connected HDMI output */
+	data->output = NULL;
+	for (int i=0; i < data->display.n_outputs; ++i) {
+		drmModeConnector *connector = data->display.outputs[i].config.connector;
+		if (connector->connection == DRM_MODE_CONNECTED) {
+			data->output = &data->display.outputs[i];
+		}
+	}
+	igt_require_f(data->output, "Requires a connected display\n");
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_assert(data->mode);
+
+	data->primary =
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
+					  IGT_PIPE_CRC_SOURCE_AUTO);
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+}
+
+/* Common test cleanup. */
+static void test_fini(data_t *data)
+{
+	igt_pipe_crc_free(data->pipe_crc);
+	igt_display_reset(&data->display);
+}
+
+static bool check_cmd_output(const char *line, void *data)
+{
+	struct line_check *check = data;
+
+	if (strstr(line, check->substr)) {
+		check->found++;
+	}
+
+	return false;
+}
+static void test_mall_ss(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_fb_t rfb;
+	int exec_ret;
+	struct line_check line;
+
+	test_init(data);
+
+	igt_create_pattern_fb(data->fd, data->w, data->h, DRM_FORMAT_XRGB8888, 0, &rfb);
+	igt_plane_set_fb(data->primary, &rfb);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	sleep(MALL_SETTLE_DELAY);
+
+	igt_system_cmd(exec_ret, "umr -O bits -r *.*.HUBP0_HUBP_MALL_STATUS | grep MALL_IN_USE");
+
+	igt_skip_on_f(exec_ret != IGT_EXIT_SUCCESS, "Error running UMR\n");
+
+	line.substr = "1 (0x00000001)";
+	igt_log_buffer_inspect(check_cmd_output, &line);
+
+	igt_assert_eq(line.found, 1);
+
+	igt_remove_fb(data->fd, &rfb);
+	test_fini(data);
+}
+
+igt_main
+{
+	data_t data;
+
+	igt_skip_on_simulation();
+
+	memset(&data, 0, sizeof(data));
+
+	igt_fixture
+	{
+		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Tests whether display scanout is triggered from MALL cache instead "
+		     "of GPU VRAM when screen contents are idle");
+	igt_subtest("static-screen") test_mall_ss(&data);
+
+	igt_fixture
+	{
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index e179bddcd..9bed83366 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -33,6 +33,7 @@ if libdrm_amdgpu.found()
 			  'amd_vcn',
 			  'amd_vm',
 			  'amd_vrr_range',
+			  'amd_mall',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.41.0
