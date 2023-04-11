Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B056E10E4CE
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Apr 2023 07:51:15 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 11 Apr 2023 10:50:57 +0300
Message-Id: <20230411075101.2785-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
References: <20230411075101.2785-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/8] tests/kms_color: Pass down the colors
 used to paint the fb
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

Instead of assuming we always want RGB stripes in the fb let's
pass those colors down from the top. Will be needed to make
more interesting tests that mix colors from multiple channels.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 5c4d884f4de8..e3fe2aea4695 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -737,16 +737,12 @@ out:
 
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
+		       const color_t *fb_colors,
 		       const color_t *expected_colors,
 		       const double *ctm,
 		       int iter)
 {
 	double delta;
-	static const color_t red_green_blue[] = {
-		{ 1.0, 0.0, 0.0 },
-		{ 0.0, 1.0, 0.0 },
-		{ 0.0, 0.0, 1.0 },
-	};
 
 	test_setup(data, p);
 
@@ -767,7 +763,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		int i;
 
 		if (!iter)
-			success = test_pipe_ctm(data, data->primary, red_green_blue,
+			success = test_pipe_ctm(data, data->primary, fb_colors,
 						expected_colors, ctm);
 
 		/*
@@ -784,7 +780,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 				{ .b = c, },
 			};
 
-			if (test_pipe_ctm(data, data->primary, red_green_blue,
+			if (test_pipe_ctm(data, data->primary, fb_colors,
 					  expected_colors_local, ctm)) {
 				success = true;
 				break;
@@ -948,14 +944,21 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property",
 		},
 	};
+	static const color_t colors_rgb[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 },
+	};
 	static const struct {
 		const char *name;
 		int iter;
+		const color_t *fb_colors;
 		color_t colors[3];
 		double ctm[9];
 		const char *desc;
 	} ctm_tests[] = {
 		{ .name = "ctm-red-to-blue",
+		  .fb_colors = colors_rgb,
 		  .colors = {
 			  { 0.0, 0.0, 1.0 },
 			  { 0.0, 1.0, 0.0 },
@@ -969,6 +972,7 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Check the color transformation from red to blue",
 		},
 		{ .name = "ctm-green-to-red",
+		  .fb_colors = colors_rgb,
 		  .colors = {
 			  { 1.0, 0.0, 0.0 },
 			  { 1.0, 0.0, 0.0 },
@@ -982,6 +986,7 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Check the color transformation from green to red",
 		},
 		{ .name = "ctm-blue-to-red",
+		  .fb_colors = colors_rgb,
 		  .colors = {
 			  { 1.0, 0.0, 0.0 },
 			  { 0.0, 1.0, 0.0 },
@@ -995,6 +1000,7 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Check the color transformation from blue to red",
 		},
 		{ .name = "ctm-max",
+		  .fb_colors = colors_rgb,
 		  .colors = {
 			  { 1.0, 0.0, 0.0 },
 			  { 0.0, 1.0, 0.0 },
@@ -1007,6 +1013,7 @@ run_tests_for_pipe(data_t *data)
 		  .desc = "Check the color transformation for maximum transparency",
 		},
 		{ .name = "ctm-negative",
+		  .fb_colors = colors_rgb,
 		  .colors = {
 			  { 0.0, 0.0, 0.0 },
 			  { 0.0, 0.0, 0.0 },
@@ -1021,6 +1028,7 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-0-25",
 		  .iter = 5,
+		  .fb_colors = colors_rgb,
 		  .ctm = {
 			  0.25, 0.0,  0.0,
 			  0.0,  0.25, 0.0,
@@ -1030,6 +1038,7 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-0-50",
 		  .iter = 5,
+		  .fb_colors = colors_rgb,
 		  .ctm = {
 			  0.5,  0.0,  0.0,
 			  0.0,  0.5,  0.0,
@@ -1039,6 +1048,7 @@ run_tests_for_pipe(data_t *data)
 		},
 		{ .name = "ctm-0-75",
 		  .iter = 7,
+		  .fb_colors = colors_rgb,
 		  .ctm = {
 			  0.75, 0.0,  0.0,
 			  0.0,  0.75, 0.0,
@@ -1064,6 +1074,7 @@ run_tests_for_pipe(data_t *data)
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
 				run_ctm_tests_for_pipe(data, pipe,
+						       ctm_tests[i].fb_colors,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
 						       ctm_tests[i].iter);
-- 
2.39.2
