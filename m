Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A220C6E29E
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2020 02:31:37 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue, 11 Feb 2020 04:31:06 +0200
Message-Id: <20200211023108.25369-6-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-1-imre.deak@intel.com>
References: <20200211023108.25369-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v2 6/8] tests/kms_frontbuffer_tracking: Skip GTT
 subtests on platforms w/o aperture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Subtests that draw through a GTT mapping are not relevent on a platform w/o
GTT aperture, so skip them.

v2:
- Remove the check for aperture where it's not relevant, or where it
  would skip the test incorrectly (badformat_subtest()).

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_frontbuffer_tracking.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 724f5d16..881cb9ff 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -1934,6 +1934,9 @@ static void draw_subtest(const struct test_mode *t)
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *target;
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		if (t->method != IGT_DRAW_MMAP_GTT && t->plane == PLANE_PRI)
@@ -2032,6 +2035,11 @@ static void multidraw_subtest(const struct test_mode *t)
 			igt_debug("Methods %s and %s\n",
 				  igt_draw_get_method_name(m1),
 				  igt_draw_get_method_name(m2));
+
+			igt_skip_on((m1 == IGT_DRAW_MMAP_GTT ||
+				     m2 == IGT_DRAW_MMAP_GTT) &&
+				    !gem_has_mappable_ggtt(drm.fd));
+
 			for (r = 0; r < pattern->n_rects; r++) {
 				used_method = (r % 2 == 0) ? m1 : m2;
 
@@ -2276,6 +2284,9 @@ static void flip_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	enum color bg_color;
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		assertions |= ASSERT_LAST_ACTION_CHANGED;
@@ -2335,6 +2346,9 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern1;
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	prepare_subtest(t, pattern);
 
 	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
@@ -2744,6 +2758,9 @@ static void farfromfence_subtest(const struct test_mode *t)
 	int max_height, assertions = 0;
 	int gen = intel_gen(intel_get_drm_devid(drm.fd));
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	switch (gen) {
 	case 2:
 		max_height = 2048;
@@ -3025,6 +3042,9 @@ static void basic_subtest(const struct test_mode *t)
 	fb1 = params->primary.fb;
 
 	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++, r++) {
+		igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
+			    !gem_has_mappable_ggtt(drm.fd));
+
 		if (r == pattern->n_rects) {
 			params->primary.fb = (params->primary.fb == fb1) ? &fb2 : fb1;
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
