Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED506F478
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 12:31:38 +0000 (UTC)
From: venkata.sai.patnana@intel.com
Date: Thu,  3 Jun 2021 17:50:14 +0530
Message-Id: <20210603122027.27330-11-venkata.sai.patnana@intel.com>
In-Reply-To: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
References: <20210603122027.27330-1-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/24] tests/kms_color: Extended IGT tests
 to support logarithmic gamma mode
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

From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>

Extended IGT tests to support logarithmic gamma mode on pipe

v5: Move all compute/set logic to advance gamma mode function
v4: Make the changes more genreric
    Reset the Client caps once done.
v3: Refactor the changes.
    Keep the wrappers remain same.
    Added Client caps support(Uma)
v4: Disable gamma in ctm tests (Bhanu)
    Remove unused variables (Bhanu)
v5: Disable gamma before starting gamma tests.

Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
(cherry picked from commit 521a1c1fcd945fced7bd169476a8b81a80b313d1)
---
 tests/kms_color.c | 33 +++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 0387c9192a..f8e0485f75 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -129,7 +129,7 @@ static void test_pipe_degamma(data_t *data,
 {
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
-	gamma_lut_t *degamma_linear, *degamma_full;
+	gamma_lut_t *degamma_full;
 	gamma_lut_t *gamma_linear;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
@@ -140,9 +140,7 @@ static void test_pipe_degamma(data_t *data,
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
-
 	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
 
 	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
@@ -174,8 +172,13 @@ static void test_pipe_degamma(data_t *data,
 		igt_plane_set_fb(primary, &fb_modeset);
 		disable_ctm(primary->pipe);
 		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_linear);
-		igt_display_commit(&data->display);
+		if (igt_pipe_obj_has_prop(primary->pipe,
+					  IGT_CRTC_GAMMA_MODE)) {
+			set_advance_gamma(data, primary->pipe, LINEAR_GAMMA);
+		} else {
+			set_gamma(data, primary->pipe, gamma_linear);
+			igt_display_commit(&data->display);
+		}
 
 		/* Draw solid colors with no degamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fb);
@@ -207,7 +210,6 @@ static void test_pipe_degamma(data_t *data,
 		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
-	free_lut(degamma_linear);
 	free_lut(degamma_full);
 	free_lut(gamma_linear);
 }
@@ -259,10 +261,22 @@ static void test_pipe_gamma(data_t *data,
 		igt_assert(fb_modeset_id);
 
 		igt_plane_set_fb(primary, &fb_modeset);
+
+		/* Reset Color properties */
 		disable_ctm(primary->pipe);
 		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_full);
+		disable_gamma(primary->pipe);
 		igt_display_commit(&data->display);
+		igt_wait_for_vblank(data->drm_fd,
+				    display->pipes[primary->pipe->pipe].crtc_offset);
+
+		if (igt_pipe_obj_has_prop(primary->pipe,
+					  IGT_CRTC_GAMMA_MODE)) {
+			set_advance_gamma(data, primary->pipe, MAX_GAMMA);
+		} else {
+			set_gamma(data, primary->pipe, gamma_full);
+			igt_display_commit(&data->display);
+		}
 
 		/* Draw solid colors with no gamma transformation. */
 		paint_rectangles(data, mode, red_green_blue, &fb);
@@ -580,7 +594,10 @@ static bool test_pipe_ctm(data_t *data,
 		 */
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
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
