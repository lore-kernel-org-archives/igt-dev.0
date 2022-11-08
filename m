Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E8B10E503
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 19:45:44 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 18:44:49 -0100
Message-Id: <20221108194449.6288-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3] tests/kms_color: check degamma and gamma
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

v2:
- remove unnecessary set_luts check (Alex Hung)

v3:
- initialize degamma and gamma LUTs as NULL

Signed-off-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_color.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e4dc2465..d016cefb 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -461,7 +461,7 @@ static bool test_pipe_ctm(data_t *data,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0
 	};
-	gamma_lut_t *degamma_linear, *gamma_linear;
+	gamma_lut_t *degamma_linear = NULL, *gamma_linear = NULL;
 	igt_output_t *output = data->output;
 	bool ret = true;
 	igt_display_t *display = &data->display;
@@ -472,9 +472,6 @@ static bool test_pipe_ctm(data_t *data,
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
 
-	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
-	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
-
 	igt_output_set_pipe(output, primary->pipe->pipe);
 	igt_output_override_mode(output, mode);
 
@@ -502,6 +499,12 @@ static bool test_pipe_ctm(data_t *data,
 	 * rounding issues and inaccuracies leading to crc mismatch.
 	 */
 	if (memcmp(before, after, sizeof(color_t))) {
+		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
+		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
+		gamma_linear = generate_table(data->gamma_lut_size, 1.0);
+
 		set_degamma(data, primary->pipe, degamma_linear);
 		set_gamma(data, primary->pipe, gamma_linear);
 	} else {
-- 
2.35.1
