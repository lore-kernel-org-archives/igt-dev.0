Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2487AB3257
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 10:19:05 +0000 (UTC)
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 5 Aug 2022 12:18:56 +0200
Message-ID: <20220805101856.1153181-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_color: add interpolated gamma
 LUT test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Yannick
 Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Raphaël Gallais-Pou <raphael.gallais-pou@foss.st.com>

On STM CRTC, the gamma transformation is implemented as eight independent
linearly-interpolated segments: the desired non-linear transformation must
thus be mapped onto the eight segments, and the shape of the eight
segments configured in the registers.

This patch adds two subtests dedicated to STM hardware. The first one sets
a full gamma LUT and compares the result to an interpolated gamma with
corresponding indexes at max value and other ones to zero. The second one
does the opposite, meaning that the standard gamma LUT is set to zero and
the tested one has all its indexes maxed out except corresponding ones.

Signed-off-by: Raphaël Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 tests/kms_color.c        | 147 +++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c |  34 +++++++++
 tests/kms_color_helper.h |   8 +++
 3 files changed, 189 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index c202547e..0721b74e 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -114,6 +114,102 @@ static bool test_pipe_degamma(data_t *data,
 	return ret;
 }
 
+/*
+ * Draw 3 gradient rectangles in red, green and blue, either with a maxed out
+ * gamma LUT or with an interpolated gamma LUT and verify we have the same CRC.
+ */
+static bool test_pipe_gamma_interpolated(data_t *data,
+					 igt_plane_t *primary,
+					 gamma_lut_t *gamma_standard,
+					 gamma_lut_t *gamma_interpolated)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	drmModeModeInfo *mode;
+	struct igt_fb fb_modeset, fb;
+	igt_crc_t crc, crc_interpolated;
+	int fb_id, fb_modeset_id;
+	bool ret;
+
+	igt_require_stm(data->drm_fd);
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
+
+	output = igt_get_single_output_for_pipe(&data->display, primary->pipe->pipe);
+	igt_require(output);
+
+	igt_output_set_pipe(output, primary->pipe->pipe);
+	mode = igt_output_get_mode(output);
+
+	/* Create a framebuffer at the size of the output. */
+	fb_id = igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
+				      mode->hdisplay,
+				      mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_LINEAR,
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	igt_plane_set_fb(primary, &fb_modeset);
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	set_gamma(data, primary->pipe, gamma_standard);
+	igt_display_commit(&data->display);
+
+	/* Draw a gradient with standard gamma LUT.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	set_gamma(data, primary->pipe, gamma_interpolated);
+	igt_display_commit(&data->display);
+
+	/* Draw a gradient with interpolated gamma LUT to remap all values
+	 * to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_interpolated);
+
+	/* Both CRC of interpolated gamma LUT and standard gamma LUT should be
+	 * the same.
+	 */
+	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc, &crc_interpolated);
+
+	disable_gamma(primary->pipe);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(&data->display);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_remove_fb(data->drm_fd, &fb_modeset);
+
+	free_lut(gamma_standard);
+	free_lut(gamma_interpolated);
+
+	return ret;
+}
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
  * LUT and verify we have the same CRC as drawing solid color rectangles.
@@ -728,6 +824,28 @@ run_gamma_degamma_tests_for_pipe(data_t *data, enum pipe p,
 	test_cleanup(data);
 }
 
+static void
+run_gamma_interpolated_tests_for_pipe(data_t *data, enum pipe p,
+				      gamma_lut_t *(*generated)(int lut_size),
+				      gamma_lut_t *(*interpolated)(int lut_size, double exp,
+								   int *coeffs, int coeffs_size),
+				      int *coeffs)
+{
+	gamma_lut_t *gamma_full;
+	gamma_lut_t *gamma_interpol;
+
+	test_setup(data, p);
+
+	gamma_full = generated(data->gamma_lut_size);
+	gamma_interpol = interpolated(data->gamma_lut_size, 1.0, coeffs, 8);
+
+	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+		igt_assert(test_pipe_gamma_interpolated(data, data->primary,
+							gamma_full, gamma_interpol));
+
+	test_cleanup(data);
+}
+
 static void
 run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 		       color_t *expected_colors,
