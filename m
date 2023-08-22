Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED2010E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Aug 2023 20:32:06 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Aug 2023 22:31:55 +0200
Message-Id: <20230822203155.53830-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Revert "tests/amdgpu: Add test for ODM
 combine"
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

This reverts commit a609e0493580c9626fd93dabcf417a41640dcd58.

This commit breaks compilation on debian images in GitLab CI:

build:tests-debian-meson has failed (https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/-/jobs/47853345):
    ^~~~~~~~
  /usr/include/xf86drmMode.h:533:2: error: unknown type name ‘uint32_t’
    uint32_t lessees[0];
    ^~~~~~~~
  /usr/include/xf86drmMode.h:539:2: error: unknown type name ‘uint32_t’
    uint32_t count;
    ^~~~~~~~

Instead of including <xf86drmMode.h> in test, there should be
used igt_kms.h library or added <stdint.h>.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/amdgpu/amd_odm.c   | 189 ---------------------------------------
 tests/amdgpu/meson.build |   1 -
 2 files changed, 190 deletions(-)
 delete mode 100644 tests/amdgpu/amd_odm.c

diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
deleted file mode 100644
index 2781ad1c2..000000000
--- a/tests/amdgpu/amd_odm.c
+++ /dev/null
@@ -1,189 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyrights 2023 Advanced Micro Devices, Inc.
- */
-
-#include <fcntl.h>
-#include <stdio.h>
-#include <xf86drmMode.h>
-
-#include "igt.h"
-#include "igt_amd.h"
-#include "igt_edid.h"
-
-IGT_TEST_DESCRIPTION("Test whether ODM Combine mode is triggered when timings with high refresh "
-		     "rate is committed");
-
-enum odmc_mode {
-	ODMC_2_TO_1,
-	ODMC_4_TO_1,
-};
-
-/* Common test data. */
-struct data {
-	igt_display_t display;
-	igt_plane_t *primary;
-	igt_output_t *output;
-	igt_pipe_t *pipe;
-	drmModeModeInfoPtr mode;
-	enum pipe pipe_id;
-	int fd;
-};
-
-static const drmModeModeInfo test_mode[] = {
-	{ 1278720,
-	3840, 3952, 3984, 4000, 0,
-	2160, 2210, 2215, 2220, 0,
-	30,
-	DRM_MODE_FLAG_NHSYNC,
-	0x40,
-	"4k144\0",
-	}, /* from HP Omen 27c */
-
-};
-
-#define TEST_MODE_IDX_ODMC_2_TO_1 0
-
-static void test_init(struct data *data)
-{
-	igt_display_t *display = &data->display;
-
-	/* It doesn't matter which pipe we choose on amdpgu. */
-	data->pipe_id = PIPE_A;
-	data->pipe = &data->display.pipes[data->pipe_id];
-
-	igt_display_reset(display);
-
-	/* find a connected non-HDMI output */
-	data->output = NULL;
-	for (int i = 0; i < data->display.n_outputs; ++i) {
-		drmModeConnector *connector = data->display.outputs[i].config.connector;
-
-		if (connector->connection == DRM_MODE_CONNECTED)
-			data->output = &data->display.outputs[i];
-	}
-	igt_require_f(data->output, "Requires a connected output\n");
-
-	data->mode = igt_output_get_mode(data->output);
-	igt_assert(data->mode);
-
-	igt_skip_on_f(!igt_amd_output_has_odm_combine_segments(data->fd, data->output->name),
-		      "ASIC does not support reading ODM combine segments\n");
-
-	igt_skip_on_f(!is_dp_dsc_supported(data->fd, data->output->name),
-		      "The monitor must be DSC capable\n");
-
-	igt_skip_on_f(data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-		      data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB,
-		      "ODM Combine isn't supported on HDMI 1.x\n");
-
-	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-	igt_output_set_pipe(data->output, data->pipe_id);
-
-	igt_display_reset(display);
-}
-
-static void test_fini(struct data *data)
-{
-	igt_display_reset(&data->display);
-	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
-}
-
-/* Forces a mode for a connector. */
-static void force_output_mode(struct data *d, igt_output_t *output,
-			      const drmModeModeInfo *mode)
-{
-	/* This allows us to create a virtual sink. */
-	if (!igt_output_is_connected(output)) {
-		kmstest_force_edid(d->fd, output->config.connector,
-				   igt_kms_get_4k_edid());
-
-		kmstest_force_connector(d->fd, output->config.connector,
-					FORCE_CONNECTOR_DIGITAL);
-	}
-
-	igt_output_override_mode(output, mode);
-}
-
-static void run_test_odmc(struct data *data, enum odmc_mode m, const drmModeModeInfo *mode)
-{
-	igt_display_t *display = &data->display;
-	struct igt_fb buffer;
-	char buf[256];
-	int ret, seg, fd;
-	int i = 0;
-
-	test_init(data);
-
-	force_output_mode(data, data->output, mode);
-
-	igt_create_color_fb(display->drm_fd, mode->hdisplay,
-			    mode->vdisplay, DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
-			    &buffer);
-
-	igt_output_set_pipe(data->output, i);
-
-	igt_plane_set_fb(data->primary, &buffer);
-
-	ret = igt_display_try_commit_atomic(display,
-					    DRM_MODE_ATOMIC_ALLOW_MODESET |
-					    DRM_MODE_ATOMIC_TEST_ONLY,
-					    NULL);
-	igt_skip_on_f(ret != 0, "Unsupported mode\n");
-
-	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
-	igt_assert(fd >= 0);
-
-	ret = igt_debugfs_simple_read(fd, "odm_combine_segments", buf, sizeof(buf));
-	close(fd);
-	igt_require(ret > 0);
-
-	seg = strtol(buf, NULL, 0);
-
-	switch (m) {
-	case ODMC_2_TO_1:
-		igt_assert_f(seg == 2,
-			     "ODM Combine uses %d segments for connector %s, expected 2\n",
-			     seg, data->output->name);
-		break;
-	case ODMC_4_TO_1:
-		igt_assert_f(seg == 4,
-			     "ODM Combine uses %d segments for connector %s, expected 4\n",
-			     seg, data->output->name);
-		break;
-	}
-
-	igt_remove_fb(display->drm_fd, &buffer);
-
-	test_fini(data);
-}
-
-igt_main
-{
-	struct data data;
-
-	memset(&data, 0, sizeof(data));
-
-	igt_fixture
-	{
-		data.fd = drm_open_driver_master(DRIVER_ANY);
-
-		kmstest_set_vt_graphics_mode();
-
-		igt_display_require(&data.display, data.fd);
-		igt_require(&data.display.is_atomic);
-		igt_display_require_output(&data.display);
-
-	}
-
-	igt_subtest_f("odm-combine-2-to-1-%s", test_mode[TEST_MODE_IDX_ODMC_2_TO_1].name)
-		run_test_odmc(&data, ODMC_2_TO_1, &test_mode[TEST_MODE_IDX_ODMC_2_TO_1]);
-
-	igt_fixture
-	{
-		igt_display_fini(&data.display);
-	}
-}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 6032a38e8..6c6166167 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -35,7 +35,6 @@ if libdrm_amdgpu.found()
 			  'amd_vm',
 			  'amd_vrr_range',
 			  'amd_mall',
-			  'amd_odm',
 			]
 	amdgpu_deps += libdrm_amdgpu
 endif
-- 
2.39.2
