Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA44510E720
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jan 2022 07:50:18 +0000 (UTC)
From: Wayne Lin <Wayne.Lin@amd.com>
Date: Thu, 20 Jan 2022 15:49:31 +0800
Message-ID: <20220120074931.22880-3-Wayne.Lin@amd.com>
In-Reply-To: <20220120074931.22880-1-Wayne.Lin@amd.com>
References: <20220120074931.22880-1-Wayne.Lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/2] test/amdgpu: Add ilr test
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
Cc: Wayne Lin <Wayne.Lin@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

[Why & How]
Add new igt test amd_ilr for ilr fature

Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
---
 lib/igt_amd.c            | 112 ++++++++++++++++
 lib/igt_amd.h            |   8 ++
 tests/amdgpu/amd_ilr.c   | 275 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 4 files changed, 396 insertions(+)
 create mode 100644 tests/amdgpu/amd_ilr.c

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 92766a30..b81fa948 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -892,3 +892,115 @@ bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name)
 	close(fd);
 	return true;
 }
+
+/*
+ * igt_amd_read_ilr_setting:
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The name of the connector to read the link_settings
+ * @supported_ilr: supported link rates
+ *
+ * The indices of @supported_ilr correspond to the supported customized
+ * link rates reported from DPCD 00010h ~ 0001Fh
+ */
+void igt_amd_read_ilr_setting(
+	int drm_fd, char *connector_name, int *supported_ilr)
+{
+	int fd, ret;
+	char buf[256] = {'\0'};
+	int i = 0;
+	char *token_end, *val_token, *tmp;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	if (fd < 0) {
+		igt_info("Could not open connector %s debugfs directory\n",
+			 connector_name);
+		return;
+	}
+	ret = igt_debugfs_simple_read(fd, DEBUGFS_DP_ILR_SETTING, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Reading %s for connector %s failed.\n",
+		     DEBUGFS_DP_ILR_SETTING, connector_name);
+
+	close(fd);
+
+	tmp = strstr(buf, "not supported");
+	if (tmp) {
+		igt_info("Connector %s: eDP panel doesn't support ILR\n%s",
+			 connector_name, buf);
+		return;
+	}
+
+	/* Parse values read from file. */
+	for (char *token = strtok_r(buf, "\n", &token_end);
+	     token != NULL;
+	     token = strtok_r(NULL, "\n", &token_end))
+	{
+		strtok_r(token, "] ", &val_token);
+		supported_ilr[i] = strtol(val_token, &val_token, 10);
+		i++;
+
+		if (i > 7) return;
+	}
+}
+
+/*
+ * igt_amd_write_link_settings:
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The name of the connector to write the link_settings
+ * @lane_count: Lane count
+ * @link_rate_set: Intermediate link rate
+ */
+void igt_amd_write_ilr_setting(
+	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
+	uint8_t link_rate_set)
+{
+	int ls_fd, fd;
+	const int buf_len = 40;
+	char buf[buf_len];
+	int wr_len = 0;
+
+	memset(buf, '\0', sizeof(char) * buf_len);
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
+	igt_assert(fd >= 0);
+	ls_fd = openat(fd, DEBUGFS_DP_ILR_SETTING, O_WRONLY);
+	close(fd);
+	igt_assert(ls_fd >= 0);
+
+	/* edp_ilr_write expects a \n at the end or else it will
+	 * dereference a null pointer.
+	 */
+	snprintf(buf, sizeof(buf), "%02x %02x \n", lane_count, link_rate_set);
+
+	wr_len = write(ls_fd, buf, strlen(buf));
+	igt_assert_eq(wr_len, strlen(buf));
+
+	close(ls_fd);
+}
+
+/**
+ * igt_amd_output_has_ilr_setting: check if connector has ilr_setting debugfs entry
+ * @drm_fd: DRM file descriptor
+ * @connector_name: The connector's name, on which we're reading the status
+ */
+bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name)
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
+	res = fstatat(fd, DEBUGFS_DP_ILR_SETTING, &stat, 0);
+	if (res != 0) {
+		igt_info("output %s: %s debugfs not supported\n", connector_name, DEBUGFS_DP_ILR_SETTING);
+		close(fd);
+		return false;
+	}
+
+	close(fd);
+	return true;
+}
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 7a91cbff..1c99d331 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -42,6 +42,8 @@
 #define DEBUGFS_DP_LINK_SETTINGS "link_settings"
 #define DEBUGFS_HPD_TRIGGER "trigger_hotplug"
 
