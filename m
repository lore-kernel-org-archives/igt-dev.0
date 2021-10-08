Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257A6E077
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Oct 2021 15:29:03 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri,  8 Oct 2021 18:28:54 +0300
Message-Id: <20211008152856.25412-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] igt:
 s/DRM_FORMAT_MOD_NONE/DRM_FORMAT_MOD_LINEAR/
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

DRM_FORMAT_MOD_LINEAR is the more sensible name for
DRM_FORMAT_MOD_NONE. Use the better name.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c                          | 18 +++++++++---------
 tests/amdgpu/amd_bypass.c             |  2 +-
 tests/debugfs_test.c                  |  2 +-
 tests/drm_read.c                      |  2 +-
 tests/i915/i915_pm_backlight.c        |  2 +-
 tests/i915/i915_pm_dc.c               |  2 +-
 tests/i915/i915_pm_lpsp.c             |  2 +-
 tests/i915/i915_pm_rpm.c              |  8 ++++----
 tests/i915/kms_big_joiner.c           |  2 +-
 tests/i915/kms_draw_crc.c             | 10 +++++-----
 tests/i915/kms_dsc.c                  |  2 +-
 tests/i915/kms_flip_tiling.c          | 16 ++++++++--------
 tests/i915/kms_frontbuffer_tracking.c |  6 +++---
 tests/i915/kms_mmap_write_crc.c       |  4 ++--
 tests/i915/kms_psr.c                  |  2 +-
 tests/i915/kms_psr2_sf.c              | 14 +++++++-------
 tests/i915/kms_psr2_su.c              |  4 ++--
 tests/i915/kms_pwrite_crc.c           |  4 ++--
 tests/i915/perf_pmu.c                 |  2 +-
 tests/kms_3d.c                        |  2 +-
 tests/kms_addfb_basic.c               |  6 +++---
 tests/kms_async_flips.c               |  2 +-
 tests/kms_atomic.c                    |  4 ++--
 tests/kms_atomic_interruptible.c      |  6 +++---
 tests/kms_atomic_transition.c         | 12 ++++++------
 tests/kms_chamelium.c                 | 26 +++++++++++++-------------
 tests/kms_color.c                     | 20 ++++++++++----------
 tests/kms_color_chamelium.c           | 24 ++++++++++++------------
 tests/kms_concurrent.c                |  4 ++--
 tests/kms_content_protection.c        |  4 ++--
 tests/kms_cursor_crc.c                | 14 +++++++-------
 tests/kms_cursor_edge_walk.c          |  4 ++--
 tests/kms_dither.c                    |  2 +-
 tests/kms_dp_tiled_display.c          |  2 +-
 tests/kms_flip.c                      |  2 +-
 tests/kms_flip_event_leak.c           |  4 ++--
 tests/kms_hdmi_inject.c               |  4 ++--
 tests/kms_invalid_mode.c              |  2 +-
 tests/kms_lease.c                     |  2 +-
 tests/kms_multipipe_modeset.c         |  2 +-
 tests/kms_panel_fitting.c             | 10 +++++-----
 tests/kms_pipe_crc_basic.c            |  8 ++++----
 tests/kms_plane.c                     | 14 +++++++-------
 tests/kms_plane_alpha_blend.c         | 20 ++++++++++----------
 tests/kms_plane_lowres.c              |  2 +-
 tests/kms_plane_multiple.c            |  6 +++---
 tests/kms_plane_scaling.c             | 10 +++++-----
 tests/kms_prime.c                     |  4 ++--
 tests/kms_properties.c                |  2 +-
 tests/kms_rmfb.c                      |  4 ++--
 tests/kms_rotation_crc.c              | 10 +++++-----
 tests/kms_sequence.c                  |  2 +-
 tests/kms_setmode.c                   |  2 +-
 tests/kms_universal_plane.c           | 24 ++++++++++++------------
 tests/kms_vblank.c                    |  2 +-
 tests/kms_vrr.c                       |  4 ++--
 tests/nouveau_crc.c                   |  4 ++--
 tests/prime_mmap_kms.c                |  2 +-
 tests/testdisplay.c                   |  2 +-
 tests/vc4_tiling.c                    | 12 ++++++------
 tools/intel_dp_compliance.c           |  8 ++++----
 tools/intel_residency.c               |  2 +-
 tools/msm_dp_compliance.c             |  4 ++--
 63 files changed, 205 insertions(+), 205 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ea4d83ab736a..037680f26ff4 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -427,7 +427,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	}
 
 	switch (modifier) {
-	case DRM_FORMAT_MOD_NONE:
+	case DRM_FORMAT_MOD_LINEAR :
 		if (is_i915_device(fd))
 			*width_ret = 64;
 		else
@@ -720,7 +720,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 	uint32_t min_stride = fb->plane_width[plane] *
 		(fb->plane_bpp[plane] / 8);
 
-	if (fb->modifier != DRM_FORMAT_MOD_NONE &&
+	if (fb->modifier != DRM_FORMAT_MOD_LINEAR &&
 	    is_i915_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint32_t stride;
@@ -743,7 +743,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		 * so the easiest way is to align the luma stride to 256.
 		 */
 		return ALIGN(min_stride, 256);
-	} else if (fb->modifier != DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+	} else if (fb->modifier != DRM_FORMAT_MOD_LINEAR && is_amdgpu_device(fb->fd)) {
 		/*
 		 * For amdgpu device with tiling mode
 		 */
@@ -809,7 +809,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 
 static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 {
-	if (fb->modifier != DRM_FORMAT_MOD_NONE &&
+	if (fb->modifier != DRM_FORMAT_MOD_LINEAR &&
 	    is_i915_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint64_t min_size = (uint64_t) fb->strides[plane] *
@@ -828,7 +828,7 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		size = roundup_power_of_two(size);
 
 		return size;
-	} else if (fb->modifier != DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+	} else if (fb->modifier != DRM_FORMAT_MOD_LINEAR && is_amdgpu_device(fb->fd)) {
 		/*
 		 * For amdgpu device with tiling mode
 		 */
@@ -926,7 +926,7 @@ void igt_calc_fb_size(int fd, int width, int height, uint32_t drm_format, uint64
 uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 {
 	switch (modifier) {
-	case DRM_FORMAT_MOD_NONE:
+	case DRM_FORMAT_MOD_LINEAR :
 		return I915_TILING_NONE;
 	case I915_FORMAT_MOD_X_TILED:
 		return I915_TILING_X;
@@ -958,7 +958,7 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling)
 {
 	switch (tiling) {
 	case I915_TILING_NONE:
-		return DRM_FORMAT_MOD_NONE;
+		return DRM_FORMAT_MOD_LINEAR;
 	case I915_TILING_X:
 		return I915_FORMAT_MOD_X_TILED;
 	case I915_TILING_Y:
@@ -2562,7 +2562,7 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 	 */
 
 	igt_init_fb(&linear->fb, fb->fd, fb->width, fb->height,
-		    fb->drm_format, DRM_FORMAT_MOD_NONE,
+		    fb->drm_format, DRM_FORMAT_MOD_LINEAR,
 		    fb->color_encoding, fb->color_range);
 
 	create_bo_for_fb(&linear->fb, true);
@@ -2739,7 +2739,7 @@ static void *igt_fb_create_cairo_shadow_buffer(int fd,
 	igt_assert(shadow);
 
 	igt_init_fb(shadow, fd, width, height,
-		    drm_format, DRM_FORMAT_MOD_NONE,
+		    drm_format, DRM_FORMAT_MOD_LINEAR,
 		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
 
 	shadow->strides[0] = ALIGN(width * (shadow->plane_bpp[0] / 8), 16);
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index f805efb2905f..75ad85212a34 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -316,7 +316,7 @@ static void bypass_8bpc_test(data_t *data)
 	test_init(data);
 
 	igt_create_fb(data->drm_fd, data->width, data->height,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
 	/*
 	 * Settings:
diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index fdfa3403643b..e6535ccdaada 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -122,7 +122,7 @@ retry:
 				igt_create_pattern_fb(display.drm_fd,
 						      mode->hdisplay, mode->vdisplay,
 						      DRM_FORMAT_XRGB8888,
-						      DRM_FORMAT_MOD_NONE, &fb[pipe]);
+						      DRM_FORMAT_MOD_LINEAR, &fb[pipe]);
 
 				/* Set a valid fb as some debugfs like to inspect it on a active pipe */
 				igt_plane_set_fb(primary, &fb[pipe]);
diff --git a/tests/drm_read.c b/tests/drm_read.c
index d7609fbd7837..3186e6097187 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -278,7 +278,7 @@ igt_main
 
 			igt_create_pattern_fb(fd, mode->hdisplay, mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE, &fb);
+					      DRM_FORMAT_MOD_LINEAR, &fb);
 
 			igt_output_set_pipe(output, pipe);
 			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), &fb);
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index b26013f7e1b4..cafae7f75b30 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -227,7 +227,7 @@ igt_main
 		igt_create_pattern_fb(display.drm_fd,
 				      mode->hdisplay, mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE, &fb);
+				      DRM_FORMAT_MOD_LINEAR, &fb);
 		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(primary, &fb);
 
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 4c9b871cdcf9..d779e28026a9 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -164,7 +164,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 			      data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      fb);
 	igt_assert(fb_id);
 	paint_rectangles(data, data->mode, fb_color, fb);
diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 05bc032a069a..b3b1561e75cd 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -111,7 +111,7 @@ static void setup_lpsp_output(data_t *data)
 	igt_create_pattern_fb(data->drm_fd,
 			      data->mode->hdisplay, data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb);
 	igt_plane_set_fb(primary, &data->fb);
 	igt_display_commit(&data->display);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 62720d02b7e0..9b916660416a 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -283,7 +283,7 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 		return false;
 
 	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &params->fb);
 
 	params->crtc_id = kmstest_find_crtc_for_connector(drm_fd, data->res,
@@ -1603,9 +1603,9 @@ static void cursor_subtest(bool dpms)
 	crtc_id = default_mode_params->crtc_id;
 
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-		      DRM_FORMAT_MOD_NONE, &cursor_fb1);
+		      DRM_FORMAT_MOD_LINEAR, &cursor_fb1);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-		      DRM_FORMAT_MOD_NONE, &cursor_fb2);
+		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
 		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
 
@@ -1737,7 +1737,7 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 		plane_format = DRM_FORMAT_ARGB8888;
 		plane_w = 64;
 		plane_h = 64;
-		tiling = DRM_FORMAT_MOD_NONE;
+		tiling = DRM_FORMAT_MOD_LINEAR;
 		break;
 	default:
 		igt_assert(0);
diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
index 4f1f3152e194..d7fa2e53db9f 100644
--- a/tests/i915/kms_big_joiner.c
+++ b/tests/i915/kms_big_joiner.c
@@ -288,7 +288,7 @@ igt_main
 		igt_require_f(count > 0, "No output with 5k+ mode found\n");
 
 		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE, &data.fb);
+				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 5e3252b7c1fd..4c8e49a179d9 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -50,7 +50,7 @@ static const uint32_t formats[N_FORMATS] = {
 
 #define N_TILING_METHODS 3
 static const uint64_t tilings[N_TILING_METHODS] = {
-	DRM_FORMAT_MOD_NONE,
+	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
 };
@@ -191,7 +191,7 @@ static void draw_method_subtest(enum igt_draw_method method,
 		get_method_crc(gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
 							       IGT_DRAW_MMAP_WC,
 			       formats[format_index],
-			       DRM_FORMAT_MOD_NONE,
+			       DRM_FORMAT_MOD_LINEAR,
 			       &base_crcs[format_index].crc);
 		base_crcs[format_index].set = true;
 	}
@@ -226,7 +226,7 @@ static void fill_fb_subtest(void)
 	igt_crc_t base_crc, crc;
 
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
 	igt_draw_rect_fb(drm_fd, bops, 0, &fb,
 			 gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
@@ -239,7 +239,7 @@ static void fill_fb_subtest(void)
 
 	igt_pipe_crc_collect_crc(pipe_crc, &base_crc);
 
-	get_fill_crc(DRM_FORMAT_MOD_NONE, &crc);
+	get_fill_crc(DRM_FORMAT_MOD_LINEAR, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
 	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
@@ -309,7 +309,7 @@ static const char *format_str(int format_index)
 static const char *tiling_str(int tiling_index)
 {
 	switch (tilings[tiling_index]) {
-	case DRM_FORMAT_MOD_NONE:
+	case DRM_FORMAT_MOD_LINEAR :
 		return "untiled";
 	case I915_FORMAT_MOD_X_TILED:
 		return "xtiled";
diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
index 3e450207f6da..dcfe8b966932 100644
--- a/tests/i915/kms_dsc.c
+++ b/tests/i915/kms_dsc.c
@@ -240,7 +240,7 @@ static void run_test(data_t *data, enum dsc_test_type test_type)
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay,
 			      mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
 	for_each_pipe(&data->display, pipe) {
diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
index ed3b759dcf78..bae13e615f5f 100644
--- a/tests/i915/kms_flip_tiling.c
+++ b/tests/i915/kms_flip_tiling.c
@@ -91,8 +91,8 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	width = mode->hdisplay;
 
 	if (tiling[0] != tiling[1] &&
-	    (tiling[0] != DRM_FORMAT_MOD_NONE ||
-	     tiling[1] != DRM_FORMAT_MOD_NONE)) {
+	    (tiling[0] != DRM_FORMAT_MOD_LINEAR ||
+	     tiling[1] != DRM_FORMAT_MOD_LINEAR)) {
 		/*
 		 * Since a page flip to a buffer with different stride
 		 * doesn't work, choose width so that the stride of both
@@ -182,7 +182,7 @@ igt_main
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling") {
 		uint64_t tiling[2] = { I915_FORMAT_MOD_X_TILED,
-				       DRM_FORMAT_MOD_NONE };
+				       DRM_FORMAT_MOD_LINEAR };
 		enum pipe pipe;
 
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
@@ -198,7 +198,7 @@ igt_main
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
 		uint64_t tiling[2] = { I915_FORMAT_MOD_Y_TILED,
-				       DRM_FORMAT_MOD_NONE };
+				       DRM_FORMAT_MOD_LINEAR };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -218,7 +218,7 @@ igt_main
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
 		uint64_t tiling[2] = { I915_FORMAT_MOD_Yf_TILED,
-				       DRM_FORMAT_MOD_NONE };
+				       DRM_FORMAT_MOD_LINEAR };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -309,7 +309,7 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-to-X-tiled") {
-		uint64_t tiling[2] = { DRM_FORMAT_MOD_NONE,
+		uint64_t tiling[2] = { DRM_FORMAT_MOD_LINEAR,
 				       I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
 
@@ -325,7 +325,7 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-to-Y-tiled") {
-		uint64_t tiling[2] = { DRM_FORMAT_MOD_NONE,
+		uint64_t tiling[2] = { DRM_FORMAT_MOD_LINEAR,
 				       I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
 
@@ -345,7 +345,7 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
-		uint64_t tiling[2] = { DRM_FORMAT_MOD_NONE,
+		uint64_t tiling[2] = { DRM_FORMAT_MOD_LINEAR,
 				       I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
 
diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
index 5740485379a3..4ae5286661bb 100644
--- a/tests/i915/kms_frontbuffer_tracking.c
+++ b/tests/i915/kms_frontbuffer_tracking.c
@@ -458,7 +458,7 @@ static uint64_t tiling_to_modifier(enum tiling_type tiling)
 {
 	switch (tiling) {
 	case TILING_LINEAR:
-		return DRM_FORMAT_MOD_NONE;
+		return DRM_FORMAT_MOD_LINEAR;
 	case TILING_X:
 		return I915_FORMAT_MOD_X_TILED;
 	case TILING_Y:
@@ -674,7 +674,7 @@ static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 		  prim_mode_params.mode->vdisplay, tiling, PLANE_PRI,
 		  &s->prim_pri);
 	create_fb(format, prim_mode_params.cursor.w,
-		  prim_mode_params.cursor.h, DRM_FORMAT_MOD_NONE,
+		  prim_mode_params.cursor.h, DRM_FORMAT_MOD_LINEAR,
 		  PLANE_CUR, &s->prim_cur);
 	create_fb(format, prim_mode_params.sprite.w,
 		  prim_mode_params.sprite.h, tiling, PLANE_SPR, &s->prim_spr);
@@ -691,7 +691,7 @@ static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 		  scnd_mode_params.mode->vdisplay, tiling, PLANE_PRI,
 		  &s->scnd_pri);
 	create_fb(format, scnd_mode_params.cursor.w, scnd_mode_params.cursor.h,
-		  DRM_FORMAT_MOD_NONE, PLANE_CUR, &s->scnd_cur);
+		  DRM_FORMAT_MOD_LINEAR, PLANE_CUR, &s->scnd_cur);
 	create_fb(format, scnd_mode_params.sprite.w, scnd_mode_params.sprite.h,
 		  tiling, PLANE_SPR, &s->scnd_spr);
 }
diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
index 2e323a209a01..b17e5fdb6fb7 100644
--- a/tests/i915/kms_mmap_write_crc.c
+++ b/tests/i915/kms_mmap_write_crc.c
@@ -86,7 +86,7 @@ static void test(data_t *data)
 
 	/* create a non-white fb where we can write later */
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
 
 	ptr = dmabuf_mmap_framebuffer(data->drm_fd, fb);
 
@@ -176,7 +176,7 @@ static void prepare_crtc(data_t *data)
 
 	/* create a white reference fb and flip to it */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0, &data->fb[0]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index c65b3c8065f7..83b8b7094c6b 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -81,7 +81,7 @@ static void create_cursor_fb(data_t *data)
 	uint32_t fb_id;
 
 	fb_id = igt_create_fb(data->drm_fd, 64, 64,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_white);
 	igt_assert(fb_id);
 
diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 1be8c3da14ef..a50c3e140b30 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -223,7 +223,7 @@ static void prepare(data_t *data)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb_primary);
 
@@ -239,7 +239,7 @@ static void prepare(data_t *data)
 				    data->mode->hdisplay/2,
 				    data->mode->vdisplay/2,
 				    DRM_FORMAT_XRGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 0.0, 1.0,
 				    &data->fb_overlay);
 
@@ -247,7 +247,7 @@ static void prepare(data_t *data)
 				    data->mode->hdisplay/2,
 				    data->mode->vdisplay/2,
 				    DRM_FORMAT_XRGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 0.0, 1.0,
 				    &data->fb_test);
 
@@ -270,7 +270,7 @@ static void prepare(data_t *data)
 		igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb_test);
 
@@ -287,7 +287,7 @@ static void prepare(data_t *data)
 					    data->mode->hdisplay,
 					    data->mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_LINEAR,
 					    0.0, 0.0, 1.0,
 					    &data->fb_overlay);
 
@@ -303,14 +303,14 @@ static void prepare(data_t *data)
 		igt_plane_set_position(cursor, 0, 0);
 
 		igt_create_fb(data->drm_fd, CUR_SIZE, CUR_SIZE,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_cursor);
 
 		draw_rect(data, &data->fb_cursor, 0, 0, CUR_SIZE, CUR_SIZE,
 			    0.0, 0.0, 1.0, 1.0);
 
 		igt_create_fb(data->drm_fd, CUR_SIZE, CUR_SIZE,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test);
 
 		draw_rect(data, &data->fb_test, 0, 0, CUR_SIZE, CUR_SIZE,
diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 3018bcc6cbbb..91de9bad17a8 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -112,7 +112,7 @@ static void prepare(data_t *data)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &data->fb[0]);
 
@@ -122,7 +122,7 @@ static void prepare(data_t *data)
 		igt_create_color_fb(data->drm_fd,
 				    data->mode->hdisplay, data->mode->vdisplay,
 				    DRM_FORMAT_XRGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    0.0, 1.0, 0.0,
 				    &data->fb[1]);
 
diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index dc32a070c198..44fcfadbe6f5 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -58,7 +58,7 @@ static void test(data_t *data)
 
 	/* create a non-white fb where we can pwrite later */
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, fb);
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
 
 	/* flip to it to make it UC/WC and fully flushed */
 	drmModeSetPlane(data->drm_fd,
@@ -113,7 +113,7 @@ static void prepare_crtc(data_t *data)
 
 	/* create a white reference fb and flip to it */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    1.0, 1.0, 1.0, &data->fb[0]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 1214cda8c32b..309e21f8fbd0 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1005,7 +1005,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb);
 
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index 8284100eeb98..1488cc146728 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -98,7 +98,7 @@ igt_simple_main
 		/* create stereo framebuffer */
 		fb_id = igt_create_stereo_fb(drm_fd, &connector->modes[i],
 					     igt_bpp_depth_to_drm_format(32, 24),
-					     DRM_FORMAT_MOD_NONE);
+					     DRM_FORMAT_MOD_LINEAR);
 
 		ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
 				     &connector->connector_id, 1,
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 55f4852da167..b7b3b0f22218 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -537,7 +537,7 @@ static void addfb25_tests(int fd)
 		f.height = 1024;
 		f.pixel_format = DRM_FORMAT_XRGB8888;
 		f.pitches[0] = 1024*4;
-		f.modifier[0] = DRM_FORMAT_MOD_NONE;
+		f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 
 		f.handles[0] = gem_bo;
 	}
@@ -571,7 +571,7 @@ static void addfb25_tests(int fd)
 
 		igt_describe("Test that addfb2 call fails correctly for irrelevant x-tiling");
 		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
-			f.modifier[0] = DRM_FORMAT_MOD_NONE;
+			f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 		}
 
@@ -625,7 +625,7 @@ static void addfb25_ytile(int fd)
 		f.pixel_format = DRM_FORMAT_XRGB8888;
 		f.pitches[0] = 1024*4;
 		f.flags = DRM_MODE_FB_MODIFIERS;
-		f.modifier[0] = DRM_FORMAT_MOD_NONE;
+		f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
 
 		f.handles[0] = gem_bo;
 	}
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 064e5022601b..4ff7a196a725 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -303,7 +303,7 @@ static void test_cursor(data_t *data)
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
 	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_NONE, 1., 1., 1., &cursor_fb);
