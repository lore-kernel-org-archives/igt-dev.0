Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E910E4FA
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 07:13:53 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:33:41 +0530
Message-Id: <20231115070344.1488683-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
References: <20231115070344.1488683-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/5] tests/intel/kms_fbt: Fill fb region with
 requested draw method
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

Instead of assuming Blitter as a default method to draw/fill
fb region, use the requested draw method by test.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 39 ++++++++++++++------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index eac33f48b..213069947 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1084,11 +1084,13 @@ static void draw_rect_igt_fb(struct draw_pattern_info *pattern,
 	draw_rect(pattern, &region, method, r);
 }
 
-static void fill_fb_region(struct fb_region *region, enum color ecolor)
+static void fill_fb_region(struct fb_region *region,
+			   enum igt_draw_method method,
+			   enum color ecolor)
 {
 	uint32_t color = pick_color(region->fb, ecolor);
 
-	igt_draw_rect_fb(drm.fd, drm.bops, 0, region->fb, IGT_DRAW_BLT,
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, region->fb, method,
 			 region->x, region->y, region->w, region->h,
 			 color);
 }
@@ -1635,7 +1637,7 @@ static void __do_assertions(const struct test_mode *t, int flags,
 
 static void enable_prim_screen_and_wait(const struct test_mode *t)
 {
-	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
+	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
 	set_mode_for_params(&prim_mode_params);
 
 	wanted_crc = &blue_crcs[t->format].crc;
@@ -1644,7 +1646,7 @@ static void enable_prim_screen_and_wait(const struct test_mode *t)
 	do_assertions(ASSERT_NO_ACTION_CHANGE);
 }
 
-static void update_modeset_cached_params(void)
+static void update_modeset_cached_params(enum igt_draw_method method)
 {
 	bool found = false;
 
@@ -1662,8 +1664,8 @@ static void update_modeset_cached_params(void)
 	scnd_mode_params.primary.w = scnd_mode_params.mode.hdisplay;
 	scnd_mode_params.primary.h = scnd_mode_params.mode.vdisplay;
 
-	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
-	fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
+	fill_fb_region(&prim_mode_params.primary, method, COLOR_PRIM_BG);
+	fill_fb_region(&scnd_mode_params.primary, method, COLOR_SCND_BG);
 
 	__set_mode_for_params(&prim_mode_params);
 	__set_mode_for_params(&scnd_mode_params);
@@ -1673,8 +1675,8 @@ static void enable_both_screens_and_wait(const struct test_mode *t)
 {
 	int ret;
 
-	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
-	fill_fb_region(&scnd_mode_params.primary, COLOR_SCND_BG);
+	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
+	fill_fb_region(&scnd_mode_params.primary, t->method, COLOR_SCND_BG);
 
 	__set_mode_for_params(&prim_mode_params);
 	__set_mode_for_params(&scnd_mode_params);
@@ -1688,7 +1690,7 @@ static void enable_both_screens_and_wait(const struct test_mode *t)
 		ret = igt_display_try_commit2(&drm.display, COMMIT_LEGACY);
 
 	if (ret)
-		update_modeset_cached_params();
+		update_modeset_cached_params(t->method);
 
 	igt_display_commit2(&drm.display, drm.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -1701,7 +1703,7 @@ static void enable_both_screens_and_wait(const struct test_mode *t)
 static void set_region_for_test(const struct test_mode *t,
 				struct fb_region *reg)
 {
-	fill_fb_region(reg, COLOR_PRIM_BG);
+	fill_fb_region(reg, t->method, COLOR_PRIM_BG);
 
 	igt_plane_set_fb(reg->plane, reg->fb);
 	igt_plane_set_position(reg->plane, 0, 0);
@@ -1721,7 +1723,7 @@ static void set_plane_for_test_fbc(const struct test_mode *t, igt_plane_t *plane
 
 	create_fb(t->format, prim_mode_params.mode.hdisplay, prim_mode_params.mode.vdisplay, t->tiling, t->plane, &fb);
 	color = pick_color(&fb, COLOR_PRIM_BG);
-	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, IGT_DRAW_BLT,
+	igt_draw_rect_fb(drm.fd, drm.bops, 0, &fb, t->method,
 			 0, 0, fb.width, fb.height,
 			 color);
 
@@ -1856,7 +1858,7 @@ static void prepare_subtest_data(const struct test_mode *t,
 	set_crtc_fbs(t);
 
 	if (t->screen == SCREEN_OFFSCREEN)
-		fill_fb_region(&offscreen_fb, COLOR_OFFSCREEN_BG);
+		fill_fb_region(&offscreen_fb, t->method, COLOR_OFFSCREEN_BG);
 
 	igt_display_reset(&drm.display);
 	if (need_modeset)
@@ -2886,7 +2888,7 @@ static void multidraw_subtest(const struct test_mode *t)
 				do_assertions(assertions);
 			}
 
-			fill_fb_region(target, COLOR_PRIM_BG);
+			fill_fb_region(target, m2, COLOR_PRIM_BG);
 			_fb_dirty_ioctl(target);
 
 			update_wanted_crc(t, &blue_crcs[t->format].crc);
@@ -2942,7 +2944,7 @@ static void badformat_subtest(const struct test_mode *t)
 
 	prepare_subtest_data(t, NULL);
 
-	fill_fb_region(&prim_mode_params.primary, COLOR_PRIM_BG);
+	fill_fb_region(&prim_mode_params.primary, t->method, COLOR_PRIM_BG);
 	set_mode_for_params(&prim_mode_params);
 
 	wanted_crc = &blue_crcs[t->format].crc;
@@ -4573,7 +4575,7 @@ static void stridechange_subtest(const struct test_mode *t)
 	igt_assert(old_fb->strides[0] != new_fb->strides[0]);
 
 	params->primary.fb = new_fb;
-	fill_fb_region(&params->primary, COLOR_PRIM_BG);
+	fill_fb_region(&params->primary, t->method, COLOR_PRIM_BG);
 
 	set_mode_for_params(params);
 	do_assertions(DONT_ASSERT_FBC_STATUS);
@@ -4742,7 +4744,7 @@ static void basic_subtest(const struct test_mode *t)
 		if (r == pattern->n_rects) {
 			params->primary.fb = (params->primary.fb == fb1) ? &fb2 : fb1;
 
-			fill_fb_region(&params->primary, COLOR_PRIM_BG);
+			fill_fb_region(&params->primary, method, COLOR_PRIM_BG);
 			update_wanted_crc(t, &blue_crcs[t->format].crc);
 
 			page_flip_for_params(params, t->flip);
@@ -5028,9 +5030,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.plane = PLANE_PRI;
 			t.fbs = FBS_INDIVIDUAL;
 			t.format = FORMAT_DEFAULT;
+			t.method = IGT_DRAW_BLT;
 			/* Make sure nothing is using these values. */
 			t.flip = -1;
-			t.method = -1;
 			t.tiling = opt.tiling;
 
 			igt_subtest_f("%s-%s-rte",
@@ -5045,9 +5047,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.screen = SCREEN_PRIM;
 	t.fbs = FBS_INDIVIDUAL;
 	t.format = FORMAT_DEFAULT;
+	t.method = IGT_DRAW_BLT;
 	/* Make sure nothing is using these values. */
 	t.flip = -1;
-	t.method = -1;
 	t.tiling = opt.tiling;
 
 	igt_subtest_f("plane-fbc-rte") {
@@ -5309,6 +5311,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	t.feature = FEATURE_DEFAULT;
 	t.format = FORMAT_DEFAULT;
 	t.flip = FLIP_PAGEFLIP;
+	t.method = IGT_DRAW_BLT;
 	t.tiling = opt.tiling;
 	igt_subtest("basic") {
 		if (!is_xe_device(drm.fd))
-- 
2.40.0
