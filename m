Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF716E077
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 15:29:05 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Oct 2021 18:28:55 +0300
Message-Id: <20211008152856.25412-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20211008152856.25412-1-ville.syrjala@linux.intel.com>
References: <20211008152856.25412-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] igt: s/tiling/modifier/ all over
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use a more reasonable variable name for modifiers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/i915/i915_pm_rpm.c     |  12 ++--
 tests/i915/kms_draw_crc.c    |  32 +++++-----
 tests/i915/kms_flip_tiling.c | 110 +++++++++++++++++------------------
 tests/kms_concurrent.c       |   4 +-
 tests/kms_flip.c             |  10 ++--
 tests/kms_plane_multiple.c   |  32 +++++-----
 tests/kms_plane_scaling.c    |  50 ++++++++--------
 tests/kms_rotation_crc.c     |  60 +++++++++----------
 tests/kms_writeback.c        |   8 ++-
 tests/testdisplay.c          |  12 ++--
 tools/intel_dp_compliance.c  |   4 +-
 tools/msm_dp_compliance.c    |   4 +-
 12 files changed, 170 insertions(+), 168 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 9b916660416a..732aea6eb947 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1714,7 +1714,7 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 	uint32_t crtc_id;
 	struct igt_fb plane_fb1, plane_fb2;
 	int32_t crtc_x = 0, crtc_y = 0;
-	uint64_t tiling;
+	uint64_t modifier;
 
 	disable_all_screens_and_wait(&ms_data);
 
@@ -1725,28 +1725,28 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 		plane_format = DRM_FORMAT_XRGB8888;
 		plane_w = 64;
 		plane_h = 64;
-		tiling = I915_FORMAT_MOD_X_TILED;
+		modifier = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_PRIMARY:
 		plane_format = DRM_FORMAT_XRGB8888;
 		plane_w = default_mode_params->mode->hdisplay;
 		plane_h = default_mode_params->mode->vdisplay;
-		tiling = I915_FORMAT_MOD_X_TILED;
+		modifier = I915_FORMAT_MOD_X_TILED;
 		break;
 	case PLANE_CURSOR:
 		plane_format = DRM_FORMAT_ARGB8888;
 		plane_w = 64;
 		plane_h = 64;
-		tiling = DRM_FORMAT_MOD_LINEAR;
+		modifier = DRM_FORMAT_MOD_LINEAR;
 		break;
 	default:
 		igt_assert(0);
 		break;
 	}
 
-	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, tiling,
+	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, modifier,
 		      &plane_fb1);
-	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, tiling,
+	igt_create_fb(drm_fd, plane_w, plane_h, plane_format, modifier,
 		      &plane_fb2);
 	fill_igt_fb(&plane_fb1, 0xFF00FFFF);
 	fill_igt_fb(&plane_fb2, 0xFF00FF00);
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 4c8e49a179d9..82c368e1dc39 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -48,8 +48,8 @@ static const uint32_t formats[N_FORMATS] = {
 	DRM_FORMAT_XRGB2101010,
 };
 
-#define N_TILING_METHODS 3
-static const uint64_t tilings[N_TILING_METHODS] = {
+#define N_MODIFIER_METHODS 3
+static const uint64_t modifiers[N_MODIFIER_METHODS] = {
 	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
@@ -119,13 +119,13 @@ static uint32_t get_color(uint32_t drm_format, bool r, bool g, bool b)
 }
 
 static void get_method_crc(enum igt_draw_method method, uint32_t drm_format,
-			   uint64_t tiling, igt_crc_t *crc)
+			   uint64_t modifier, igt_crc_t *crc)
 {
 	struct igt_fb fb;
 	int rc;
 
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
-		      drm_format, tiling, &fb);
+		      drm_format, modifier, &fb);
 	igt_draw_rect_fb(drm_fd, bops, 0, &fb, method,
 			 0, 0, fb.width, fb.height,
 			 get_color(drm_format, 0, 0, 1));