+			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
 
 	cur.flags = DRM_MODE_CURSOR_BO;
 	cur.crtc_id = data->crtc_id;
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 3a0f76d97569..1657624e93a8 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -652,7 +652,7 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 
 	igt_create_color_fb(pipe_obj->display->drm_fd,
 			    width, height, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0, &fb);
 
 	/* Flip the cursor plane using the atomic API, and double-check
@@ -1111,7 +1111,7 @@ igt_main
 		igt_create_pattern_fb(display.drm_fd,
 				      mode->hdisplay, mode->vdisplay,
 				      plane_get_igt_format(primary),
-				      DRM_FORMAT_MOD_NONE, &fb);
+				      DRM_FORMAT_MOD_LINEAR, &fb);
 	}
 
 	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 03980d6e8c8d..038cb2867989 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -96,16 +96,16 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
 	switch (plane_type) {
 	case DRM_PLANE_TYPE_PRIMARY:
 		igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb2);
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb2);
 		break;
 	case DRM_PLANE_TYPE_CURSOR:
 		igt_create_fb(display->drm_fd, 64, 64,
-		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, &fb2);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &fb2);
 		break;
 	}
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index bc0a1c81b466..2823f08cc14c 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -76,7 +76,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_skip_on_f(ret == -EINVAL, "Primary plane cannot be disabled separately from output\n");
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
 	igt_plane_set_fb(primary, &fb);
 
@@ -234,7 +234,7 @@ static void set_sprite_wh(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, sprite_fb);
 	igt_create_fb(data->drm_fd, w, h,
 		      alpha ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
-		      DRM_FORMAT_MOD_NONE, sprite_fb);
+		      DRM_FORMAT_MOD_LINEAR, sprite_fb);
 }
 
 #define is_atomic_check_failure_errno(errno) \
@@ -283,7 +283,7 @@ static void setup_parms(data_t *data, enum pipe pipe,
 		} else {
 			if (!n_overlays)
 				alpha = igt_plane_has_format_mod(plane,
-					DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE);
+					DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR);
 			parms[i].fb = sprite_fb;
 			parms[i].mask = 1 << 2;
 
@@ -311,10 +311,10 @@ static void setup_parms(data_t *data, enum pipe pipe,
 	}
 
 	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
-		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, argb_fb);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, argb_fb);
 
 	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
-		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, sprite_fb);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, sprite_fb);
 
 	*iter_max = iter_mask + 1;
 	if (!n_overlays)
@@ -507,7 +507,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	override_mode.flags ^= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC;
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &data->fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
 
 	igt_output_set_pipe(output, pipe);
 
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 1ab411cecfbf..1cbbd06bbed5 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -229,7 +229,7 @@ static int chamelium_get_pattern_fb(data_t *data, size_t width, size_t height,
 	igt_assert(fourcc == DRM_FORMAT_XRGB8888);
 
 	fb_id = igt_create_fb(data->drm_fd, width, height, fourcc,
-			      DRM_FORMAT_MOD_NONE, fb);
+			      DRM_FORMAT_MOD_LINEAR, fb);
 	igt_assert(fb_id > 0);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -688,7 +688,7 @@ static void do_test_display(data_t *data, struct chamelium_port *port,
 	igt_assert(fb_id > 0);
 
 	frame_id = igt_fb_convert(&frame_fb, &fb, fourcc,
-				  DRM_FORMAT_MOD_NONE);
+				  DRM_FORMAT_MOD_LINEAR);
 	igt_assert(frame_id > 0);
 
 	if (check == CHAMELIUM_CHECK_CRC)
@@ -765,7 +765,7 @@ static void test_display_one_mode(data_t *data, struct chamelium_port *port,
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(primary);
 
-	igt_require(igt_plane_has_format_mod(primary, fourcc, DRM_FORMAT_MOD_NONE));
+	igt_require(igt_plane_has_format_mod(primary, fourcc, DRM_FORMAT_MOD_LINEAR));
 
 	mode = &connector->modes[0];
 	if (check == CHAMELIUM_CHECK_ANALOG) {
@@ -818,7 +818,7 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
 						    DRM_PLANE_TYPE_PRIMARY);
 		igt_assert(primary);
 		igt_require(igt_plane_has_format_mod(primary, fourcc,
-			    DRM_FORMAT_MOD_NONE));
+			    DRM_FORMAT_MOD_LINEAR));
 
 		/* we may skip some modes due to above but that's ok */
 		count_modes = connector->count_modes;
