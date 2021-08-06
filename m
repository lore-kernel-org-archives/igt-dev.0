Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7B6EA13
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 08:44:30 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Fri, 6 Aug 2021 16:44:12 +0800
Message-ID: <20210806084412.478115-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu: Introduce amd_hotplug tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com, Rodrigo.Siqueira@amd.com, Anson.Jacob@amd.com
Cc: Victor Lu <victorchengchi.lu@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Victor Lu <victorchengchi.lu@amd.com>

[Why]
There is a debugfs entry to trigger software hotplugs. We can use this
for IGT tests.

[How]
Add hotplug test for all connectors, hotplug after suspend.

Signed-off-by: Victor Lu <victorchengchi.lu@amd.com>
---
 lib/igt_amd.c              |  77 ++++++++++++++++
 lib/igt_amd.h              |   8 ++
 tests/amdgpu/amd_hotplug.c | 184 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   1 +
 4 files changed, 270 insertions(+)
 create mode 100644 tests/amdgpu/amd_hotplug.c

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index a4e1cb59..4ffe7cf2 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -20,6 +20,9 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <fcntl.h>
+#include <sys/stat.h>
+
 #include "igt_amd.h"
 #include "igt.h"
 #include <amdgpu_drm.h>
@@ -246,3 +249,77 @@ bool igt_amd_is_tiled(uint64_t modifier)
 	else
 		return false;
 }
+
+/**
+ * igt_amd_output_has_hpd: check if connector has HPD debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+static bool igt_amd_output_has_hpd(int drm_fd, char *connector_name)
+{
+	int fd;
+	int res;
+	struct stat stat;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("output %s: debugfs not found\n", connector_name);
+		return false;
+	}
+
+	res = fstatat(fd, DEBUGFS_HPD_TRIGGER, &stat, 0);
+	if (res != 0) {
+		igt_info("%s debugfs not supported\n", DEBUGFS_HPD_TRIGGER);
+		close(fd);
+		return false;
+	}
+
+	close(fd);
+	return true;
+}
+
+/**
+ * igt_amd_require_hpd: Checks if connectors have HPD debugfs
+ * @display: A pointer to an #igt_display_t structure
+ * @drm_fd: DRM file descriptor
+ *
+ * Checks if the AMDGPU driver has support the 'trigger_hotplug'
+ * entry for HPD. Skip test if HPD is not supported.
+ */
+void igt_amd_require_hpd(igt_display_t *display, int drm_fd)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(display, output) {
+		if (igt_amd_output_has_hpd(drm_fd, output->name))
+			return;
+	}
+
+	igt_skip("No HPD debugfs support.\n");
+}
+
+/**
+ * igt_amd_trigger_hotplut: Triggers a debugfs HPD
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, which we trigger the hotplug on
+ *
+ * igt_amd_require_hpd should be called before calling this.
+ */
+int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
+{
+	int fd, hpd_fd;
+	int wr_len;
+	const char *enable_hpd = "1";
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+	hpd_fd = openat(fd, DEBUGFS_HPD_TRIGGER, O_WRONLY);
+	close(fd);
+	igt_assert(hpd_fd >= 0);
+
+	wr_len = write(hpd_fd, enable_hpd, strlen(enable_hpd));
+	close(hpd_fd);
+	igt_assert_eq(wr_len, strlen(enable_hpd));
+
+	return 0;
+}
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 6656d901..d333ad9c 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -24,8 +24,11 @@
 #define IGT_AMD_H
 
 #include <stdint.h>
+#include "igt.h"
 #include "igt_fb.h"
 
