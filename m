Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE2D10EA2C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 01:41:08 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 07:05:52 +0530
Message-Id: <20220922013552.29453-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_frontbuffer_tracking:
 Convert tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Covert the existing subtests to dynamic subtests.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 265 ++++++++++++++------------
 1 file changed, 146 insertions(+), 119 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 9518c706..e4d7862d 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -3432,68 +3432,80 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		devid = intel_get_drm_devid(drm.fd);
 	}
 
-	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
-		if (!opt.show_hidden && t.feature == FEATURE_NONE)
-			continue;
-		for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
-			t.screen = SCREEN_PRIM;
-			t.plane = PLANE_PRI;
-			t.fbs = FBS_INDIVIDUAL;
-			t.format = FORMAT_DEFAULT;
-			/* Make sure nothing is using these values. */
-			t.flip = -1;
-			t.method = -1;
-			t.tiling = opt.tiling;
-
-			igt_subtest_f("%s-%s-rte",
-				      feature_str(t.feature),
-				      pipes_str(t.pipes))
-				rte_subtest(&t);
+	igt_subtest_with_dynamic("rte") {
+		for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
+			if (!opt.show_hidden && t.feature == FEATURE_NONE)
+				continue;
+			for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {
+				t.screen = SCREEN_PRIM;
+				t.plane = PLANE_PRI;
+				t.fbs = FBS_INDIVIDUAL;
+				t.format = FORMAT_DEFAULT;
+				/* Make sure nothing is using these values. */
+				t.flip = -1;
+				t.method = -1;
+				t.tiling = opt.tiling;
+					igt_dynamic_f("%s-%s-rte",
+						       feature_str(t.feature),
+						       pipes_str(t.pipes)) {
+						rte_subtest(&t);
+					}
+			}
 		}
 	}
 
-	TEST_MODE_ITER_BEGIN(t)
-		igt_subtest_f("%s-%s-%s-%s-%s-draw-%s",
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      screen_str(t.screen),
-			      plane_str(t.plane),
-			      fbs_str(t.fbs),
-			      igt_draw_get_method_name(t.method))
-			draw_subtest(&t);
-	TEST_MODE_ITER_END
+	igt_subtest_with_dynamic("draw") {
+		TEST_MODE_ITER_BEGIN(t)
+				igt_dynamic_f("%s-%s-%s-%s-%s-draw-%s",
+					       feature_str(t.feature),
+					       pipes_str(t.pipes),
+					       screen_str(t.screen),
+					       plane_str(t.plane),
+					       fbs_str(t.fbs),
+					       igt_draw_get_method_name(t.method)) {
+					draw_subtest(&t);
+				}
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.plane != PLANE_PRI ||
-		    t.screen == SCREEN_OFFSCREEN ||
-		    (!opt.show_hidden && t.method != IGT_DRAW_BLT))
-			continue;
+		TEST_MODE_ITER_END
+	}
 