@@ -886,7 +886,7 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
 		fb_id = igt_create_color_pattern_fb(data->drm_fd,
 						    mode->hdisplay, mode->vdisplay,
 						    DRM_FORMAT_XRGB8888,
-						    DRM_FORMAT_MOD_NONE,
+						    DRM_FORMAT_MOD_LINEAR,
 						    0, 0, 0, &fb);
 		igt_assert(fb_id > 0);
 
@@ -1023,7 +1023,7 @@ static void test_mode_timings(data_t *data, struct chamelium_port *port)
 		fb_id = igt_create_color_pattern_fb(data->drm_fd,
 						    mode->hdisplay, mode->vdisplay,
 						    DRM_FORMAT_XRGB8888,
-						    DRM_FORMAT_MOD_NONE,
+						    DRM_FORMAT_MOD_LINEAR,
 						    0, 0, 0, &fb);
 		igt_assert(fb_id > 0);
 
@@ -1134,7 +1134,7 @@ static void test_display_aspect_ratio(data_t *data, struct chamelium_port *port)
 	fb_id = igt_create_color_pattern_fb(data->drm_fd,
 					    mode->hdisplay, mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_LINEAR,
 					    0, 0, 0, &fb);
 	igt_assert(fb_id > 0);
 
@@ -1855,7 +1855,7 @@ test_display_audio(data_t *data, struct chamelium_port *port,
 	fb_id = igt_create_color_pattern_fb(data->drm_fd,
 					    mode->hdisplay, mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_LINEAR,
 					    0, 0, 0, &fb);
 	igt_assert(fb_id > 0);
 
@@ -1938,7 +1938,7 @@ test_display_audio_edid(data_t *data, struct chamelium_port *port,
 	fb_id = igt_create_color_pattern_fb(data->drm_fd,
 					    mode->hdisplay, mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_LINEAR,
 					    0, 0, 0, &fb);
 	igt_assert(fb_id > 0);
 
@@ -2279,7 +2279,7 @@ static void prepare_randomized_plane(data_t *data,
 	randomize_plane_setup(data, plane, mode, &overlay_fb_w, &overlay_fb_h,
 			      &format, &modifier, allow_yuv);
 
-	tiled = (modifier != DRM_FORMAT_MOD_NONE);
+	tiled = (modifier != DRM_FORMAT_MOD_LINEAR);
 	igt_debug("Plane %d: framebuffer size %dx%d %s format (%s)\n",
 		  index, overlay_fb_w, overlay_fb_h,
 		  igt_format_str(format), tiled ? "tiled" : "linear");
@@ -2383,7 +2383,7 @@ static void test_display_planes_random(data_t *data,
 	/* Get a framebuffer for the cairo composition result. */
 	fb_id = igt_create_fb(data->drm_fd, mode->hdisplay,
 			      mode->vdisplay, DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE, &result_fb);
+			      DRM_FORMAT_MOD_LINEAR, &result_fb);
 	igt_assert(fb_id > 0);
 
 	result_surface = igt_get_cairo_surface(data->drm_fd, &result_fb);
@@ -2814,7 +2814,7 @@ igt_main
 				if (igt_format_is_yuv(primary->formats[k]))
 					continue;
 
-				if (primary->modifiers[k] != DRM_FORMAT_MOD_NONE)
+				if (primary->modifiers[k] != DRM_FORMAT_MOD_LINEAR)
 					continue;
 
 				igt_dynamic_f("%s", igt_format_str(primary->formats[k]))
@@ -2845,7 +2845,7 @@ igt_main
 				if (!igt_format_is_yuv(primary->formats[k]))
 					continue;
 
-				if (primary->modifiers[k] != DRM_FORMAT_MOD_NONE)
+				if (primary->modifiers[k] != DRM_FORMAT_MOD_LINEAR)
 					continue;
 
 				igt_dynamic_f("%s", igt_format_str(primary->formats[k]))
diff --git a/tests/kms_color.c b/tests/kms_color.c
index d78c7e211511..775f35964f61 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -59,7 +59,7 @@ static void test_pipe_degamma(data_t *data,
 			      mode->hdisplay,
 			      mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
 
@@ -67,7 +67,7 @@ static void test_pipe_degamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
 
@@ -147,7 +147,7 @@ static void test_pipe_gamma(data_t *data,
 			      mode->hdisplay,
 			      mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
 
@@ -155,7 +155,7 @@ static void test_pipe_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
 
@@ -240,7 +240,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 			      mode->hdisplay,
 			      mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
 
@@ -248,7 +248,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
 
@@ -463,7 +463,7 @@ static bool test_pipe_ctm(data_t *data,
 			      mode->hdisplay,
 			      mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &fb);
 	igt_assert(fb_id);
 
@@ -471,7 +471,7 @@ static bool test_pipe_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -583,7 +583,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -591,7 +591,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_LINEAR,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 		igt_plane_set_fb(primary, &fb_modeset);
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 89f169d7f726..76f82d6d35b4 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -84,7 +84,7 @@ static void test_pipe_degamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -92,7 +92,7 @@ static void test_pipe_degamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_LINEAR,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -100,7 +100,7 @@ static void test_pipe_degamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_LINEAR,
 					      &fbref);
 		igt_assert(fbref_id);
 
@@ -198,7 +198,7 @@ static void test_pipe_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -206,7 +206,7 @@ static void test_pipe_gamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_LINEAR,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -214,7 +214,7 @@ static void test_pipe_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fbref);
 		igt_assert(fbref_id);
 
@@ -309,7 +309,7 @@ static bool test_pipe_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -317,7 +317,7 @@ static bool test_pipe_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_LINEAR,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -325,7 +325,7 @@ static bool test_pipe_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fbref);
 		igt_assert(fbref_id);
 
@@ -440,7 +440,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -448,7 +448,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_LINEAR,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -456,7 +456,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      &fbref);
 		igt_assert(fbref_id);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 47c441a5a3f7..170ce22e20d8 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -166,11 +166,11 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 		} else if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 			size[i] = SIZE_CURSOR;
 			format = DRM_FORMAT_ARGB8888;
