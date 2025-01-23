Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F702C02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 08:11:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7C610E790;
	Thu, 23 Jan 2025 08:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7jxZiMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C4F10E790
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 08:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737619912; x=1769155912;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iyg+y2DzvArmVnG0uY5ger8DZBdQn3zBUuLag4C0DAQ=;
 b=X7jxZiMK5VrdEujeYouP9G5CzpIGzcFTANBGbQ1OtqnypNzNTSbIybaH
 dY5xLLakJFrs2DfBG3FSWiQX3EI7ZMlCsOAjYWOorCYVPtAejzeLSzMeh
 kz+o9S2ko7AfOzpFMxf+5SYG4uDyh8+1Cw5RnznhvZoEmppgOwBK+dAYT
 k6mYRORAibjOK/gjn8JaybrMM84Y1DqSfoAN6ScE0LJ8R37vwcmf7sc/x
 jZm7V06qLhSIrhKPZGnnUhqZrKIF1d1wAhlbp5QQT5e9RjqsgTakJwNql
 B79dmwMpcEWx1LTboHHuByCScMkMY37bZLRFphnTwfhjIfV1DoGGy1sVY w==;
X-CSE-ConnectionGUID: 09PYT+zySQq81OuHzLx+xA==
X-CSE-MsgGUID: dpCf/GUyRaWCKFvsx7iklg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38272073"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="38272073"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 00:11:52 -0800
X-CSE-ConnectionGUID: HYldGyd0QGq//VeSrXctuA==
X-CSE-MsgGUID: dPj9CU3NRYGzBuYQD99KCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107201766"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 00:11:50 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 1/1] tests/intel/kms_dirty_fbc: Add kms_dirty_fbc
 test for DIRTYFB ioctl with fbc
Date: Thu, 23 Jan 2025 13:40:14 +0530
Message-Id: <20250123081014.120066-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250123081014.120066-1-santhosh.reddy.guddati@intel.com>
References: <20250123081014.120066-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_dirty_fbc.c | 252 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 253 insertions(+)
 create mode 100644 tests/intel/kms_dirty_fbc.c

diff --git a/tests/intel/kms_dirty_fbc.c b/tests/intel/kms_dirty_fbc.c
new file mode 100644
index 000000000..cd52c5070
--- /dev/null
+++ b/tests/intel/kms_dirty_fbc.c
@@ -0,0 +1,252 @@
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
+/**
+ * SUBTEST: fbc-dirty-rectangle-basic
+ * Description: Sanity test to verify FBC DR by sending multiple damaged areas with non psr modes
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
+
+	/* Whole blue screen with one white rect and collect crc */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &rect_1_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &rect_1_fb_crc);
+
+	/* Second white rect and collect crc */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &rect_2_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &rect_2_fb_crc);
+
+	/* Both rects and collect crc */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &rect_combined_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &rect_combined_fb_crc);
+
+	/* Put full blank screen back */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &full_rect, sizeof(full_rect));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &main_fb_crc);
+
+	/* Set combined rect - draw two white rects using damage area*/
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &rect_combined, sizeof(rect_combined));
+	igt_plane_set_fb(primary, &rect_combined_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
+
+	/* Clear first rect using damage area. Only the second rect should be visible here! */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &rect1, sizeof(rect1));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
+
+	/* Clear the second rect as well. Now back to original blank screen */
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS,
+				    &rect2, sizeof(rect2));
+	igt_plane_set_fb(primary, &main_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc);
+	igt_assert_crc_equal(&crc, &main_fb_crc);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &main_fb);
+	igt_remove_fb(data->drm_fd, &rect_1_fb);
+	igt_remove_fb(data->drm_fd, &rect_2_fb);
+	igt_remove_fb(data->drm_fd, &rect_combined_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
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
+					      kmstest_pipe_name(data.pipe),
+					      igt_output_name(data.output)) {
+					      fbc_dirty_rectangle_basic(&data);
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
index 33dffad31..d569cce8e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -268,6 +268,7 @@ intel_kms_progs = [
 	'kms_psr2_su',
 	'kms_psr_stress_test',
 	'kms_pwrite_crc',
+        'kms_dirty_fbc',
 ]
 
 intel_xe_progs = [
-- 
2.34.1

