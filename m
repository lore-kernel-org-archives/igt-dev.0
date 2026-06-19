Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD2DCD98F6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 04:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97C910E021;
	Fri, 19 Jun 2026 04:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ghj/R4qA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976BD10E021
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781843252; x=1813379252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bH+yf4uEAr/KMk/BBemEbxX3LMR9eOBY2mMciGUDFVw=;
 b=ghj/R4qAlrbwD+1nAndf1QkpNQtcmGV5Wazo/PMWj4NqvTvKCpujyDnK
 oxEhfZSH/4HdbW5nHNDeRGFeCEh5v/8/agb0lLo9g+X1paQCo7bgDRf9+
 fNVUJzBnlRMfoPXfi8KU9sOysHhy68O9QX6Kqq38ZxWcDhgXaffXlpP3o
 6kqRfqMLeWpPoK/WM7tT7ODLya3B1Rs1pfQfaROnCxCT+JM1eW/H+XsdX
 jgC/0rg4WV5B+8x/VScYvWp1gDRcfobfwuRCw7xHH7rVeSy8VOB3m3hDL
 ZnQzI1F3/lYcbV0UYdOiExgRx2JQk89SBNfyZ0sWIq01GK8dn3gM/xG2V Q==;
X-CSE-ConnectionGUID: O+XnKhtmS0K7f4cUpq5h1w==
X-CSE-MsgGUID: Tl0Nlb0dS5O0S7411n+0tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="82696639"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="82696639"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 21:27:31 -0700
X-CSE-ConnectionGUID: 4UGYD/CfTYmCLfTCcxdMJg==
X-CSE-MsgGUID: Hm8kMrbARqKeFSYKcRmHtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="247661410"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 21:27:30 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_rotation_crc: concurrent cursor movement
 with rotation
Date: Fri, 19 Jun 2026 09:49:03 +0530
Message-Id: <20260619041903.999144-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Add a new subtest to validate primary plane rotation 180 degree while
moving the cursor across the screen.

Use a triangular pattern fb which is easy to identify rotations on the
plane. Use CRCs to verify the plane rotation with cursor movement
doesn't cause artifacts on screen.

v2: Remove hardcoded cursor dimensions, rename variables. (Jeevan)

v3: Make test dynamic per output/pipe and cover all valid CRTC/output
pairs. Drop unused parameter in paint traingle (Jeevan)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_rotation_crc.c | 204 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4a249ed21..a01aac78f 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -68,6 +68,13 @@
  * Description: This test intends to check for fence leaks exhaustively
  */
 
