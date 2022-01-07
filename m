Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820D311332D
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jan 2022 05:35:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  7 Jan 2022 11:02:36 +0530
Message-Id: <20220107053238.1760508-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
References: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 i-g-t 13/15] tests/kms_color: Extended IGT tests to
 support logarithmic gamma mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>, Pekka Paalanen <ppaalanen@gmail.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Extended IGT tests to support logarithmic gamma mode on pipe

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 212442fb42..d4b251efb1 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -208,8 +208,6 @@ static void test_pipe_gamma(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	gamma_full = generate_table_max(data->gamma_lut_size);
-
 	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
 	igt_require(output);
 
@@ -234,10 +232,13 @@ static void test_pipe_gamma(data_t *data,
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
+	/* Reset Color properties */
 	disable_ctm(primary->pipe);
 	disable_degamma(primary->pipe);
-	set_gamma(data, primary->pipe, gamma_full);
+	disable_gamma(primary->pipe);
 	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
 
 	/* Draw solid colors with no gamma transformation. */
 	paint_rectangles(data, mode, red_green_blue, &fb);
@@ -250,6 +251,13 @@ static void test_pipe_gamma(data_t *data,
 	/* Draw a gradient with gamma LUT to remap all values
 	 * to max red/green/blue.
 	 */
+	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE)) {
+		set_advance_gamma(data, primary->pipe, MAX_GAMMA);
+	} else {
+		gamma_full = generate_table_max(data->gamma_lut_size);
+		set_gamma(data, primary->pipe, gamma_full);
+		igt_display_commit(&data->display);
+	}
 	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
@@ -557,7 +565,10 @@ static bool test_pipe_ctm(data_t *data,
 	 */
 	if (memcmp(before, after, sizeof(color_t))) {
 		set_degamma(data, primary->pipe, degamma_linear);
-		set_gamma(data, primary->pipe, gamma_linear);
+		if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_MODE))
+			disable_gamma(primary->pipe);
+		else
+			set_gamma(data, primary->pipe, gamma_linear);
 	} else {
 		/* Disable Degamma and Gamma for ctm max test */
 		disable_degamma(primary->pipe);
-- 
2.32.0