@@ -174,7 +174,7 @@ static bool format_is_supported(uint32_t format, uint64_t modifier)
 }
 
 static void draw_method_subtest(enum igt_draw_method method,
-				uint32_t format_index, uint64_t tiling)
+				uint32_t format_index, uint64_t modifier)
 {
 	igt_crc_t crc;
 
@@ -182,7 +182,7 @@ static void draw_method_subtest(enum igt_draw_method method,
 	igt_skip_on(method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm_fd));
 
-	igt_require(format_is_supported(formats[format_index], tiling));
+	igt_require(format_is_supported(formats[format_index], modifier));
 
 	/* Use IGT_DRAW_MMAP_GTT/WC on an untiled buffer as the parameter for
 	 * comparison. Cache the value so we don't recompute it for every single
@@ -196,17 +196,17 @@ static void draw_method_subtest(enum igt_draw_method method,
 		base_crcs[format_index].set = true;
 	}
 
-	get_method_crc(method, formats[format_index], tiling, &crc);
+	get_method_crc(method, formats[format_index], modifier, &crc);
 	igt_assert_crc_equal(&crc, &base_crcs[format_index].crc);
 }
 
-static void get_fill_crc(uint64_t tiling, igt_crc_t *crc)
+static void get_fill_crc(uint64_t modifier, igt_crc_t *crc)
 {
 	struct igt_fb fb;
 	int rc;
 
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, tiling, &fb);
+		      DRM_FORMAT_XRGB8888, modifier, &fb);
 
 	igt_draw_fill_fb(drm_fd, &fb, 0xFF);
 
@@ -306,9 +306,9 @@ static const char *format_str(int format_index)
 	}
 }
 
-static const char *tiling_str(int tiling_index)
+static const char *modifier_str(int modifier_index)
 {
-	switch (tilings[tiling_index]) {
+	switch (modifiers[modifier_index]) {
 	case DRM_FORMAT_MOD_LINEAR :
 		return "untiled";
 	case I915_FORMAT_MOD_X_TILED:
@@ -323,22 +323,22 @@ static const char *tiling_str(int tiling_index)
 igt_main
 {
 	enum igt_draw_method method;
-	int format_idx, tiling_idx;
+	int format_idx, modifier_idx;
 
 	igt_fixture
 		setup_environment();
 
 	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
-	for (tiling_idx = 0; tiling_idx < N_TILING_METHODS; tiling_idx++) {
+	for (modifier_idx = 0; modifier_idx < N_MODIFIER_METHODS; modifier_idx++) {
 		igt_describe("This subtest verfies igt_draw library works "
-			     "with different tilings, DRM_FORMATS, DRAW_METHODS.");
+			     "with different modifiers, DRM_FORMATS, DRAW_METHODS.");
 		igt_subtest_f("draw-method-%s-%s-%s",
 			      format_str(format_idx),
 			      igt_draw_get_method_name(method),
-			      tiling_str(tiling_idx))
+			      modifier_str(modifier_idx))
 			draw_method_subtest(method, format_idx,
-					    tilings[tiling_idx]);
+					    modifiers[modifier_idx]);
 	} } }
 
 	igt_describe("This subtest verifies CRC after filling fb with x-tiling "
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index bae13e615f5f..49ed7cb4863a 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -66,7 +66,7 @@ static void pipe_crc_free(void)
 }
 
 static void
-test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t tiling[2])
+test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -80,19 +80,19 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	mode = igt_output_get_mode(output);
 
 	/* Interlaced modes don't support Y/Yf tiling */
-	if (tiling[0] == I915_FORMAT_MOD_Y_TILED ||
-	    tiling[0] == I915_FORMAT_MOD_Yf_TILED ||
-	    tiling[1] == I915_FORMAT_MOD_Y_TILED ||
-	    tiling[1] == I915_FORMAT_MOD_Yf_TILED)
+	if (modifier[0] == I915_FORMAT_MOD_Y_TILED ||
+	    modifier[0] == I915_FORMAT_MOD_Yf_TILED ||
+	    modifier[1] == I915_FORMAT_MOD_Y_TILED ||
+	    modifier[1] == I915_FORMAT_MOD_Yf_TILED)
 		igt_require(!(mode->flags & DRM_MODE_FLAG_INTERLACE));
 
 	primary = igt_output_get_plane(output, 0);
 
 	width = mode->hdisplay;
 
-	if (tiling[0] != tiling[1] &&
-	    (tiling[0] != DRM_FORMAT_MOD_LINEAR ||
-	     tiling[1] != DRM_FORMAT_MOD_LINEAR)) {
+	if (modifier[0] != modifier[1] &&
+	    (modifier[0] != DRM_FORMAT_MOD_LINEAR ||
+	     modifier[1] != DRM_FORMAT_MOD_LINEAR)) {
 		/*
 		 * Since a page flip to a buffer with different stride
 		 * doesn't work, choose width so that the stride of both
@@ -104,13 +104,13 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	}
 
 	fb_id = igt_create_pattern_fb(data->drm_fd, width, mode->vdisplay,
-				      data->testformat, tiling[0],
+				      data->testformat, modifier[0],
 				      &data->fb[0]);
 	igt_assert(fb_id);
 
 	/* Second fb has different background so CRC does not match. */
 	fb_id = igt_create_color_pattern_fb(data->drm_fd, width, mode->vdisplay,
-				      data->testformat, tiling[1],
+				      data->testformat, modifier[1],
 				      0.5, 0.5, 0.5, &data->fb[1]);
 	igt_assert(fb_id);
 
@@ -181,56 +181,56 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling") {
-		uint64_t tiling[2] = { I915_FORMAT_MOD_X_TILED,
-				       DRM_FORMAT_MOD_LINEAR };
+		uint64_t modifier[2] = { I915_FORMAT_MOD_X_TILED,
+					 DRM_FORMAT_MOD_LINEAR };
 		enum pipe pipe;
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
-		uint64_t tiling[2] = { I915_FORMAT_MOD_Y_TILED,
-				       DRM_FORMAT_MOD_LINEAR };
+		uint64_t modifier[2] = { I915_FORMAT_MOD_Y_TILED,
+					 DRM_FORMAT_MOD_LINEAR };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
-		uint64_t tiling[2] = { I915_FORMAT_MOD_Yf_TILED,
-				       DRM_FORMAT_MOD_LINEAR };
+		uint64_t modifier[2] = { I915_FORMAT_MOD_Yf_TILED,
+					 DRM_FORMAT_MOD_LINEAR };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
@@ -245,56 +245,56 @@ igt_main
 
 	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-X-tiled") {
-		uint64_t tiling[2] = { I915_FORMAT_MOD_X_TILED,
-				       I915_FORMAT_MOD_X_TILED };
+		uint64_t modifier[2] = { I915_FORMAT_MOD_X_TILED,
+					 I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-Y-tiled") {
-		uint64_t tiling[2] = { I915_FORMAT_MOD_Y_TILED,
-				       I915_FORMAT_MOD_Y_TILED };
+		uint64_t modifier[2] = { I915_FORMAT_MOD_Y_TILED,
+					 I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflip from tiled buffer to another tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-Yf-tiled") {
-		uint64_t tiling[2] = { I915_FORMAT_MOD_Yf_TILED,
-				       I915_FORMAT_MOD_Yf_TILED };
+		uint64_t modifier[2] = { I915_FORMAT_MOD_Yf_TILED,
+					 I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
@@ -309,56 +309,56 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-to-X-tiled") {
-		uint64_t tiling[2] = { DRM_FORMAT_MOD_LINEAR,
-				       I915_FORMAT_MOD_X_TILED };
+		uint64_t modifier[2] = { DRM_FORMAT_MOD_LINEAR,
+					 I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-to-Y-tiled") {
-		uint64_t tiling[2] = { DRM_FORMAT_MOD_LINEAR,
-				       I915_FORMAT_MOD_Y_TILED };
+		uint64_t modifier[2] = { DRM_FORMAT_MOD_LINEAR,
+					 I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
-		uint64_t tiling[2] = { DRM_FORMAT_MOD_LINEAR,
-				       I915_FORMAT_MOD_Yf_TILED };
+		uint64_t modifier[2] = { DRM_FORMAT_MOD_LINEAR,
+					 I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
 
-		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
-			igt_require(igt_display_has_format_mod(&data.display, data.testformat, tiling[i]));
+		for (int i = 0; i < ARRAY_SIZE(modifier); i++)
+			igt_require(igt_display_has_format_mod(&data.display, data.testformat, modifier[i]));
 
 		igt_require(data.gen >= 9);
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
-				test_flip_tiling(&data, pipe, output, tiling);
+				test_flip_tiling(&data, pipe, output, modifier);
 			test_cleanup(&data, pipe, output);
 		}
 	}
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 170ce22e20d8..dece615a0183 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -95,7 +95,7 @@ static void
 create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
 			    int *rect_x, int *rect_y,
 			    int *rect_w, int *rect_h,
-			    uint64_t tiling, int max_planes,
+			    uint64_t modifier, int max_planes,
 			    igt_output_t *output)
 {
 	unsigned int fb_id;
@@ -106,7 +106,7 @@ create_fb_for_mode_position(data_t *data, drmModeModeInfo *mode,
 
 	fb_id = igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      tiling,
+			      modifier,
 			      &data->fb[primary->index]);
 	igt_assert(fb_id);
 
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index bcd4b5c97a44..c16350033189 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1275,7 +1275,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	bool retried = false;
 	bool state_ok;
 	unsigned elapsed;
-	uint64_t tiling;
+	uint64_t modifier;
 	int i;
 
 	last_connector = o->kconnector[0];
@@ -1283,9 +1283,9 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	if (o->flags & TEST_PAN)
 		o->fb_width *= 2;
 
-	tiling = DRM_FORMAT_MOD_LINEAR;
+	modifier = DRM_FORMAT_MOD_LINEAR;
 	if (o->flags & TEST_FENCE_STRESS)
-		tiling = I915_FORMAT_MOD_X_TILED;
+		modifier = I915_FORMAT_MOD_X_TILED;
 
 	/* 256 MB is usually the maximum mappable aperture,
 	 * (make it 4x times that to ensure failure) */
@@ -1297,10 +1297,10 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 
 	o->fb_ids[0] = igt_create_fb(drm_fd, o->fb_width, o->fb_height,
 					 igt_bpp_depth_to_drm_format(o->bpp, o->depth),
-					 tiling, &o->fb_info[0]);
+					 modifier, &o->fb_info[0]);
 	o->fb_ids[1] = igt_create_fb_with_bo_size(drm_fd, o->fb_width, o->fb_height,
 						  igt_bpp_depth_to_drm_format(o->bpp, o->depth),
-						  tiling, IGT_COLOR_YCBCR_BT709,
+						  modifier, IGT_COLOR_YCBCR_BT709,
 						  IGT_COLOR_YCBCR_LIMITED_RANGE,
 						  &o->fb_info[1], bo_size, 0);
 
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index c9c43dd534c5..d94ea23c2523 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -98,7 +98,7 @@ static void test_fini(data_t *data, igt_output_t *output, int n_planes)
 
 static void
 get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
-	      color_t *color, uint64_t tiling)
+	      color_t *color, uint64_t modifier)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -128,7 +128,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 static void
 create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo *mode,
 			    color_t *color, int *rect_x, int *rect_y,
-			    int *rect_w, int *rect_h, uint64_t tiling,
+			    int *rect_w, int *rect_h, uint64_t modifier,
 			    int max_planes)
 {
 	unsigned int fb_id;
@@ -139,12 +139,12 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo
 
 	igt_skip_on(!igt_display_has_format_mod(&data->display,
 						DRM_FORMAT_XRGB8888,
-						tiling));
+						modifier));
 
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      tiling,
+			      modifier,
 			      &data->fb[primary->index]);
 	igt_assert(fb_id);
 
@@ -166,7 +166,7 @@ create_fb_for_mode_position(data_t *data, igt_output_t *output, drmModeModeInfo
 
 static void
 prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
-	       uint64_t tiling, int max_planes, igt_output_t *output)
+	       uint64_t modifier, int max_planes, igt_output_t *output)
 {
 	drmModeModeInfo *mode;
 	igt_pipe_t *pipe;
@@ -228,7 +228,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 		 */
 		igt_plane_t *plane = igt_output_get_plane(output, suffle[i]);
 		uint32_t plane_format;
-		uint64_t plane_tiling;
+		uint64_t plane_modifier;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
 			continue;
@@ -243,15 +243,15 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 		data->plane[i] = plane;
 
 		plane_format = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
-		plane_tiling = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : tiling;
+		plane_modifier = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : modifier;
 
 		igt_skip_on(!igt_plane_has_format_mod(plane, plane_format,
-						      plane_tiling));
+						      plane_modifier));
 
 		igt_create_color_fb(data->drm_fd,
 				    size[i], size[i],
 				    plane_format,
-				    plane_tiling,
+				    plane_modifier,
 				    color->red, color->green, color->blue,
 				    &data->fb[i]);
 