-			modifier = DRM_FORMAT_MOD_NONE;
+			modifier = DRM_FORMAT_MOD_LINEAR;
 		} else {
 			size[i] = SIZE_PLANE;
 			format = DRM_FORMAT_XRGB8888;
-			modifier = DRM_FORMAT_MOD_NONE;
+			modifier = DRM_FORMAT_MOD_LINEAR;
 		}
 
 		x[i] = rand() % (mode->hdisplay - size[i]);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index e8002df27116..407d99986695 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -716,10 +716,10 @@ static void create_fbs(void)
 	}
 
 	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    1.f, 0.f, 0.f, &data.red);
 	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.f, 1.f, 0.f, &data.green);
 }
 
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f478ae08d6a2..9faba1a186c2 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -473,15 +473,15 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	/* create and set the primary plane fbs */
 	mode = igt_output_get_mode(output);
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 		      &data->primary_fb[HWCURSORBUFFER]);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 		      &data->primary_fb[SWCOMPARISONBUFFER1]);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 		      &data->primary_fb[SWCOMPARISONBUFFER2]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -540,7 +540,7 @@ static void test_cursor_alpha(data_t *data, double a)
 	/* Alpha cursor fb with white color */
 	fb_id = igt_create_fb(data->drm_fd, curw, curh,
 				    DRM_FORMAT_ARGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    &data->fb);
 	igt_assert(fb_id);
 
