Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1755C10E405
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:34:14 +0000 (UTC)
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Aug 2023 11:33:45 +0300
Message-Id: <20230809083345.1759961-5-jouni.hogander@intel.com>
In-Reply-To: <20230809083345.1759961-1-jouni.hogander@intel.com>
References: <20230809083345.1759961-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v7 4/4] tests/kms_dirtyfb: Add new test for
 dirtyfb ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add new test to validate dirtyfb ioctl is working properly with GPU
frontbuffer rendering.

Create big framebuffer and use only lower right corner for the
plane. Initiate GPU drawing for a rectangle over the whole
framebuffer and perform dirtyfb ioctl. Then wait for the drawing to
complete and collect crc and check that it matches with expected.

v6:
 - Perform igt_display_reset in prepare
v5:
 - Modifiations to support Xe as well
v4:
 - Check connector type when PSR is tested
v3:
 - Use spinner
 - Drop allocating big frambuffers
v2:
 - Change license comment
 - Move disable_features and do not apply for FEATURE_DEFAULT

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_dirtyfb.c | 303 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 304 insertions(+)
 create mode 100644 tests/i915/kms_dirtyfb.c

diff --git a/tests/i915/kms_dirtyfb.c b/tests/i915/kms_dirtyfb.c
new file mode 100644
index 000000000..4e49574a2
--- /dev/null
+++ b/tests/i915/kms_dirtyfb.c
@@ -0,0 +1,303 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <sys/types.h>
+
+#include "igt.h"
+#include "igt_psr.h"
+
+#include "i915/intel_drrs.h"
+#include "i915/intel_fbc.h"
+
+#include "xe/xe_query.h"
+
+IGT_TEST_DESCRIPTION("Test the DIRTYFB ioctl is working properly with "
+		     "its related features: FBC, PSR and DRRS");
+
+#ifndef PAGE_ALIGN
+#ifndef PAGE_SIZE
+#define PAGE_SIZE 4096
+#endif
+#define PAGE_ALIGN(x) ALIGN(x, PAGE_SIZE)
+#endif
+
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	igt_display_t display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	igt_pipe_crc_t *pipe_crc;
+	enum pipe pipe;
+
+	struct igt_fb fbs[3];
+
+	igt_crc_t ref_crc;
+
+	struct buf_ops *bops;
+	enum {
+		FEATURE_NONE  = 0,
+		FEATURE_PSR   = 1,
+		FEATURE_FBC   = 2,
+		FEATURE_DRRS  = 4,
+		FEATURE_COUNT = 8,
+		FEATURE_DEFAULT = 8,
+	} feature;
+} data_t;
+
+static const char *feature_str(int feature)
+{
+	switch (feature) {
+	case FEATURE_NONE:
+		return "nop";
+	case FEATURE_FBC:
+		return "fbc";
+	case FEATURE_PSR:
+		return "psr";
+	case FEATURE_DRRS:
+		return "drrs";
+	case FEATURE_DEFAULT:
+		return "default";
+	default:
+		igt_assert(false);
+	}
+}
+
+static bool check_support(data_t *data)
+{
+	switch (data->feature) {
+	case FEATURE_NONE:
+		return true;
+	case FEATURE_FBC:
+		return intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
+	case FEATURE_PSR:
+		if (data->output->config.connector->connector_type !=
+		    DRM_MODE_CONNECTOR_eDP)
+			return false;
+		return psr_sink_support(data->drm_fd, data->debugfs_fd,
+					PSR_MODE_1);
+	case FEATURE_DRRS:
+		return intel_is_drrs_supported(data->drm_fd, data->pipe) &&
+			intel_output_has_drrs(data->drm_fd, data->output);
+	case FEATURE_DEFAULT:
+		return true;
+	default:
+		igt_assert(false);
+	}
+}
+
+static void enable_feature(data_t *data)
+{
+	switch (data->feature) {
+	case FEATURE_NONE:
+		break;
+	case FEATURE_FBC:
+		intel_fbc_enable(data->drm_fd);
+		break;
+	case FEATURE_PSR:
+		psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1);
+		break;
+	case FEATURE_DRRS:
+		intel_drrs_enable(data->drm_fd, data->pipe);
+		break;
+	case FEATURE_DEFAULT:
+		break;
+	default:
+		igt_assert(false);
+	}
+}
+
+static void check_feature(data_t *data)
+{
+	switch (data->feature) {
+	case FEATURE_NONE:
+		break;
+	case FEATURE_FBC:
+		igt_assert_f(intel_fbc_wait_until_enabled(data->drm_fd,
+							  data->pipe),
+			     "FBC still disabled");
+		break;
+	case FEATURE_PSR:
+		igt_assert_f(psr_wait_entry(data->debugfs_fd, PSR_MODE_1),
+			     "PSR still disabled\n");
+		break;
+	case FEATURE_DRRS:
+		igt_assert_f(intel_is_drrs_inactive(data->drm_fd, data->pipe),
+			     "DRRS INACTIVE\n");
+		break;
+	case FEATURE_DEFAULT:
+		break;
+	default:
+		igt_assert(false);
+	}
+}
+
+static void disable_features(data_t *data)
+{
+	intel_fbc_disable(data->drm_fd);
+	psr_disable(data->drm_fd, data->debugfs_fd);
+	intel_drrs_disable(data->drm_fd, data->pipe);
+}
+
+static void prepare(data_t *data)
+{
+	igt_plane_t *primary;
+
+	igt_skip_on(!check_support(data));
+
+	igt_display_reset(&data->display);
+
+	data->mode = igt_output_get_mode(data->output);
+
+	igt_output_set_pipe(data->output, data->pipe);
+
+	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+					 IGT_PIPE_CRC_SOURCE_AUTO);
+
+	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
+			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+			    &data->fbs[0]);
+
+	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
+			 IGT_DRAW_RENDER, 0, 0, data->fbs[0].width,
+			 data->fbs[0].height, 0xFF);
+
+	primary = igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+
+	igt_plane_set_fb(primary, &data->fbs[0]);
+
+	if (data->feature != FEATURE_DEFAULT)
+		disable_features(data);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	igt_pipe_crc_collect_crc(data->pipe_crc, &data->ref_crc);
+
+	igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,
+			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+			    &data->fbs[1]);
+	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
+			 IGT_DRAW_RENDER, 0, 0, data->fbs[1].width,
+			 data->fbs[1].height, 0xFF);
+
+	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
+			     data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+			    &data->fbs[2]);
+
+	igt_plane_set_fb(primary, &data->fbs[2]);
+
+	enable_feature(data);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
+	check_feature(data);
+}
+
+static void cleanup(data_t *data)
+{
+	igt_remove_fb(data->drm_fd, &data->fbs[0]);
+	igt_remove_fb(data->drm_fd, &data->fbs[1]);
+	igt_remove_fb(data->drm_fd, &data->fbs[2]);
+
+	igt_pipe_crc_free(data->pipe_crc);
+
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+}
+
+static void run_test(data_t *data)
+{
+	igt_crc_t crc;
+	struct intel_buf *src, *dst;
+	struct intel_bb *ibb;
+	igt_spin_t *spin;
+	uint32_t devid = intel_get_drm_devid(data->drm_fd);
+	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
+	int r;
+
+	igt_skip_on(!rendercopy);
+
+	src = intel_buf_create_full(data->bops, data->fbs[1].gem_handle,
+				    data->fbs[1].width,
+				    data->fbs[1].height,
+				    igt_drm_format_to_bpp(data->fbs[1].drm_format),
+				    0,
+				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
+				    0, 0, 0, is_xe_device(data->drm_fd) ?
+				    system_memory(data->drm_fd) : 0);
+	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
+				    data->fbs[2].width,
+				    data->fbs[2].height,
+				    igt_drm_format_to_bpp(data->fbs[2].drm_format),
+				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
+				    0, 0, 0, is_xe_device(data->drm_fd) ?
+				    system_memory(data->drm_fd) : 0);
+	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
+
+	spin = igt_spin_new(data->drm_fd, .ahnd = ibb->allocator_handle);
+	igt_spin_set_timeout(spin, NSEC_PER_SEC);
+
+	rendercopy(ibb, src, 0, 0, data->fbs[2].width, data->fbs[2].height, dst, 0, 0);
+
+	/* Perfom dirtyfb right after initiating rendercopy */
+	r = drmModeDirtyFB(data->drm_fd, data->fbs[2].fb_id, NULL, 0);
+	igt_assert(r == 0 || r == -ENOSYS);
+
+	/* Ensure rendercopy is complete */
+	intel_bb_sync(ibb);
+
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &data->ref_crc);
+
+	igt_spin_free(data->drm_fd, spin);
+	intel_bb_destroy(ibb);
+	intel_buf_destroy(src);
+	intel_buf_destroy(dst);
+}
+
+igt_main
+{
+	data_t data = {};
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
+		kmstest_set_vt_graphics_mode();
+
+		igt_display_require(&data.display, data.drm_fd);
+
+		data.bops = buf_ops_create(data.drm_fd);
+
+		igt_display_reset(&data.display);
+	}
+
+	igt_describe("Test dirtyFB ioctl");
+	igt_subtest_with_dynamic("dirtyfb-ioctl") {
+		data.pipe = PIPE_A;
+		for_each_valid_output_on_pipe(&data.display, data.pipe,
+					      data.output) {
+			for (data.feature = FEATURE_DEFAULT; data.feature > 0;
+			     data.feature = data.feature >> 1) {
+				igt_dynamic_f("%s-%s", feature_str(data.feature),
+					      igt_output_name(data.output)) {
+					prepare(&data);
+					run_test(&data);
+					cleanup(&data);
+				}
+			}
+		}
+	}
+
+	igt_fixture {
+		buf_ops_destroy(data.bops);
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 58061dbc2..7b621220c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -240,6 +240,7 @@ i915_progs = [
 	'kms_busy',
 	'kms_ccs',
 	'kms_cdclk',
+	'kms_dirtyfb',
 	'kms_draw_crc',
 	'kms_dsc',
 	'kms_fb_coherency',
-- 
2.34.1
