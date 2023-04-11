Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E35210E5A4
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:16:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:48 +0300
Message-Id: <20230411161555.10001-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/9] tests/kms_color: Make loads of stuff
 static const
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Huge swaths of the data used in the test can be made static const.
The one slightly tricky part is 'expected_colors' which is being
mutated in the ctm tests. But we can just use an on stack variable
for that.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c        | 47 +++++++++++++++++++++-------------------
 tests/kms_color_helper.c |  4 ++--
 tests/kms_color_helper.h |  4 ++--
 3 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 84a8eabe5484..5c4d884f4de8 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -321,7 +321,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 static bool test_pipe_legacy_gamma_reset(data_t *data,
 					 igt_plane_t *primary)
 {
-	const double ctm_identity[] = {
+	static const double ctm_identity[] = {
 		1.0, 0.0, 0.0,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0,
@@ -454,11 +454,11 @@ end:
  */
 static bool test_pipe_ctm(data_t *data,
 			  igt_plane_t *primary,
-			  color_t *before,
-			  color_t *after,
-			  double *ctm_matrix)
+			  const color_t *before,
+			  const color_t *after,
+			  const double *ctm_matrix)
 {
-	const double ctm_identity[] = {
+	static const double ctm_identity[] = {
 		1.0, 0.0, 0.0,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0,
@@ -566,17 +566,17 @@ static void test_pipe_limited_range_ctm(data_t *data,
 					igt_plane_t *primary)
 {
 	double limited_result = 235.0 / 255.0;
-	color_t red_green_blue_limited[] = {
+	static const color_t red_green_blue_limited[] = {
 		{ limited_result, 0.0, 0.0 },
 		{ 0.0, limited_result, 0.0 },
 		{ 0.0, 0.0, limited_result },
 	};
-	color_t red_green_blue_full[] = {
+	static const color_t red_green_blue_full[] = {
 		{ 0.5, 0.0, 0.0 },
 		{ 0.0, 0.5, 0.0 },
 		{ 0.0, 0.0, 0.5 },
 	};
-	double ctm[] = {
+	static const double ctm[] = {
 		1.0, 0.0, 0.0,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0,
@@ -737,12 +737,12 @@ out:
 
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
-		       color_t *expected_colors,
-		       double *ctm,
+		       const color_t *expected_colors,
+		       const double *ctm,
 		       int iter)
 {
 	double delta;
-	color_t red_green_blue[] = {
+	static const color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 },
@@ -777,12 +777,15 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		 * for odd number of items in the LUTs.
 		 */
 		for (i = 0; i < iter; i++) {
-			expected_colors[0].r =
-				expected_colors[1].g =
-				expected_colors[2].b =
-				ctm[0] + delta * (i - (iter / 2));
+			float c = ctm[0] + delta * (i - (iter / 2));
+			color_t expected_colors_local[] = {
+				{ .r = c, },
+				{ .g = c, },
+				{ .b = c, },
+			};
+
 			if (test_pipe_ctm(data, data->primary, red_green_blue,
-					  expected_colors, ctm)) {
+					  expected_colors_local, ctm)) {
 				success = true;
 				break;
 			}
@@ -798,17 +801,17 @@ static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
 	igt_output_t *output;
-	color_t blue_green_blue[] = {
+	static const color_t blue_green_blue[] = {
 		{ 0.0, 0.0, 1.0 },
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 },
 	};
-	color_t red_green_blue[] = {
+	static const color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 }
+		{ 0.0, 0.0, 1.0 },
 	};
-	double ctm[] = {
+	static const double ctm[] = {
 		0.0, 0.0, 0.0,
 		0.0, 1.0, 0.0,
 		1.0, 0.0, 1.0,
@@ -923,7 +926,7 @@ static void
 run_tests_for_pipe(data_t *data)
 {
 	enum pipe pipe;
-	struct {
+	static const struct {
 		const char *name;
 		bool (*test_t)(data_t*, igt_plane_t*);
 		const char *desc;
@@ -945,7 +948,7 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property",
 		},
 	};
-	struct {
+	static const struct {
 		const char *name;
 		int iter;
 		color_t colors[3];
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 2f9950f801e4..5089bc373343 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -54,7 +54,7 @@ uint64_t get_max_bpc(igt_output_t *output)
 
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
-			       color_t *colors,
+			       const color_t *colors,
 			       struct igt_fb *fb)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
@@ -90,7 +90,7 @@ void paint_gradient_rectangles(data_t *data,
 
 void paint_rectangles(data_t *data,
 		      drmModeModeInfo *mode,
-		      color_t *colors,
+		      const color_t *colors,
 		      struct igt_fb *fb)
 {
 	cairo_t *cr = igt_get_cairo_ctx(data->drm_fd, fb);
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 78b97b00864f..23463b944b6f 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -74,11 +74,11 @@ bool panel_supports_deep_color(int fd, char *output_name);
 uint64_t get_max_bpc(igt_output_t *output);
 void paint_gradient_rectangles(data_t *data,
 			       drmModeModeInfo *mode,
-			       color_t *colors,
+			       const color_t *colors,
 			       struct igt_fb *fb);
 void paint_rectangles(data_t *data,
 		      drmModeModeInfo *mode,
-		      color_t *colors,
+		      const color_t *colors,
 		      struct igt_fb *fb);
 gamma_lut_t *alloc_lut(int lut_size);
 void free_lut(gamma_lut_t *gamma);
-- 
2.39.2