@@ -262,7 +262,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 	/* primary plane */
 	data->plane[primary->index] = primary;
 	create_fb_for_mode_position(data, output, mode, color, x, y,
-				    size, size, tiling, max_planes);
+				    size, size, modifier, max_planes);
 	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]);
 	free((void*)x);
 	free((void*)y);
@@ -284,7 +284,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 static void
 test_plane_position_with_output(data_t *data, enum pipe pipe,
 				igt_output_t *output, int n_planes,
-				uint64_t tiling)
+				uint64_t modifier)
 {
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc;
@@ -307,12 +307,12 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 
 	test_init(data, pipe, n_planes);
 
-	get_reference_crc(data, output, pipe, &blue, tiling);
+	get_reference_crc(data, output, pipe, &blue, modifier);
 
 	/* Find out how many planes are allowed simultaneously */
 	do {
 		c++;
-		prepare_planes(data, pipe, &blue, tiling, c, output);
+		prepare_planes(data, pipe, &blue, modifier, c, output);
 		err = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for_each_plane_on_pipe(&data->display, pipe, plane)
@@ -334,7 +334,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 	i = 0;
 	while (i < iterations || loop_forever) {
 		/* randomize planes and set up the holes */
-		prepare_planes(data, pipe, &blue, tiling, c, output);
+		prepare_planes(data, pipe, &blue, modifier, c, output);
 
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		if (!crc_enabled) {
@@ -361,7 +361,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 }
 
 static void
-test_plane_position(data_t *data, enum pipe pipe, uint64_t tiling)
+test_plane_position(data_t *data, enum pipe pipe, uint64_t modifier)
 {
 	igt_output_t *output;
 	int n_planes = opt.all_planes ?
@@ -376,7 +376,7 @@ test_plane_position(data_t *data, enum pipe pipe, uint64_t tiling)
 	srand(opt.seed);
 
 	test_plane_position_with_output(data, pipe, output,
-					n_planes, tiling);
+					n_planes, modifier);
 }
 
 static void
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 883601c02d5c..0db8f13a4b87 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -81,7 +81,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 			igt_plane_t *plane, drmModeModeInfo *mode)
 {
 	igt_display_t *display = &data->display;
-	uint64_t tiling = is_i915_device(data->drm_fd) ?
+	uint64_t modifier = is_i915_device(data->drm_fd) ?
 		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	cleanup_crtc(data);
@@ -89,12 +89,12 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_output_set_pipe(output, pipe);
 
 	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						tiling));