@@ -599,7 +599,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 	 */
 	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
 				    DRM_FORMAT_ARGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    1.0, 1.0, 1.0,
 				    &data->fb);
 
@@ -630,7 +630,7 @@ static void require_cursor_size(data_t *data, int w, int h)
 
 	/* Create temporary primary fb for testing */
 	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_NONE, &primary_fb));
+				 DRM_FORMAT_MOD_LINEAR, &primary_fb));
 
 	igt_plane_set_fb(primary, &primary_fb);
 	igt_plane_set_fb(cursor, &data->fb);
@@ -678,7 +678,7 @@ static void test_cursor_size(data_t *data)
 	 * smaller ones to see that the size is applied correctly
 	 */
 	fb_id = igt_create_fb(data->drm_fd, cursor_max_size, cursor_max_size,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->fb);
 	igt_assert(fb_id);
 
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index fbfc275c41d5..cce562e0e7eb 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -67,7 +67,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 
 	fb_id = igt_create_fb(data->drm_fd, cur_w, cur_h,
 			      DRM_FORMAT_ARGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb);
 	igt_assert(fb_id);
 
@@ -242,7 +242,7 @@ static void prepare_crtc(data_t *data)
 	mode = igt_output_get_mode(data->output);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &data->primary_fb);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index ae21cc7660e4..8e18dc834c98 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -125,7 +125,7 @@ static void test_dithering(data_t *data, enum pipe pipe,
 
 	igt_assert(igt_create_fb(data->drm_fd, data->mode->hdisplay,
 				 data->mode->vdisplay, fb_format,
-				 DRM_FORMAT_MOD_NONE, &data->fb));
+				 DRM_FORMAT_MOD_LINEAR, &data->fb));
 	igt_plane_set_fb(data->primary, &data->fb);
 	igt_plane_set_size(data->primary, data->mode->hdisplay, data->mode->vdisplay);
 
diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 8c180c886fc9..f030254dedbd 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -300,7 +300,7 @@ static void setup_framebuffer(data_t *data)
 			      fb_h_size,
 			      fb_v_size,
 			      DRM_FORMAT_XBGR8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb_test_pattern);
 
 	for (count = 0; count < data->num_h_tiles; count++) {
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 20112de1e94a..bcd4b5c97a44 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1283,7 +1283,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	if (o->flags & TEST_PAN)
 		o->fb_width *= 2;
 
-	tiling = DRM_FORMAT_MOD_NONE;
+	tiling = DRM_FORMAT_MOD_LINEAR;
 	if (o->flags & TEST_FENCE_STRESS)
 		tiling = I915_FORMAT_MOD_X_TILED;
 
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 09c871911efd..ac201293b334 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -56,7 +56,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0, &fb[0]);
 
 	igt_plane_set_fb(primary, &fb[0]);
