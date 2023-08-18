Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2074.outbound.protection.outlook.com [40.107.243.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B40D10E0A9
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 16:15:32 +0000 (UTC)
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 18 Aug 2023 12:15:28 -0400
Message-ID: <20230818161528.189560-1-aurabindo.pillai@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amdgpu: Add test for ODM combine
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: hersenxs.wu@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a test that checks whether ODM Combine mode is triggered when high
refresh rate timing is committed on hardware it supports. This test
requires a DSC capable monitor.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_odm.c   | 206 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 tests/amdgpu/amd_odm.c

diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
new file mode 100644
index 000000000..0b91817eb
--- /dev/null
+++ b/tests/amdgpu/amd_odm.c
@@ -0,0 +1,206 @@
+/*
+ * Copyrights 2023 Advanced Micro Devices, Inc.
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
+#include <fcntl.h>
+#include <stdio.h>
+#include <xf86drmMode.h>
+
+#include "igt.h"
+#include "igt_amd.h"
+#include "igt_edid.h"
+
+IGT_TEST_DESCRIPTION("Test whether ODM Combine mode is triggered when timings with high refresh"
+		     "rate is committed");
+
+typedef enum odm_combine_mode {
+	ODMC_2_TO_1,
+	ODMC_4_TO_1,
+} odmc_mode_t;
+
+/* Common test data. */
+typedef struct data {
+        igt_display_t display;
+        igt_plane_t *primary;
+        igt_output_t *output;
+        igt_pipe_t *pipe;
+        drmModeModeInfoPtr mode;
+        enum pipe pipe_id;
+        int w;
+        int h;
+        int fd;
+} data_t;
+
+static const drmModeModeInfo test_mode[] = {
+	{ 1278720,
+	3840, 3952, 3984, 4000, 0,
+	2160, 2210, 2215, 2220, 0,
+	30,
+	DRM_MODE_FLAG_NHSYNC,
+	0x40,
+	"4k144\0",
+	}, /* from HP Omen 27c */
+
+};
+
+#define TEST_MODE_IDX_ODMC_2_TO_1 0
+
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
+	/* find a connected non-HDMI output */
+	data->output = NULL;
+	for (int i=0; i < data->display.n_outputs; ++i) {
+		drmModeConnector *connector = data->display.outputs[i].config.connector;
+		if (connector->connection == DRM_MODE_CONNECTED) {
+			data->output = &data->display.outputs[i];
+		}
+	}
+	igt_require_f(data->output, "Requires a connected output\n");
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_assert(data->mode);
+
+	igt_skip_on_f(!is_dp_dsc_supported(data->fd, data->output->name),
+		      "The monitor must be DSC capable\n");
+
+	igt_skip_on_f(data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+		      data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB,
+		      "ODM Combine isn't supported on HDMI 1.x\n");
+
+	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_output_set_pipe(data->output, data->pipe_id);
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+
+	igt_display_reset(display);
+}
+
+static void test_fini(data_t *data)
+{
+	igt_display_reset(&data->display);
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
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
+static void run_test_odmc(data_t *data, odmc_mode_t m, const drmModeModeInfo *mode) {
+	igt_display_t *display = &data->display;
+	struct igt_fb buffer;
+	char buf[256];
+	int ret, seg, fd;
+	int i = 0;
+
+	test_init(data);
+
+	force_output_mode(data, data->output, mode);
+
+	igt_create_color_fb(display->drm_fd, mode->hdisplay,
+			    mode->vdisplay, DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
+			    &buffer);
+
+	igt_output_set_pipe(data->output, i);
+
+	igt_plane_set_fb(data->primary, &buffer);
+
+	ret = igt_display_try_commit_atomic(display,
+					    DRM_MODE_ATOMIC_ALLOW_MODESET |
+					    DRM_MODE_ATOMIC_TEST_ONLY,
+					    NULL);
+	igt_skip_on_f(ret != 0, "Unsupported mode\n");
+
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	ret = igt_debugfs_simple_read(fd, "odm_combine_segments", buf, sizeof(buf));
+	close(fd);
+	igt_require(ret > 0);
+
+	seg = strtol(buf, NULL, 0);
+
+	switch (m) {
+	case ODMC_2_TO_1:
+		igt_assert_f(seg == 2,
+			     "ODM Combine uses %d segments for connector %s, expected 2\n",
+			     seg, data->output->name);
+		break;
+	case ODMC_4_TO_1:
+		igt_assert_f(seg == 4,
+			     "ODM Combine uses %d segments for connector %s, expected 4\n",
+			     seg, data->output->name);
+		break;
+	}
+
+	igt_remove_fb(display->drm_fd, &buffer);
+
+	test_fini(data);
+}
+
+igt_main
+{
+	data_t data;
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
+	igt_subtest_f("odm-combine-2-to-1-%s", test_mode[TEST_MODE_IDX_ODMC_2_TO_1].name)
+		run_test_odmc(&data, ODMC_2_TO_1, &test_mode[TEST_MODE_IDX_ODMC_2_TO_1]);
+
+	igt_fixture
+	{
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 6c6166167..6032a38e8 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -35,6 +35,7 @@ if libdrm_amdgpu.found()
 			  'amd_vm',
 			  'amd_vrr_range',
 			  'amd_mall',
+			  'amd_odm',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.41.0