+						modifier));
 
 	/* allocate fb for plane 1 */
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      tiling,
+			      modifier,
 			      &data->fb[0]);
 
 	igt_plane_set_fb(plane, &data->fb[0]);
@@ -120,7 +120,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
-					 uint64_t tiling, enum pipe pipe,
+					 uint64_t modifier, enum pipe pipe,
 					 igt_output_t *output,
 					 igt_rotation_t rot)
 {
@@ -136,7 +136,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	/* create buffer in the range of  min and max source side limit.*/
 	width = height = 20;
 	igt_create_color_fb(display->drm_fd, width, height,
-		       pixel_format, tiling, 0.0, 1.0, 0.0, &d->fb[0]);
+		       pixel_format, modifier, 0.0, 1.0, 0.0, &d->fb[0]);
 	igt_plane_set_fb(plane, &d->fb[0]);
 
 	/* Check min to full resolution upscaling */
@@ -158,7 +158,7 @@ static const igt_rotation_t rotations[] = {
 	IGT_ROTATION_270,
 };
 
-static bool can_rotate(data_t *d, unsigned format, uint64_t tiling,
+static bool can_rotate(data_t *d, unsigned format, uint64_t modifier,
 		       igt_rotation_t rot)
 {
 
@@ -247,7 +247,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 {
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
-	uint64_t tiling = is_i915_device(d->drm_fd) ?
+	uint64_t modifier = is_i915_device(d->drm_fd) ?
 		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
@@ -267,12 +267,12 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 				unsigned format = plane->drm_plane->formats[j];
 
 				if (test_format(d, &tested_formats, format) &&
-				    igt_plane_has_format_mod(plane, format, tiling) &&
+				    igt_plane_has_format_mod(plane, format, modifier) &&
 				    igt_plane_has_rotation(plane, rot) &&
-				    can_rotate(d, format, tiling, rot) &&
+				    can_rotate(d, format, modifier, rot) &&
 				    can_scale(d, format))
 					check_scaling_pipe_plane_rot(d, plane, format,
-								     tiling, pipe,
+								     modifier, pipe,
 								     output, rot);
 			}
 
@@ -281,7 +281,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 	}
 }
 
