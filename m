Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54D06E852
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Sep 2021 07:32:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  3 Sep 2021 13:02:48 +0530
Message-Id: <20210903073251.462352-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
References: <20210903073251.462352-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v2 3/6] tests/kms_color: Refactor invalid LUT size
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
To: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com, uma.shankar@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reuse the same code for all invalid LUT size tests.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_color_helper.c | 81 +++++++++++++---------------------------
 1 file changed, 26 insertions(+), 55 deletions(-)

diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 5f223a881..f9fde340f 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -277,77 +277,48 @@ pipe_set_property_blob(igt_pipe_t *pipe,
 				       COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-void
-invalid_gamma_lut_sizes(data_t *data)
+static void
+invalid_lut_sizes(data_t *data, enum igt_atomic_crtc_properties prop, int size)
 {
 	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe = &display->pipes[0];
-	size_t gamma_lut_size = data->gamma_lut_size *
-				sizeof(struct drm_color_lut);
-	struct drm_color_lut *gamma_lut;
+	struct drm_color_lut *lut;
+	size_t lut_size = size * sizeof(lut[0]);
 
-	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_GAMMA_LUT));
+	igt_require(igt_pipe_obj_has_prop(pipe, prop));
 
-	gamma_lut = malloc(gamma_lut_size * 2);
+	lut = malloc(lut_size * 2);
 
 	igt_display_commit2(display,
 			    display->is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
-					     gamma_lut, 1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
-					     gamma_lut, gamma_lut_size + 1),
-					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
-					     gamma_lut, gamma_lut_size - 1),
-					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_GAMMA_LUT,
-					     gamma_lut, gamma_lut_size +
-					     sizeof(struct drm_color_lut)),
-					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_GAMMA_LUT,
-		      pipe->crtc_id), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_GAMMA_LUT,
-		      4096 * 4096), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+					     1), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+					     lut_size + 1), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+					     lut_size - 1), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+					     lut_size + sizeof(struct drm_color_lut)), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob_id(pipe, prop,
+						pipe->crtc_id), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob_id(pipe, prop,
+						4096 * 4096), -EINVAL);
 
-	free(gamma_lut);
+	free(lut);
 }
 
 void
-invalid_degamma_lut_sizes(data_t *data)
+invalid_gamma_lut_sizes(data_t *data)
 {
-	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe = &display->pipes[0];
-	size_t degamma_lut_size = data->degamma_lut_size *
-				  sizeof(struct drm_color_lut);
-	struct drm_color_lut *degamma_lut;
-
-	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT));
-
-	degamma_lut = malloc(degamma_lut_size * 2);
-
-	igt_display_commit2(display, display->is_atomic ?
-			    COMMIT_ATOMIC : COMMIT_LEGACY);
-
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
-					     degamma_lut, 1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
-					     degamma_lut, degamma_lut_size + 1),
-					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
-					     degamma_lut, degamma_lut_size - 1),
-					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_DEGAMMA_LUT,
-					     degamma_lut, degamma_lut_size +
-					     sizeof(struct drm_color_lut)),
-					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_DEGAMMA_LUT,
-						pipe->crtc_id), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_DEGAMMA_LUT,
-						4096 * 4096), -EINVAL);
+	return invalid_lut_sizes(data, IGT_CRTC_GAMMA_LUT, data->gamma_lut_size);
+}
 
-	free(degamma_lut);
+void
+invalid_degamma_lut_sizes(data_t *data)
+{
+	return invalid_lut_sizes(data, IGT_CRTC_DEGAMMA_LUT, data->degamma_lut_size);
 }
 
 void invalid_ctm_matrix_sizes(data_t *data)
-- 
2.32.0