@@ -70,7 +70,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0, &fb[1]);
 	ret = drmModePageFlip(fd, output->config.crtc->crtc_id,
 			      fb[1].fb_id, DRM_MODE_PAGE_FLIP_EVENT,
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index a324950bbcc0..abae0ab44feb 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -121,7 +121,7 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
 	fb_id = igt_create_fb(drm_fd, connector->modes[i].hdisplay,
 			      connector->modes[i].vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE, &fb);
+			      DRM_FORMAT_MOD_LINEAR, &fb);
 
 	ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
 			     &connector->connector_id, 1,
@@ -165,7 +165,7 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	fb_id = igt_create_fb(drm_fd, connector->modes[0].hdisplay,
 			      connector->modes[0].vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE, &fb);
+			      DRM_FORMAT_MOD_LINEAR, &fb);
 
 	ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
 			     &connector->connector_id, 1,
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index d4feba327fdd..32efb57ae37d 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -198,7 +198,7 @@ test_output(data_t *data)
 		      max(mode.hdisplay, 64),
 		      max(mode.vdisplay, 64),
 		      DRM_FORMAT_XRGB8888,
-		      DRM_FORMAT_MOD_NONE,
+		      DRM_FORMAT_MOD_LINEAR,
 		      &fb);
 
 	kmstest_unset_all_crtcs(data->drm_fd, data->res);
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index b69d99389de0..0bf102a6d8f1 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -107,7 +107,7 @@ static int prepare_crtc(lease_t *lease, uint32_t connector_id, uint32_t crtc_id)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(lease->fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0,
 			    &lease->primary_fb);
 
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index b1dbc73a39bd..55e0ab526dda 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -56,7 +56,7 @@ static void run_test(data_t *data, int valid_outputs)
 	}
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE, &data->fb);
+			      DRM_FORMAT_MOD_LINEAR, &data->fb);
 
 	/* Collect reference CRC by Committing individually on all outputs*/
 	for_each_connected_output(display, output) {
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index f92dfd047e4b..6c1b748d4975 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -61,7 +61,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_create_pattern_fb(data->drm_fd,
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      &data->fb1);
 
 	/*
@@ -104,7 +104,7 @@ static void test_panel_fitting(data_t *d)
 		/* allocate fb2 with image */
 		igt_create_pattern_fb(d->drm_fd, mode->hdisplay / 2, mode->vdisplay / 2,
 				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_NONE, &d->fb2);
+				      DRM_FORMAT_MOD_LINEAR, &d->fb2);
 
 		/* Set up display to enable panel fitting */
 		mode->hdisplay = 640;
@@ -195,15 +195,15 @@ test_panel_fitting_fastset(igt_display_t *display, const enum pipe pipe, igt_out
 	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
 	igt_create_color_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.f, 0.f, 1.f, &blue);
 
 	igt_create_color_fb(display->drm_fd, 640, 480,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    1.f, 0.f, 0.f, &red);
 
 	igt_create_color_fb(display->drm_fd, 800, 600,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.f, 1.f, 0.f, &green);
 
 	igt_plane_set_fb(primary, &blue);
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index dac7c6487f21..0861c46dbd9b 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -89,7 +89,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 		igt_create_color_fb(data->drm_fd,
 					mode->hdisplay, mode->vdisplay,
 					DRM_FORMAT_XRGB8888,
-					DRM_FORMAT_MOD_NONE,
+					DRM_FORMAT_MOD_LINEAR,
 					colors[c].r,
 					colors[c].g,
 					colors[c].b,
@@ -187,13 +187,13 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
 	igt_create_color_fb(data->drm_fd,
 			mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0,
 			&fb0);
 	igt_create_color_fb(data->drm_fd,
 			mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0,
 			&fb1);
 
@@ -244,7 +244,7 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
 	igt_create_color_fb(data->drm_fd,
 			    mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0, &data->fb);
 	igt_plane_set_fb(igt_output_get_plane(output, 0), &data->fb);
 	igt_display_commit(display);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 77b13a33ed49..effc54cecbf7 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -106,7 +106,7 @@ create_fb_for_mode(data_t *data, drmModeModeInfo *mode,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      fb);
 	igt_assert_fd(fb_id);
 
@@ -152,7 +152,7 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 		igt_assert_fd(igt_create_color_fb(data->drm_fd,
 						  mode->hdisplay, mode->vdisplay,
 						  DRM_FORMAT_XRGB8888,
-						  DRM_FORMAT_MOD_NONE,
+						  DRM_FORMAT_MOD_LINEAR,
 						  fb_color->red, fb_color->green, fb_color->blue,
 						  &fb));
 	}
@@ -224,7 +224,7 @@ test_plane_position_with_output(data_t *data,
 	igt_create_color_fb(data->drm_fd,
 			    64, 64, /* width, height */
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &sprite_fb);
 	igt_plane_set_fb(sprite, &sprite_fb);
@@ -306,7 +306,7 @@ create_fb_for_mode_panning(data_t *data, drmModeModeInfo *mode,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay * 2, mode->vdisplay * 2,
 			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_LINEAR,
 			      fb);
 	igt_assert(fb_id);
 
@@ -868,7 +868,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		width = mode->hdisplay;
 		height = mode->vdisplay;
 		ref.format = DRM_FORMAT_XRGB8888;
-		ref.modifier = DRM_FORMAT_MOD_NONE;
+		ref.modifier = DRM_FORMAT_MOD_LINEAR;
 	} else {
 		if (!plane->drm_plane) {
 			igt_debug("Only legacy cursor ioctl supported, skipping cursor plane\n");
@@ -877,7 +877,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
 		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
 		ref.format = DRM_FORMAT_ARGB8888;
-		ref.modifier = DRM_FORMAT_MOD_NONE;
+		ref.modifier = DRM_FORMAT_MOD_LINEAR;
 	}
 
 	igt_debug("Testing connector %s on %s plane %s.%u\n",
@@ -1044,7 +1044,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &primary_fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
 
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 075c84788a75..9e4ee22b43af 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -184,17 +184,17 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_remove_fb(data->gfx_fd, &data->gray_fb);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->xrgb_fb);
 		draw_gradient(&data->xrgb_fb, w, h, 1.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_cov_0);
 		draw_gradient_coverage(&data->argb_fb_cov_0, w, h, 0);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_0);
 
 		cr = igt_get_cairo_ctx(data->gfx_fd, &data->argb_fb_0);
@@ -203,36 +203,36 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_put_cairo_ctx(cr);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_7e);
 		draw_squares(&data->argb_fb_7e, w, h, 126. / 255.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_cov_7e);
 		draw_squares_coverage(&data->argb_fb_cov_7e, w, h, 0x7e);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_fc);
 		draw_squares(&data->argb_fb_fc, w, h, 252. / 255.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_cov_fc);
 		draw_squares_coverage(&data->argb_fb_cov_fc, w, h, 0xfc);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->argb_fb_100);
 		draw_gradient(&data->argb_fb_100, w, h, 1.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			      &data->black_fb);
 
 		igt_create_color_fb(data->gfx_fd, w, h,
-				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 				    .5, .5, .5, &data->gray_fb);
 	}
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 39c7abbed946..6c0fce86e56e 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -298,7 +298,7 @@ igt_main
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with tiling as none.");
 		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, DRM_FORMAT_MOD_NONE);
