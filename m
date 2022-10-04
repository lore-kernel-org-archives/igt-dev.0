Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92D0010E184
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Oct 2022 21:17:32 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Oct 2022 15:16:26 -0600
Message-ID: <20221004211626.1480938-5-alex.hung@amd.com>
In-Reply-To: <20221004211626.1480938-1-alex.hung@amd.com>
References: <20221004211626.1480938-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [RFC PATCH 4/4][i-g-t] tests/kms_color: add 3D LUT tests
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

This is a sample test that passes a dummy 3D LUT to a proposed 3DLUT
API and verifies 3D LUT functionalities by the hardware.

Note: The kernel 3DLUT API proposal "Proposal for Pre-blending 3D LUT
interfaces" is sent to dri-devel mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_color.c        | 96 ++++++++++++++++++++++++++++++++++++++++
 tests/kms_color_helper.c | 35 +++++++++++++++
 tests/kms_color_helper.h |  1 +
 3 files changed, 132 insertions(+)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 1539c750..20bd56e2 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -859,6 +859,97 @@ static bool invalid_plane_ctm_test(data_t *data, igt_plane_t *plane)
 	return true;
 }
 
+static bool plane_3dlut_test(data_t *data, igt_plane_t *plane)
+{
+	igt_display_t *display = &data->display;
+	drmModeModeInfo *mode;
+	igt_output_t *output;
+	struct igt_fb fb;
+	drmModePropertyPtr lut_3d_mode = NULL;
+	igt_pipe_crc_t *pipe_crc = NULL;
+	bool ret = true;
+	uint32_t i;
+	color_t red_green_blue[] = {
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
+	};
+
+	igt_info("Plane 3D LUT test is running on pipe-%s plane-%s(%s)\n",
+			kmstest_pipe_name(plane->pipe->pipe),
+			kmstest_plane_type_name(plane->type),
+			is_hdr_plane(plane) ? "hdr":"sdr");
+
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_3D_LUT_MODE));
+	igt_require(igt_plane_has_prop(plane, IGT_PLANE_3D_LUT));
+
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, plane->pipe->pipe, "auto");
+	output = igt_get_single_output_for_pipe(display, plane->pipe->pipe);
+	igt_assert(output);
+
+	igt_output_set_pipe(output, plane->pipe->pipe);
+	mode = igt_output_get_mode(output);
+
+	/* Create a framebuffer at the size of the output. */
+	igt_assert(igt_create_fb(data->drm_fd,
+			      mode->hdisplay,
+			      mode->vdisplay,
+			      DRM_FORMAT_XRGB16161616,
+			      DRM_FORMAT_MOD_LINEAR,
+			      &fb));
+
+	igt_plane_set_fb(plane, &fb);
+
+	lut_3d_mode = get_plane_gamma_degamma_mode(plane, IGT_PLANE_3D_LUT_MODE);
+	for (i = 0; i < lut_3d_mode->count_enums; i++) {
+		igt_crc_t crc_3dlut, crc_fullcolors;
+		void *lut = NULL;
+		uint32_t lut_size = 0;
+
+		igt_info("Teseting with 3D LUT mode: \'%s\'\n", lut_3d_mode->enums[i].name);
+
+		lut = create_max_3dlut(data, lut_3d_mode->enums[i].value, &lut_size);
+
+		/* Draw solid colors without 3D LUT. */
+		disable_plane_prop(plane, IGT_PLANE_3D_LUT);
+		paint_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_fullcolors);
+
+		/* Draw with dummy 3D LUT */
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		igt_plane_set_prop_enum(plane, IGT_PLANE_3D_LUT_MODE, lut_3d_mode->enums[i].name);
+		igt_plane_replace_prop_blob(plane, IGT_PLANE_3D_LUT, lut, lut_size);
+		igt_assert(igt_display_commit2(display, display->is_atomic ?
+				COMMIT_ATOMIC : COMMIT_LEGACY) == 0);
+		igt_wait_for_vblank(data->drm_fd,
+				display->pipes[plane->pipe->pipe].crtc_offset);
+		igt_pipe_crc_collect_crc(pipe_crc, &crc_3dlut);
+
+		/* TODO Verify CRC values - is checking CRC reasonable? */
+
+		/* TODO Draw with a real 3D LUT that can be verified by eyes */
+
+		/* Draw without 3D LUT again */
+		paint_gradient_rectangles(data, mode, red_green_blue, &fb);
+		igt_plane_set_fb(plane, &fb);
+		disable_plane_prop(plane, IGT_PLANE_3D_LUT);
+		igt_display_commit2(display, display->is_atomic ?
+			COMMIT_ATOMIC : COMMIT_LEGACY);
+
+		free(lut);
+	}
+
+	drmModeFreeProperty(lut_3d_mode);
+	return ret;
+}
+
+
 static bool plane_3dlut_mode_test(data_t *data, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
@@ -1583,6 +1674,11 @@ static void run_tests_for_plane(data_t *data, enum pipe pipe)
 	igt_describe("Verify for plane 3dlut modes");
 	igt_subtest_f("pipe-%s-plane-3dlut-modes", kmstest_pipe_name(pipe))
 		run_plane_color_test(data, pipe, plane_3dlut_mode_test);
+
+	igt_describe("Compare out plane with 3dlut");
+	igt_subtest_f("pipe-%s-plane-3dlut", kmstest_pipe_name(pipe))
+		run_plane_color_test(data, pipe, plane_3dlut_test);
+
 }
 
 igt_main
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 5ed313e9..c84ec7fa 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -423,6 +423,41 @@ segment_data_t *get_segment_data(data_t *data,
 	return info;
 }
 
