Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD7710E22D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:55:57 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 22:29:35 +0530
Message-Id: <20230613165936.2930050-6-kunal1.joshi@intel.com>
In-Reply-To: <20230613165936.2930050-1-kunal1.joshi@intel.com>
References: <20230613165936.2930050-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] RFC
 tests/i915/kms_frontbuffer_tracking: xe only supports MMAP_WC, BLT, RENDER
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

xe only supports MMAP_WC, BLT and RENDER methods,

Open :- does draw method give guarantee for fb to be rendered
on return, if not how to assure, ex for RENDER we have intel_bb_sync

v2: use igt_draw_supports_method (Bhanu)
    Remove check from macro and put it in igt_require at test level
    (Bhanu)
v3: change order of basic subtest to avoid skipping early (Bhanu)
v4: Avoid changing basic test order, instead keep igt_required inside

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 79 ++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 22d1a7df..9edcbf0a 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1306,11 +1306,13 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
 		for (r = 0; r < pattern->n_rects; r++)
 			for (r_ = 0; r_ <= r; r_++)
 				draw_rect_igt_fb(pattern, &tmp_fbs[r],
-						 IGT_DRAW_PWRITE, r_);
+						 igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
+						 IGT_DRAW_PWRITE : IGT_DRAW_RENDER,
+						 r_);
 	} else {
 		for (r = 0; r < pattern->n_rects; r++)
-			draw_rect_igt_fb(pattern, &tmp_fbs[r], IGT_DRAW_PWRITE,
-					 r);
+			draw_rect_igt_fb(pattern, &tmp_fbs[r], igt_draw_supports_method(drm.fd, IGT_DRAW_PWRITE) ?
+					 IGT_DRAW_PWRITE : IGT_DRAW_RENDER, r);
 	}
 
 	igt_output_set_pipe(prim_mode_params.output, prim_mode_params.pipe);
@@ -2044,9 +2046,6 @@ static void draw_subtest(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *target;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
@@ -2146,9 +2145,8 @@ static void multidraw_subtest(const struct test_mode *t)
 				  igt_draw_get_method_name(m1),
 				  igt_draw_get_method_name(m2));
 
-			if ((m1 == IGT_DRAW_MMAP_GTT ||
-			     m2 == IGT_DRAW_MMAP_GTT) &&
-			    !gem_has_mappable_ggtt(drm.fd))
+			if (!igt_draw_supports_method(drm.fd, m1) ||
+			    !igt_draw_supports_method(drm.fd, m2))
 				continue;
 
 			for (r = 0; r < pattern->n_rects; r++) {
@@ -2417,9 +2415,6 @@ static void flip_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	enum color bg_color;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		assertions |= ASSERT_LAST_ACTION_CHANGED;
@@ -2479,9 +2474,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern1;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	prepare_subtest(t, pattern);
 
 	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
@@ -2891,9 +2883,6 @@ static void farfromfence_subtest(const struct test_mode *t)
 	int max_height, assertions = 0;
 	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (gen) {
 	case 2:
 		max_height = 2048;
@@ -3177,8 +3166,7 @@ static void basic_subtest(const struct test_mode *t)
 	fb1 = params->primary.fb;
 
 	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-		if (method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd))
+		if (!igt_draw_supports_method(drm.fd, method))
 			continue;
 
 		if (r == pattern->n_rects) {
@@ -3483,6 +3471,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	TEST_MODE_ITER_BEGIN(t)
+
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3490,7 +3479,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      plane_str(t.plane),
 			      fbs_str(t.fbs),
 			      igt_draw_get_method_name(t.method))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			draw_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3507,7 +3499,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				      fbs_str(t.fbs),
 				      flip_str(t.flip),
 				      igt_draw_get_method_name(t.method))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				flip_subtest(&t);
+			}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3522,7 +3517,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      pipes_str(t.pipes),
 			      fbs_str(t.fbs),
 			      igt_draw_get_method_name(t.method))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			fliptrack_subtest(&t, FLIP_PAGEFLIP);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3537,7 +3535,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      screen_str(t.screen),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			move_subtest(&t);
+		}
 
 		igt_subtest_f("%s-%s-%s-%s-%s-onoff",
 			      feature_str(t.feature),
@@ -3545,7 +3546,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      screen_str(t.screen),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			onoff_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3554,13 +3558,18 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.plane != PLANE_SPR)
 			continue;
 
+
 		igt_subtest_f("%s-%s-%s-%s-%s-fullscreen",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
 			      screen_str(t.screen),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			fullscreen_plane_subtest(&t);
+		}
+
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3575,7 +3584,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      pipes_str(t.pipes),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			multidraw_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3589,7 +3601,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_subtest_f("%s-farfromfence-%s",
 			      feature_str(t.feature),
 			      igt_draw_get_method_name(t.method))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			farfromfence_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3608,7 +3623,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				      feature_str(t.feature),
 				      format_str(t.format),
 				      igt_draw_get_method_name(t.method))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				format_draw_subtest(&t);
+			}
 		}
 	TEST_MODE_ITER_END
 
@@ -3618,10 +3636,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.plane != PLANE_PRI ||
 		    t.method != IGT_DRAW_BLT)
 			continue;
+
 		igt_subtest_f("%s-%s-scaledprimary",
 			      feature_str(t.feature),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			scaledprimary_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3633,14 +3655,23 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			continue;
 
 		igt_subtest_f("%s-modesetfrombusy", feature_str(t.feature))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			modesetfrombusy_subtest(&t);
+		}
 
 		if (t.feature & FEATURE_FBC) {
 			igt_subtest_f("%s-badstride", feature_str(t.feature))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				badstride_subtest(&t);
+			}
 
 			igt_subtest_f("%s-stridechange", feature_str(t.feature))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				stridechange_subtest(&t);
+			}
 
 			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT;
 			     t.tiling++) {
@@ -3657,6 +3688,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					      feature_str(t.feature),
 					      tiling_str(t.tiling)) {
 
+					igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 					if (is_xe_device(drm.fd))
 						igt_require(t.tiling == TILING_LINEAR);
 
@@ -3683,10 +3716,16 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 		if ((t.feature & FEATURE_PSR) || (t.feature & FEATURE_DRRS))
 			igt_subtest_f("%s-slowdraw", feature_str(t.feature))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				slow_draw_subtest(&t);
+			}
 
 		igt_subtest_f("%s-suspend", feature_str(t.feature))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			suspend_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	t.pipes = PIPE_SINGLE;
-- 
2.34.1