+			test_planes_on_pipe(&data, DRM_FORMAT_MOD_LINEAR);
 
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with x-tiling.");
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 45cabb500774..c9c43dd534c5 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -113,7 +113,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    color->red, color->green, color->blue,
 			    &data->fb[primary->index]);
 
@@ -243,7 +243,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 		data->plane[i] = plane;
 
 		plane_format = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
-		plane_tiling = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_NONE : tiling;
+		plane_tiling = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_LINEAR : tiling;
 
 		igt_skip_on(!igt_plane_has_format_mod(plane, plane_format,
 						      plane_tiling));
@@ -397,7 +397,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
 
 	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, DRM_FORMAT_MOD_NONE);
+		test_plane_position(data, pipe, DRM_FORMAT_MOD_LINEAR);
 }
 
 static data_t data;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 4c517a4326d7..883601c02d5c 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -82,7 +82,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 {
 	igt_display_t *display = &data->display;
 	uint64_t tiling = is_i915_device(data->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	cleanup_crtc(data);
 
@@ -248,7 +248,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
 	uint64_t tiling = is_i915_device(d->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -282,7 +282,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 }
 
 static const uint64_t tilings[] = {
-	DRM_FORMAT_MOD_NONE,
+	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
 	I915_FORMAT_MOD_Yf_TILED
@@ -366,7 +366,7 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 	drmModeModeInfo *mode;
 	int primary_plane_scaling = 0; /* For now */
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -614,7 +614,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	drmModeModeInfo *mode1, *mode2;
 	enum pipe pipe1, pipe2;
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_LINEAR;
 
 	cleanup_crtc(d);
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 5cdb559778b3..1ad4b3a638f5 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -134,7 +134,7 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 	enum igt_color_range color_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
 
 	igt_init_fb(fb, importer_fd, scratch->width, scratch->height,
-		    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+		    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 		    color_encoding, color_range);
 }
 
@@ -224,7 +224,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 
 		igt_create_color_fb(importer_fd,
 				    mode->hdisplay, mode->vdisplay,
-				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 				    colors[i].r, colors[i].g, colors[i].b,
 				    &fb);
 
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 974f49fa34e6..dd5a93aa7a77 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -41,7 +41,7 @@ static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, fb);
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb);
 
 	igt_output_set_pipe(output, pipe);
 
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index a1b9c5ac1b5c..fcd5cdad22b8 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -65,13 +65,13 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
 
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &cursor_height));
 
 	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
-		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, &argb_fb);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, &argb_fb);
 
 	/*
 	 * Make sure these buffers are suited for display use
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 11401a6d00ad..32695a42c201 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -220,7 +220,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
 	unsigned int w, h, ref_w, ref_h, min_w, min_h;
-	uint64_t tiling = data->override_tiling ?: DRM_FORMAT_MOD_NONE;
+	uint64_t tiling = data->override_tiling ?: DRM_FORMAT_MOD_LINEAR;
 	uint32_t pixel_format = data->override_fmt ?: DRM_FORMAT_XRGB8888;
 	const float flip_opacity = 0.75;
 
@@ -310,7 +310,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 		* Create a reference CRC for a software-rotated fb.
 		*/
 		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
-			data->override_tiling ?: DRM_FORMAT_MOD_NONE, &data->fb_reference);
+			data->override_tiling ?: DRM_FORMAT_MOD_LINEAR, &data->fb_reference);
 		paint_squares(data, data->rotation, &data->fb_reference, 1.0);
 
 		igt_plane_set_fb(plane, &data->fb_reference);
@@ -677,13 +677,13 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		uint64_t tiling;
 		struct igt_fb fbs[ARRAY_SIZE(formatlist)][2];
 	} planeconfigs[] = {
-	{IGT_ROTATION_0, .2f, .4f, DRM_FORMAT_MOD_NONE },
+	{IGT_ROTATION_0, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_X_TILED },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_180, .2f, .4f, DRM_FORMAT_MOD_NONE },
+	{IGT_ROTATION_180, .2f, .4f, DRM_FORMAT_MOD_LINEAR },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_X_TILED },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
@@ -1059,7 +1059,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
 						AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
 				else
-					data.override_tiling = DRM_FORMAT_MOD_NONE;
+					data.override_tiling = DRM_FORMAT_MOD_LINEAR;
 			}
 			data.rotation = subtest->rot;
 			test_plane_rotation(&data, subtest->plane, false);
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 17cc5ab35068..9c28748012de 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -84,7 +84,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb);
 
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 80665204c68d..0b837a49c4ed 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -184,7 +184,7 @@ static void create_fb_for_crtc(struct crtc_config *crtc,
 	fb_id = igt_create_pattern_fb(drm_fd, crtc->mode.hdisplay,
 				      crtc->mode.vdisplay,
 				      igt_bpp_depth_to_drm_format(bpp, depth),
-				      DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_LINEAR,
 				      fb_info);
 	igt_assert_lt(0, fb_id);
 }
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index c7b859dac427..2e8958979dd6 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -75,22 +75,22 @@ functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pi
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				DRM_FORMAT_XRGB8888,
-				DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_LINEAR,
 				0.0, 0.0, 0.0,
 				&test->black_fb);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				DRM_FORMAT_XRGB8888,
-				DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_LINEAR,
 				0.0, 0.0, 1.0,
 				&test->blue_fb);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				DRM_FORMAT_XRGB8888,
-				DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_LINEAR,
 				1.0, 1.0, 0.0,
 				&test->yellow_fb);
 	igt_create_color_fb(data->drm_fd, 100, 100,
 				DRM_FORMAT_XRGB8888,
-				DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_LINEAR,
 				1.0, 0.0, 0.0,
 				&test->red_fb);
 
@@ -316,19 +316,19 @@ sanity_test_init(sanity_test_t *test, igt_output_t *output, enum pipe pipe)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 1.0,
 			    &test->blue_fb);
 	igt_create_color_fb(data->drm_fd,
 			    mode->hdisplay + 100, mode->vdisplay + 100,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 1.0,
 			    &test->oversized_fb);
 	igt_create_color_fb(data->drm_fd,
 			    mode->hdisplay - 100, mode->vdisplay - 100,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 1.0,
 			    &test->undersized_fb);
 
@@ -446,12 +446,12 @@ pageflip_test_init(pageflip_test_t *test, igt_output_t *output, enum pipe pipe)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    1.0, 0.0, 0.0,
 			    &test->red_fb);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 1.0,
 			    &test->blue_fb);
 }