-static const uint64_t tilings[] = {
+static const uint64_t modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
@@ -301,8 +301,8 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_ou
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
-		for (int i = 0; i < ARRAY_SIZE(tilings); i++) {
-			uint64_t tiling = tilings[i];
+		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
+			uint64_t modifier = modifiers[i];
 			struct igt_vec tested_formats;
 
 			igt_vec_init(&tested_formats, sizeof(uint32_t));
@@ -311,10 +311,10 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, enum pipe pipe, igt_ou
 				uint32_t format = plane->drm_plane->formats[j];
 
 				if (test_format(d, &tested_formats, format) &&
-				    igt_plane_has_format_mod(plane, format, tiling) &&
+				    igt_plane_has_format_mod(plane, format, modifier) &&
 				    can_scale(d, format))
 					check_scaling_pipe_plane_rot(d, plane,
-								     format, tiling,
+								     format, modifier,
 								     pipe, output, IGT_ROTATION_0);
 			}
 
@@ -365,13 +365,13 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 	igt_pipe_t *pipe_obj = &display->pipes[pipe];
 	drmModeModeInfo *mode;
 	int primary_plane_scaling = 0; /* For now */
-	uint64_t tiling = is_i915_device(display->drm_fd) ?
+	uint64_t modifier = is_i915_device(display->drm_fd) ?
 		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
 	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						tiling));
+						modifier));
 
 	mode = igt_output_get_mode(output);
 