-		for (t.flip = 0; t.flip < FLIP_COUNT; t.flip++)
-			igt_subtest_f("%s-%s-%s-%s-%sflip-%s",
+	igt_subtest_with_dynamic("flip") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.plane != PLANE_PRI ||
+			    t.screen == SCREEN_OFFSCREEN ||
+			    (!opt.show_hidden && t.method != IGT_DRAW_BLT))
+				continue;
+
+			for (t.flip = 0; t.flip < FLIP_COUNT; t.flip++)
+				igt_dynamic_f("%s-%s-%s-%s-%sflip-%s",
+					      feature_str(t.feature),
+					      pipes_str(t.pipes),
+					      screen_str(t.screen),
+					      fbs_str(t.fbs),
+					      flip_str(t.flip),
+					      igt_draw_get_method_name(t.method)) {
+					flip_subtest(&t);
+				}
+		TEST_MODE_ITER_END
+	}
+
+	igt_subtest_with_dynamic("fliptrack") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.plane != PLANE_PRI ||
+			    t.screen != SCREEN_PRIM ||
+			    t.method != IGT_DRAW_MMAP_GTT ||
+			    (t.feature & FEATURE_FBC) == 0)
+				continue;
+
+			igt_dynamic_f("%s-%s-%s-fliptrack-%s",
 				      feature_str(t.feature),
 				      pipes_str(t.pipes),
-				      screen_str(t.screen),
 				      fbs_str(t.fbs),
-				      flip_str(t.flip),
-				      igt_draw_get_method_name(t.method))
-				flip_subtest(&t);
-	TEST_MODE_ITER_END
-
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.plane != PLANE_PRI ||
-		    t.screen != SCREEN_PRIM ||
-		    t.method != IGT_DRAW_MMAP_GTT ||
-		    (t.feature & FEATURE_FBC) == 0)
-			continue;
-
-		igt_subtest_f("%s-%s-%s-fliptrack-%s",
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      fbs_str(t.fbs),
-			      igt_draw_get_method_name(t.method))
-			fliptrack_subtest(&t, FLIP_PAGEFLIP);
-	TEST_MODE_ITER_END
+				      igt_draw_get_method_name(t.method)) {
+				fliptrack_subtest(&t, FLIP_PAGEFLIP);
+			}
+		TEST_MODE_ITER_END
+	}
 
 	TEST_MODE_ITER_BEGIN(t)
 		if (t.screen == SCREEN_OFFSCREEN ||
@@ -3518,81 +3530,96 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			onoff_subtest(&t);
 	TEST_MODE_ITER_END
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.screen == SCREEN_OFFSCREEN ||
-		    t.method != IGT_DRAW_BLT ||
-		    t.plane != PLANE_SPR)
-			continue;
-
-		igt_subtest_f("%s-%s-%s-%s-%s-fullscreen",
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      screen_str(t.screen),
-			      plane_str(t.plane),
-			      fbs_str(t.fbs))
-			fullscreen_plane_subtest(&t);
-	TEST_MODE_ITER_END
+	igt_subtest_with_dynamic("fullscreen") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.screen == SCREEN_OFFSCREEN ||
+			    t.method != IGT_DRAW_BLT ||
+			    t.plane != PLANE_SPR)
+				continue;
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.screen != SCREEN_PRIM ||
-		    t.method != IGT_DRAW_BLT ||
-		    (!opt.show_hidden && t.plane != PLANE_PRI) ||
-		    (!opt.show_hidden && t.fbs != FBS_INDIVIDUAL))
-			continue;
+			igt_dynamic_f("%s-%s-%s-%s-%s-fullscreen",
+				      feature_str(t.feature),
+				      pipes_str(t.pipes),
+				      screen_str(t.screen),
+				      plane_str(t.plane),
+				      fbs_str(t.fbs)) {
+				fullscreen_plane_subtest(&t);
+			}
+		TEST_MODE_ITER_END
+	}
 
-		igt_subtest_f("%s-%s-%s-%s-multidraw",
-			      feature_str(t.feature),
-			      pipes_str(t.pipes),
-			      plane_str(t.plane),
-			      fbs_str(t.fbs))
-			multidraw_subtest(&t);
-	TEST_MODE_ITER_END
+	igt_subtest_with_dynamic("multidraw") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.screen != SCREEN_PRIM ||
+			    t.method != IGT_DRAW_BLT ||
+			    (!opt.show_hidden && t.plane != PLANE_PRI) ||
+			    (!opt.show_hidden && t.fbs != FBS_INDIVIDUAL))
+				continue;
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.pipes != PIPE_SINGLE ||
-		    t.screen != SCREEN_PRIM ||
-		    t.plane != PLANE_PRI ||
-		    t.fbs != FBS_INDIVIDUAL ||
-		    t.method != IGT_DRAW_MMAP_GTT)
-			continue;
+			igt_dynamic_f("%s-%s-%s-%s-multidraw",
+				      feature_str(t.feature),
+				      pipes_str(t.pipes),
+				      plane_str(t.plane),
+				      fbs_str(t.fbs)) {
+				multidraw_subtest(&t);
+			}
+		TEST_MODE_ITER_END
+	}
 
