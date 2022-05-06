Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9368510E9C7
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:48:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:45 +0530
Message-Id: <20220506054446.3228224-15-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 14/15] tests/kms_color_chamelium: Extended IGT tests
 to support logarithmic gamma mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Extended IGT tests to support logarithmic gamma mode on pipe

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color_chamelium.c | 40 ++++++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 62851006..000f5d05 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -293,10 +293,21 @@ static void test_pipe_gamma(data_t *data,
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
@@ -319,6 +330,7 @@ static void test_pipe_gamma(data_t *data,
 					      frame_fullcolors, &fbref,
 					      CHAMELIUM_CHECK_ANALOG);
 
+		/* Cleanup */
 		disable_gamma(primary->pipe);
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
@@ -407,7 +419,10 @@ static bool test_pipe_ctm(data_t *data,
 
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
@@ -441,6 +456,12 @@ static bool test_pipe_ctm(data_t *data,
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
 
@@ -537,7 +558,14 @@ static void test_pipe_limited_range_ctm(data_t *data,
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
@@ -574,6 +602,12 @@ static void test_pipe_limited_range_ctm(data_t *data,
 
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
2.35.1