+#define DEBUGFS_DP_ILR_SETTING "ilr_setting"
+
 enum amd_dsc_clock_force {
 	DSC_AUTOMATIC = 0,
 	DSC_FORCE_ON,
@@ -126,5 +128,11 @@ void igt_amd_write_link_settings(
 	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
 	enum dc_link_rate link_rate, enum dc_link_training_type training_type);
 bool igt_amd_output_has_link_settings(int drm_fd, char *connector_name);
+void igt_amd_read_ilr_setting(
+	int drm_fd, char *connector_name, int *supported_ilr);
+void igt_amd_write_ilr_setting(
+	int drm_fd, char *connector_name, enum dc_lane_count lane_count,
+	uint8_t link_rate_set);
+bool igt_amd_output_has_ilr_setting(int drm_fd, char *connector_name);
 
 #endif /* IGT_AMD_H */
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
new file mode 100644
index 00000000..e3853254
--- /dev/null
+++ b/tests/amdgpu/amd_ilr.c
@@ -0,0 +1,275 @@
+/*
+ * Copyright 2022 Advanced Micro Devices, Inc.
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
+#include "igt_sysfs.h"
+#include <dirent.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+
+typedef struct {
+	int drm_fd;
+	igt_display_t display;
+	igt_plane_t *primary;
+	igt_output_t *output;
+	igt_fb_t fb;
+	igt_pipe_t *pipe;
+	igt_pipe_crc_t *pipe_crc;
+	igt_crc_t crc_dprx;
+	enum pipe pipe_id;
+	int connector_type;
+	int supported_ilr[8];
+	int lane_count[4], link_rate[4], link_spread_spectrum[4];
+} data_t;
+
+enum sub_test {
+	ILR_LINK_TRAINING_CONFIGS,
+	ILR_POLICY
+};
+
+enum link_settings {
+	CURRENT,
+	VERIFIED,
+	REPORTED,
+	PREFERRED
+};
+
+static void test_fini(data_t *data)
+{
+	igt_pipe_crc_free(data->pipe_crc);
+	igt_display_reset(&data->display);
+}
+
+static void set_all_output_pipe_to_none(data_t *data)
+{
+	igt_output_t *output;
+
+	for_each_connected_output(&data->display, output) {
+		igt_output_set_pipe(output, PIPE_NONE);
+	}
+
+	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+}
+
+static void test_init(data_t *data, igt_output_t *output)
+{
+	enum pipe pipe;
+
+	igt_require(output->config.connector->count_modes >= 1);
+
+	set_all_output_pipe_to_none(data);
+
+	for_each_pipe(&data->display, pipe) {
+		if (igt_pipe_connector_valid(pipe, output)) {
+			data->pipe_id = pipe;
+			break;
+		}
+	}
+
+	data->connector_type = output->config.connector->connector_type;
+
+	igt_require(data->pipe_id != PIPE_NONE);
+
+	data->pipe = &data->display.pipes[data->pipe_id];
+
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
+					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
+
+	igt_output_set_pipe(output, data->pipe_id);
+
+	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+}
+
+static void test_ilr_link_training_configs(data_t *data, igt_output_t *output)
+{
+	int reported_lc, idx;
+
+	reported_lc = data->lane_count[REPORTED];
+
+	/* If ILR is supported */
+	if (data->supported_ilr[0] != 0) {
+		for (idx = 0; idx < 8 && data->supported_ilr[idx] != 0; idx++) {
+			igt_amd_write_ilr_setting(data->drm_fd, output->name,
+				reported_lc, idx);
+			igt_info("Write training setting - lane count:%d, supported link rate idx:%d\n",
+				reported_lc, idx);
+
+			igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
+				   data->link_rate, data->link_spread_spectrum);
+			igt_info("Actual link result - lane count:%d, link rate:0x%02X\n",
+					data->lane_count[CURRENT], data->link_rate[CURRENT]);
+
+			/* Check lane count and link rate are trained at desired config*/
+			igt_assert(reported_lc == data->lane_count[CURRENT]);
+			igt_assert(data->supported_ilr[idx] == data->link_rate[CURRENT] * 270000);
+		}
+	}
+}
+
+static void test_ilr_policy(data_t *data, igt_output_t *output)
+{
+	drmModeConnector *connector;
+	drmModeModeInfo *mode;
+	int idx = 0, link_rate_set = 0;
+	int current_link_rate;
+	char *crc_str;
+
+	igt_info("Policy test on %s\n", output->name);
+
+	connector = output->config.connector;
+	for (idx = 0; idx < connector->count_modes; idx++) {
+		mode = &connector->modes[idx];
+		igt_info("[%d]: htotal:%d vtotal:%d vrefresh:%d clock:%d\n", idx, mode->hdisplay,
+		     mode->vdisplay, mode->vrefresh, mode->clock);
+
+		/* Set test pattern*/
+		igt_output_override_mode(output, mode);
+		igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
+				      mode->vdisplay, DRM_FORMAT_XRGB8888,
+				      0, &data->fb);
+		igt_plane_set_fb(data->primary, &data->fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
+					   data->link_rate, data->link_spread_spectrum);
+
+		igt_info("link result - lane count:%d, link rate:0x%02X\n",
+					data->lane_count[CURRENT], data->link_rate[CURRENT]);
+
+		current_link_rate = data->link_rate[CURRENT] * 270000;
+
+		/* Get current link_rate_set index after link training*/
+		for (link_rate_set = 0; link_rate_set < sizeof(data->supported_ilr) &&
+		 data->supported_ilr[link_rate_set] != 0; link_rate_set++) {
+			if (data->supported_ilr[link_rate_set] == current_link_rate)
+				break;
+		}
+
+		/* Firstly check driver does use ILR link setting */
+		igt_assert(link_rate_set < sizeof(data->supported_ilr));
+		igt_assert(data->supported_ilr[link_rate_set] > 0);
+
+		/* Secondly check trained BW is sufficient.
+		 * If BW is insufficient, crc retrieving will timeout
+		 */
+		igt_wait_for_vblank_count(data->drm_fd,
+					data->pipe->crtc_offset, 10);
+
+		igt_pipe_crc_collect_crc(data->pipe_crc, &data->crc_dprx);
+		crc_str = igt_crc_to_string(&data->crc_dprx);
+		igt_info("DP_RX CRC: %s\n", crc_str);
+	}
+
+
+}
+
+static void test_flow(data_t *data, enum sub_test option)
+{
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+
+	igt_enable_connectors(data->drm_fd);
+
+	for_each_connected_output(&data->display, output) {
+		if (!igt_amd_output_has_ilr_setting(data->drm_fd, output->name) ||
+			!igt_amd_output_has_link_settings(data->drm_fd, output->name)) {
+			igt_info("Skipping output: %s\n", output->name);
+			continue;
+		}
+
+		igt_info("Testing on output: %s\n", output->name);
+
+		/* Init only if display supports ilr link settings */
+		test_init(data, output);
+
+		mode = igt_output_get_mode(output);
+		igt_assert(mode);
+
+		/* Set test pattern*/
+		igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
+				      mode->vdisplay, DRM_FORMAT_XRGB8888,
+				      0, &data->fb);
+		igt_plane_set_fb(data->primary, &data->fb);
+		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Collect info of Reported Lane Count & ILR */
+		igt_amd_read_link_settings(data->drm_fd, output->name, data->lane_count,
+					   data->link_rate, data->link_spread_spectrum);
+		igt_amd_read_ilr_setting(data->drm_fd, output->name, data->supported_ilr);
+
+		switch (option) {
+			case ILR_LINK_TRAINING_CONFIGS:
+				test_ilr_link_training_configs(data, output);
+				break;
+			case ILR_POLICY:
+				test_ilr_policy(data, output);
+				break;
+			default:
+				break;
+		}
+
+		/* Reset preferred link settings*/
+		memset(data->supported_ilr, 0, sizeof(data->supported_ilr));
+		igt_amd_write_ilr_setting(data->drm_fd, output->name, 0, 0);
+
+		igt_remove_fb(data->drm_fd, &data->fb);
+
+		test_fini(data);
+	}
+
+}
+
+igt_main
+{
+	data_t data;
+	memset(&data, 0, sizeof(data));
+
+	igt_skip_on_simulation();
+
+	igt_fixture
+	{
+		data.drm_fd = drm_open_driver_master(DRIVER_AMDGPU);
+		if (data.drm_fd == -1)
+			igt_skip("Not an amdgpu driver.\n");
+
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+		igt_require(data.display.is_atomic);
+		igt_display_require_output(&data.display);
+	}
+
+	igt_describe("Test intermediate link rate (ILR) by phy and policy perspective");
+	igt_subtest("ilr-link-training-configs")
+		test_flow(&data, ILR_LINK_TRAINING_CONFIGS);
+	igt_subtest("ilr-policy")
+		test_flow(&data, ILR_POLICY);
+
+	igt_fixture
+	{
+		igt_display_fini(&data.display);
+	}
+}
+
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 0ccbb36d..f4a0b9fd 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -20,6 +20,7 @@ if libdrm_amdgpu.found()
 			  'amd_dp_dsc',
 			  'amd_psr',
 			  'amd_plane',
+			  'amd_ilr',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.25.1
