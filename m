Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C7D10E931
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:48:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:44 +0530
Message-Id: <20220506054446.3228224-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 13/15] tests/kms_color: Extended IGT tests to support
 logarithmic gamma mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Extended IGT tests to support logarithmic gamma mode on pipe

V2:
* Rebase

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
index 665f06c2..43b5d110 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -209,8 +209,6 @@ static bool test_pipe_gamma(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	gamma_full = generate_table_max(data->gamma_lut_size);
-
 	igt_output_set_pipe(output, primary->pipe->pipe);
 	mode = igt_output_get_mode(output);
 
@@ -232,10 +230,13 @@ static bool test_pipe_gamma(data_t *data,
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
@@ -248,6 +249,13 @@ static bool test_pipe_gamma(data_t *data,
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
@@ -554,7 +562,10 @@ static bool test_pipe_ctm(data_t *data,
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
2.35.1