@@ -381,13 +381,13 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 
 	igt_create_color_pattern_fb(display->drm_fd, 600, 600,
 				    DRM_FORMAT_XRGB8888,
-				    tiling,
+				    modifier,
 				    .5, .5, .5, &d->fb[1]);
 
 	igt_create_pattern_fb(d->drm_fd,
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      tiling,
+			      modifier,
 			      &d->fb[2]);
 
 	if (primary_plane_scaling) {
@@ -613,7 +613,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	igt_output_t *output1, *output2;
 	drmModeModeInfo *mode1, *mode2;
 	enum pipe pipe1, pipe2;
-	uint64_t tiling = is_i915_device(display->drm_fd) ?
+	uint64_t modifier = is_i915_device(display->drm_fd) ?
 		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	cleanup_crtc(d);
@@ -632,23 +632,23 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	d->plane4 = get_num_scalers(d, pipe2) >= 2 ? igt_output_get_plane(output2, 1) : NULL;
 
 	igt_skip_on(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888,
-						tiling));
+						modifier));
 
 	igt_create_pattern_fb(d->drm_fd, 600, 600,
 			      DRM_FORMAT_XRGB8888,
-			      tiling, &d->fb[0]);
+			      modifier, &d->fb[0]);
 
 	igt_create_pattern_fb(d->drm_fd, 500, 500,
 			      DRM_FORMAT_XRGB8888,
-			      tiling, &d->fb[1]);
+			      modifier, &d->fb[1]);
 
 	igt_create_pattern_fb(d->drm_fd, 700, 700,
 			      DRM_FORMAT_XRGB8888,
-			      tiling, &d->fb[2]);
+			      modifier, &d->fb[2]);
 
 	igt_create_pattern_fb(d->drm_fd, 400, 400,
 			      DRM_FORMAT_XRGB8888,
-			      tiling, &d->fb[3]);
+			      modifier, &d->fb[3]);
 
 	igt_plane_set_fb(d->plane1, &d->fb[0]);
 	if (d->plane2)
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 32695a42c201..865ec8244280 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -73,7 +73,7 @@ typedef struct {
 	int pos_x;
 	int pos_y;
 	uint32_t override_fmt;
-	uint64_t override_tiling;
+	uint64_t override_modifier;
 	int devid;
 
 	struct p_struct *multiplaneoldview;
@@ -220,7 +220,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
 	unsigned int w, h, ref_w, ref_h, min_w, min_h;
-	uint64_t tiling = data->override_tiling ?: DRM_FORMAT_MOD_LINEAR;
+	uint64_t modifier = data->override_modifier ?: DRM_FORMAT_MOD_LINEAR;
 	uint32_t pixel_format = data->override_fmt ?: DRM_FORMAT_XRGB8888;
 	const float flip_opacity = 0.75;
 
@@ -271,23 +271,23 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	 * frame can fit in
 	 */
 	if (igt_rotation_90_or_270(data->rotation)) {
-		tiling = data->override_tiling ?: I915_FORMAT_MOD_Y_TILED;
+		modifier = data->override_modifier ?: I915_FORMAT_MOD_Y_TILED;
 
 		igt_swap(w, h);
 	}
 
 	/*
-	 * Just try here if requested tiling format is generally available,
+	 * Just try here if requested modifier format is generally available,
 	 * if one format fail it will skip entire subtest.
 	 */
-	igt_require(igt_display_has_format_mod(display, pixel_format, tiling));
+	igt_require(igt_display_has_format_mod(display, pixel_format, modifier));
 
 	if (!data->crc_rect[data->output_crc_in_use][rect].valid) {
 		/*
 		* Create a reference software rotated flip framebuffer.
 		*/
-		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling,
-			&data->fb_flip);
+		igt_create_fb(data->gfx_fd, ref_w, ref_h,
+			      pixel_format, modifier, &data->fb_flip);
 		paint_squares(data, data->rotation, &data->fb_flip,
 			flip_opacity);
 		igt_plane_set_fb(plane, &data->fb_flip);
@@ -310,7 +310,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 		* Create a reference CRC for a software-rotated fb.
 		*/
 		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
-			data->override_tiling ?: DRM_FORMAT_MOD_LINEAR, &data->fb_reference);
+			data->override_modifier ?: DRM_FORMAT_MOD_LINEAR, &data->fb_reference);
 		paint_squares(data, data->rotation, &data->fb_reference, 1.0);
 
 		igt_plane_set_fb(plane, &data->fb_reference);
@@ -333,7 +333,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	/*
 	  * Prepare the non-rotated flip fb.
 	  */
-	igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling,
+	igt_create_fb(data->gfx_fd, w, h, pixel_format, modifier,
 		      &data->fb_flip);
 	paint_squares(data, IGT_ROTATION_0, &data->fb_flip,
 		      flip_opacity);
@@ -341,7 +341,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	/*
 	 * Prepare the plane with an non-rotated fb let the hw rotate it.
 	 */
-	igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling, &data->fb);
+	igt_create_fb(data->gfx_fd, w, h, pixel_format, modifier, &data->fb);
 	paint_squares(data, IGT_ROTATION_0, &data->fb, 1.0);
 	igt_plane_set_fb(plane, &data->fb);
 
@@ -557,7 +557,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 typedef struct {
 	int32_t x1, y1;
-	uint64_t width, height, tiling, format;
+	uint64_t width, height, modifier, format;
 	igt_plane_t *plane;
 	igt_rotation_t rotation_sw, rotation_hw;
 } planeinfos;
@@ -582,7 +582,7 @@ static bool setup_multiplane(data_t *data, planeinfos *planeinfo,
 
 		if (!igt_plane_has_format_mod(planeinfo[c].plane,
 					      planeinfo[c].format,
-					      planeinfo[c].tiling))
+					      planeinfo[c].modifier))
 			return false;
 
 		/*
@@ -591,7 +591,7 @@ static bool setup_multiplane(data_t *data, planeinfos *planeinfo,
 		 */
 		if (planes[c]->fb_id == 0) {
 			igt_create_fb(data->gfx_fd, w, h, planeinfo[c].format,
-				      planeinfo[c].tiling, planes[c]);
+				      planeinfo[c].modifier, planes[c]);
 
 			paint_squares(data, planeinfo[c].rotation_sw,
 				      planes[c], 1.0f);