@@ -666,19 +666,19 @@ gen9_test_init(gen9_test_t *test, igt_output_t *output, enum pipe pipe)
 	/* Initial framebuffer of full CRTC size */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0,
 			    &test->biggreen_fb);
 
 	/* Framebuffers that only cover a quarter of the CRTC size */
 	igt_create_color_fb(data->drm_fd, test->w, test->h,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    1.0, 0.0, 0.0,
 			    &test->smallred_fb);
 	igt_create_color_fb(data->drm_fd, test->w, test->h,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 1.0,
 			    &test->smallblue_fb);
 }
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index f3a9875e300f..e65e8522a861 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -81,7 +81,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb);
 
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 14d66905e9a6..55de7cb989b0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -218,11 +218,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.50, 0.50, 0.50, &data->fb0);
 
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			    0.50, 0.50, 0.50, &data->fb1);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb0);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 55b429dd3bf4..076cbda40ade 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -71,7 +71,7 @@ static void create_crc_colors(data_t *data,
 				    data->mode->hdisplay,
 				    data->mode->vdisplay,
 				    DRM_FORMAT_XRGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    colors[i].r, colors[i].g, colors[i].b,
 				    &colors[i].fb);
 
@@ -356,7 +356,7 @@ igt_main
 					    data.mode->hdisplay,
 					    data.mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_LINEAR,
 					    0.0, 0.0, 0.0,
 					    &data.default_fb);
 			igt_plane_set_fb(data.primary, &data.default_fb);
diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 8869aba7125e..8b127a13c127 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
@@ -167,7 +167,7 @@ static void prepare_crtc(gpu_process_t *gpu)
 
 	/* create a white fb and flip to it */
 	igt_create_color_fb(gpu->drm_fd, mode->hdisplay, mode->vdisplay,
-			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
 			1.0, 1.0, 1.0, &gpu->fb);
 
 	gpu->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 74472ed900cb..399318d07b78 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -81,7 +81,7 @@ drmModeRes *resources;
 int drm_fd, modes;
 int test_all_modes = 0, test_preferred_mode = 0, force_mode = 0, test_plane,
     test_stereo_modes, test_aspect_ratio;
-uint64_t tiling = DRM_FORMAT_MOD_NONE;
+uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
 int sleep_between_modes = 0;
 int do_dpms = 0; /* This aliases to DPMS_ON */
 uint32_t depth = 24, stride, bpp;
diff --git a/tests/vc4_tiling.c b/tests/vc4_tiling.c
index 00c7c6b84d60..b96fe4ad7e18 100644
--- a/tests/vc4_tiling.c
+++ b/tests/vc4_tiling.c
@@ -52,7 +52,7 @@ igt_main
 	igt_subtest("set-bad-handle") {
 		struct drm_vc4_set_tiling set = {
 			.handle = 0xd0d0d0d0,
-			.modifier = DRM_FORMAT_MOD_NONE,
+			.modifier = DRM_FORMAT_MOD_LINEAR,
 		};
 		do_ioctl_err(fd, DRM_IOCTL_VC4_SET_TILING, &set, ENOENT);
 	}
@@ -72,7 +72,7 @@ igt_main
 		struct drm_vc4_set_tiling set = {
 			.handle = bo,
 			.flags = 0xd0d0d0d0,
-			.modifier = DRM_FORMAT_MOD_NONE,
+			.modifier = DRM_FORMAT_MOD_LINEAR,
 		};
 		do_ioctl_err(fd, DRM_IOCTL_VC4_SET_TILING, &set, EINVAL);
 		gem_close(fd, bo);
@@ -102,7 +102,7 @@ igt_main
 		int bo = igt_vc4_create_bo(fd, 4096);
 
 		/* Default is untiled. */
-		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_NONE);
+		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_LINEAR);
 
 		/* Set to tiled and check. */
 		igt_vc4_set_tiling(fd, bo, DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED);
@@ -110,8 +110,8 @@ igt_main
 			   DRM_FORMAT_MOD_BROADCOM_VC4_T_TILED);
 
 		/* Set it back and check. */
-		igt_vc4_set_tiling(fd, bo, DRM_FORMAT_MOD_NONE);
-		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_NONE);
+		igt_vc4_set_tiling(fd, bo, DRM_FORMAT_MOD_LINEAR);
+		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_LINEAR);
 
 		gem_close(fd, bo);
 	}
@@ -128,7 +128,7 @@ igt_main
 		gem_close(fd, bo);
 
 		bo = igt_vc4_create_bo(fd, size);
-		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_NONE);
+		igt_assert(igt_vc4_get_tiling(fd, bo) == DRM_FORMAT_MOD_LINEAR);
 		gem_close(fd, bo);
 	}
 
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 9026a99ec504..71be8f13478d 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -174,7 +174,7 @@ uint8_t bitdepth;
 
 drmModeRes *resources;
 int drm_fd, modes, gen;
-uint64_t tiling = DRM_FORMAT_MOD_NONE;
+uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
 uint32_t depth = 24, stride, bpp;
 int specified_mode_num = -1, specified_disp_id = -1;
 int width, height;
@@ -356,7 +356,7 @@ static int setup_framebuffers(struct connector *dp_conn)
 	dp_conn->fb = igt_create_fb(drm_fd,
 				    dp_conn->fb_width, dp_conn->fb_height,
 				    DRM_FORMAT_XRGB8888,
-				    DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_LINEAR,
 				    &dp_conn->fb_video_pattern);
 	igt_assert(dp_conn->fb);
 
@@ -386,7 +386,7 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 					     dp_conn->failsafe_width,
 					     dp_conn->failsafe_height,
 					     DRM_FORMAT_XRGB8888,
-					     DRM_FORMAT_MOD_NONE,
+					     DRM_FORMAT_MOD_LINEAR,
 					     &dp_conn->fb_failsafe_pattern);
 	igt_assert(dp_conn->failsafe_fb);
 
@@ -423,7 +423,7 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	dp_conn->test_pattern.fb = igt_create_fb(drm_fd,
 						 video_width, video_height,
 						 gen == 10 ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
-						 DRM_FORMAT_MOD_NONE,
+						 DRM_FORMAT_MOD_LINEAR,
 						 &dp_conn->test_pattern.fb_pattern);
 	igt_assert(dp_conn->test_pattern.fb);
 
diff --git a/tools/intel_residency.c b/tools/intel_residency.c
index 5dffea9b375d..0932e362b9f0 100644
--- a/tools/intel_residency.c
+++ b/tools/intel_residency.c
@@ -273,7 +273,7 @@ static void setup_modeset(void)
 	draw_rect(&fbs[1], IGT_DRAW_BLT, 0x800000);
 
 	igt_create_fb(drm.fd, 64, 64, DRM_FORMAT_ARGB8888,
-		     DRM_FORMAT_MOD_NONE, &cursor);
+		     DRM_FORMAT_MOD_LINEAR, &cursor);
 	igt_draw_fill_fb(drm.fd, &cursor, 0xFF008000);
 }
 
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 4c7fc94b9c43..4063d06e7b65 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -155,7 +155,7 @@ uint8_t bitdepth;
 
 drmModeRes *resources;
 int drm_fd, modes, gen;
-uint64_t tiling = DRM_FORMAT_MOD_NONE;
+uint64_t tiling = DRM_FORMAT_MOD_LINEAR;
 uint32_t depth = 24, stride, bpp;
 int specified_mode_num = -1, specified_disp_id = -1;
 int width, height;
@@ -310,7 +310,7 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	dp_conn->test_pattern.fb = igt_create_fb(drm_fd,
 			video_width, video_height,
 			DRM_FORMAT_XRGB8888,
-			DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_MOD_LINEAR,
 			&dp_conn->test_pattern.fb_pattern);
 	igt_assert(dp_conn->test_pattern.fb);
 
-- 
2.32.0
