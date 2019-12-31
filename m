Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4436E237
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2019 13:34:01 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Tue, 31 Dec 2019 18:51:55 +0530
Message-Id: <20191231132158.3911-5-swati2.sharma@intel.com>
In-Reply-To: <20191231132158.3911-1-swati2.sharma@intel.com>
References: <20191231132158.3911-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] tests/kms_hdr: Add bpc switch subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Add subtests to validate transitions between 8bpc and 10bpc. Test is
made compatible for both amd and intel drivers. The test requires
the "output_bpc" debugfs entry to read current and maximum bpc.
This is exposed by amd driver, however intel driver doesn't expose it,
so made that restriction to assert output bpc only for amd driver.

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/Makefile.sources |   1 +
 tests/kms_hdr.c        | 292 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 3 files changed, 294 insertions(+)
 create mode 100644 tests/kms_hdr.c

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index 2893f9bc..e8fcddf5 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -55,6 +55,7 @@ TESTS_progs = \
 	kms_frontbuffer_tracking \
 	kms_getfb \
 	kms_hdmi_inject \
+	kms_hdr \
 	kms_invalid_dotclock \
 	kms_lease \
 	kms_legacy_colorkey \
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
new file mode 100644
index 00000000..212d246d
--- /dev/null
+++ b/tests/kms_hdr.c
@@ -0,0 +1,292 @@
+/*
+ * Copyright 2019 Advanced Micro Devices, Inc.
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
+#include <fcntl.h>
+#include <termios.h>
+#include <unistd.h>
+
+IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
+
+/* Test flags. */
+enum {
+	TEST_NONE = 0,
+	TEST_DPMS = 1 << 0,
+	TEST_SUSPEND = 1 << 1,
+};
+
+/* BPC connector state. */
+typedef struct output_bpc {
+	unsigned int current;
+	unsigned int maximum;
+} output_bpc_t;
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
+/* Common test cleanup. */
+static void test_fini(data_t *data)
+{
+	igt_pipe_crc_free(data->pipe_crc);
+	igt_display_reset(&data->display);
+}
+
+static void test_cycle_flags(data_t *data, uint32_t test_flags)
+{
+	if (test_flags & TEST_DPMS) {
+		kmstest_set_connector_dpms(data->fd,
+					   data->output->config.connector,
+					   DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->fd,
+					   data->output->config.connector,
+					   DRM_MODE_DPMS_ON);
+	}
+
+	if (test_flags & TEST_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+}
+
+/* Returns the current and maximum bpc from the connector debugfs. */
+static output_bpc_t get_output_bpc(data_t *data)
+{
+	char buf[256];
+	char *start_loc;
+	int fd, res;
+	output_bpc_t info;
+
+	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
+
+	igt_require(res > 0);
+
+	close(fd);
+
+	igt_assert(start_loc = strstr(buf, "Current: "));
+	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
+
+	igt_assert(start_loc = strstr(buf, "Maximum: "));
+	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
+
+	return info;
+}
+
+/* Verifies that connector has the correct output bpc. */
+static void assert_output_bpc(data_t *data, unsigned int bpc)
+{
+	output_bpc_t info = get_output_bpc(data);
+
+	igt_require_f(info.maximum >= bpc,
+		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
+		      info.maximum);
+
+	igt_assert_eq(info.current, bpc);
+}
+
+/* Fills the FB with a test HDR pattern. */
+static void draw_hdr_pattern(igt_fb_t *fb)
+{
+	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
+
+	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
+	igt_paint_test_pattern(cr, fb->width, fb->height);
+
+	igt_put_cairo_ctx(fb->fd, fb, cr);
+}
+
+/* Prepare test data. */
+static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
+{
+	igt_display_t *display = &data->display;
+
+        data->pipe_id = pipe;
+	data->pipe = &data->display.pipes[data->pipe_id];
+	igt_assert(data->pipe);
+
+	igt_display_reset(display);
+
+	data->output = output;
+	igt_assert(data->output);
+
+	data->mode = igt_output_get_mode(data->output);
+	igt_assert(data->mode);
+
+	data->primary =
+		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+
+	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
+					  INTEL_PIPE_CRC_SOURCE_AUTO);
+
+	igt_output_set_pipe(data->output, data->pipe_id);
+
+	data->w = data->mode->hdisplay;
+	data->h = data->mode->vdisplay;
+}
+
+static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
+{
+	int i;
+
+	for (i = 0; i < display->n_outputs; i++)
+		if (display->outputs[i].pending_pipe == pipe)
+			return false;
+
+	return true;
+}
+
+static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
+				      uint32_t flags)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	enum pipe pipe;
+	igt_fb_t afb;
+	int afb_id;
+
+	for_each_pipe(display, pipe) {
+		if (!igt_pipe_connector_valid(pipe, output))
+			continue;
+
+		/*
+		 * If previous subtest of connector failed, pipe
+		 * attached to that connector is not released.
+		 * Because of that we have to choose the non
+		 * attached pipe for this subtest.
+		 */
+		if (!igt_pipe_is_free(display, pipe))
+			continue;
+
+		prepare_test(data, output, pipe);
+
+		/* 10-bit formats are slow, so limit the size. */
+		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+		igt_assert(afb_id);
+
+		draw_hdr_pattern(&afb);
+
+		/* Start in 8bpc. */
+		igt_plane_set_fb(data->primary, &afb);
+		igt_plane_set_size(data->primary, data->w, data->h);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		/*
+		 * i915 driver doesn't expose max bpc as debugfs entry,
+		 * so limiting assert only for amd driver.
+		 */
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		/* Switch to 10bpc. */
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 10);
+
+		/* Verify that the CRC are equal after DPMS or suspend. */
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+		test_cycle_flags(data, flags);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+		/* Drop back to 8bpc. */
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		/* CRC capture is clamped to 8bpc, so capture should match. */
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		test_fini(data);
+		igt_remove_fb(data->fd, &afb);
+
+		/*
+		 * Testing a output with a pipe is enough for HDR
+		 * testing. No ROI in testing the connector with other
+		 * pipes. So break the loop on pipe.
+		 */
+		break;
+	}
+}
+
+/* Returns true if an output supports max bpc property */
+static bool has_max_bpc(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
+}
+
+static void test_bpc_switch(data_t *data, uint32_t flags)
+{
+	igt_output_t *output;
+	int valid_tests = 0;
+
+	for_each_connected_output(&data->display, output) {
+		if (!has_max_bpc(output))
+			continue;
+
+		igt_info("BPC switch test execution on %s\n", output->name);
+		test_bpc_switch_on_output(data, output, flags);
+		valid_tests++;
+	}
+
+	igt_require_f(valid_tests, "No connector found with MAX BPC connector property\n");
+}
+
+igt_main
+{
+	data_t data = { 0 };
+
+	igt_fixture {
+		data.fd = drm_open_driver_master(DRIVER_AMDGPU | DRIVER_INTEL);
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.fd);
+		igt_require(data.display.is_atomic);
+
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Tests switching between different display output bpc modes");
+	igt_subtest("bpc-switch") test_bpc_switch(&data, TEST_NONE);
+	igt_describe("Tests bpc switch with dpms");
+	igt_subtest("bpc-switch-dpms") test_bpc_switch(&data, TEST_DPMS);
+	igt_describe("Tests bpc switch with suspend");
+	igt_subtest("bpc-switch-suspend") test_bpc_switch(&data, TEST_SUSPEND);
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index d931cc37..eed5e38f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -39,6 +39,7 @@ test_progs = [
 	'kms_frontbuffer_tracking',
 	'kms_getfb',
 	'kms_hdmi_inject',
+	'kms_hdr',
 	'kms_invalid_dotclock',
 	'kms_lease',
 	'kms_legacy_colorkey',
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
