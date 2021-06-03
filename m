Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F8F6F478
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:39 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:15 +0530
Message-Id: <20210603122027.27330-12-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/24] tests/kms_color_chamelium: Extended
 IGT tests to support logarithmic gamma mode
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Extended IGT tests to support logarithmic gamma mode on pipe

V2:
* Disable gamma for CTM tests (Bhanu)

v3: Disable the pipe color properties before starting the test,
so that we begin with clean state. Addressed Bhanu's review comments.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
(cherry picked from commit b36d919700509f203f4463e033048135925274f2)
---
 tests/kms_color_chamelium.c | 61 +++++++++++++++++++++++++++++++------
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 24f25d964c..38c7169737 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -133,7 +133,7 @@ static void test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
 	igt_output_t *output;
-	gamma_lut_t *degamma_linear, *degamma_full;
+	gamma_lut_t *degamma_full;
 	gamma_lut_t *gamma_linear;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -152,9 +152,7 @@ static void test_pipe_degamma(data_t *data,
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
-
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
 	for_each_valid_output_on_pipe(&data->display,
@@ -208,8 +206,12 @@ static void test_pipe_degamma(data_t *data,
 		igt_plane_set_fb(primary, &fb_modeset);
 		disable_ctm(primary->pipe);
 		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_linear);
-		igt_display_commit(&data->display);
+		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE)) {
+			set_advance_gamma(data, primary->pipe, LINEAR_GAMMA);
+		} else {
+			set_gamma(data, primary->pipe, gamma_linear);
+			igt_display_commit(&data->display);
+		}
 
 		/* Draw solid colors with no degamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fbref);
@@ -235,9 +237,13 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+
+		/* Cleanup */
+		disable_gamma(primary->pipe);
+		disable_degamma(primary->pipe);
+		igt_display_commit(&data->display);
 	}
 
-	free_lut(degamma_linear);
 	free_lut(degamma_full);
 	free_lut(gamma_linear);
 }
@@ -319,10 +325,21 @@ static void test_pipe_gamma(data_t *data,
 		igt_assert(fbref_id);
 
 		igt_plane_set_fb(primary, &fb_modeset);
+
+		/* Reset the color properties */
 		disable_ctm(primary->pipe);
 		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_full);
+		disable_gamma(primary->pipe);
 		igt_display_commit(&data->display);
+		igt_wait_for_vblank(data->drm_fd,
+				    data->display.pipes[primary->pipe->pipe].crtc_offset);
+
+		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE)) {
+			set_advance_gamma(data, primary->pipe, MAX_GAMMA);
+		} else {
+			set_gamma(data, primary->pipe, gamma_full);
+			igt_display_commit(&data->display);
+		}
 
 		/* Draw solid colors with no gamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fbref);
@@ -347,6 +364,10 @@ static void test_pipe_gamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+
+		/* Cleanup */
+		disable_gamma(primary->pipe);
+		igt_display_commit(&data->display);
 	}
 
 	free_lut(gamma_full);
@@ -431,7 +452,10 @@ static bool test_pipe_ctm(data_t *data,
 
 		if (memcmp(before, after, sizeof(color_t))) {
 			set_degamma(data, primary->pipe, degamma_linear);
-			set_gamma(data, primary->pipe, gamma_linear);
+			if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE))
+				disable_gamma(primary->pipe);
+			else
+				set_gamma(data, primary->pipe, gamma_linear);
 		} else {
 			/* Disable Degamma and Gamma for ctm max test */
 			disable_degamma(primary->pipe);
@@ -465,6 +489,12 @@ static bool test_pipe_ctm(data_t *data,
 		igt_output_set_pipe(output, PIPE_NONE);
 	}
 
+	/* Cleanup */
+	disable_gamma(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
 	free_lut(degamma_linear);
 	free_lut(gamma_linear);
 
@@ -559,7 +589,14 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		igt_plane_set_fb(primary, &fb_modeset);
 
 		set_degamma(data, primary->pipe, degamma_linear);
-		set_gamma(data, primary->pipe, gamma_linear);
+		/*
+		 * No need of linear gamma for limited range ctm test
+		 * Not extending for new API interface.
+		 */
+		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE))
+			disable_gamma(primary->pipe);
+		else
+			set_gamma(data, primary->pipe, gamma_linear);
 		set_ctm(primary->pipe, ctm);
 
 		igt_output_set_prop_value(output,
@@ -596,6 +633,12 @@ static void test_pipe_limited_range_ctm(data_t *data,
 
 	}
 
+	/* Cleanup */
+	disable_gamma(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_ctm(primary->pipe);
+	igt_display_commit(&data->display);
+
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