+#define DEBUGFS_HPD_TRIGGER "trigger_hotplug"
+
 uint32_t igt_amd_create_bo(int fd, uint64_t size);
 void *igt_amd_mmap_bo(int fd, uint32_t handle, uint64_t size, int prot);
 unsigned int igt_amd_compute_offset(unsigned int* swizzle_pattern,
@@ -40,4 +43,9 @@ void igt_amd_fb_to_tiled(struct igt_fb *dst, void *dst_buf, struct igt_fb *src,
 void igt_amd_fb_convert_plane_to_tiled(struct igt_fb *dst, void *dst_buf,
 				       struct igt_fb *src, void *src_buf);
 bool igt_amd_is_tiled(uint64_t modifier);
+
+/* IGT HPD helper functions */
+void igt_amd_require_hpd(igt_display_t *display, int drm_fd);
+int igt_amd_trigger_hotplug(int drm_fd, char *connector_name);
+
 #endif /* IGT_AMD_H */
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
new file mode 100644
index 00000000..7e6b63db
--- /dev/null
+++ b/tests/amdgpu/amd_hotplug.c
@@ -0,0 +1,184 @@
+/*
+ * Copyright 2021 Advanced Micro Devices, Inc.
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
+#include "igt_amd.h"
+
+IGT_TEST_DESCRIPTION("Test simulated hotplugging on connectors");
+
+/* Maximum pipes on any AMD ASIC. */
+#define MAX_PIPES 6
+
+/* Common test data. */
+typedef struct data {
+	igt_display_t display;
+	igt_plane_t *primary[MAX_PIPES];
+	igt_plane_t *overlay[MAX_PIPES];
+	igt_plane_t *cursor[MAX_PIPES];
+	igt_output_t *output[MAX_PIPES];
+	igt_pipe_t *pipe[MAX_PIPES];
+	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
+	drmModeModeInfo mode[MAX_PIPES];
+	enum pipe pipe_id[MAX_PIPES];
+	int w[MAX_PIPES];
+	int h[MAX_PIPES];
+	int fd;
+} data_t;
+
+static void test_init(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	int i, n, max_pipes = display->n_pipes;
+
+	for_each_pipe(display, i) {
+		data->pipe_id[i] = PIPE_A + i;
+		data->pipe[i] = &data->display.pipes[data->pipe_id[i]];
+		data->primary[i] = igt_pipe_get_plane_type(
+			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
+		data->overlay[i] = igt_pipe_get_plane_type_index(
+			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
+		data->cursor[i] = igt_pipe_get_plane_type(
+			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
+		data->pipe_crc[i] =
+			igt_pipe_crc_new(data->fd, data->pipe_id[i], "auto");
+	}
+
+	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
+		igt_output_t *output = &display->outputs[i];
+
+		data->output[n] = output;
+
+		/* Only allow physically connected displays for the tests. */
+		if (!igt_output_is_connected(output))
+			continue;
+
+		igt_assert(kmstest_get_connector_default_mode(
+			data->fd, output->config.connector, &data->mode[n]));
+
+		data->w[n] = data->mode[n].hdisplay;
+		data->h[n] = data->mode[n].vdisplay;
+
+		n += 1;
+	}
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
+		igt_pipe_crc_free(data->pipe_crc[i]);
+	}
+
+	igt_display_reset(display);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+}
+
+static void test_hotplug_basic(data_t *data, bool suspend)
+{
+	igt_output_t *output;
+	igt_fb_t ref_fb[MAX_PIPES];
+	igt_crc_t ref_crc[MAX_PIPES], new_crc[MAX_PIPES];
+	igt_display_t *display = &data->display;
+	int i = 0;
+
+	test_init(data);
+
+	/* Setup all outputs */
+	for (i = 0; i < display->n_pipes; i++) {
+		output = data->output[i];
+		if (!output || !igt_output_is_connected(output))
+			continue;
+
+		igt_create_pattern_fb(data->fd, data->w[i], data->h[i],
+				      DRM_FORMAT_XRGB8888, 0, &ref_fb[i]);
+		igt_output_set_pipe(output, data->pipe_id[i]);
+		igt_plane_set_fb(data->primary[i], &ref_fb[i]);
+	}
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
+
+	/* Collect reference CRCs */
+	for (i = 0; i < display->n_pipes; i++) {
+		output = data->output[i];
+		if (!output || !igt_output_is_connected(output))
+			continue;
+
+		igt_pipe_crc_collect_crc(data->pipe_crc[i], &ref_crc[i]);
+	}
+
+	if (suspend) {
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+	}
+
+	/* Trigger hotplug and confirm reference image is the same. */
+	for (i = 0; i < display->n_pipes; i++) {
+		output = data->output[i];
+		if (!output || !igt_output_is_connected(output))
+			continue;
+
+		igt_amd_trigger_hotplug(data->fd, output->name);
+
+		igt_pipe_crc_collect_crc(data->pipe_crc[i], &new_crc[i]);
+		igt_assert_crc_equal(&ref_crc[i], &new_crc[i]);
+		igt_remove_fb(data->fd, &ref_fb[i]);
+	}
+
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
+
+		igt_amd_require_hpd(&data.display, data.fd);
+	}
+
+	igt_describe("Tests HPD on each connected output");
+	igt_subtest("basic") test_hotplug_basic(&data, false);
+
+	igt_describe("Tests HPD on each connected output after a suspend sequence");
+	igt_subtest("basic-suspend") test_hotplug_basic(&data, true);
+
+	igt_fixture
+	{
+		igt_display_fini(&data.display);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 84179410..6aa10361 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -7,6 +7,7 @@ if libdrm_amdgpu.found()
 			  'amd_bypass',
 			  'amd_color',
 			  'amd_cs_nop',
+			  'amd_hotplug',
 			  'amd_info',
 			  'amd_prime',
 			  'amd_module_load',
-- 
2.32.0
