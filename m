Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA006E8B7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 16:15:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  3 Sep 2021 19:15:32 +0300
Message-Id: <20210903161532.25874-7-ville.syrjala@linux.intel.com>
In-Reply-To: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
References: <20210903161532.25874-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/6] tests/kms_color: Add GAMMA_LUT_3D
 tests
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
Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add some basic tests for 3D LUTs.

v2: Add missing igt_describe()s
    s/degamma/3D LUT/ in some comments
    Run the test for a single connector only
    Run the invalid LUT size test for each pipe

Cc: Bhanuprakash Modem <Bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color.c        | 97 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c | 58 +++++++++++++++++++++++-
 tests/kms_color_helper.h | 18 ++++++++
 3 files changed, 172 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d78c7e211511..2e250ffe8ae8 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -198,6 +198,88 @@ static void test_pipe_gamma(data_t *data,
 	free_lut(gamma_full);
 }
 
+static void test_pipe_gamma_lut_3d(data_t *data,
+				   igt_plane_t *primary)
+{
+	igt_output_t *output;
+	igt_display_t *display = &data->display;
+	gamma_lut_t *gamma_lut_3d_linear, *gamma_lut_3d_full;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+	drmModeModeInfo *mode;
+	struct igt_fb fb_modeset, fb;
+	igt_crc_t crc_fulllut3d, crc_fullcolors;
+	int fb_id, fb_modeset_id;
+
+	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT_3D));
+
+	gamma_lut_3d_linear = generate_lut_3d(data->gamma_lut_3d_size, 1.0);
+	gamma_lut_3d_full = generate_lut_3d_max(data->gamma_lut_3d_size);
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
+			      DRM_FORMAT_MOD_NONE,
+			      &fb);
+	igt_assert(fb_id);
+
+	fb_modeset_id = igt_create_fb(data->drm_fd,
+				      mode->hdisplay,
+				      mode->vdisplay,
+				      DRM_FORMAT_XRGB8888,
+				      DRM_FORMAT_MOD_NONE,
+				      &fb_modeset);
+	igt_assert(fb_modeset_id);
+
+	igt_plane_set_fb(primary, &fb_modeset);
+	disable_ctm(primary->pipe);
+	disable_degamma(primary->pipe);
+	disable_gamma(primary->pipe);
+	set_gamma_lut_3d(data, primary->pipe, gamma_lut_3d_linear);
+	igt_display_commit(&data->display);
+
+	/* Draw solid colors with no 3D LUT transformation. */
+	paint_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
+
+	/* Draw a gradient with 3D LUT to remap all
+	 * values to max red/green/blue.
+	 */
+	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+	igt_plane_set_fb(primary, &fb);
+	set_gamma_lut_3d(data, primary->pipe, gamma_lut_3d_full);
+	igt_display_commit(&data->display);
+	igt_wait_for_vblank(data->drm_fd,
+			    display->pipes[primary->pipe->pipe].crtc_offset);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fulllut3d);
+
+	/* Verify that the CRC of the software computed output is
+	 * equal to the CRC of the 3D LUT transformation output.
+	 */
+	igt_assert_crc_equal(&crc_fulllut3d, &crc_fullcolors);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+
+	free_lut(gamma_lut_3d_linear);
+	free_lut(gamma_lut_3d_full);
+}
+
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
  * gamma LUT and verify we have the same CRC as drawing solid color rectangles
@@ -656,6 +738,13 @@ prep_pipe(data_t *data, enum pipe p)
 					      IGT_CRTC_GAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->gamma_lut_size);
 	}
+
+	if (igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_GAMMA_LUT_3D_SIZE)) {
+		data->gamma_lut_3d_size =
+			igt_pipe_obj_get_prop(&data->display.pipes[p],
+					      IGT_CRTC_GAMMA_LUT_3D_SIZE);
+		igt_assert_lt(0, data->gamma_lut_3d_size);
+	}
 }
 
 static void
@@ -860,6 +949,10 @@ run_tests_for_pipe(data_t *data, enum pipe p)
 	igt_subtest_f("pipe-%s-legacy-gamma-reset", kmstest_pipe_name(p))
 		test_pipe_legacy_gamma_reset(data, primary);
 
+	igt_describe("Verify that gamma LUT 3D transformation works correctly");
+	igt_subtest_f("pipe-%s-gamma-lut-3d", kmstest_pipe_name(p))
+		test_pipe_gamma_lut_3d(data, primary);
+
 	igt_fixture {
 		disable_degamma(primary->pipe);
 		disable_gamma(primary->pipe);
@@ -888,6 +981,10 @@ run_invalid_tests_for_pipe(data_t *data, enum pipe p)
 	igt_describe("Negative check for color tranformation matrix sizes");
 	igt_subtest_f("pipe-%s-invalid-ctm-matrix-sizes", kmstest_pipe_name(p))
 		invalid_ctm_matrix_sizes(data, p);
+
+	igt_describe("Negative check for invalid gamma lut 3D sizes");
+	igt_subtest_f("pipe-%s-invalid-gamma-lut-3d-sizes", kmstest_pipe_name(p))
+		invalid_gamma_lut_3d_sizes(data, p);
 }
 
 igt_main
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index d71e7bb2e6f9..38e388c54ee8 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -143,6 +143,44 @@ gamma_lut_t *generate_table_zero(int lut_size)
 	return gamma;
 }
 
