Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63420C0218B
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 12:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021DB10E25E;
	Fri, 24 Jan 2025 12:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1NDttA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2319D10E25E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737720317; x=1769256317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ALYmdS+bGc6qBzd9hzN2bDtC1/9f9Dvj4V6xy1ak8Rs=;
 b=B1NDttA0rQFxtOvibDhB88eIQ0EZSdD5CCFQe4XKv+eF3vHYJYkERJBb
 bjQyDLzurhLVX419tTsAftsH/bFK44WyAJekPpuRv5f+Bv6r8UxSwMtUs
 LpDXz1G6i3x+P6KGAPAp31h0Gan+MJNN7SjG2rWnPK2K1A9fkiZBcxbzf
 a7xl5uH+vclTTwI6E0uKPcBKEM1lxlw88y4MGG5V3ybkwiUhYQGQbYY71
 kY5fTYqJW82xDh0HklrEwAjKSD4dxjj/b6MMiemfMuB9MLN0ozayedjDh
 A/eVp1dnMC9r4Js/aAA9to6eD+0SK3fYJEH/auGYQuuvk86/radIWByXo A==;
X-CSE-ConnectionGUID: //cLTdrwROahZJs3oMU3/A==
X-CSE-MsgGUID: Yiixju0DRda61dF8fUczOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63603913"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="63603913"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:05:17 -0800
X-CSE-ConnectionGUID: K0G6KjCsQYGIwVc86Ly/Jg==
X-CSE-MsgGUID: ex4Nz9R8QUOzIsUcqVeTRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="138624988"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:05:15 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 1/1] tests/intel/kms_dirty_fbc: Add kms_dirty_fbc
 test for DIRTYFB ioctl with fbc
Date: Fri, 24 Jan 2025 17:33:35 +0530
Message-Id: <20250124120335.379855-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124120335.379855-1-santhosh.reddy.guddati@intel.com>
References: <20250124120335.379855-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

v2: Fix typo , add version check for feature support,
    extend support for all pipes (Rama Naidu).

v3: Add new subtest to scatter dirty rectangles at differnt places in a
    frame and commit all rectangles at once (Rama Naidu).
    Add a negative case with invalid coordinates (Vinod)

v4: Add subtest `fbc-dirty-rectangle-basic` to perform sanity checks
    by sending multiple damaged areas with non-PSR modes.(Vinod)
    Update `meson.build` to include the new test.

v5: Include checks to ensure FBC is enabled during tests.(Vinod)
    Add dynamic subtests for fbc-dirty-rectangle-different-formats
    and fbc-dirty-rectangle-dirtyfb-ioctl. (Vinod)

