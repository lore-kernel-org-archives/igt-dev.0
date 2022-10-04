Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4B110E19D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 21:17:23 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Oct 2022 15:16:25 -0600
Message-ID: <20221004211626.1480938-4-alex.hung@amd.com>
In-Reply-To: <20221004211626.1480938-1-alex.hung@amd.com>
References: <20221004211626.1480938-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH 3/4][i-g-t] tests/kms_color: add 3D LUT mode
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: bhawanpreet.lakha@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This sample test whether whether a GPU driver returns sane 3D LUT
modes supported by the hardware.

Note: The kernel 3DLUT API proposal "Proposal for Pre-blending 3D LUT
interfaces" is sent to dri-devel mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_color.c        | 34 ++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c | 36 ++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.h |  1 +
 3 files changed, 71 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 00742afa..1539c750 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -859,6 +859,36 @@ static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
 	return true;
 }
 
+static bool plane_3dlut_mode_test(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModePropertyPtr lut_3d_mode = NULL;
+	uint32_t i;
+
+	igt_info("Plane 3D LUT test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_3D_LUT_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_3D_LUT));
+
+	lut_3d_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_3D_LUT_MODE);
+	for (i = 0; i < lut_3d_mode->count_enums; i++) {
+		igt_info("Verifying 3D LUT mode: \'%s\'\n", lut_3d_mode->enums[i].name);
+
+		verify_3dlut_mode(data, lut_3d_mode->enums[i].value);
+		igt_plane_set_prop_enum(plane,
+					IGT_PLANE_3D_LUT_MODE,
+					lut_3d_mode->enums[i].name);
+		igt_assert(igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY) == 0);
+	}
+
+	drmModeFreeProperty(lut_3d_mode);
+
+	return true;
+}
+
 static bool plane_gamma_test(data_t *data, igt_plane_t *plane)
 {
 	igt_output_t *output;
@@ -1549,6 +1579,10 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_subtest_f("pipe-%s-invalid-plane-ctm-matrix-sizes",
 			kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, invalid_plane_ctm_test);
+
+	igt_describe("Verify for plane 3dlut modes");
+	igt_subtest_f("pipe-%s-plane-3dlut-modes", kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_3dlut_mode_test);
 }
 
 igt_main
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 7ea8282d..5ed313e9 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -423,6 +423,42 @@ segment_data_t *get_segment_data(data_t *data,
 	return info;
 }
 
+void verify_3dlut_mode(data_t *data, uint64_t blob_id)
+{
+	struct drm_mode_3dlut_mode *mode_3dlut = NULL;
+	drmModePropertyBlobPtr blob;
+	uint32_t i, j, count;
+
+	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
+	igt_assert(blob);
+	igt_assert(blob->length);
+
+	mode_3dlut = (struct drm_mode_3dlut_mode *) blob->data;
+	count = blob->length / sizeof(mode_3dlut[0]);
+	igt_assert(count);
+
+	/* TODO more tests? */
+	for (i = 0; i < count; i++) {
+		igt_assert(mode_3dlut[i].lut_size);
+		igt_assert(mode_3dlut[i].bit_depth);
+
+		for (j = 0; j < 3; j++) {
+			igt_assert(mode_3dlut[i].lut_stride[j]);
+			igt_assert_lte(mode_3dlut[i].lut_size,
+				       mode_3dlut[i].lut_stride[j]);
+		}
+
+		/* check whether color formats are support */
+		if (mode_3dlut[i].color_format != DRM_FORMAT_XRGB16161616 &&
+		    mode_3dlut[i].color_format != DRM_FORMAT_XBGR16161616)
+			igt_info("format 0x%X is not supported\n", mode_3dlut[i].color_format);
+
+	}
+
+	drmModeFreePropertyBlob(blob);
+
+}
+
 void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type)
 {
 	igt_display_t *display = &data->display;
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index c863874f..994ba2be 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -117,6 +117,7 @@ gamma_lut_t *pipe_create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
 segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void verify_3dlut_mode(data_t *data, uint64_t blob_id);
 void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
 		    struct drm_color_lut *lut, uint32_t size);
 void set_advance_gamma(data_t *data, igt_pipe_t *pipe, enum gamma_type type);
-- 
2.25.1