-		igt_subtest_f("%s-farfromfence-%s",
-			      feature_str(t.feature),
-			      igt_draw_get_method_name(t.method))
-			farfromfence_subtest(&t);
-	TEST_MODE_ITER_END
+	igt_subtest_with_dynamic("farfromfence") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.pipes != PIPE_SINGLE ||
+			    t.screen != SCREEN_PRIM ||
+			    t.plane != PLANE_PRI ||
+			    t.fbs != FBS_INDIVIDUAL ||
+			    t.method != IGT_DRAW_MMAP_GTT)
+				continue;
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.pipes != PIPE_SINGLE ||
-		    t.screen != SCREEN_PRIM ||
-		    t.plane != PLANE_PRI ||
-		    t.fbs != FBS_INDIVIDUAL)
-			continue;
+			igt_dynamic_f("%s-farfromfence-%s",
+				      feature_str(t.feature),
+				      igt_draw_get_method_name(t.method)) {
+				farfromfence_subtest(&t);
+			}
+		TEST_MODE_ITER_END
+	}
 
-		for (t.format = 0; t.format < FORMAT_COUNT; t.format++) {
-			/* Skip what we already tested. */
-			if (t.format == FORMAT_DEFAULT)
+	igt_subtest_with_dynamic("format-draw") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.pipes != PIPE_SINGLE ||
+			    t.screen != SCREEN_PRIM ||
+			    t.plane != PLANE_PRI ||
+			    t.fbs != FBS_INDIVIDUAL)
 				continue;
 
-			igt_subtest_f("%s-%s-draw-%s",
-				      feature_str(t.feature),
-				      format_str(t.format),
-				      igt_draw_get_method_name(t.method))
-				format_draw_subtest(&t);
-		}
-	TEST_MODE_ITER_END
+			for (t.format = 0; t.format < FORMAT_COUNT; t.format++) {
+				/* Skip what we already tested. */
+				if (t.format == FORMAT_DEFAULT)
+					continue;
 
-	TEST_MODE_ITER_BEGIN(t)
-		if (t.pipes != PIPE_SINGLE ||
-		    t.screen != SCREEN_PRIM ||
-		    t.plane != PLANE_PRI ||
-		    t.method != IGT_DRAW_BLT)
-			continue;
-		igt_subtest_f("%s-%s-scaledprimary",
+				igt_dynamic_f("%s-%s-draw-%s",
+					      feature_str(t.feature),
+					      format_str(t.format),
+					      igt_draw_get_method_name(t.method)) {
+					format_draw_subtest(&t);
+				}
+			}
+		TEST_MODE_ITER_END
+	}
+
+	igt_subtest_with_dynamic("scaledprimary") {
+		TEST_MODE_ITER_BEGIN(t)
+			if (t.pipes != PIPE_SINGLE ||
+			    t.screen != SCREEN_PRIM ||
+			    t.plane != PLANE_PRI ||
+			    t.method != IGT_DRAW_BLT)
+				continue;
+		igt_dynamic_f("%s-%s-scaledprimary",
 			      feature_str(t.feature),
-			      fbs_str(t.fbs))
+			      fbs_str(t.fbs)) {
 			scaledprimary_subtest(&t);
-	TEST_MODE_ITER_END
+		}
+		TEST_MODE_ITER_END
+	}
 
 	TEST_MODE_ITER_BEGIN(t)
 		if (t.pipes != PIPE_SINGLE ||
@@ -3610,8 +3637,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 				badstride_subtest(&t);
 
 			igt_subtest_f("%s-stridechange", feature_str(t.feature))
-				stridechange_subtest(&t);
 
+				stridechange_subtest(&t);
 			for (t.tiling = TILING_LINEAR; t.tiling < TILING_COUNT;
 			     t.tiling++) {
 				if (t.tiling == TILING_X)
-- 
2.36.0