@@ -928,6 +1046,23 @@ run_tests_for_pipe(data_t *data)
 		{ "legacy-gamma-reset", test_pipe_legacy_gamma_reset,
 		  "Verify that setting the legacy gamma LUT resets the gamma LUT set through GAMMA_LUT property" },
 	};
+	struct {
+		const char *name;
+		gamma_lut_t *(*generated)(int lut_size);
+		gamma_lut_t *(*interpolated)(int lut_size, double exp, int *coeffs, int coeffs_size);
+		int coeffs[8];
+		const char *desc;
+	} interpolated_tests[] = {
+		{ "gamma-full-interpolated",
+		  generate_table_max, generate_table_interpolated,
+		  { 32, 64, 96, 128, 160, 192, 224, 255 },
+		  "Verify that interpolated gamma LUT transformation works correctly" },
+
+		{ "gamma-zero-interpolated",
+		  generate_table_zero, generate_table_interpolated_zero,
+		  { 32, 64, 96, 128, 160, 192, 224, 255 },
+		  "Verify that interpolated gamma LUT transformation works correctly" },
+	};
 	struct {
 		const char *name;
 		int iter;
@@ -1014,6 +1149,18 @@ run_tests_for_pipe(data_t *data)
 		}
 	}
 
+	for (i = 0; i < ARRAY_SIZE(interpolated_tests); i++) {
+		igt_describe_f("%s", interpolated_tests[i].desc);
+		igt_subtest_with_dynamic_f("%s", interpolated_tests[i].name) {
+			for_each_pipe(&data->display, pipe) {
+				run_gamma_interpolated_tests_for_pipe(data, pipe,
+								      interpolated_tests[i].generated,
+								      interpolated_tests[i].interpolated,
+								      interpolated_tests[i].coeffs);
+			}
+		}
+	}
+
 	for (i = 0; i < ARRAY_SIZE(ctm_tests); i++) {
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 55f3e409..47e217ce 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -159,6 +159,40 @@ gamma_lut_t *generate_table_zero(int lut_size)
 	return gamma;
 }
 
+gamma_lut_t *generate_table_interpolated(int lut_size,
+					 double exp,
+					 int *coeffs,
+					 int coeffs_size)
+{
+	gamma_lut_t *gamma;
+	int i;
+
+	gamma = generate_table_zero(lut_size);
+	for (i = 0; i < coeffs_size; i++) {
+		igt_info("coeffs[%d] = %d\n", i, coeffs[i]);
+		set_rgb(&gamma->coeffs[coeffs[i]], 1.0);
+	}
+
+	return gamma;
+}
+
+gamma_lut_t *generate_table_interpolated_zero(int lut_size,
+					      double exp,
+					      int *coeffs,
+					      int coeffs_size)
+{
+	gamma_lut_t *gamma;
+	int i;
+
+	gamma = generate_table_max(lut_size);
+	for (i = 0; i < coeffs_size; i++) {
+		igt_info("coeffs[%d] = %d\n", i, coeffs[i]);
+		set_rgb(&gamma->coeffs[coeffs[i]], 0);
+	}
+
+	return gamma;
+}
+
 struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index f0ae30e3..c5baf224 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -84,6 +84,14 @@ void free_lut(gamma_lut_t *gamma);
 gamma_lut_t *generate_table(int lut_size, double exp);
 gamma_lut_t *generate_table_max(int lut_size);
 gamma_lut_t *generate_table_zero(int lut_size);
+gamma_lut_t *generate_table_interpolated(int lut_size,
+					 double exp,
+					 int *coeffs,
+					 int coeffs_size);
+gamma_lut_t *generate_table_interpolated_zero(int lut_size,
+					      double exp,
+					      int *coeffs,
+					      int coeffs_size);
 struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
-- 
2.25.1