+void *create_max_3dlut(data_t *data, uint64_t blob_id, uint32_t *lut_size)
+{
+	struct drm_mode_3dlut_mode *mode_3dlut = NULL;
+	drmModePropertyBlobPtr blob;
+	uint32_t fmt = 0;
+	void *lut = NULL;
+
+	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
+	igt_assert(blob);
+	igt_assert(blob->length);
+
+	/* test with the first 3dlut */
+	mode_3dlut = (struct drm_mode_3dlut_mode *) blob->data;
+	fmt = mode_3dlut->color_format;
+	if (fmt == DRM_FORMAT_XRGB16161616 || fmt == DRM_FORMAT_XBGR16161616)
+		*lut_size = pow(mode_3dlut->lut_size, 3) * sizeof(uint64_t);
+	else if (fmt == DRM_FORMAT_XRGB8888 || fmt == DRM_FORMAT_XBGR8888)
+		*lut_size = pow(mode_3dlut->lut_size, 3) * sizeof(uint32_t);
+	else
+		return lut;
+
+	lut = malloc(sizeof(struct drm_mode_3dlut_mode) * (*lut_size));
+	igt_assert(lut);
+
+	/* TODO create 3dlut - fill with dummy values for now */
+	if (mode_3dlut->color_format == DRM_FORMAT_XRGB16161616)
+		memset(lut, 0x5A, *lut_size);
+	else if (mode_3dlut->color_format == DRM_FORMAT_XBGR16161616)
+		memset(lut, 0xA5, *lut_size);
+	else
+		memset(lut, 0, *lut_size);
+
+	return lut;
+}
+
 void verify_3dlut_mode(data_t *data, uint64_t blob_id)
 {
 	struct drm_mode_3dlut_mode *mode_3dlut = NULL;
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 994ba2be..b097b77a 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -117,6 +117,7 @@ gamma_lut_t *pipe_create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
 struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
 segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *mode);
+void *create_max_3dlut(data_t *data, uint64_t blob_id, uint32_t *lut_size);
 void verify_3dlut_mode(data_t *data, uint64_t blob_id);
 void set_pipe_gamma(igt_pipe_t *pipe, uint64_t value,
 		    struct drm_color_lut *lut, uint32_t size);
-- 
2.25.1
