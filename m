Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E3A10E3C2
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Mar 2023 16:10:54 +0000 (UTC)
From: Melissa Wen <mwen@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 12 Mar 2023 15:10:31 -0100
Message-Id: <20230312161031.716849-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/amdgpu/amd_color: check supported
 color prop before running tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If a DRM CRTC color prop is not advertised, the test should skip instead
of fail. It currently fits DCE case. The driver doesn't support user
degamma, therefore, DRM CRTC degamma properties are disabled in the
kernel driver [1]. Previously the test just fails on DCE because the
driver advertises degamma props although user degamma isn't supported by
HW. Now we can just skip the test in case of a missing color prop
support.

[1] https://lore.kernel.org/dri-devel/20221103184500.14450-1-mwen@igalia.com/

v2:
  - replace lib/igt replace_prop_blob() in favor of AMD wrapper (Alex H.)
  - remove regamma setup from degamma-only test case (Alex H.)

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/amdgpu/amd_color.c | 33 ++++++++++++++++++++++-----------
 1 file changed, 22 insertions(+), 11 deletions(-)

diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index defe57bd..9eed1da3 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -196,14 +196,6 @@ static void test_init(data_t *data)
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
-	data->degamma_lut_size =
-		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
-	igt_assert_lt(0, data->degamma_lut_size);
-
-	data->regamma_lut_size =
-		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
-	igt_assert_lt(0, data->regamma_lut_size);
-
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
 }
@@ -221,6 +213,8 @@ static void test_fini(data_t *data)
  * matrix if not passed any. The whole pipe should be in linear bypass mode
  * when all the matrices are NULL - CRCs for a linear degamma matrix and
  * a NULL one should match.
+ *
+ * This test skips on DCE because it doesn't support user degamma.
  */
 static void test_crtc_linear_degamma(data_t *data)
 {
@@ -231,6 +225,12 @@ static void test_crtc_linear_degamma(data_t *data)
 
 	test_init(data);
 
+	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
+
+	data->degamma_lut_size =
+		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
+	igt_assert_lt(0, data->degamma_lut_size);
+
 	lut_init(&lut_linear, data->degamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
 
@@ -239,7 +239,6 @@ static void test_crtc_linear_degamma(data_t *data)
 
 	/* Draw the reference image. */
 	igt_plane_set_fb(data->primary, &afb);
-	set_regamma_lut(data, NULL);
 	set_degamma_lut(data, NULL);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -252,6 +251,7 @@ static void test_crtc_linear_degamma(data_t *data)
 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
+	set_degamma_lut(data, NULL);
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
 	lut_free(&lut_linear);
@@ -273,6 +273,12 @@ static void test_crtc_linear_regamma(data_t *data)
 
 	test_init(data);
 
+	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
+
+	data->regamma_lut_size =
+		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
+	igt_assert_lt(0, data->regamma_lut_size);
+
 	lut_init(&lut_linear, data->regamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
 
@@ -282,7 +288,6 @@ static void test_crtc_linear_regamma(data_t *data)
 	/* Draw the reference image. */
 	igt_plane_set_fb(data->primary, &afb);
 	set_regamma_lut(data, NULL);
-	set_degamma_lut(data, NULL);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -294,6 +299,7 @@ static void test_crtc_linear_regamma(data_t *data)
 	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
+	set_regamma_lut(data, NULL);
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
 	lut_free(&lut_linear);
@@ -305,7 +311,7 @@ static void test_crtc_linear_regamma(data_t *data)
  * being CRC level accurate across a full test gradient but most values should
  * still match.
  *
- * This test can't pass on DCE because it doesn't support non-linear degamma.
+ * This test skips on DCE because it doesn't support user degamma.
  */
 static void test_crtc_lut_accuracy(data_t *data)
 {
@@ -331,6 +337,9 @@ static void test_crtc_lut_accuracy(data_t *data)
 
 	test_init(data);
 
+	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
+	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
+
 	lut_init(&lut_degamma, data->degamma_lut_size);
 	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
 
@@ -369,6 +378,8 @@ static void test_crtc_lut_accuracy(data_t *data)
 		igt_assert_crc_equal(&ref_crc, &new_crc);
 	}
 
+	set_degamma_lut(data, NULL);
+	set_regamma_lut(data, NULL);
 	test_fini(data);
 	igt_remove_fb(data->fd, &afb);
 	lut_free(&lut_regamma);
-- 
2.39.2