@@ -665,7 +665,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 
 	/*
 	 * These are those modes which are tested. For testing feel interesting
-	 * case with tiling are 2 bpp, 4 bpp and NV12.
+	 * case with modifier are 2 bpp, 4 bpp and NV12.
 	 */
 	static const uint32_t formatlist[] = {DRM_FORMAT_RGB565,
 		DRM_FORMAT_XRGB8888, DRM_FORMAT_NV12};
@@ -674,7 +674,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		igt_rotation_t rotation;
 		float_t width;
 		float_t height;
-		uint64_t tiling;
+		uint64_t modifier;
 		struct igt_fb fbs[ARRAY_SIZE(formatlist)][2];
 	} planeconfigs[] = {
 	{IGT_ROTATION_0, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
@@ -711,7 +711,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
 			p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
 			p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
-			p[0].tiling = planeconfigs[i].tiling;
+			p[0].modifier = planeconfigs[i].modifier;
 			pointlocation(data, (planeinfos *)&p, mode, 0);
 
 			for (k = 0; k < ARRAY_SIZE(formatlist); k++) {
@@ -720,7 +720,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
 					p[1].width = (uint64_t)(planeconfigs[j].width * used_w);
 					p[1].height = (uint64_t)(planeconfigs[j].height * used_h);
-					p[1].tiling = planeconfigs[j].tiling;
+					p[1].modifier = planeconfigs[j].modifier;
 					pointlocation(data, (planeinfos *)&p,
 						      mode, 1);
 
@@ -884,7 +884,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 					       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
-	uint64_t tiling = I915_FORMAT_MOD_Y_TILED;
+	uint64_t modifier = I915_FORMAT_MOD_Y_TILED;
 	uint32_t format = DRM_FORMAT_XRGB8888;
 	int fd = data->gfx_fd;
 	drmModeModeInfo *mode;
@@ -904,7 +904,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	w = mode->hdisplay;
 	h = mode->vdisplay;
 
-	igt_calc_fb_size(fd, w, h, format, tiling, &size, &stride);
+	igt_calc_fb_size(fd, w, h, format, modifier, &size, &stride);
 
 	/*
 	 * Make sure there is atleast 90% of the available GTT space left
@@ -915,7 +915,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	igt_require(total_fbs_size < total_aperture_size * 0.9);
 
 	for (i = 0; i < MAX_FENCES + 1; i++) {
-		igt_create_fb(fd, w, h, format, tiling, &fb[i]);
+		igt_create_fb(fd, w, h, format, modifier, &fb[i]);
 
 		igt_plane_set_fb(plane, &fb[i]);
 		igt_plane_set_rotation(plane, IGT_ROTATION_0);
@@ -960,9 +960,9 @@ static const char *rot_test_str(igt_rotation_t rot)
 	}
 }
 
-static const char *tiling_test_str(uint64_t tiling)
+static const char *modifier_test_str(uint64_t modifier)
 {
-	switch (tiling) {
+	switch (modifier) {
 	case I915_FORMAT_MOD_X_TILED:
 		return "x-tiled";
 	case I915_FORMAT_MOD_Y_TILED:
@@ -1014,7 +1014,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	};
 
 	struct reflect_x {
-		uint64_t tiling;
+		uint64_t modifier;
 		igt_rotation_t rot;
 	} *reflect_x, reflect_x_subtests[] = {
 		{ I915_FORMAT_MOD_X_TILED, IGT_ROTATION_0 },
@@ -1055,11 +1055,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			if (is_amdgpu_device(data.gfx_fd)) {
 				data.override_fmt = DRM_FORMAT_XRGB8888;
 				if (igt_rotation_90_or_270(subtest->rot))
-					data.override_tiling = AMD_FMT_MOD |
+					data.override_modifier = AMD_FMT_MOD |
 						AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
 						AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
 				else
-					data.override_tiling = DRM_FORMAT_MOD_LINEAR;
+					data.override_modifier = DRM_FORMAT_MOD_LINEAR;
 			}
 			data.rotation = subtest->rot;
 			test_plane_rotation(&data, subtest->plane, false);
@@ -1091,18 +1091,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_describe("Checking unsupported tiling for gen9+ with 90 degree of rotation");
 	igt_subtest_f("bad-tiling") {
 		data.rotation = IGT_ROTATION_90;
-		data.override_tiling = I915_FORMAT_MOD_X_TILED;
+		data.override_modifier = I915_FORMAT_MOD_X_TILED;
 		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
 	}
-	data.override_tiling = 0;
+	data.override_modifier = 0;
 
 	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
-	for (reflect_x = reflect_x_subtests; reflect_x->tiling; reflect_x++) {
+	for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
 		igt_subtest_f("primary-%s-reflect-x-%s",
-			      tiling_test_str(reflect_x->tiling),
+			      modifier_test_str(reflect_x->modifier),
 			      rot_test_str(reflect_x->rot)) {
 			data.rotation = (IGT_REFLECT_X | reflect_x->rot);
-			data.override_tiling = reflect_x->tiling;
+			data.override_modifier = reflect_x->modifier;
 			test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, false);
 		}
 	}
diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index a033b44f7bb0..03edb7aff95c 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -63,7 +63,7 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
 	igt_fb_t input_fb, output_fb;
 	igt_plane_t *plane;
 	uint32_t writeback_format = DRM_FORMAT_XRGB8888;
-	uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
 	drmModeModeInfo override_mode = {
 		.clock = 25175,
@@ -86,10 +86,12 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
-	ret = igt_create_fb(display->drm_fd, width, height, DRM_FORMAT_XRGB8888, tiling, &input_fb);
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
-	ret = igt_create_fb(display->drm_fd, width, height, writeback_format, tiling, &output_fb);
+	ret = igt_create_fb(display->drm_fd, width, height,
+			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 399318d07b78..543277611186 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -81,7 +81,7 @@ drmModeRes *resources;
 int drm_fd, modes;
 int test_all_modes = 0, test_preferred_mode = 0, force_mode = 0, test_plane,
     test_stereo_modes, test_aspect_ratio;
-uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
+uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 int sleep_between_modes = 0;
 int do_dpms = 0; /* This aliases to DPMS_ON */
 uint32_t depth = 24, stride, bpp;
@@ -370,7 +370,7 @@ set_mode(struct connector *c)
 
 		fb_id = igt_create_pattern_fb(drm_fd, width, height,
 					      igt_bpp_depth_to_drm_format(bpp, depth),
-					      tiling, &fb_info[current_fb]);
+					      modifier, &fb_info[current_fb]);
 		paint_output_info(c, &fb_info[current_fb]);
 		paint_color_key(&fb_info[current_fb]);
 
@@ -416,7 +416,7 @@ static void do_set_stereo_mode(struct connector *c)
 
 	fb_id = igt_create_stereo_fb(drm_fd, &c->mode,
 				     igt_bpp_depth_to_drm_format(bpp, depth),
-				     tiling);
+				     modifier);
 
 	igt_warn_on_f(drmModeSetCrtc(drm_fd, c->crtc, fb_id, 0, 0, &c->id, 1, &c->mode),
 		      "failed to set mode (%dx%d@%dHz): %s\n", width, height, c->mode.vrefresh, strerror(errno));
@@ -671,14 +671,14 @@ static int opt_handler(int opt, int opt_index, void *data)
 		test_preferred_mode = 1;
 		break;
 	case 't':
-		tiling = I915_FORMAT_MOD_X_TILED;
+		modifier = I915_FORMAT_MOD_X_TILED;
 		break;
 	case 'y':
 	case OPT_YB:
-		tiling = I915_FORMAT_MOD_Y_TILED;
+		modifier = I915_FORMAT_MOD_Y_TILED;
 		break;
 	case OPT_YF:
-		tiling = I915_FORMAT_MOD_Yf_TILED;
+		modifier = I915_FORMAT_MOD_Yf_TILED;
 		break;
 	case 'r':
 		qr_code = 1;
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 71be8f13478d..39218c3bb92c 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -174,7 +174,7 @@ uint8_t bitdepth;
 
 drmModeRes *resources;
 int drm_fd, modes, gen;
-uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
+uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 uint32_t depth = 24, stride, bpp;
 int specified_mode_num = -1, specified_disp_id = -1;
 int width, height;
@@ -638,7 +638,7 @@ set_default_mode(struct connector *c, bool set_mode)
 
 	fb_id = igt_create_pattern_fb(drm_fd, width, height,
 				      DRM_FORMAT_XRGB8888,
-				      tiling, &fb_info);
+				      modifier, &fb_info);
 
 	igt_info("CRTC(%u):[%d]", c->crtc, 0);
 	kmstest_dump_mode(&c->mode);
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 4063d06e7b65..5e491c89583a 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -155,7 +155,7 @@ uint8_t bitdepth;
 
 drmModeRes *resources;
 int drm_fd, modes, gen;
-uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
+uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 uint32_t depth = 24, stride, bpp;
 int specified_mode_num = -1, specified_disp_id = -1;
 int width, height;
@@ -487,7 +487,7 @@ set_default_mode(struct connector *c, bool set_mode)
 
 	fb_id = igt_create_pattern_fb(drm_fd, width, height,
 				      DRM_FORMAT_XRGB8888,
-				      tiling, &fb_info);
+				      modifier, &fb_info);
 
 	kmstest_dump_mode(&c->mode);
 	drmModeSetCrtc(drm_fd, c->crtc, -1, 0, 0, NULL, 0, NULL);
-- 
2.32.0
