Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78A26EBC7
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 14:45:59 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon, 27 Jan 2020 16:45:54 +0200
Message-Id: <20200127144554.11364-3-mika.kahola@intel.com>
In-Reply-To: <20200127144554.11364-1-mika.kahola@intel.com>
References: <20200127144554.11364-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane_lowres: Fix CRC mismatch
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Mixing SDR and HDR planes yields to CRC mismatch. The patch computes the
reference image and CRC with the main plane matching the SDR/HDR plane type.

References: https://gitlab.freedesktop.org/drm/intel/issues/899
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/kms_plane_lowres.c | 141 +++++++++++++++++++++++----------------
 1 file changed, 84 insertions(+), 57 deletions(-)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index f4a9ff8d..b519b386 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -32,12 +32,16 @@
 
 IGT_TEST_DESCRIPTION("Test atomic mode setting with a plane by switching between high and low resolutions");
 
+#define SDR_PLANE_BASE	3
 #define SIZE 64
 
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
 	uint32_t devid;
+	igt_output_t *output;
+	igt_plane_t *plane;
+	enum pipe pipe;
 	struct igt_fb fb_primary;
 	struct igt_fb fb_plane[2];
 	struct {
@@ -78,21 +82,46 @@ get_lowres_mode(int drmfd, igt_output_t *output,
 	return *mode;
 }
 
-static bool setup_plane(data_t *data, igt_plane_t *plane)
+static igt_plane_t *first_sdr_plane(data_t *data)
+{
+	return igt_output_get_plane(data->output, SDR_PLANE_BASE);
+}
+
+static bool is_sdr_plane(const igt_plane_t *plane)
+{
+	return plane->index >= SDR_PLANE_BASE;
+}
+
+/*
+ * Mixing SDR and HDR planes results in a CRC mismatch, so use the first
+ * SDR/HDR plane as the main plane matching the SDR/HDR type of the sprite
+ * plane under test.
+ */
+static igt_plane_t *compatible_main_plane(data_t *data)
+{
+	if (is_sdr_plane(data->plane))
+		return first_sdr_plane(data);
+
+	return igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
+}
+
+static bool setup_plane(data_t *data)
 {
 	struct igt_fb *fb;
 
-	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+	if (data->plane->type == DRM_PLANE_TYPE_PRIMARY ||
+	    data->plane == first_sdr_plane(data) ||
+		data->plane->type == DRM_PLANE_TYPE_CURSOR)
 		return false;
 
 	fb = &data->fb_plane[0];
-	if (!igt_plane_has_format_mod(plane, fb->drm_format, fb->modifier))
+	if (!igt_plane_has_format_mod(data->plane, fb->drm_format, fb->modifier))
 		fb = &data->fb_plane[1];
-	if (!igt_plane_has_format_mod(plane, fb->drm_format, fb->modifier))
+	if (!igt_plane_has_format_mod(data->plane, fb->drm_format, fb->modifier))
 		return false;
 
-	igt_plane_set_position(plane, data->x, data->y);
-	igt_plane_set_fb(plane, fb);
+	igt_plane_set_position(data->plane, data->x, data->y);
+	igt_plane_set_fb(data->plane, fb);
 
 	return true;
 }
@@ -126,25 +155,20 @@ static void create_ref_fb(data_t *data, uint64_t modifier,
 }
 
 static unsigned
-test_planes_on_pipe_with_output(data_t *data, enum pipe pipe,
-				igt_output_t *output, uint64_t modifier)
+test_planes_on_pipe_with_output(data_t *data, uint64_t modifier)
 {
-	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
 	const drmModeModeInfo *mode;
 	drmModeModeInfo mode_lowres;
 	igt_pipe_crc_t *pipe_crc;
 	unsigned tested = 0;
-	igt_plane_t *plane;
 	igt_plane_t *primary;
+	igt_crc_t crc_lowres, crc_hires1, crc_hires2;
 
-	primary = igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_info("Testing connector %s using pipe %s\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe));
+	igt_output_set_pipe(data->output, data->pipe);
 
-	igt_output_set_pipe(output, pipe);
-	mode = igt_output_get_mode(output);
-	mode_lowres = get_lowres_mode(data->drm_fd, output, mode);
+	primary = compatible_main_plane(data);
+	mode = igt_output_get_mode(data->output);
+	mode_lowres = get_lowres_mode(data->drm_fd, data->output, mode);
 
 	igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				    DRM_FORMAT_XRGB8888, modifier, 0.0, 0.0, 1.0,
@@ -165,15 +189,15 @@ test_planes_on_pipe_with_output(data_t *data, enum pipe pipe,
 	create_ref_fb(data, modifier, mode, &data->ref_hires.fb);
 	create_ref_fb(data, modifier, &mode_lowres, &data->ref_lowres.fb);
 
-	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+	pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
 				    INTEL_PIPE_CRC_SOURCE_AUTO);
 
-	igt_output_override_mode(output, &mode_lowres);
+	igt_output_override_mode(data->output, &mode_lowres);
 	igt_plane_set_fb(primary, &data->ref_lowres.fb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(pipe_crc, &data->ref_lowres.crc);
 
-	igt_output_override_mode(output, NULL);
+	igt_output_override_mode(data->output, NULL);
 	igt_plane_set_fb(primary, &data->ref_hires.fb);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_pipe_crc_collect_crc(pipe_crc, &data->ref_hires.crc);
@@ -182,40 +206,36 @@ test_planes_on_pipe_with_output(data_t *data, enum pipe pipe,
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	/* yellow sprite plane in lower left corner */
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
-		igt_crc_t crc_lowres, crc_hires1, crc_hires2;
-
-		if (!setup_plane(data, plane))
-			continue;
+	if (!setup_plane(data))
+		return 0;
 
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_collect_crc(pipe_crc, &crc_hires1);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_hires1);
 
-		/* switch to lower resolution */
-		igt_output_override_mode(output, &mode_lowres);
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	/* switch to lower resolution */
+	igt_output_override_mode(data->output, &mode_lowres);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_collect_crc(pipe_crc, &crc_lowres);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_lowres);
 
-		/* switch back to higher resolution */
-		igt_output_override_mode(output, NULL);
-		igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	/* switch back to higher resolution */
+	igt_output_override_mode(data->output, NULL);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-		igt_pipe_crc_collect_crc(pipe_crc, &crc_hires2);
+	igt_pipe_crc_collect_crc(pipe_crc, &crc_hires2);
 
-		igt_assert_crc_equal(&data->ref_hires.crc, &crc_hires1);
-		igt_assert_crc_equal(&data->ref_hires.crc, &crc_hires2);
-		igt_assert_crc_equal(&data->ref_lowres.crc, &crc_lowres);
+	igt_assert_crc_equal(&data->ref_hires.crc, &crc_hires1);
+	igt_assert_crc_equal(&data->ref_hires.crc, &crc_hires2);
+	igt_assert_crc_equal(&data->ref_lowres.crc, &crc_lowres);
 
-		igt_plane_set_fb(plane, NULL);
-		tested++;
-	}
+	igt_plane_set_fb(data->plane, NULL);
+	tested++;
 
 	igt_pipe_crc_free(pipe_crc);
 
 	igt_plane_set_fb(primary, NULL);
-	igt_output_set_pipe(output, PIPE_NONE);
+	igt_output_set_pipe(data->output, PIPE_NONE);
 
 	igt_remove_fb(data->drm_fd, &data->fb_plane[1]);
 	igt_remove_fb(data->drm_fd, &data->fb_plane[0]);
@@ -227,24 +247,34 @@ test_planes_on_pipe_with_output(data_t *data, enum pipe pipe,
 }
 
 static void
-test_planes_on_pipe(data_t *data, enum pipe pipe, uint64_t modifier)
+test_planes_on_pipe(data_t *data, uint64_t modifier)
 {
-	igt_output_t *output;
 	unsigned tested = 0;
 
-	igt_skip_on(pipe >= data->display.n_pipes);
-	igt_display_require_output_on_pipe(&data->display, pipe);
+	igt_skip_on(data->pipe >= data->display.n_pipes);
+	igt_display_require_output_on_pipe(&data->display, data->pipe);
 	igt_skip_on(!igt_display_has_format_mod(&data->display,
 						DRM_FORMAT_XRGB8888, modifier));
 
 	igt_skip_on(intel_gen(data->devid) >= 12 &&
 		    modifier == LOCAL_I915_FORMAT_MOD_Yf_TILED);
 
-	for_each_valid_output_on_pipe(&data->display, pipe, output)
-		tested += test_planes_on_pipe_with_output(data, pipe, output,
-							  modifier);
+	data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
+	igt_require(data->output);
+
+	igt_info("Testing connector %s using pipe %s\n",
+		 igt_output_name(data->output), kmstest_pipe_name(data->pipe));
+
+	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
+		data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
+		igt_require(data->output);
+
+		tested += test_planes_on_pipe_with_output(data, modifier);
+	}
 
 	igt_assert(tested > 0);
+	igt_output_set_pipe(data->output, PIPE_NONE);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
 igt_main
@@ -265,21 +295,18 @@ igt_main
 	}
 
 	for_each_pipe_static(pipe) {
+		data.pipe = pipe;
 		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, pipe,
-					    LOCAL_DRM_FORMAT_MOD_NONE);
+			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
 
 		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, pipe,
-					    LOCAL_I915_FORMAT_MOD_X_TILED);
+			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_X_TILED);
 
 		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, pipe,
-					    LOCAL_I915_FORMAT_MOD_Y_TILED);
+			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Y_TILED);
 
 		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, pipe,
-					    LOCAL_I915_FORMAT_MOD_Yf_TILED);
+			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Yf_TILED);
 	}
 
 	igt_fixture {
-- 
2.17.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
