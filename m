Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4276310E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 16:16:12 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 19:15:50 +0300
Message-Id: <20230411161555.10001-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
References: <20230411161555.10001-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 5/9] tests/kms_color: Get rid of hand
 coded "expected_colors"
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

Instead of specifying the expected colors by hand just apply
the ctm to the fb colors and let the computer do the work for
us.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 59 +++++++++++++++++------------------------------
 1 file changed, 21 insertions(+), 38 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e3fe2aea4695..d430ee12aaa3 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -735,10 +735,18 @@ out:
 	test_cleanup(data);
 }
 
+static void transform_color(color_t *color, const double *ctm, double offset)
+{
+	color_t tmp = *color;
+
+	color->r = ctm[0] * tmp.r + ctm[1] * tmp.g + ctm[2] * tmp.b + offset;
+	color->g = ctm[3] * tmp.r + ctm[4] * tmp.g + ctm[5] * tmp.b + offset;
+	color->b = ctm[6] * tmp.r + ctm[7] * tmp.g + ctm[8] * tmp.b + offset;
+}
+
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		       const color_t *fb_colors,
-		       const color_t *expected_colors,
 		       const double *ctm,
 		       int iter)
 {
@@ -758,14 +766,13 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 	if (!pipe_output_combo_valid(data, p))
 		goto out;
 
+	if (!iter)
+		iter = 1;
+
 	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name) {
 		bool success = false;
 		int i;
 
-		if (!iter)
-			success = test_pipe_ctm(data, data->primary, fb_colors,
-						expected_colors, ctm);
-
 		/*
 		 * We tests a few values around the expected result because
 		 * it depends on the hardware we're dealing with, we can either
@@ -773,15 +780,18 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		 * for odd number of items in the LUTs.
 		 */
 		for (i = 0; i < iter; i++) {
-			float c = ctm[0] + delta * (i - (iter / 2));
-			color_t expected_colors_local[] = {
-				{ .r = c, },
-				{ .g = c, },
-				{ .b = c, },
+			color_t expected_colors[3] = {
+				fb_colors[0],
+				fb_colors[1],
+				fb_colors[2],
 			};
 
+			transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
+			transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
+			transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
+
 			if (test_pipe_ctm(data, data->primary, fb_colors,
-					  expected_colors_local, ctm)) {
+					  expected_colors, ctm)) {
 				success = true;
 				break;
 			}
@@ -953,17 +963,11 @@ run_tests_for_pipe(data_t *data)
 		const char *name;
 		int iter;
 		const color_t *fb_colors;
-		color_t colors[3];
 		double ctm[9];
 		const char *desc;
 	} ctm_tests[] = {
 		{ .name = "ctm-red-to-blue",
 		  .fb_colors = colors_rgb,
-		  .colors = {
-			  { 0.0, 0.0, 1.0 },
-			  { 0.0, 1.0, 0.0 },
-			  { 0.0, 0.0, 1.0 },
-		  },
 		  .ctm = {
 			  0.0, 0.0, 0.0,
 			  0.0, 1.0, 0.0,
@@ -973,11 +977,6 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-green-to-red",
 		  .fb_colors = colors_rgb,
-		  .colors = {
-			  { 1.0, 0.0, 0.0 },
-			  { 1.0, 0.0, 0.0 },
-			  { 0.0, 0.0, 1.0 },
-		  },
 		  .ctm = {
 			  1.0, 1.0, 0.0,
 			  0.0, 0.0, 0.0,
@@ -987,11 +986,6 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-blue-to-red",
 		  .fb_colors = colors_rgb,
-		  .colors = {
-			  { 1.0, 0.0, 0.0 },
-			  { 0.0, 1.0, 0.0 },
-			  { 1.0, 0.0, 0.0 },
-		  },
 		  .ctm = {
 			  1.0, 0.0, 1.0,
 			  0.0, 1.0, 0.0,
@@ -1001,11 +995,6 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-max",
 		  .fb_colors = colors_rgb,
-		  .colors = {
-			  { 1.0, 0.0, 0.0 },
-			  { 0.0, 1.0, 0.0 },
-			  { 0.0, 0.0, 1.0 },
-		  },
 		  .ctm = { 100.0, 0.0, 0.0,
 			  0.0, 100.0, 0.0,
 			  0.0, 0.0, 100.0,
@@ -1014,11 +1003,6 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-negative",
 		  .fb_colors = colors_rgb,
-		  .colors = {
-			  { 0.0, 0.0, 0.0 },
-			  { 0.0, 0.0, 0.0 },
-			  { 0.0, 0.0, 0.0 },
-		  },
 		  .ctm = {
 			  -1.0,  0.0,  0.0,
 			   0.0, -1.0,  0.0,
@@ -1075,7 +1059,6 @@ run_tests_for_pipe(data_t *data)
 			for_each_pipe(&data->display, pipe) {
 				run_ctm_tests_for_pipe(data, pipe,
 						       ctm_tests[i].fb_colors,
-						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
 			}
-- 
2.39.2
