Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C4310EC25
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 05:47:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  6 May 2022 11:14:38 +0530
Message-Id: <20220506054446.3228224-8-bhanuprakash.modem@intel.com>
In-Reply-To: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
References: <20220506054446.3228224-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v4 07/15] tests/kms_color: New negative tests for plane
 level color mgmt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Negative check for:
 * plane gamma lut sizes
 * plane degamma lut sizes
 * plane ctm matrix sizes

v2:
* Run subtests for all enums (Pekka)

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 118 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index b72bca58..665f06c2 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -709,6 +709,109 @@ static void test_pipe_limited_range_ctm(data_t *data,
 }
 #endif
 
+static bool invalid_plane_gamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModePropertyPtr gamma_mode = NULL;
+	uint32_t i;
+
+	igt_info("Plane invalid gamma test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_GAMMA_LUT));
+
+	gamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_GAMMA_MODE);
+
+	/* Iterate all supported gamma modes. */
+	for (i = 0; i < gamma_mode->count_enums; i++) {
+		segment_data_t *segment_info = NULL;
+		size_t lut_size = 0;
+
+		/* Ignore 'no gamma' from enum list. */
+		if (!strcmp(gamma_mode->enums[i].name, "no gamma"))
+			continue;
+
+		igt_info("Trying to use gamma mode: \'%s\'\n", gamma_mode->enums[i].name);
+
+		segment_info = get_segment_data(data, gamma_mode->enums[i].value,
+				gamma_mode->enums[i].name);
+		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count;
+
+		igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, gamma_mode->enums[i].name);
+		invalid_plane_lut_sizes(display, plane,
+					IGT_PLANE_GAMMA_LUT,
+					lut_size);
+
+		clear_segment_data(segment_info);
+	}
+
+	drmModeFreeProperty(gamma_mode);
+
+	return true;
+}
+
+static bool invalid_plane_degamma_test(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModePropertyPtr degamma_mode = NULL;
+	uint32_t i;
+
+	igt_info("Plane invalid degamma test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_DEGAMMA_LUT));
+
+	degamma_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_DEGAMMA_MODE);
+
+	/* Iterate all supported degamma modes. */
+	for (i = 0; i < degamma_mode->count_enums; i++) {
+		segment_data_t *segment_info = NULL;
+		size_t lut_size = 0;
+
+		/* Ignore 'no degamma' from enum list. */
+		if (!strcmp(degamma_mode->enums[i].name, "no degamma"))
+			continue;
+
+		igt_info("Trying to use degamma mode: \'%s\'\n", degamma_mode->enums[i].name);
+
+		segment_info = get_segment_data(data,
+						degamma_mode->enums[i].value,
+						degamma_mode->enums[i].name);
+		lut_size = sizeof(struct drm_color_lut_ext) * segment_info->entries_count * 2;
+
+		igt_plane_set_prop_enum(plane,
+					IGT_PLANE_DEGAMMA_MODE,
+					degamma_mode->enums[i].name);
+		invalid_plane_lut_sizes(display, plane,
+					IGT_PLANE_DEGAMMA_LUT,
+					lut_size);
+
+		clear_segment_data(segment_info);
+	}
+
+	drmModeFreeProperty(degamma_mode);
+
+	return true;
+}
+
+static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
+{
+	igt_info("Plane invalid CTM test is running on pipe-%s plane-%d(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe), plane->index,
+			kmstest_plane_type_name(plane->type));
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_CTM));
+	invalid_plane_lut_sizes(&data->display, plane,
+				IGT_PLANE_CTM,
+				sizeof(struct drm_color_ctm));
+
+	return true;
+}
+
 static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
 {
 	igt_output_t *output;
@@ -1465,6 +1568,21 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 					ctm_tests[i].iter);
 		}
 	}
+
+	igt_describe("Negative check for invalid plane gamma lut sizes");
+	igt_subtest_f("pipe-%s-invalid-plane-gamma-lut-sizes",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, invalid_plane_gamma_test);
+
+	igt_describe("Negative check for invalid plane degamma lut sizes");
+	igt_subtest_f("pipe-%s-invalid-plane-degamma-lut-sizes",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, invalid_plane_degamma_test);
+
+	igt_describe("Negative check for invalid plane ctm matrix sizes");
+	igt_subtest_f("pipe-%s-invalid-plane-ctm-matrix-sizes",
+			kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, invalid_plane_ctm_test);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
-- 
2.35.1
