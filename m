Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1F8C0218F
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 02:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E154010E3AC;
	Mon,  3 Feb 2025 02:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T55x9msa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAEB10E3A8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 02:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738550951; x=1770086951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ic4mUn9m3eMuY+ipr8SSI/0B+NPvojAeEqaGsFvm+u8=;
 b=T55x9msav+18pwkaDLcYaUnHBOY49wrUdCj0gt6n7NOk+pbhj9PzHakd
 okVYDF8gcd8wuwXkCh6q34ltaxyNtUI888QBs7HTaHcke1JdeXfV8jFA9
 +LsS26hB9V4Rzyy9+xCTSoI2l4ZimjYOyED7j2zJet5+YPv1SpiqA1bt+
 mYfWSIe3xK7lE+zsQV2memjHX+bGb8nMBQ/C16VSkxECV3AgekfHs+1G0
 fLjXGSmATYybSNFkMEDnkoyDHvF2VOG5eDIozet61id7X+Z0tdeFj90xH
 IER/0mSF2oEiecM/l0+FjX1tc1x9LqW6rQL6qFJ9M6rFaPSWx62YeTXZF g==;
X-CSE-ConnectionGUID: P7S+T3UERC+wIM3pFC+egg==
X-CSE-MsgGUID: Vvw9t4opSTOLWlZyCu/Sog==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="39064376"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="39064376"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 18:49:11 -0800
X-CSE-ConnectionGUID: +9yw6BnzQa66bTkmKbfG8Q==
X-CSE-MsgGUID: PG2y0IUFQV6aEIWqDGh1hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114185212"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2025 18:49:08 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v7 1/1] tests/intel/kms_dirty_fbc: Add kms_dirty_fbc
 test for DIRTYFB ioctl with fbc
Date: Mon,  3 Feb 2025 08:16:52 +0530
Message-Id: <20250203024652.441405-2-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203024652.441405-1-santhosh.reddy.guddati@intel.com>
References: <20250203024652.441405-1-santhosh.reddy.guddati@intel.com>
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

- Introduce new test file kms_fbc_dirty_rect.c to verify
  DIRTYFB ioctl functionality with FBC enabled.
- Added subtests for basic FBC dirty rectangle, different formats,
  and dirtyfb ioctl.
- Update meson.build to include the new test.

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

v7: Add commit description, remove i915 check and remove
    redundant checks (Swathi)
    Reformat code by removing redundant usage.
    Add new test to verify dirty rect outside-visible-region.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbc_dirty_rect.c | 324 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 325 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
