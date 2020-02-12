Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF2596E119
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 21:51:01 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Wed, 12 Feb 2020 23:50:35 +0200
Message-Id: <20200212215036.27407-2-imre.deak@intel.com>
In-Reply-To: <20200211023108.25369-6-imre.deak@intel.com>
References: <20200211023108.25369-6-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 6/8] tests/kms_frontbuffer_tracking: Skip GTT
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

basic_subtest() so far expected that each method drew a new rectangle to
the FB (see the pattern::frames_stack flag), so fix up things allowing
the skip now.

v2:
- Remove the check for aperture where it's not relevant, or where it
  would skip the test incorrectly (badformat_subtest()).
v3:
- Don't skip the whole subtest where multiple draw methods are used.
  (Ashutosh).

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com> (v2)
---
 tests/kms_frontbuffer_tracking.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 724f5d16c..c4b4af43a 100644
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
@@ -2032,6 +2035,12 @@ static void multidraw_subtest(const struct test_mode *t)
 			igt_debug("Methods %s and %s\n",
 				  igt_draw_get_method_name(m1),
 				  igt_draw_get_method_name(m2));
+
+			if ((m1 == IGT_DRAW_MMAP_GTT ||
+			     m2 == IGT_DRAW_MMAP_GTT) &&
+			    !gem_has_mappable_ggtt(drm.fd))
+				continue;
+
 			for (r = 0; r < pattern->n_rects; r++) {
 				used_method = (r % 2 == 0) ? m1 : m2;
 
@@ -2276,6 +2285,9 @@ static void flip_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	enum color bg_color;
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	switch (t->screen) {
 	case SCREEN_PRIM:
 		assertions |= ASSERT_LAST_ACTION_CHANGED;
@@ -2335,6 +2347,9 @@ static void fliptrack_subtest(const struct test_mode *t, enum flip_type type)
 	struct modeset_params *params = pick_params(t);
 	struct draw_pattern_info *pattern = &pattern1;
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	prepare_subtest(t, pattern);
 
 	create_fb(t->format, params->primary.fb->width, params->primary.fb->height,
@@ -2744,6 +2759,9 @@ static void farfromfence_subtest(const struct test_mode *t)
 	int max_height, assertions = 0;
 	int gen = intel_gen(intel_get_drm_devid(drm.fd));
 
+	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd));
+
 	switch (gen) {
 	case 2:
 		max_height = 2048;
@@ -3024,7 +3042,11 @@ static void basic_subtest(const struct test_mode *t)
 		  opt.tiling, t->plane, &fb2);
 	fb1 = params->primary.fb;
 
-	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++, r++) {
+	for (r = 0, method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
+		if (method == IGT_DRAW_MMAP_GTT &&
+		    !gem_has_mappable_ggtt(drm.fd))
+			continue;
+
 		if (r == pattern->n_rects) {
 			params->primary.fb = (params->primary.fb == fb1) ? &fb2 : fb1;
 
@@ -3040,6 +3062,8 @@ static void basic_subtest(const struct test_mode *t)
 		draw_rect(pattern, &params->primary, method, r);
 		update_wanted_crc(t, &pattern->crcs[t->format][r]);
 		do_assertions(assertions);
+
+		r++;
 	}
 
 	igt_remove_fb(drm.fd, &fb2);
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