+/**
+ * SUBTEST: rotation-with-cursor-movement
+ * Description: This test draws a simple triangle on the primary plane, rotates the
+ *              plane by 180 degrees, and then moves a cursor through different
+ *              screen positions.
+ */
+
 /**
  * SUBTEST: primary-%s-tiled-reflect-x-%d
  * Description: Test for %arg[1] & %arg[2] degree rotation on primary plane
@@ -118,6 +125,7 @@
 #define MAX_TESTED_MODES 8
 #define MULTIPLANE_REFERENCE 0
 #define MULTIPLANE_ROTATED 1
+#define CURSOR_EDGE_SET 16
 
 struct p_struct {
 	igt_plane_t *plane;
@@ -274,6 +282,80 @@ paint_squares(data_t *data, igt_rotation_t rotation,
 	igt_put_cairo_ctx(cr);
 }
 
+static void paint_triangle(data_t *data, igt_rotation_t rotation,
+			   struct igt_fb *fb)
+{
+	cairo_t *cr;
+	unsigned int w = fb->width;
+	unsigned int h = fb->height;
+	rgb_color_t color;
+	int i;
+	bool rotate_180 = (rotation & IGT_ROTATION_180);
+
+	cr = igt_get_cairo_ctx(data->gfx_fd, fb);
+	set_color(&color, 0.0f, 0.0f, 0.0f);
+	igt_paint_color(cr, 0, 0, w, h, RGB_COLOR(color));
+
+	/* Build a simple upward triangle using horizontal strips. */
+	for (i = 0; i < 9; i++) {
+		int strip_h = h / 14;
+		int y = h / 8 + i * strip_h;
+		int strip_w = (i + 1) * w / 14;
+		int x = w / 2 - strip_w / 2;
+
+		if (rotate_180) {
+			x = (int)w - (x + strip_w);
+			y = (int)h - (y + strip_h);
+		}
+
+		set_color(&color, 1.0f, 0.0f, 0.0f);
+		igt_paint_color(cr, x, y,
+				strip_w, strip_h,
+				RGB_COLOR(color));
+	}
+
+	igt_put_cairo_ctx(cr);
+}
+
+static void collect_current_crc(data_t *data, igt_crc_t *crc)
+{
+	if (is_amdgpu_device(data->gfx_fd))
+		igt_pipe_crc_collect_crc(data->pipe_crc, crc);
+	else
+		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, crc);
+}
+
+struct cur_data {
+	int x;
+	int y;
+};
+
+static void set_cursor_positions(const drmModeModeInfo *mode,
+				 const struct igt_fb *cursor_fb,
+				 struct cur_data positions[5])
+{
+	int cw = cursor_fb->width;
+	int ch = cursor_fb->height;
+	int x_min = CURSOR_EDGE_SET;
+	int y_min = CURSOR_EDGE_SET;
+	int x_max = mode->hdisplay - cw - CURSOR_EDGE_SET;
+	int y_max = mode->vdisplay - ch - CURSOR_EDGE_SET;
+
+	x_max = max(x_max, x_min);
+	y_max = max(y_max, y_min);
+
+	positions[0].x = x_min;
+	positions[0].y = y_min;
+	positions[1].x = x_max;
+	positions[1].y = y_min;
+	positions[2].x = x_min;
+	positions[2].y = y_max;
+	positions[3].x = x_max;
+	positions[3].y = y_max;
+	positions[4].x = (mode->hdisplay - cw) / 2;
+	positions[4].y = (mode->vdisplay - ch) / 2;
+}
+
 static void remove_fbs(data_t *data)
 {
 	igt_remove_fb(data->gfx_fd, &data->fb);
@@ -1159,6 +1241,115 @@ static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_t *crtc,
 		igt_remove_fb(fd, &fb[i]);
 }
 
