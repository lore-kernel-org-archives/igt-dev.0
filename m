Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180FE10E25A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 04:28:35 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 20 Jun 2023 10:02:39 +0530
Message-Id: <20230620043240.3312945-5-kunal1.joshi@intel.com>
In-Reply-To: <20230620043240.3312945-1-kunal1.joshi@intel.com>
References: <20230620043240.3312945-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/5] RFC tests/i915/kms_frontbuffer_tracking: xe
 only supports MMAP_WC, BLT, RENDER
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
v5: Dropped tiling checks for xe

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 79 ++++++++++++++++++++-------
 1 file changed, 59 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 027a874a..8155d4e4 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -1307,11 +1307,13 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
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
@@ -2035,9 +2037,6 @@ static void draw_subtest(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *target;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
@@ -2137,9 +2136,8 @@ static void multidraw_subtest(const struct test_mode *t)
 				  igt_draw_get_method_name(m1),
 				  igt_draw_get_method_name(m2));
 
-			if ((m1 == IGT_DRAW_MMAP_GTT ||
-			     m2 == IGT_DRAW_MMAP_GTT) &&
-			    !gem_has_mappable_ggtt(drm.fd))
+			if (!igt_draw_supports_method(drm.fd, m1) ||
+			    !igt_draw_supports_method(drm.fd, m2))
 				continue;
 
 			for (r = 0; r < pattern->n_rects; r++) {
@@ -2408,9 +2406,6 @@ static void flip_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	enum color bg_color;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		assertions |= ASSERT_LAST_ACTION_CHANGED;
@@ -2470,9 +2465,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern1;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	prepare_subtest(t, pattern);
 
 	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
@@ -2882,9 +2874,6 @@ static void farfromfence_subtest(const struct test_mode *t)
 	int max_height, assertions = 0;
 	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (gen) {
 	case 2:
 		max_height = 2048;
@@ -3168,8 +3157,7 @@ static void basic_subtest(const struct test_mode *t)
 	fb1 = params->primary.fb;
 
 	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-		if (method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd))
+		if (!igt_draw_supports_method(drm.fd, method))
 			continue;
 
 		if (r == pattern->n_rects) {
@@ -3474,6 +3462,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	TEST_MODE_ITER_BEGIN(t)
+
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3481,7 +3470,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      plane_str(t.plane),
 			      fbs_str(t.fbs),
 			      igt_draw_get_method_name(t.method))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			draw_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3498,7 +3490,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				      fbs_str(t.fbs),
 				      flip_str(t.flip),
 				      igt_draw_get_method_name(t.method))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				flip_subtest(&t);
+			}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3513,7 +3508,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      pipes_str(t.pipes),
 			      fbs_str(t.fbs),
 			      igt_draw_get_method_name(t.method))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			fliptrack_subtest(&t, FLIP_PAGEFLIP);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3528,7 +3526,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      screen_str(t.screen),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			move_subtest(&t);
+		}
 
 		igt_subtest_f("%s-%s-%s-%s-%s-onoff",
 			      feature_str(t.feature),
@@ -3536,7 +3537,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      screen_str(t.screen),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			onoff_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3545,13 +3549,18 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
@@ -3566,7 +3575,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			      pipes_str(t.pipes),
 			      plane_str(t.plane),
 			      fbs_str(t.fbs))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			multidraw_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3580,7 +3592,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_subtest_f("%s-farfromfence-%s",
 			      feature_str(t.feature),
 			      igt_draw_get_method_name(t.method))
+		{
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
 			farfromfence_subtest(&t);
+		}
 	TEST_MODE_ITER_END
 
 	TEST_MODE_ITER_BEGIN(t)
@@ -3599,7 +3614,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				      feature_str(t.feature),
 				      format_str(t.format),
 				      igt_draw_get_method_name(t.method))
+			{
+				igt_require(igt_draw_supports_method(drm.fd, t.method));
 				format_draw_subtest(&t);
+			}
 		}
 	TEST_MODE_ITER_END
 
@@ -3609,10 +3627,14 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
@@ -3624,14 +3646,23 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
@@ -3647,6 +3678,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 					      feature_str(t.feature),
 					      tiling_str(t.tiling)) {
 
+					igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 					/* Tiling Y is only supported on GEN9+ */
 					if (t.tiling == TILING_Y) {
 						igt_require(AT_LEAST_GEN(devid, 9));
@@ -3670,10 +3703,16 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
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
2.25.1
