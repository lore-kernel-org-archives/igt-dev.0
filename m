Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A17F10E537
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 11:44:58 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Jun 2023 17:18:56 +0530
Message-Id: <20230601114856.2500802-6-kunal1.joshi@intel.com>
In-Reply-To: <20230601114856.2500802-1-kunal1.joshi@intel.com>
References: <20230601114856.2500802-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

xe only supports MMAP_WC, BLT and RENDER methods,

Open :- does draw method give guarantee for fb to be rendered
on return, if not how to assure, ex for RENDER we have intel_bb_sync

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_frontbuffer_tracking.c | 62 +++++++++++++++++----------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index e31918e8..49260626 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -309,6 +309,16 @@ struct {
 	.stop = true,
 };
 
+/*
+ * returns true if draw method is supported on XE
+ * Currently xe supports on MMAP_WC, BLT and RENDER
+ */
+static bool supported_xe_draw_method(enum igt_draw_method method)
+{
+	return method == IGT_DRAW_MMAP_WC || method == IGT_DRAW_BLT
+			 || method == IGT_DRAW_RENDER;
+}
+
 static drmModeModeInfo *get_connector_smallest_mode(igt_output_t *output)
 {
 	drmModeConnector *c = output->config.connector;
@@ -1307,10 +1317,12 @@ static void init_crcs(enum pixel_format format, enum tiling_type tiling,
 		for (r = 0; r < pattern->n_rects; r++)
 			for (r_ = 0; r_ <= r; r_++)
 				draw_rect_igt_fb(pattern, &tmp_fbs[r],
-						 IGT_DRAW_PWRITE, r_);
+						 is_xe_device(drm.fd)?IGT_DRAW_RENDER:IGT_DRAW_PWRITE,
+						 r_);
 	} else {
 		for (r = 0; r < pattern->n_rects; r++)
-			draw_rect_igt_fb(pattern, &tmp_fbs[r], IGT_DRAW_PWRITE,
+			draw_rect_igt_fb(pattern, &tmp_fbs[r],
+					 is_xe_device(drm.fd)?IGT_DRAW_RENDER:IGT_DRAW_PWRITE,
 					 r);
 	}
 
@@ -3180,6 +3192,9 @@ static void basic_subtest(const struct test_mode *t)
 	fb1 = params->primary.fb;
 
 	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
+		if (is_xe_device(drm.fd) && !supported_xe_draw_method(method))
+			continue;
+
 		if (method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm.fd))
 			continue;
@@ -3413,29 +3428,30 @@ static const char *tiling_str(enum tiling_type tiling)
 }
 
 #define TEST_MODE_ITER_BEGIN(t) \
-	t.format = FORMAT_DEFAULT;					   \
-	t.flip = FLIP_PAGEFLIP;						   \
-	t.tiling = opt.tiling;;						   \
-	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {	   \
-	for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {		   \
-	for (t.screen = 0; t.screen < SCREEN_COUNT; t.screen++) {	   \
-	for (t.plane = 0; t.plane < PLANE_COUNT; t.plane++) {		   \
-	for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {			   \
-	for (t.method = 0; t.method < IGT_DRAW_METHOD_COUNT; t.method++) { \
-		if (t.pipes == PIPE_SINGLE && t.screen == SCREEN_SCND)	   \
-			continue;					   \
-		if (t.screen == SCREEN_OFFSCREEN && t.plane != PLANE_PRI)  \
-			continue;					   \
-		if (!opt.show_hidden && t.pipes == PIPE_DUAL &&		   \
-		    t.screen == SCREEN_OFFSCREEN)			   \
-			continue;					   \
-		if (!opt.show_hidden && t.feature == FEATURE_NONE)	   \
-			continue;					   \
-		if (!opt.show_hidden && t.fbs == FBS_SHARED &&		   \
-		    (t.plane == PLANE_CUR || t.plane == PLANE_SPR))	   \
+       t.format = FORMAT_DEFAULT;                                               \
+       t.flip = FLIP_PAGEFLIP;                                                  \
+       t.tiling = opt.tiling;;                                                  \
+       for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {            \
+       for (t.pipes = 0; t.pipes < PIPE_COUNT; t.pipes++) {                     \
+       for (t.screen = 0; t.screen < SCREEN_COUNT; t.screen++) {                \
+       for (t.plane = 0; t.plane < PLANE_COUNT; t.plane++) {                    \
+       for (t.fbs = 0; t.fbs < FBS_COUNT; t.fbs++) {                            \
+       for (t.method = 0; t.method < IGT_DRAW_METHOD_COUNT; t.method++) {       \
+	if (is_xe_device(drm.fd) && !supported_xe_draw_method(t.method))        \
+		continue;                                                       \
+	if (t.pipes == PIPE_SINGLE && t.screen == SCREEN_SCND)                  \
+		continue;                                                       \
+	if (t.screen == SCREEN_OFFSCREEN && t.plane != PLANE_PRI)               \
+		continue;                                                       \
+	if (!opt.show_hidden && t.pipes == PIPE_DUAL &&                         \
+		   t.screen == SCREEN_OFFSCREEN)                                \
+		continue;                                                       \
+	if (!opt.show_hidden && t.feature == FEATURE_NONE)                      \
+		continue;                                                       \
+	if (!opt.show_hidden && t.fbs == FBS_SHARED &&                          \
+		   (t.plane == PLANE_CUR || t.plane == PLANE_SPR))              \
 			continue;
 
-
 #define TEST_MODE_ITER_END } } } } } }
 
 struct option long_options[] = {
-- 
2.25.1
