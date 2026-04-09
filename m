Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3065E98FAC
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6539B10E0EE;
	Thu,  9 Apr 2026 04:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="As4DIw75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C0010E0B0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775710354; x=1807246354;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IQJ+AT2VF9WE1R1fBETay0afPsL2NncsZYts2wfsg6U=;
 b=As4DIw75Lkmmfta+N4GBILwg8Dq6yaWjHoNfVUvMjuJwF5UdensmB3vQ
 3WfLNUy5xN1Tz/Xwpq4F+lQEdoXaqVJwq7KDQ/DFV2GRiArYLBmuBEnZ8
 HCFTqeJexbfQjHOjF7A60jWI0zOo5j2wEVMfQns2izrVZ9DqqATP2mbBT
 TpN38ZfKOyAYPgTzv737BiUyyeoMfxM9sw/I4MJT3ySQnIKZoWD+MfwVo
 7X9FZ8K1227bhvevG0BFZQ8yAoc0moTEc+fs9uG0KgbPLSTsyQwW04gBh
 evMYemU0HiW3/9klN4nNu7tt8VOq8x8JdZbVd9yYvhkQCbODWF14lDFPH A==;
X-CSE-ConnectionGUID: DvQvgzT9TluAVLOblLisbQ==
X-CSE-MsgGUID: cxxpMENZSca3u3vrVQoeWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75878562"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75878562"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:52:33 -0700
X-CSE-ConnectionGUID: talIT1mKSQiJeqaxto1BFw==
X-CSE-MsgGUID: 0Sdmv84uSJWNTCGjSWzYxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="224358283"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:52:31 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, pranay.samala@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_rotation_crc: concurrent cursor movement
 with rotation
Date: Thu,  9 Apr 2026 10:18:55 +0530
Message-Id: <20260409044855.191421-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_rotation_crc.c | 193 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 4420053f1..4002eee55 100644
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
@@ -274,6 +281,81 @@ paint_squares(data_t *data, igt_rotation_t rotation,
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
+	int edge_set = 16;
+	int x_min = edge_set;
+	int y_min = edge_set;
+	int x_max = mode->hdisplay - cw - edge_set;
+	int y_max = mode->vdisplay - ch - edge_set;
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
@@ -1160,6 +1242,109 @@ static void test_plane_rotation_exhaust_fences(data_t *data, igt_crtc_t *crtc,
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
+		igt_crc_t ref_crc, hw_crc_atomic, hw_crc_seq;
+		struct cur_data cur_positions[5] = {};
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
+		igt_create_color_fb(data->gfx_fd, 64, 64,
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
+			collect_current_crc(data, &hw_crc_seq);
+			igt_assert_crc_equal(&ref_crc, &hw_crc_seq);
+
+			igt_assert_crc_equal(&hw_crc_atomic, &hw_crc_seq);
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
@@ -1359,6 +1544,14 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
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

