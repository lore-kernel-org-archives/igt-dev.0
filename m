Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D48D6EAD5
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jun 2021 07:34:37 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Tue,  8 Jun 2021 12:55:18 +0530
Message-Id: <1623137118-16598-3-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1623137118-16598-1-git-send-email-vidya.srinivas@intel.com>
References: <1623137118-16598-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_color_chamelium: Disable
 gamma in degamma tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: petri.latvala@intel.com, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This patch disables gamma in degamma subtest which is missing.
It compares CRC between (linear degamma + solid colors) and (max
degamma + gradient colors). Patch also cleans up degamma before
exiting degamma test and cleans up gamma before exiting gamma
test.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_color_chamelium.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 30b38b82e306..11e5286912d7 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -36,7 +36,6 @@ static void test_pipe_degamma(data_t *data,
 {
 	igt_output_t *output;
 	gamma_lut_t *degamma_linear, *degamma_full;
-	gamma_lut_t *gamma_linear;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -57,8 +56,6 @@ static void test_pipe_degamma(data_t *data,
 	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
-	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
-
 	for_each_valid_output_on_pipe(&data->display,
 				      primary->pipe->pipe,
 				      output) {
@@ -109,11 +106,11 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, &fb_modeset);
 		disable_ctm(primary->pipe);
-		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_linear);
+		disable_gamma(primary->pipe);
+		set_degamma(data, primary->pipe, degamma_linear);
 		igt_display_commit(&data->display);
 
-		/* Draw solid colors with no degamma transformation. */
+		/* Draw solid colors with linear degamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fbref);
 
 		/* Draw a gradient with degamma LUT to remap all
@@ -135,13 +132,14 @@ static void test_pipe_degamma(data_t *data,
 					      frame_fullcolors, &fbref,
 					      CHAMELIUM_CHECK_ANALOG);
 
+		disable_degamma(primary->pipe);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_display_commit(&data->display);
 	}
 
 	free_lut(degamma_linear);
 	free_lut(degamma_full);
-	free_lut(gamma_linear);
 }
 
 /*
@@ -247,8 +245,10 @@ static void test_pipe_gamma(data_t *data,
 					      frame_fullcolors, &fbref,
 					      CHAMELIUM_CHECK_ANALOG);
 
+		disable_gamma(primary->pipe);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_display_commit(&data->display);
 	}
 
 	free_lut(gamma_full);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
