Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF9E10E67B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jun 2023 10:08:42 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Jun 2023 15:42:05 +0530
Message-Id: <20230609101205.2803975-6-kunal1.joshi@intel.com>
In-Reply-To: <20230609101205.2803975-1-kunal1.joshi@intel.com>
References: <20230609101205.2803975-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] RFC
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 59 ++++++++++++++++++---------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 7159cd37..b8dd5cd5 100644
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
@@ -2048,9 +2050,6 @@ static void draw_subtest(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *target;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
@@ -2150,9 +2149,8 @@ static void multidraw_subtest(const struct test_mode *t)
 				  igt_draw_get_method_name(m1),
 				  igt_draw_get_method_name(m2));
 
-			if ((m1 == IGT_DRAW_MMAP_GTT ||
-			     m2 == IGT_DRAW_MMAP_GTT) &&
-			    !gem_has_mappable_ggtt(drm.fd))
+			if (!igt_draw_supports_method(drm.fd, m1) ||
+			    !igt_draw_supports_method(drm.fd, m2))
 				continue;
 
 			for (r = 0; r < pattern->n_rects; r++) {
@@ -2421,9 +2419,6 @@ static void flip_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	enum color bg_color;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		assertions |= ASSERT_LAST_ACTION_CHANGED;
@@ -2483,9 +2478,6 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern1;
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	prepare_subtest(t, pattern);
 
 	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
@@ -2895,9 +2887,6 @@ static void farfromfence_subtest(const struct test_mode *t)
 	int max_height, assertions = 0;
 	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
 
-	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd));
-
 	switch (gen) {
 	case 2:
 		max_height = 2048;
@@ -3181,8 +3170,7 @@ static void basic_subtest(const struct test_mode *t)
 	fb1 = params->primary.fb;
 
 	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-		if (method == IGT_DRAW_MMAP_GTT &&
-		    !gem_has_mappable_ggtt(drm.fd))
+		if (!igt_draw_supports_method(drm.fd, method))
 			continue;
 
 		if (r == pattern->n_rects) {
@@ -3487,6 +3475,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 	}
 
 	TEST_MODE_ITER_BEGIN(t)
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3503,6 +3494,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    (!opt.show_hidden && t.method != IGT_DRAW_BLT))
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		for (t.flip = 0; t.flip < FLIP_COUNT; t.flip++)
 			igt_subtest_f("%s-%s-%s-%s-%sflip-%s",
 				      feature_str(t.feature),
@@ -3521,6 +3515,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    (t.feature & FEATURE_FBC) == 0)
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-%s-%s-fliptrack-%s",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3535,6 +3532,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.plane == PLANE_PRI)
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-%s-%s-%s-%s-move",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3558,6 +3558,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.plane != PLANE_SPR)
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-%s-%s-%s-%s-fullscreen",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3574,6 +3577,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    (!opt.show_hidden && t.fbs != FBS_INDIVIDUAL))
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-%s-%s-%s-multidraw",
 			      feature_str(t.feature),
 			      pipes_str(t.pipes),
@@ -3590,6 +3596,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.method != IGT_DRAW_MMAP_GTT)
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-farfromfence-%s",
 			      feature_str(t.feature),
 			      igt_draw_get_method_name(t.method))
@@ -3603,6 +3612,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.fbs != FBS_INDIVIDUAL)
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		for (t.format = 0; t.format < FORMAT_COUNT; t.format++) {
 			/* Skip what we already tested. */
 			if (t.format == FORMAT_DEFAULT)
@@ -3622,6 +3634,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.plane != PLANE_PRI ||
 		    t.method != IGT_DRAW_BLT)
 			continue;
+
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-%s-scaledprimary",
 			      feature_str(t.feature),
 			      fbs_str(t.fbs))
@@ -3636,6 +3652,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		    t.method != IGT_DRAW_BLT)
 			continue;
 
+		igt_fixture
+			igt_require(igt_draw_supports_method(drm.fd, t.method));
+
 		igt_subtest_f("%s-modesetfrombusy", feature_str(t.feature))
 			modesetfrombusy_subtest(&t);
 
-- 
2.34.1