v6: Update meson.build to include kms_fbc_dirty_rect.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 348 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 349 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
new file mode 100644
index 000000000..b05367011
--- /dev/null
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -0,0 +1,348 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: kms dirty fbc
+ * Category: Display
+ * Description: Test DIRTYFB ioctl functionality with FBC enabled.
+ * Driver requirement: i915, xe
+ * Functionality: dirtyfb, fbc
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "i915/intel_fbc.h"
+
+enum operations {
+	FRONTBUFFER,
+};
+
+/**
+ * SUBTEST: fbc-dirty-rectangle-basic
+ * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
+ * Functionality: fbc
+ *
+ * SUBTEST: fbc-dirty-rectangle-different-formats
+ * Description: Sanity test to verify FBC DR by sending multiple
+ *              damaged areas with different formats.
+ * Functionality: fbc
+ *
+ * SUBTEST: fbc-dirty-rectangle-dirtyfb-ioctl
+ * Description: Sanity test to verify FBC DR by sending
+ *              multiple damaged areas with dirtyfb ioctl with fbc enabled.
+ * Functionality: fbc
+ */
+
+#define SQUARE_SIZE 100
+#define SQUARE_OFFSET 100
+#define SQUARE_OFFSET_2 600
+
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	igt_display_t display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	igt_pipe_crc_t *pipe_crc;
+	enum pipe pipe;
+	enum operations op;
+	u32 format;
+
+	igt_crc_t ref_crc;
+
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
+
+static void set_damage_clip(struct drm_mode_rect *damage, int x1, int y1, int x2, int y2)
+{
+	damage->x1 = x1;
+	damage->y1 = y1;
+	damage->x2 = x2;
+	damage->y2 = y2;
+}
+
+static void dirty_rect_create_fb(data_t *data, struct igt_fb *fb, int nrects,
+				 struct drm_mode_rect *rect)
+{
+	cairo_t *cr;
+
+	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 1.0, fb);
+
+	if (!nrects || !rect)
+		return;
+
+	cr = igt_get_cairo_ctx(data->drm_fd, fb);
+
+	for (int i = 0; i < nrects; i++) {
+		igt_paint_color_alpha(cr, rect[i].x1, rect[i].y1,
+				      rect[i].x2 - rect[i].x1,
+				      rect[i].y2 - rect[i].y1,
+				      1.0, 1.0, 1.0, 1.0);
+	}
+	igt_put_cairo_ctx(cr);
+}
+
+static void fbc_dirty_rectangle_complete_set(data_t *data)
+{
+	igt_pipe_crc_t *pipe_crc = data->pipe_crc;
+	igt_display_t *display = &data->display;
+	igt_output_t *output = data->output;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	struct igt_fb main_fb;
+	struct igt_fb rect_1_fb;
+	struct igt_fb rect_2_fb;
+	struct igt_fb rect_combined_fb;
+	struct drm_mode_rect rect1;
+	struct drm_mode_rect rect2;
+	struct drm_mode_rect rect_combined[2];
+	struct drm_mode_rect full_rect;
+	igt_crc_t main_fb_crc, rect_1_fb_crc, rect_2_fb_crc, rect_combined_fb_crc, crc;
+	int ret;
+
+	mode = igt_output_get_mode(output);
+	igt_output_set_pipe(output, data->pipe);
+	if (!pipe_crc) {
+		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
+					    IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_assert(pipe_crc);
+	}
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	set_damage_clip(&full_rect, 0, 0, mode->hdisplay-1, mode->vdisplay-1);
+	set_damage_clip(&rect1, SQUARE_OFFSET, SQUARE_OFFSET,
+			SQUARE_OFFSET + SQUARE_SIZE, SQUARE_OFFSET + SQUARE_SIZE);
+	set_damage_clip(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2,
+			SQUARE_OFFSET_2 + SQUARE_SIZE, SQUARE_OFFSET_2 + SQUARE_SIZE);
+	set_damage_clip(&rect_combined[0], rect1.x1, rect1.y1, rect1.x2, rect1.y2);
+	set_damage_clip(&rect_combined[1], rect2.x1, rect2.y1, rect2.x2, rect2.y2);
+
+	dirty_rect_create_fb(data, &main_fb, 0, NULL);
+	dirty_rect_create_fb(data, &rect_1_fb, 1, &rect1);
+	dirty_rect_create_fb(data, &rect_2_fb, 1, &rect2);
+	dirty_rect_create_fb(data, &rect_combined_fb, 2, rect_combined);
+
+	/* main_fb blank blue screen - get and store crc*/
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	dirty_rect_create_fb(data, &main_fb, 0, NULL);
+	dirty_rect_create_fb(data, &rect_1_fb, 1, &rect1);
+	dirty_rect_create_fb(data, &rect_2_fb, 1, &rect2);
+	dirty_rect_create_fb(data, &rect_combined_fb, 2, rect_combined);
+
+	/* main_fb blank blue screen - get and store crc*/
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &main_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Whole blue screen with one white rect and collect crc */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &rect_1_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &rect_1_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Second white rect and collect crc */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &rect_2_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &rect_2_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Both rects and collect crc */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &rect_combined_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &rect_combined_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Put full blank screen back */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &main_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Set combined rect - draw two white rects using damage area*/
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &rect_combined, sizeof(rect_combined));
+	igt_plane_set_fb(primary, &rect_combined_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Clear first rect using damage area. Only the second rect should be visible here! */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &rect1, sizeof(rect1));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	/* Clear the second rect as well. Now back to original blank screen */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &rect2, sizeof(rect2));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &main_fb_crc);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &main_fb);
+	igt_remove_fb(data->drm_fd, &rect_1_fb);
+	igt_remove_fb(data->drm_fd, &rect_2_fb);
+	igt_remove_fb(data->drm_fd, &rect_combined_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+
+	if (data->op == FRONTBUFFER) {
+		drmModeClip clip;
+		struct igt_fb fb;
+
+		clip.x1 = clip.y1 = SQUARE_OFFSET;
+		clip.x2 = clip.y2 = SQUARE_OFFSET + SQUARE_SIZE;
+
+		dirty_rect_create_fb(data, &fb, 1, (struct drm_mode_rect *)&clip);
+		ret = drmModeDirtyFB(data->drm_fd, fb.fb_id, &clip, 1);
+		igt_assert(ret == 0);
+	}
+}
+
+static void prepare_test(data_t *data, igt_output_t *output)
+{
+	bool is_fbc_supported = false;
+
+	is_fbc_supported = intel_fbc_supported_on_chipset(data->drm_fd, data->pipe);
+
+	igt_require_f(is_fbc_supported, "FBC not supported on this platform\n");
+
+	if (data->feature & FEATURE_FBC)
+		intel_fbc_enable(data->drm_fd);
+
+}
+
+static void fbc_dirty_rectangle_basic(data_t *data)
+{
+	prepare_test(data, NULL);
+	return fbc_dirty_rectangle_complete_set(data);
+}
+
+igt_main
+{
+	data_t data = {0};
+	int display_ver;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
+		kmstest_set_vt_graphics_mode();
+		igt_require_pipe_crc(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
+	}
+
+	igt_subtest_with_dynamic("fbc-dirty-rectangle-basic") {
+		data.feature = FEATURE_FBC;
+		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
+		for_each_pipe(&data.display, data.pipe) {
+			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+				data.mode = igt_output_get_mode(data.output);
+				igt_display_reset(&data.display);
+				igt_output_set_pipe(data.output, data.pipe);
+				igt_dynamic_f("%s-%s",
+					       kmstest_pipe_name(data.pipe),
+					       igt_output_name(data.output)) {
+					fbc_dirty_rectangle_basic(&data);
+				}
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("fbc-dirty-rectangle-different-formats") {
+		uint32_t formats[] = {DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_ARGB8888,
+				      DRM_FORMAT_RGB565};
+		int num_formats = ARRAY_SIZE(formats);
+
+		data.feature = FEATURE_FBC;
+		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
+
+		for_each_pipe(&data.display, data.pipe) {
+			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+				data.mode = igt_output_get_mode(data.output);
+				igt_display_reset(&data.display);
+				igt_output_set_pipe(data.output, data.pipe);
+
+				for (int i = 0; i < num_formats; i++) {
+					igt_dynamic_f("%s-%s-format-%s",
+						       kmstest_pipe_name(data.pipe),
+						       igt_output_name(data.output),
+						       igt_format_str(formats[i])) {
+						data.format = formats[i];
+						fbc_dirty_rectangle_basic(&data);
+					}
+				}
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("fbc-dirty-rectangle-dirtyfb-ioctl") {
+		data.feature = FEATURE_FBC;
+		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
+
+		for_each_pipe(&data.display, data.pipe) {
+			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+				data.mode = igt_output_get_mode(data.output);
+				igt_display_reset(&data.display);
+				igt_output_set_pipe(data.output, data.pipe);
+
+				igt_dynamic_f("%s-%s-dirtyfb-ioctl",
+					       kmstest_pipe_name(data.pipe),
+					       igt_output_name(data.output)) {
+					data.op = FRONTBUFFER;
+					data.format = DRM_FORMAT_XRGB8888;
+					fbc_dirty_rectangle_basic(&data);
+				}
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_display_fini(&data.display);
+		close(data.drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 33dffad31..2ac5ce309 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -268,6 +268,7 @@ intel_kms_progs = [
 	'kms_psr2_su',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
+        'kms_fbc_dirty_rect',
 ]
 
 intel_xe_progs = [
-- 
2.34.1

