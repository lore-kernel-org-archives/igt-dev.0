Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABD110E110
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Nov 2022 18:41:06 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Nov 2022 17:40:21 -0100
Message-Id: <20221103184021.13961-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_color: check degamma and gamma
 props in CTM subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Some CTM subtests generate and set degamma/gamma LUTs without checking
if these properties are supported by the driver. Therefore, if degamma
and gamma are used in the subtest, check the color properties before
generate and set LUTs. If these properties are not supported, these
subtests will skip instead of failing.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_color.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e4dc2465..e0222c42 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -463,7 +463,7 @@ static bool test_pipe_ctm(data_t *data,
 	};
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output = data->output;
-	bool ret = true;
+	bool set_luts, ret = true;
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode = data->mode;
 	struct igt_fb fb_modeset, fb;
@@ -472,9 +472,6 @@ static bool test_pipe_ctm(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
-	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
-
 	igt_output_set_pipe(output, primary->pipe->pipe);
 	igt_output_override_mode(output, mode);
 
@@ -501,7 +498,14 @@ static bool test_pipe_ctm(data_t *data,
 	 * representing intermediate values between 0 and 1.0 causes
 	 * rounding issues and inaccuracies leading to crc mismatch.
 	 */
-	if (memcmp(before, after, sizeof(color_t))) {
+	set_luts = memcmp(before, after, sizeof(color_t));
+	if (set_luts) {
+		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
+		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
+		gamma_linear = generate_table(data->gamma_lut_size, 1.0);
+
 		set_degamma(data, primary->pipe, degamma_linear);
 		set_gamma(data, primary->pipe, gamma_linear);
 	} else {
@@ -542,8 +546,10 @@ static bool test_pipe_ctm(data_t *data,
 	igt_remove_fb(data->drm_fd, &fb);
 	igt_remove_fb(data->drm_fd, &fb_modeset);
 
-	free_lut(degamma_linear);
-	free_lut(gamma_linear);
+	if (set_luts) {
+		free_lut(degamma_linear);
+		free_lut(gamma_linear);
+	}
 
 	return ret;
 }
-- 
2.35.1