+gamma_lut_t *generate_lut_3d(int lut_size, double exp)
+{
+	gamma_lut_t *gamma = alloc_lut(lut_3d_size(lut_size));
+
+	for (int r = 0; r < lut_size; r++) {
+		for (int g = 0; g < lut_size; g++) {
+			for (int b = 0; b < lut_size; b++) {
+				int i = lut_3d_index(r, g, b, lut_size);
+
+				gamma->coeffs[i].r = pow(r * 1.0 / (lut_size - 1), exp);
+				gamma->coeffs[i].g = pow(g * 1.0 / (lut_size - 1), exp);
+				gamma->coeffs[i].b = pow(b * 1.0 / (lut_size - 1), exp);
+			}
+		}
+	}
+
+	return gamma;
+}
+
+gamma_lut_t *generate_lut_3d_max(int lut_size)
+{
+	gamma_lut_t *gamma = alloc_lut(lut_3d_size(lut_size));
+
+	for (int r = 0; r < lut_size; r++) {
+		for (int g = 0; g < lut_size; g++) {
+			for (int b = 0; b < lut_size; b++) {
+				int i = lut_3d_index(r, g, b, lut_size);
+
+				gamma->coeffs[i].r = r == 0 ? 0.0 : 1.0;
+				gamma->coeffs[i].g = g == 0 ? 0.0 : 1.0;
+				gamma->coeffs[i].b = b == 0 ? 0.0 : 1.0;
+			}
+		}
+	}
+
+	return gamma;
+}
+
 struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
@@ -215,6 +253,19 @@ void set_gamma(data_t *data,
 	free(lut);
 }
 
+void set_gamma_lut_3d(data_t *data,
+		      igt_pipe_t *pipe,
+		      const gamma_lut_t *gamma_lut_3d)
+{
+	size_t size = sizeof(struct drm_color_lut) * gamma_lut_3d->size;
+	struct drm_color_lut *lut = coeffs_to_lut(data, gamma_lut_3d,
+						  data->color_depth, 0);
+
+	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT_3D, lut, size);
+
+	free(lut);
+}
+
 void set_ctm(igt_pipe_t *pipe, const double *coefficients)
 {
 	struct drm_color_ctm ctm;
@@ -331,6 +382,12 @@ invalid_degamma_lut_sizes(data_t *data, enum pipe p)
 	invalid_lut_sizes(data, p, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
 }
 
+void
+invalid_gamma_lut_3d_sizes(data_t *data, enum pipe p)
+{
+	invalid_lut_sizes(data, p, IGT_CRTC_GAMMA_LUT_3D, lut_3d_size(data->gamma_lut_3d_size));
+}
+
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
@@ -359,4 +416,3 @@ void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 
 	free(ptr);
 }
-
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index bb6f0054f388..7406820b6955 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -52,6 +52,7 @@ typedef struct {
 	uint32_t color_depth;
 	uint64_t degamma_lut_size;
 	uint64_t gamma_lut_size;
+	uint64_t gamma_lut_3d_size;
 	#ifdef HAVE_CHAMELIUM
 	struct chamelium *chamelium;
 	struct chamelium_port **ports;
@@ -77,6 +78,8 @@ void free_lut(gamma_lut_t *gamma);
 gamma_lut_t *generate_table(int lut_size, double exp);
 gamma_lut_t *generate_table_max(int lut_size);
 gamma_lut_t *generate_table_zero(int lut_size);
+gamma_lut_t *generate_lut_3d(int lut_size, double exp);
+gamma_lut_t *generate_lut_3d_max(int lut_size);
 struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    const gamma_lut_t *gamma,
 				    uint32_t color_depth,
@@ -87,13 +90,27 @@ void set_degamma(data_t *data,
 void set_gamma(data_t *data,
 	       igt_pipe_t *pipe,
 	       const gamma_lut_t *gamma);
+void set_gamma_lut_3d(data_t *data,
+		      igt_pipe_t *pipe,
+		      const gamma_lut_t *gamma);
 void set_ctm(igt_pipe_t *pipe, const double *coefficients);
 void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
 
 #define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
 #define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
+#define disable_lut_3d(pipe) disable_prop(pipe, IGT_CRTC_LUT_3D)
 #define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
 
+static inline int lut_3d_size(int lut_size)
+{
+	return lut_size * lut_size * lut_size;
+}
+
+static inline int lut_3d_index(int r, int g, int b, int lut_size)
+{
+	return r * lut_size * lut_size + g * lut_size + b;
+}
+
 drmModePropertyBlobPtr get_blob(data_t *data, igt_pipe_t *pipe,
 				enum igt_atomic_crtc_properties prop);
 bool crc_equal(igt_crc_t *a, igt_crc_t *b);
@@ -105,6 +122,7 @@ int pipe_set_property_blob(igt_pipe_t *pipe,
 			   void *ptr, size_t length);
 void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
 void invalid_degamma_lut_sizes(data_t *data, enum pipe p);
+void invalid_gamma_lut_3d_sizes(data_t *data, enum pipe p);
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p);
 
 #endif
-- 
2.31.1