new file mode 100644
index 000000000..b72c98ed3
--- /dev/null
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -0,0 +1,324 @@
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
+ *
+ * SUBTEST: fbc-dirty-rectangle-different-formats
+ * Description: Sanity test to verify FBC DR by sending multiple
+ *              damaged areas with different formats.
+ *
+ * SUBTEST: fbc-dirty-rectangle-outside-visible-region
+ * Description: Test that FBC DR works with damage area outside the visible region
+ */
+
+#define SQUARE_SIZE 100
+#define SQUARE_OFFSET 100
+#define SQUARE_OFFSET_2 600
+#define SQUARE_OFFSET_OUT 1000
+
+typedef struct {
+	int drm_fd;
+	int debugfs_fd;
+	igt_display_t display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	igt_pipe_crc_t *pipe_crc;
+	enum pipe pipe;
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
+static void set_and_check_crc(data_t *data, igt_plane_t *primary,
+			      igt_pipe_crc_t *pipe_crc, struct igt_fb *fb,
+			      struct drm_mode_rect *rect, int rect_size,
+			      igt_crc_t *expected_crc)
+{
+	igt_plane_replace_prop_blob(primary, IGT_PLANE_FB_DAMAGE_CLIPS, rect, rect_size);
+	igt_plane_set_fb(primary, fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
+					  IGT_LOG_WARN), "FBC is not enabled\n");
+	igt_pipe_crc_collect_crc(pipe_crc, expected_crc);
+}
+
+static void dirty_rect_create_fb(data_t *data, struct igt_fb *fb, int nrects,
+				 struct drm_mode_rect *rect)
+{
+	cairo_t *cr;
+
+	igt_info("Creating framebuffer with %d damaged areas format %s\n",
+		 nrects, igt_format_str(data->format));
+	igt_create_color_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay,
+			    data->format, DRM_FORMAT_MOD_LINEAR,
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
+	struct igt_fb main_fb, rect_1_fb, rect_2_fb, rect_combined_fb;
+	struct drm_mode_rect rect1, rect2, rect_combined[2], full_rect;
+	igt_crc_t main_fb_crc, rect_1_fb_crc, rect_2_fb_crc, rect_combined_fb_crc, crc;
+
+	mode = igt_output_get_mode(output);
+	igt_output_set_pipe(output, data->pipe);
+	if (!pipe_crc) {
+		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_assert(pipe_crc);
+	}
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	set_damage_clip(&full_rect, 0, 0, mode->hdisplay - 1, mode->vdisplay - 1);
+	set_damage_clip(&rect1, SQUARE_OFFSET, SQUARE_OFFSET, SQUARE_OFFSET + SQUARE_SIZE, SQUARE_OFFSET + SQUARE_SIZE);
+	set_damage_clip(&rect2, SQUARE_OFFSET_2, SQUARE_OFFSET_2, SQUARE_OFFSET_2 + SQUARE_SIZE, SQUARE_OFFSET_2 + SQUARE_SIZE);
+	rect_combined[0] = rect1;
+	rect_combined[1] = rect2;
+
+	dirty_rect_create_fb(data, &main_fb, 0, NULL);
+	dirty_rect_create_fb(data, &rect_1_fb, 1, &rect1);
+	dirty_rect_create_fb(data, &rect_2_fb, 1, &rect2);
+	dirty_rect_create_fb(data, &rect_combined_fb, 2, rect_combined);
+
+	/* main_fb blank blue screen - get and store crc */
+	set_and_check_crc(data, primary, pipe_crc, &main_fb, &full_rect,
+			  sizeof(full_rect), &main_fb_crc);
+
+	/* Whole blue screen with one white rect and collect crc */
+	set_and_check_crc(data, primary, pipe_crc, &rect_1_fb, &full_rect,
+			  sizeof(full_rect), &rect_1_fb_crc);
+
+	/* Second white rect and collect crc */
+	set_and_check_crc(data, primary, pipe_crc, &rect_2_fb, &full_rect,
+			  sizeof(full_rect), &rect_2_fb_crc);
+
+	/* Both rects and collect crc */
+	set_and_check_crc(data, primary, pipe_crc, &rect_combined_fb, &full_rect,
+			  sizeof(full_rect), &rect_combined_fb_crc);
+
+	/* Put full blank screen back */
+	set_and_check_crc(data, primary, pipe_crc, &main_fb, &full_rect,
+			  sizeof(full_rect), &crc);
+	igt_assert_crc_equal(&crc, &main_fb_crc);
+
+	/* Set combined rect - draw two white rects using damage area */
+	set_and_check_crc(data, primary, pipe_crc, &rect_combined_fb, rect_combined,
+			  sizeof(rect_combined), &crc);
+	igt_assert_crc_equal(&crc, &rect_combined_fb_crc);
+
+	/* Clear first rect. Only the second rect should be visible here! */
+	igt_plane_set_fb(primary, &rect_2_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	set_and_check_crc(data, primary, pipe_crc, &rect_2_fb, &rect1,
+			  sizeof(rect1), &crc);
+	igt_assert_crc_equal(&crc, &rect_2_fb_crc);
+
+	/* Clear the second rect as well. Only the first rect should be visible here */
+	igt_plane_set_fb(primary, &rect_1_fb);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	set_and_check_crc(data, primary, pipe_crc, &rect_1_fb, &rect2,
+			  sizeof(rect2), &crc);
+	igt_assert_crc_equal(&crc, &rect_1_fb_crc);
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
+static void fbc_test_outside_region(data_t *data)
+{
+	struct igt_fb main_fb, rect_outside_fb;
+	igt_pipe_crc_t *crc = data->pipe_crc;
+	igt_plane_t *primary;
+	igt_crc_t main_fb_crc, rect_outside_fb_crc;
+	struct drm_mode_rect main_rect, rect_outside;
+
+	prepare_test(data, data->output);
+
+	igt_output_get_mode(data->output);
+	igt_output_set_pipe(data->output, data->pipe);
+
+	crc = igt_pipe_crc_new(data->drm_fd, data->pipe, IGT_PIPE_CRC_SOURCE_AUTO);
+	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+
+	// Set damage area outside the visible region
+	set_damage_clip(&main_rect, 0, 0, data->mode->hdisplay - 1,
+			data->mode->vdisplay - 1);
+	set_damage_clip(&rect_outside, data->mode->hdisplay, data->mode->vdisplay,
+			data->mode->hdisplay + SQUARE_OFFSET_OUT,
+			data->mode->vdisplay + SQUARE_OFFSET_OUT);
+
+	dirty_rect_create_fb(data, &main_fb, 0, NULL);
+	dirty_rect_create_fb(data, &rect_outside_fb, 1, &rect_outside);
+
+	set_and_check_crc(data, primary, crc, &main_fb, &main_rect,
+			  sizeof(main_rect), &main_fb_crc);
+	set_and_check_crc(data, primary, crc, &rect_outside_fb, &rect_outside,
+			  sizeof(rect_outside), &rect_outside_fb_crc);
+
+	// Verify that the CRC remains unchanged
+	igt_assert_crc_equal(&main_fb_crc, &rect_outside_fb_crc);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &main_fb);
+	igt_remove_fb(data->drm_fd, &rect_outside_fb);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
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
+		data.feature = FEATURE_FBC;
+		kmstest_set_vt_graphics_mode();
+		igt_require_pipe_crc(data.drm_fd);
+		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
+		display_ver = intel_display_ver(intel_get_drm_devid(data.drm_fd));
+		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
+	}
+
+	igt_subtest_with_dynamic("fbc-dirty-rectangle-basic") {
+		data.format = DRM_FORMAT_XRGB8888;
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
+	igt_subtest_with_dynamic("fbc-dirty-rectangle-outside-visible-region") {
+		data.feature = FEATURE_FBC;
+		data.format = DRM_FORMAT_XRGB8888;
+		igt_require_f(display_ver >= 30, "FBC with dirty region is not supported\n");
+
+		for_each_pipe(&data.display, data.pipe) {
+			for_each_valid_output_on_pipe(&data.display, data.pipe, data.output) {
+				data.mode = igt_output_get_mode(data.output);
+				igt_display_reset(&data.display);
+				igt_output_set_pipe(data.output, data.pipe);
+
+				igt_dynamic_f("%s-%s-outside-visible-region",
+					       kmstest_pipe_name(data.pipe),
+					       igt_output_name(data.output)) {
+					fbc_test_outside_region(&data);
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
index 33dffad31..fde1078e3 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -251,6 +251,7 @@ intel_kms_progs = [
 	'kms_dsc',
 	'kms_fb_coherency',
 	'kms_fbcon_fbt',
+	'kms_fbc_dirty_rect',
 	'kms_fence_pin_leak',
 	'kms_flip_scaled_crc',
 	'kms_flip_tiling',
-- 
2.34.1

