Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B750CCD4F54
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 02:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AE710E087;
	Mon, 25 May 2026 02:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HzQv1bMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E6110E087
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 02:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779677437; x=1811213437;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QAZdChgrFpi5WZjnBY5NUHAgmecOnJH2zDdUD8mLJ/M=;
 b=HzQv1bMIRdWeifNV08uDLcDl7V/Xpha+D/YEMnYBNGtGMRr+ld44yh2q
 BxPHJtNjfwt+mdVmKh96xqy9Tkrystmv/28guMc4Z6G9+jVL+57kq9B3w
 XvwLJdFPKNU4OnIlC5n743JisGasvw9jq75OMdtj/7SJwjKEoKSyWwf2X
 9lyT16qCJHLbDauJ2fvK2qvwY+2je31H/hIjuTybSu8WH4MQSGm9BLF19
 U/5P91iy/X7wKjXJNWQ7BRtHIMO9LnDyTu435oULtNWmqR9R3tJhafjEM
 8R7JQf0ZBBgd7Eor2yLBjZ+yWCG+5wjZO86osc4X/6mFDr5H8Y7/uo5fi g==;
X-CSE-ConnectionGUID: QbKDuzdSS+Cw7rNENcAi5Q==
X-CSE-MsgGUID: Yi80HHsMQ/+wwHgUsxmgsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="79646682"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="79646682"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2026 19:50:35 -0700
X-CSE-ConnectionGUID: sZ7dd1bwS0CiBg2qkzC2DA==
X-CSE-MsgGUID: of4XAmd9SvqTSslfUxIsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; d="scan'208";a="235115403"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 19:50:33 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_rotation_crc: concurrent cursor movement
 with rotation
Date: Mon, 25 May 2026 08:13:48 +0530
Message-Id: <20260525024348.763823-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_rotation_crc.c | 198 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4a249ed21..0a3270139 100644
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
+			   struct igt_fb *fb, float o)
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
+		set_color(&color, o, 0.0f, 0.0f);
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
@@ -1159,6 +1241,114 @@ static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_t *crtc,
 		igt_remove_fb(fd, &fb[i]);
 }
 
+static void test_rotation_with_cursor_movement(data_t *data, igt_crtc_t *crtc)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	int tested = 0;
+	int i;
+
+	igt_require(display->has_cursor_plane);
+	igt_display_require_output(display);
+
+	for_each_connected_output(display, output) {
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
+		prepare_crtc(data, output, crtc, primary, true);
+
+		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &ref_fb);
+		paint_triangle(data, IGT_ROTATION_180, &ref_fb, 1.0f);
+
+		igt_create_fb(data->gfx_fd, mode->hdisplay, mode->vdisplay,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &hw_fb);
+		paint_triangle(data, IGT_ROTATION_0, &hw_fb, 1.0f);
+
+		do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_WIDTH, &cur_w));
+		do_or_die(drmGetCap(display->drm_fd, DRM_CAP_CURSOR_HEIGHT, &cur_h));
+
+		igt_skip_on(cur_w <= 64 && cur_h <= 64);
+		igt_create_color_fb(data->gfx_fd, cur_w, cur_h,
+				    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
+				    1.0, 1.0, 1.0, &cursor_fb);
+
+		set_cursor_positions(mode, &cursor_fb, cur_positions);
+
+		for (i = 0; i < ARRAY_SIZE(cur_positions); i++) {
+			int x = cur_positions[i].x;
+			int y = cur_positions[i].y;
+
+			/* Reference: SW-rotated triangle, no HW rotation. */
+			igt_plane_set_fb(primary, &ref_fb);
+			igt_plane_set_rotation(primary, IGT_ROTATION_0);
+			igt_plane_set_fb(cursor, &cursor_fb);
+			igt_plane_set_position(cursor, x, y);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			collect_current_crc(data, &ref_crc);
+
+			/* HW path: unrotated triangle with HW 180 rotation. */
+			igt_plane_set_fb(primary, &hw_fb);
+			igt_plane_set_rotation(primary, IGT_ROTATION_180);
+			igt_plane_set_fb(cursor, &cursor_fb);
+			igt_plane_set_position(cursor, x, y);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			collect_current_crc(data, &hw_crc_atomic);
+			igt_assert_crc_equal(&ref_crc, &hw_crc_atomic);
+
+			/*
+			 * move cursor first with no rotation, then
+			 * enable primary rotation while cursor remains active.
+			 */
+			igt_plane_set_fb(primary, &hw_fb);
+			igt_plane_set_rotation(primary, IGT_ROTATION_0);
+			igt_plane_set_fb(cursor, &cursor_fb);
+			igt_plane_set_position(cursor, x, y);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+
+			igt_plane_set_rotation(primary, IGT_ROTATION_180);
+			igt_display_commit2(display, COMMIT_ATOMIC);
+			collect_current_crc(data, &hw_crc_sequential);
+			igt_assert_crc_equal(&ref_crc, &hw_crc_sequential);
+
+			igt_assert_crc_equal(&hw_crc_atomic, &hw_crc_sequential);
+		}
+
+		igt_plane_set_fb(cursor, NULL);
+		igt_plane_set_fb(primary, NULL);
+		igt_plane_set_rotation(primary, IGT_ROTATION_0);
+		igt_display_commit2(display, COMMIT_ATOMIC);
+		igt_remove_fb(data->gfx_fd, &cursor_fb);
+		igt_remove_fb(data->gfx_fd, &ref_fb);
+		igt_remove_fb(data->gfx_fd, &hw_fb);
+		cleanup_crtc(data);
+		tested++;
+	}
+
+	igt_require_f(tested,
+		      "No connected output can be tested on first CRTC %s.\n",
+		      igt_crtc_name(crtc));
+}
+
 static const char *plane_test_str(unsigned plane)
 {
 	switch (plane) {
@@ -1358,6 +1548,14 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		test_multi_plane_rotation(&data, crtc);
 	}
 
+	igt_describe("Rotation test on primary plane with concurrent cursor movement");
+	igt_subtest_f("rotation-with-cursor-movement") {
+		igt_crtc_t *crtc = igt_first_crtc(&data.display);
+
+		cleanup_crtc(&data);
+		test_rotation_with_cursor_movement(&data, crtc);
+	}
+
 	/*
 	 * exhaust-fences should be last test, if it fails we may OOM in
 	 * the following subtests otherwise.
-- 
2.34.1

