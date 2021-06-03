Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu,  3 Jun 2021 20:25:41 +0530
Message-Id: <1622732141-13561-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color: Remove gamma code from
 degamma tests
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
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: charlton.lin@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

CRC should be collected without degamma transformation
and after drawing gradient with degamma LUT.
This patch removes things which are not related to degamma
and makes it similar to pipe gamma test.

Change-Id: I37f957b3a95dfe95119f0f0941f20c10471f437c
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_color.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 3a42532a5c27..2c9821cdecce 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -31,8 +31,7 @@ static void test_pipe_degamma(data_t *data,
 {
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
-	gamma_lut_t *degamma_linear, *degamma_full;
-	gamma_lut_t *gamma_linear;
+	gamma_lut_t *degamma_full;
 	color_t red_green_blue[] = {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -42,11 +41,8 @@ static void test_pipe_degamma(data_t *data,
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
 	degamma_full = generate_table_max(data->degamma_lut_size);
 
-	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
-
 	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
 		drmModeModeInfo *mode;
 		struct igt_fb fb_modeset, fb;
@@ -75,8 +71,7 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, &fb_modeset);
 		disable_ctm(primary->pipe);
-		disable_degamma(primary->pipe);
-		set_gamma(data, primary->pipe, gamma_linear);
+		set_degamma(data, primary->pipe, degamma_full);
 		igt_display_commit(&data->display);
 
 		/* Draw solid colors with no degamma transformation. */
@@ -92,7 +87,6 @@ static void test_pipe_degamma(data_t *data,
 		 */
 		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
 		igt_plane_set_fb(primary, &fb);
-		set_degamma(data, primary->pipe, degamma_full);
 		igt_display_commit(&data->display);
 		igt_wait_for_vblank(data->drm_fd,
 				display->pipes[primary->pipe->pipe].crtc_offset);
@@ -105,13 +99,13 @@ static void test_pipe_degamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_display_commit2(&data->display, data->display.is_atomic ?
+							COMMIT_ATOMIC : COMMIT_LEGACY);
 		igt_remove_fb(data->drm_fd, &fb);
 		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
 
-	free_lut(degamma_linear);
 	free_lut(degamma_full);
-	free_lut(gamma_linear);
 }
 
 /*
@@ -191,6 +185,8 @@ static void test_pipe_gamma(data_t *data,
 
 		igt_plane_set_fb(primary, NULL);
 		igt_output_set_pipe(output, PIPE_NONE);
+		igt_display_commit2(&data->display, data->display.is_atomic ?
+							COMMIT_ATOMIC : COMMIT_LEGACY);
 		igt_remove_fb(data->drm_fd, &fb);
 		igt_remove_fb(data->drm_fd, &fb_modeset);
 	}
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