+static int test_rotation_with_cursor_movement(data_t *data, igt_crtc_t *crtc)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	int tested = 0;
+	int i;
+
+	igt_display_require_output(display);
+	igt_require(display->has_cursor_plane);
+
+	for_each_valid_output_on_crtc(display, crtc, output) {
+		igt_plane_t *primary, *cursor;
+		struct igt_fb ref_fb, hw_fb, cursor_fb;
+		drmModeModeInfo *mode;
+		igt_crc_t ref_crc, hw_crc_atomic, hw_crc_sequential;
+		struct cur_data cur_positions[5] = {};
+		uint64_t cur_w, cur_h;
+
+		mode = igt_output_get_mode(output);
+		igt_assert_f(mode, "Failed to get mode for output %s\n", igt_output_name(output));
+
+		igt_display_reset(display);
+		igt_output_set_crtc(output, crtc);
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		cursor = igt_output_get_plane_type(output, DRM_PLANE_TYPE_CURSOR);
+
+		if (!igt_plane_has_prop(primary, IGT_PLANE_ROTATION) ||
+		    !igt_plane_has_rotation(primary, IGT_ROTATION_180))
+			continue;
+
+		tested++;
+		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+			      igt_output_name(output)) {
+			prepare_crtc(data, output, crtc, primary, true);
+
+			igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
+				      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &ref_fb);
+			paint_triangle(data, IGT_ROTATION_180, &ref_fb);
+
+			igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
+				      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &hw_fb);
+			paint_triangle(data, IGT_ROTATION_0, &hw_fb);
+
+			do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_WIDTH, &cur_w));
+			do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_HEIGHT, &cur_h));
+
+			igt_skip_on(cur_w <= 64 && cur_h <= 64);
+			igt_create_color_fb(data->gfx_fd, cur_w, cur_h,
+					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+					    1.0, 1.0, 1.0, &cursor_fb);
+
+			set_cursor_positions(mode, &cursor_fb, cur_positions);
+
+			for (i = 0; i < ARRAY_SIZE(cur_positions); i++) {
+				int x = cur_positions[i].x;
+				int y = cur_positions[i].y;
+
+				/* Reference: SW-rotated triangle, no HW rotation. */
+				igt_plane_set_fb(primary, &ref_fb);
+				igt_plane_set_rotation(primary, IGT_ROTATION_0);
+				igt_plane_set_fb(cursor, &cursor_fb);
+				igt_plane_set_position(cursor, x, y);
+				igt_display_commit2(display, COMMIT_ATOMIC);
+				collect_current_crc(data, &ref_crc);
+
+				/* HW path: unrotated triangle with HW 180 rotation. */
+				igt_plane_set_fb(primary, &hw_fb);
+				igt_plane_set_rotation(primary, IGT_ROTATION_180);
+				igt_plane_set_fb(cursor, &cursor_fb);
+				igt_plane_set_position(cursor, x, y);
+				igt_display_commit2(display, COMMIT_ATOMIC);
+				collect_current_crc(data, &hw_crc_atomic);
+				igt_assert_crc_equal(&ref_crc, &hw_crc_atomic);
+
+				/*
+				 * move cursor first with no rotation, then
+				 * enable primary rotation while cursor remains active.
+				 */
+				igt_plane_set_fb(primary, &hw_fb);
+				igt_plane_set_rotation(primary, IGT_ROTATION_0);
+				igt_plane_set_fb(cursor, &cursor_fb);
+				igt_plane_set_position(cursor, x, y);
+				igt_display_commit2(display, COMMIT_ATOMIC);
+
+				igt_plane_set_rotation(primary, IGT_ROTATION_180);
+				igt_display_commit2(display, COMMIT_ATOMIC);
+				collect_current_crc(data, &hw_crc_sequential);
+				igt_assert_crc_equal(&ref_crc, &hw_crc_sequential);
+
+				igt_assert_crc_equal(&hw_crc_atomic, &hw_crc_sequential);
+			}
+
+			igt_plane_set_fb(cursor, NULL);
+			igt_plane_set_fb(primary, NULL);
+			igt_plane_set_rotation(primary, IGT_ROTATION_0);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			igt_remove_fb(data->gfx_fd, &cursor_fb);
+			igt_remove_fb(data->gfx_fd, &ref_fb);
+			igt_remove_fb(data->gfx_fd, &hw_fb);
+			cleanup_crtc(data);
+		}
+	}
+
+	return tested;
+}
+
 static const char *plane_test_str(unsigned plane)
 {
 	switch (plane) {
@@ -1358,6 +1549,19 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		test_multi_plane_rotation(&data, crtc);
 	}
 
+	igt_describe("Rotation test on primary plane with concurrent cursor movement");
+	igt_subtest_with_dynamic("rotation-with-cursor-movement") {
+		igt_crtc_t *crtc;
+		int tested = 0;
+
+		for_each_crtc(&data.display, crtc) {
+			cleanup_crtc(&data);
+			tested += test_rotation_with_cursor_movement(&data, crtc);
+		}
+
+		igt_skip_on_f(!tested, "No connected output can be tested on any CRTC.\n");
+	}
+
 	/*
 	 * exhaust-fences should be last test, if it fails we may OOM in
 	 * the following subtests otherwise.
-- 
2.34.1

