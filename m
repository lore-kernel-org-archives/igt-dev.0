Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074586EB84
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:24 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:10 -0700
Message-Id: <20210711061211.2879015-9-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 8/9] Nuke local versions of DRM_FORMAT
 and DRM_MODE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use the definition from kernel headers.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_fb.c                     |  20 +++---
 lib/ioctl_wrappers.h             |  26 --------
 tests/amdgpu/amd_bypass.c        |   2 +-
 tests/debugfs_test.c             |   2 +-
 tests/drm_read.c                 |   2 +-
 tests/i915/i915_pm_backlight.c   |   2 +-
 tests/i915/i915_pm_dc.c          |   2 +-
 tests/i915/i915_pm_lpsp.c        |   2 +-
 tests/i915/i915_pm_rpm.c         |   8 +--
 tests/i915/perf_pmu.c            |   2 +-
 tests/kms_3d.c                   |   2 +-
 tests/kms_addfb_basic.c          |  50 +++++++-------
 tests/kms_async_flips.c          |   2 +-
 tests/kms_atomic.c               |   4 +-
 tests/kms_atomic_interruptible.c |   6 +-
 tests/kms_atomic_transition.c    |  12 ++--
 tests/kms_big_fb.c               |   4 +-
 tests/kms_big_joiner.c           |   2 +-
 tests/kms_ccs.c                  |   4 +-
 tests/kms_chamelium.c            |  26 ++++----
 tests/kms_color.c                |  20 +++---
 tests/kms_color_chamelium.c      |  24 +++----
 tests/kms_concurrent.c           |   2 +-
 tests/kms_content_protection.c   |   4 +-
 tests/kms_cursor_crc.c           |  12 ++--
 tests/kms_cursor_edge_walk.c     |   4 +-
 tests/kms_dither.c               |   2 +-
 tests/kms_dp_dsc.c               |   2 +-
 tests/kms_dp_tiled_display.c     |   2 +-
 tests/kms_draw_crc.c             |  12 ++--
 tests/kms_flip.c                 |   2 +-
 tests/kms_flip_event_leak.c      |   4 +-
 tests/kms_flip_tiling.c          |  16 ++---
 tests/kms_frontbuffer_tracking.c |   6 +-
 tests/kms_hdmi_inject.c          |   4 +-
 tests/kms_invalid_dotclock.c     |   2 +-
 tests/kms_lease.c                | 109 +++++++------------------------
 tests/kms_mmap_write_crc.c       |   4 +-
 tests/kms_multipipe_modeset.c    |   2 +-
 tests/kms_panel_fitting.c        |  10 +--
 tests/kms_pipe_crc_basic.c       |   8 +--
 tests/kms_plane.c                |  10 +--
 tests/kms_plane_alpha_blend.c    |  20 +++---
 tests/kms_plane_lowres.c         |   2 +-
 tests/kms_plane_multiple.c       |   6 +-
 tests/kms_plane_scaling.c        |  10 +--
 tests/kms_prime.c                |   4 +-
 tests/kms_properties.c           |   2 +-
 tests/kms_psr.c                  |   2 +-
 tests/kms_psr2_sf.c              |  14 ++--
 tests/kms_psr2_su.c              |   4 +-
 tests/kms_pwrite_crc.c           |   4 +-
 tests/kms_rmfb.c                 |   4 +-
 tests/kms_rotation_crc.c         |  10 +--
 tests/kms_sequence.c             |   2 +-
 tests/kms_setmode.c              |   2 +-
 tests/kms_universal_plane.c      |  24 +++----
 tests/kms_vblank.c               |   2 +-
 tests/kms_vrr.c                  |   4 +-
 tests/nouveau_crc.c              |   4 +-
 tests/prime_mmap_kms.c           |   2 +-
 tests/prime_vgem.c               |   2 +-
 tests/testdisplay.c              |   2 +-
 tools/intel_dp_compliance.c      |   8 +--
 tools/intel_residency.c          |   2 +-
 tools/msm_dp_compliance.c        |   4 +-
 66 files changed, 246 insertions(+), 335 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index b67483de..75ab217b 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -411,7 +411,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	}
 
 	switch (modifier) {
-	case LOCAL_DRM_FORMAT_MOD_NONE:
+	case DRM_FORMAT_MOD_NONE:
 		if (is_i915_device(fd))
 			*width_ret = 64;
 		else
@@ -704,7 +704,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 	uint32_t min_stride = fb->plane_width[plane] *
 		(fb->plane_bpp[plane] / 8);
 
-	if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE &&
+	if (fb->modifier != DRM_FORMAT_MOD_NONE &&
 	    is_i915_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint32_t stride;
@@ -727,7 +727,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		 * so the easiest way is to align the luma stride to 256.
 		 */
 		return ALIGN(min_stride, 256);
-	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+	} else if (fb->modifier != DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
 		/*
 		 * For amdgpu device with tiling mode
 		 */
@@ -786,7 +786,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 
 static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 {
-	if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE &&
+	if (fb->modifier != DRM_FORMAT_MOD_NONE &&
 	    is_i915_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint64_t min_size = (uint64_t) fb->strides[plane] *
@@ -805,7 +805,7 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 		size = roundup_power_of_two(size);
 
 		return size;
-	} else if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
+	} else if (fb->modifier != DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb->fd)) {
 		/*
 		 * For amdgpu device with tiling mode
 		 */
@@ -919,7 +919,7 @@ void igt_calc_fb_size(int fd, int width, int height, uint32_t drm_format, uint64
 uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 {
 	switch (modifier) {
-	case LOCAL_DRM_FORMAT_MOD_NONE:
+	case DRM_FORMAT_MOD_NONE:
 		return I915_TILING_NONE;
 	case I915_FORMAT_MOD_X_TILED:
 		return I915_TILING_X;
@@ -951,7 +951,7 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling)
 {
 	switch (tiling) {
 	case I915_TILING_NONE:
-		return LOCAL_DRM_FORMAT_MOD_NONE;
+		return DRM_FORMAT_MOD_NONE;
 	case I915_TILING_X:
 		return I915_FORMAT_MOD_X_TILED;
 	case I915_TILING_Y:
@@ -1814,7 +1814,7 @@ igt_create_fb_with_bo_size(int fd, int width, int height,
 		  __func__, fb->gem_handle, fb->strides[0]);
 
 	if (fb->modifier || igt_has_fb_modifiers(fd))
-		flags = LOCAL_DRM_MODE_FB_MODIFIERS;
+		flags = DRM_MODE_FB_MODIFIERS;
 
 	do_or_die(__kms_addfb(fb->fd, fb->gem_handle,
 			      fb->width, fb->height,
@@ -2537,7 +2537,7 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 	 */
 
 	igt_init_fb(&linear->fb, fb->fd, fb->width, fb->height,
-		    fb->drm_format, LOCAL_DRM_FORMAT_MOD_NONE,
+		    fb->drm_format, DRM_FORMAT_MOD_NONE,
 		    fb->color_encoding, fb->color_range);
 
 	create_bo_for_fb(&linear->fb, true);
@@ -2714,7 +2714,7 @@ static void *igt_fb_create_cairo_shadow_buffer(int fd,
 	igt_assert(shadow);
 
 	igt_init_fb(shadow, fd, width, height,
-		    drm_format, LOCAL_DRM_FORMAT_MOD_NONE,
+		    drm_format, DRM_FORMAT_MOD_NONE,
 		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
 
 	shadow->strides[0] = ALIGN(width * (shadow->plane_bpp[0] / 8), 16);
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 0ed67b6e..9a897fec 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -147,32 +147,6 @@ off_t prime_get_size(int dma_buf_fd);
 void prime_sync_start(int dma_buf_fd, bool write);
 void prime_sync_end(int dma_buf_fd, bool write);
 
-/* addfb2 fb modifiers */
-struct local_drm_mode_fb_cmd2 {
-	uint32_t fb_id;
-	uint32_t width, height;
-	uint32_t pixel_format;
-	uint32_t flags;
-	uint32_t handles[4];
-	uint32_t pitches[4];
-	uint32_t offsets[4];
-	uint64_t modifier[4];
-};
-
-#define LOCAL_DRM_MODE_FB_MODIFIERS	(1<<1)
-
-#define LOCAL_DRM_FORMAT_MOD_VENDOR_INTEL	0x01
-
-#define local_fourcc_mod_code(vendor, val) \
-		((((uint64_t)LOCAL_DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | \
-		(val & 0x00ffffffffffffffL))
-
-#define LOCAL_DRM_FORMAT_MOD_NONE	(0)
-#define LOCAL_DRM_IOCTL_MODE_ADDFB2	DRM_IOWR(0xB8,			\
-						 struct local_drm_mode_fb_cmd2)
-
-#define LOCAL_DRM_CAP_ADDFB2_MODIFIERS	0x10
-
 bool igt_has_fb_modifiers(int fd);
 void igt_require_fb_modifiers(int fd);
 bool igt_has_drm_cap(int fd, uint64_t capability);
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 8231c768..f805efb2 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -316,7 +316,7 @@ static void bypass_8bpc_test(data_t *data)
 	test_init(data);
 
 	igt_create_fb(data->drm_fd, data->width, data->height,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
 
 	/*
 	 * Settings:
diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c
index e50f213a..fdfa3403 100644
--- a/tests/debugfs_test.c
+++ b/tests/debugfs_test.c
@@ -122,7 +122,7 @@ retry:
 				igt_create_pattern_fb(display.drm_fd,
 						      mode->hdisplay, mode->vdisplay,
 						      DRM_FORMAT_XRGB8888,
-						      LOCAL_DRM_FORMAT_MOD_NONE, &fb[pipe]);
+						      DRM_FORMAT_MOD_NONE, &fb[pipe]);
 
 				/* Set a valid fb as some debugfs like to inspect it on a active pipe */
 				igt_plane_set_fb(primary, &fb[pipe]);
diff --git a/tests/drm_read.c b/tests/drm_read.c
index 2fdec5be..d7609fbd 100644
--- a/tests/drm_read.c
+++ b/tests/drm_read.c
@@ -278,7 +278,7 @@ igt_main
 
 			igt_create_pattern_fb(fd, mode->hdisplay, mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+					      DRM_FORMAT_MOD_NONE, &fb);
 
 			igt_output_set_pipe(output, pipe);
 			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), &fb);
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index 9753ef95..b26013f7 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -227,7 +227,7 @@ igt_main
 		igt_create_pattern_fb(display.drm_fd,
 				      mode->hdisplay, mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+				      DRM_FORMAT_MOD_NONE, &fb);
 		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(primary, &fb);
 
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2705b7d0..53840579 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -159,7 +159,7 @@ static void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 			      data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      fb);
 	igt_assert(fb_id);
 	paint_rectangles(data, data->mode, fb_color, fb);
diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 4a187810..05bc032a 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -111,7 +111,7 @@ static void setup_lpsp_output(data_t *data)
 	igt_create_pattern_fb(data->drm_fd,
 			      data->mode->hdisplay, data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      &data->fb);
 	igt_plane_set_fb(primary, &data->fb);
 	igt_display_commit(&data->display);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 6b086eee..39e0064a 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -283,7 +283,7 @@ static bool init_modeset_params_for_type(struct mode_set_data *data,
 		return false;
 
 	igt_create_pattern_fb(drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			      &params->fb);
 
 	params->crtc_id = kmstest_find_crtc_for_connector(drm_fd, data->res,
@@ -1588,9 +1588,9 @@ static void cursor_subtest(bool dpms)
 	crtc_id = default_mode_params->crtc_id;
 
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-		      LOCAL_DRM_FORMAT_MOD_NONE, &cursor_fb1);
+		      DRM_FORMAT_MOD_NONE, &cursor_fb1);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-		      LOCAL_DRM_FORMAT_MOD_NONE, &cursor_fb2);
+		      DRM_FORMAT_MOD_NONE, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
 		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
 
@@ -1722,7 +1722,7 @@ static void test_one_plane(bool dpms, uint32_t plane_id,
 		plane_format = DRM_FORMAT_ARGB8888;
 		plane_w = 64;
 		plane_h = 64;
-		tiling = LOCAL_DRM_FORMAT_MOD_NONE;
+		tiling = DRM_FORMAT_MOD_NONE;
 		break;
 	default:
 		igt_assert(0);
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 73f37860..10dc3bf2 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -957,7 +957,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb);
 
diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index a88a86ee..2e438b43 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -98,7 +98,7 @@ igt_simple_main
 		/* create stereo framebuffer */
 		fb_id = igt_create_stereo_fb(drm_fd, &connector->modes[i],
 					     igt_bpp_depth_to_drm_format(32, 24),
-					     LOCAL_DRM_FORMAT_MOD_NONE);
+					     DRM_FORMAT_MOD_NONE);
 
 		ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
 				     &connector->connector_id, 1,
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 7937fff8..1e62a897 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -71,7 +71,7 @@ static int rmfb(int fd, uint32_t id)
 
 static void invalid_tests(int fd)
 {
-	struct local_drm_mode_fb_cmd2 f = {};
+	struct drm_mode_fb_cmd2 f = {};
 
 	f.width = 512;
 	f.height = 512;
@@ -93,14 +93,14 @@ static void invalid_tests(int fd)
 		f.fb_id = 0;
 	}
 
-	f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
+	f.flags = DRM_MODE_FB_MODIFIERS;
 
 	igt_describe("Test that addfb2 call fails correctly for unused handle");
 	igt_subtest("unused-handle") {
 		igt_require_fb_modifiers(fd);
 
 		f.handles[1] = gem_bo_small;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 		f.handles[1] = 0;
 	}
@@ -110,7 +110,7 @@ static void invalid_tests(int fd)
 		igt_require_fb_modifiers(fd);
 
 		f.pitches[1] = 512;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 		f.pitches[1] = 0;
 	}
@@ -120,7 +120,7 @@ static void invalid_tests(int fd)
 		igt_require_fb_modifiers(fd);
 
 		f.offsets[1] = 512;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 		f.offsets[1] = 0;
 	}
@@ -130,7 +130,7 @@ static void invalid_tests(int fd)
 		igt_require_fb_modifiers(fd);
 
 		f.modifier[1] =  I915_FORMAT_MOD_X_TILED;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == -1 &&
 			   errno == EINVAL);
 		f.modifier[1] = 0;
 	}
@@ -141,7 +141,7 @@ static void invalid_tests(int fd)
 		f.flags = 0;
 		f.modifier[0] = 0;
 		gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4);
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
 		f.fb_id = 0;
 		igt_assert(f.modifier[0] == 0);
@@ -161,7 +161,7 @@ static void invalid_tests(int fd)
 				DRM_FORMAT_XRGB8888, 0, &size, &stride);
 		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
 		f.handles[0] = handle;
-		do_ioctl_err(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
+		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
 	}
 
 	igt_describe("Check if addfb2 call works for legacy formats");
@@ -527,7 +527,7 @@ static void size_tests(int fd)
 
 static void addfb25_tests(int fd)
 {
-	struct local_drm_mode_fb_cmd2 f = {};
+	struct drm_mode_fb_cmd2 f = {};
 
 	igt_fixture {
 		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
@@ -540,7 +540,7 @@ static void addfb25_tests(int fd)
 		f.height = 1024;
 		f.pixel_format = DRM_FORMAT_XRGB8888;
 		f.pitches[0] = 1024*4;
-		f.modifier[0] = LOCAL_DRM_FORMAT_MOD_NONE;
+		f.modifier[0] = DRM_FORMAT_MOD_NONE;
 
 		f.handles[0] = gem_bo;
 	}
@@ -550,18 +550,18 @@ static void addfb25_tests(int fd)
 		igt_require_fb_modifiers(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_X_TILED;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 	}
 
 	igt_fixture
-		f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
+		f.flags = DRM_MODE_FB_MODIFIERS;
 
 	igt_describe("Test that addfb2 call fails correctly for irrelevant modifier");
 	igt_subtest("addfb25-bad-modifier") {
 		igt_require_fb_modifiers(fd);
 
 		f.modifier[0] = ~0;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 	}
 
 	igt_subtest_group {
@@ -573,14 +573,14 @@ static void addfb25_tests(int fd)
 
 		igt_describe("Test that addfb2 call fails correctly for irrelevant x-tiling");
 		igt_subtest("addfb25-x-tiled-mismatch-legacy") {
-			f.modifier[0] = LOCAL_DRM_FORMAT_MOD_NONE;
-			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
+			f.modifier[0] = DRM_FORMAT_MOD_NONE;
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 		}
 
 		igt_describe("Check if addfb2 call works for x-tiling");
 		igt_subtest("addfb25-x-tiled-legacy") {
 			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
-			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
 			f.fb_id = 0;
 		}
@@ -588,7 +588,7 @@ static void addfb25_tests(int fd)
 		igt_describe("Check if addfb2 call works for relevant combination of tiling and fbs");
 		igt_subtest("addfb25-framebuffer-vs-set-tiling") {
 			f.modifier[0] = I915_FORMAT_MOD_X_TILED;
-			igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_X, 512*4) == -EBUSY);
 			igt_assert(__gem_set_tiling(fd, gem_bo, I915_TILING_Y, 1024*4) == -EBUSY);
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
@@ -599,7 +599,7 @@ static void addfb25_tests(int fd)
 		gem_close(fd, gem_bo);
 }
 
-static int addfb_expected_ret(igt_display_t *display, struct local_drm_mode_fb_cmd2 *f)
+static int addfb_expected_ret(igt_display_t *display, struct drm_mode_fb_cmd2 *f)
 {
 	return igt_display_has_format_mod(display, f->pixel_format,
 					  f->modifier[0]) ? 0 : -1;
@@ -607,7 +607,7 @@ static int addfb_expected_ret(igt_display_t *display, struct local_drm_mode_fb_c
 
 static void addfb25_ytile(int fd)
 {
-	struct local_drm_mode_fb_cmd2 f = {};
+	struct drm_mode_fb_cmd2 f = {};
 	igt_display_t display;
 
 	igt_fixture {
@@ -626,8 +626,8 @@ static void addfb25_ytile(int fd)
 		f.height = 1024;
 		f.pixel_format = DRM_FORMAT_XRGB8888;
 		f.pitches[0] = 1024*4;
-		f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
-		f.modifier[0] = LOCAL_DRM_FORMAT_MOD_NONE;
+		f.flags = DRM_MODE_FB_MODIFIERS;
+		f.modifier[0] = DRM_FORMAT_MOD_NONE;
 
 		f.handles[0] = gem_bo;
 	}
@@ -638,7 +638,7 @@ static void addfb25_ytile(int fd)
 		igt_require_intel(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_Y_TILED;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
 			   addfb_expected_ret(&display, &f));
 		if (!addfb_expected_ret(&display, &f))
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
@@ -651,7 +651,7 @@ static void addfb25_ytile(int fd)
 		igt_require_intel(fd);
 
 		f.modifier[0] = I915_FORMAT_MOD_Yf_TILED;
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) ==
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
 			   addfb_expected_ret(&display, &f));
 		if (!addfb_expected_ret(&display, &f))
 			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
@@ -667,7 +667,7 @@ static void addfb25_ytile(int fd)
 		f.height = 1023;
 		f.handles[0] = gem_bo_small;
 		igt_require(addfb_expected_ret(&display, &f) == 0);
-		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
+		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno == EINVAL);
 		f.fb_id = 0;
 	}
 
@@ -788,7 +788,7 @@ static void master_tests(int fd)
 
 static bool has_addfb2_iface(int fd)
 {
-	struct local_drm_mode_fb_cmd2 f = {};
+	struct drm_mode_fb_cmd2 f = {};
 	int err;
 
 	err = 0;
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 7a63f42b..ecc62680 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -298,7 +298,7 @@ static void test_cursor(data_t *data)
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &height));
 
 	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_ARGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE, 1., 1., 1., &cursor_fb);
+			    DRM_FORMAT_MOD_NONE, 1., 1., 1., &cursor_fb);
 
 	cur.flags = DRM_MODE_CURSOR_BO;
 	cur.crtc_id = data->crtc_id;
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index df9c9df7..81e20099 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -642,7 +642,7 @@ static void plane_cursor(igt_pipe_t *pipe_obj,
 
 	igt_create_color_fb(pipe_obj->display->drm_fd,
 			    width, height, DRM_FORMAT_ARGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0, &fb);
 
 	/* Flip the cursor plane using the atomic API, and double-check
@@ -1101,7 +1101,7 @@ igt_main
 		igt_create_pattern_fb(display.drm_fd,
 				      mode->hdisplay, mode->vdisplay,
 				      plane_get_igt_format(primary),
-				      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+				      DRM_FORMAT_MOD_NONE, &fb);
 	}
 
 	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 9d19055c..0a127921 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -97,16 +97,16 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
 
 	switch (plane_type) {
 	case DRM_PLANE_TYPE_PRIMARY:
 		igt_create_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb2);
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb2);
 		break;
 	case DRM_PLANE_TYPE_CURSOR:
 		igt_create_fb(display->drm_fd, 64, 64,
-		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb2);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, &fb2);
 		break;
 	}
 
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index f4131071..cef6187e 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -76,7 +76,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_skip_on_f(ret == -EINVAL, "Primary plane cannot be disabled separately from output\n");
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
 
 	igt_plane_set_fb(primary, &fb);
 
@@ -234,7 +234,7 @@ static void set_sprite_wh(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, sprite_fb);
 	igt_create_fb(data->drm_fd, w, h,
 		      alpha ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
-		      LOCAL_DRM_FORMAT_MOD_NONE, sprite_fb);
+		      DRM_FORMAT_MOD_NONE, sprite_fb);
 }
 
 #define is_atomic_check_failure_errno(errno) \
@@ -283,7 +283,7 @@ static void setup_parms(data_t *data, enum pipe pipe,
 		} else {
 			if (!n_overlays)
 				alpha = igt_plane_has_format_mod(plane,
-					DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE);
+					DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE);
 			parms[i].fb = sprite_fb;
 			parms[i].mask = 1 << 2;
 
@@ -311,10 +311,10 @@ static void setup_parms(data_t *data, enum pipe pipe,
 	}
 
 	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
-		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE, argb_fb);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, argb_fb);
 
 	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
-		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE, sprite_fb);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, sprite_fb);
 
 	*iter_max = iter_mask + 1;
 	if (!n_overlays)
@@ -507,7 +507,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	override_mode.flags ^= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NHSYNC;
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &data->fb);
 
 	igt_output_set_pipe(output, pipe);
 
diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index 065e58c0..c6f374bd 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -106,7 +106,7 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
 	f.width = newfb->width;
 	f.height = newfb->height;
 	f.pixel_format = newfb->drm_format;
-	f.flags = LOCAL_DRM_MODE_FB_MODIFIERS;
+	f.flags = DRM_MODE_FB_MODIFIERS;
 
 	for (int n = 0; n < newfb->num_planes; n++) {
 		f.handles[n] = newfb->gem_handle;
@@ -125,7 +125,7 @@ static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
                igt_put_cairo_ctx(cr);
        }
 
-	igt_assert(drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) == 0);
+	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f) == 0);
 	newfb->fb_id = f.fb_id;
 }
 
diff --git a/tests/kms_big_joiner.c b/tests/kms_big_joiner.c
index 98a6fc77..4f1f3152 100644
--- a/tests/kms_big_joiner.c
+++ b/tests/kms_big_joiner.c
@@ -288,7 +288,7 @@ igt_main
 		igt_require_f(count > 0, "No output with 5k+ mode found\n");
 
 		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE, &data.fb);
+				      DRM_FORMAT_MOD_NONE, &data.fb);
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index c3453160..e60a6a77 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -118,7 +118,7 @@ static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
 	f->width = fb->width;
 	f->height = fb->height;
 	f->pixel_format = fb->drm_format;
-	f->flags = LOCAL_DRM_MODE_FB_MODIFIERS;
+	f->flags = DRM_MODE_FB_MODIFIERS;
 
 	for (i = 0; i < fb->num_planes; i++) {
 		f->handles[i] = fb->gem_handle;
@@ -341,7 +341,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		}
 	}
 
-	ret = drmIoctl(data->drm_fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f);
+	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
 	if (data->flags & TEST_FAIL_ON_ADDFB2) {
 		igt_assert_eq(ret, -1);
 		igt_assert_eq(errno, EINVAL);
diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
index 3651981a..1ab411ce 100644
--- a/tests/kms_chamelium.c
+++ b/tests/kms_chamelium.c
@@ -229,7 +229,7 @@ static int chamelium_get_pattern_fb(data_t *data, size_t width, size_t height,
 	igt_assert(fourcc == DRM_FORMAT_XRGB8888);
 
 	fb_id = igt_create_fb(data->drm_fd, width, height, fourcc,
-			      LOCAL_DRM_FORMAT_MOD_NONE, fb);
+			      DRM_FORMAT_MOD_NONE, fb);
 	igt_assert(fb_id > 0);
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -688,7 +688,7 @@ static void do_test_display(data_t *data, struct chamelium_port *port,
 	igt_assert(fb_id > 0);
 
 	frame_id = igt_fb_convert(&frame_fb, &fb, fourcc,
-				  LOCAL_DRM_FORMAT_MOD_NONE);
+				  DRM_FORMAT_MOD_NONE);
 	igt_assert(frame_id > 0);
 
 	if (check == CHAMELIUM_CHECK_CRC)
@@ -765,7 +765,7 @@ static void test_display_one_mode(data_t *data, struct chamelium_port *port,
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(primary);
 
-	igt_require(igt_plane_has_format_mod(primary, fourcc, LOCAL_DRM_FORMAT_MOD_NONE));
+	igt_require(igt_plane_has_format_mod(primary, fourcc, DRM_FORMAT_MOD_NONE));
 
 	mode = &connector->modes[0];
 	if (check == CHAMELIUM_CHECK_ANALOG) {
@@ -818,7 +818,7 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
 						    DRM_PLANE_TYPE_PRIMARY);
 		igt_assert(primary);
 		igt_require(igt_plane_has_format_mod(primary, fourcc,
-			    LOCAL_DRM_FORMAT_MOD_NONE));
+			    DRM_FORMAT_MOD_NONE));
 
 		/* we may skip some modes due to above but that's ok */
 		count_modes = connector->count_modes;
@@ -886,7 +886,7 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
 		fb_id = igt_create_color_pattern_fb(data->drm_fd,
 						    mode->hdisplay, mode->vdisplay,
 						    DRM_FORMAT_XRGB8888,
-						    LOCAL_DRM_FORMAT_MOD_NONE,
+						    DRM_FORMAT_MOD_NONE,
 						    0, 0, 0, &fb);
 		igt_assert(fb_id > 0);
 
@@ -1023,7 +1023,7 @@ static void test_mode_timings(data_t *data, struct chamelium_port *port)
 		fb_id = igt_create_color_pattern_fb(data->drm_fd,
 						    mode->hdisplay, mode->vdisplay,
 						    DRM_FORMAT_XRGB8888,
-						    LOCAL_DRM_FORMAT_MOD_NONE,
+						    DRM_FORMAT_MOD_NONE,
 						    0, 0, 0, &fb);
 		igt_assert(fb_id > 0);
 
@@ -1134,7 +1134,7 @@ static void test_display_aspect_ratio(data_t *data, struct chamelium_port *port)
 	fb_id = igt_create_color_pattern_fb(data->drm_fd,
 					    mode->hdisplay, mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    LOCAL_DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_NONE,
 					    0, 0, 0, &fb);
 	igt_assert(fb_id > 0);
 
@@ -1855,7 +1855,7 @@ test_display_audio(data_t *data, struct chamelium_port *port,
 	fb_id = igt_create_color_pattern_fb(data->drm_fd,
 					    mode->hdisplay, mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    LOCAL_DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_NONE,
 					    0, 0, 0, &fb);
 	igt_assert(fb_id > 0);
 
@@ -1938,7 +1938,7 @@ test_display_audio_edid(data_t *data, struct chamelium_port *port,
 	fb_id = igt_create_color_pattern_fb(data->drm_fd,
 					    mode->hdisplay, mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    LOCAL_DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_NONE,
 					    0, 0, 0, &fb);
 	igt_assert(fb_id > 0);
 
@@ -2279,7 +2279,7 @@ static void prepare_randomized_plane(data_t *data,
 	randomize_plane_setup(data, plane, mode, &overlay_fb_w, &overlay_fb_h,
 			      &format, &modifier, allow_yuv);
 
-	tiled = (modifier != LOCAL_DRM_FORMAT_MOD_NONE);
+	tiled = (modifier != DRM_FORMAT_MOD_NONE);
 	igt_debug("Plane %d: framebuffer size %dx%d %s format (%s)\n",
 		  index, overlay_fb_w, overlay_fb_h,
 		  igt_format_str(format), tiled ? "tiled" : "linear");
@@ -2383,7 +2383,7 @@ static void test_display_planes_random(data_t *data,
 	/* Get a framebuffer for the cairo composition result. */
 	fb_id = igt_create_fb(data->drm_fd, mode->hdisplay,
 			      mode->vdisplay, DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE, &result_fb);
+			      DRM_FORMAT_MOD_NONE, &result_fb);
 	igt_assert(fb_id > 0);
 
 	result_surface = igt_get_cairo_surface(data->drm_fd, &result_fb);
@@ -2814,7 +2814,7 @@ igt_main
 				if (igt_format_is_yuv(primary->formats[k]))
 					continue;
 
-				if (primary->modifiers[k] != LOCAL_DRM_FORMAT_MOD_NONE)
+				if (primary->modifiers[k] != DRM_FORMAT_MOD_NONE)
 					continue;
 
 				igt_dynamic_f("%s", igt_format_str(primary->formats[k]))
@@ -2845,7 +2845,7 @@ igt_main
 				if (!igt_format_is_yuv(primary->formats[k]))
 					continue;
 
-				if (primary->modifiers[k] != LOCAL_DRM_FORMAT_MOD_NONE)
+				if (primary->modifiers[k] != DRM_FORMAT_MOD_NONE)
 					continue;
 
 				igt_dynamic_f("%s", igt_format_str(primary->formats[k]))
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 1b021ac3..9105076a 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -58,7 +58,7 @@ static void test_pipe_degamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -66,7 +66,7 @@ static void test_pipe_degamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -146,7 +146,7 @@ static void test_pipe_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -154,7 +154,7 @@ static void test_pipe_gamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -239,7 +239,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -247,7 +247,7 @@ static void test_pipe_legacy_gamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -462,7 +462,7 @@ static bool test_pipe_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -470,7 +470,7 @@ static bool test_pipe_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 		igt_plane_set_fb(primary, &fb_modeset);
@@ -583,7 +583,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -591,7 +591,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 		igt_plane_set_fb(primary, &fb_modeset);
diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c
index 11e52869..bc4356bf 100644
--- a/tests/kms_color_chamelium.c
+++ b/tests/kms_color_chamelium.c
@@ -84,7 +84,7 @@ static void test_pipe_degamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -92,7 +92,7 @@ static void test_pipe_degamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -100,7 +100,7 @@ static void test_pipe_degamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fbref);
 		igt_assert(fbref_id);
 
@@ -198,7 +198,7 @@ static void test_pipe_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -206,7 +206,7 @@ static void test_pipe_gamma(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -214,7 +214,7 @@ static void test_pipe_gamma(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fbref);
 		igt_assert(fbref_id);
 
@@ -309,7 +309,7 @@ static bool test_pipe_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -317,7 +317,7 @@ static bool test_pipe_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -325,7 +325,7 @@ static bool test_pipe_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fbref);
 		igt_assert(fbref_id);
 
@@ -438,7 +438,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fb);
 		igt_assert(fb_id);
 
@@ -446,7 +446,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 					      mode->hdisplay,
 					      mode->vdisplay,
 					      DRM_FORMAT_XRGB8888,
-					      LOCAL_DRM_FORMAT_MOD_NONE,
+					      DRM_FORMAT_MOD_NONE,
 					      &fb_modeset);
 		igt_assert(fb_modeset_id);
 
@@ -454,7 +454,7 @@ static void test_pipe_limited_range_ctm(data_t *data,
 				      mode->hdisplay,
 				      mode->vdisplay,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      &fbref);
 		igt_assert(fbref_id);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 25d4b3c9..969f07a7 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -176,7 +176,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 		igt_create_color_fb(data->drm_fd,
 				    size[i], size[i],
 				    data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
-				    data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? LOCAL_DRM_FORMAT_MOD_NONE : I915_FORMAT_MOD_X_TILED,
+				    data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_NONE : I915_FORMAT_MOD_X_TILED,
 				    0.0f, 0.0f, 1.0f,
 				    &data->fb[i]);
 
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index bab61817..79304bd7 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -713,10 +713,10 @@ static void create_fbs(void)
 	}
 
 	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    1.f, 0.f, 0.f, &data.red);
 	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    0.f, 1.f, 0.f, &data.green);
 }
 
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index ee8912dc..a9bc3a74 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -381,13 +381,13 @@ static void prepare_crtc(data_t *data, igt_output_t *output,
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb[HWCURSORBUFFER]);
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb[SWCOMPARISONBUFFER]);
 
@@ -447,7 +447,7 @@ static void test_cursor_alpha(data_t *data, double a)
 	/* Alpha cursor fb with white color */
 	fb_id = igt_create_fb(data->drm_fd, curw, curh,
 				    DRM_FORMAT_ARGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    &data->fb);
 	igt_assert(fb_id);
 
@@ -506,7 +506,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 	 */
 	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
 				    DRM_FORMAT_ARGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    1.0, 1.0, 1.0,
 				    &data->fb);
 
@@ -537,7 +537,7 @@ static void require_cursor_size(data_t *data, int w, int h)
 
 	/* Create temporary primary fb for testing */
 	igt_assert(igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				 LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb));
+				 DRM_FORMAT_MOD_NONE, &primary_fb));
 
 	igt_plane_set_fb(primary, &primary_fb);
 	igt_plane_set_fb(cursor, &data->fb);
@@ -585,7 +585,7 @@ static void test_cursor_size(data_t *data)
 	 * smaller ones to see that the size is applied correctly
 	 */
 	fb_id = igt_create_fb(data->drm_fd, cursor_max_size, cursor_max_size,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->fb);
 	igt_assert(fb_id);
 
diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index d1d8a914..e9902f5e 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -67,7 +67,7 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 
 	fb_id = igt_create_fb(data->drm_fd, cur_w, cur_h,
 			      DRM_FORMAT_ARGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      &data->fb);
 	igt_assert(fb_id);
 
@@ -242,7 +242,7 @@ static void prepare_crtc(data_t *data)
 	mode = igt_output_get_mode(data->output);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      &data->primary_fb);
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index a6009d6e..49f79352 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -123,7 +123,7 @@ static void test_dithering(data_t *data, enum pipe pipe,
 
 	igt_assert(igt_create_fb(data->drm_fd, data->mode->hdisplay,
 				 data->mode->vdisplay, fb_format,
-				 LOCAL_DRM_FORMAT_MOD_NONE, &data->fb));
+				 DRM_FORMAT_MOD_NONE, &data->fb));
 	igt_plane_set_fb(data->primary, &data->fb);
 	igt_plane_set_size(data->primary, data->mode->hdisplay, data->mode->vdisplay);
 
diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 3fb9852e..22065d0c 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -230,7 +230,7 @@ static void run_test(data_t *data, igt_output_t *output,
 	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
 			      data->mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      &data->fb_test_pattern);
 
 	for_each_pipe(&data->display, pipe) {
diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index eb28dd6b..8c180c88 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
@@ -300,7 +300,7 @@ static void setup_framebuffer(data_t *data)
 			      fb_h_size,
 			      fb_v_size,
 			      DRM_FORMAT_XBGR8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      &data->fb_test_pattern);
 
 	for (count = 0; count < data->num_h_tiles; count++) {
diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index 153e654e..5e3252b7 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -50,7 +50,7 @@ static const uint32_t formats[N_FORMATS] = {
 
 #define N_TILING_METHODS 3
 static const uint64_t tilings[N_TILING_METHODS] = {
-	LOCAL_DRM_FORMAT_MOD_NONE,
+	DRM_FORMAT_MOD_NONE,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
 };
@@ -166,7 +166,7 @@ static bool format_is_supported(uint32_t format, uint64_t modifier)
 						   0, NULL, &strides[0], NULL);
 	ret =  __kms_addfb(drm_fd, gem_handle, 64, 64,
 			   format, modifier, strides, offsets, 1,
-			   LOCAL_DRM_MODE_FB_MODIFIERS, &fb_id);
+			   DRM_MODE_FB_MODIFIERS, &fb_id);
 	drmModeRmFB(drm_fd, fb_id);
 	gem_close(drm_fd, gem_handle);
 
@@ -191,7 +191,7 @@ static void draw_method_subtest(enum igt_draw_method method,
 		get_method_crc(gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
 							       IGT_DRAW_MMAP_WC,
 			       formats[format_index],
-			       LOCAL_DRM_FORMAT_MOD_NONE,
+			       DRM_FORMAT_MOD_NONE,
 			       &base_crcs[format_index].crc);
 		base_crcs[format_index].set = true;
 	}
@@ -226,7 +226,7 @@ static void fill_fb_subtest(void)
 	igt_crc_t base_crc, crc;
 
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
 
 	igt_draw_rect_fb(drm_fd, bops, 0, &fb,
 			 gem_has_mappable_ggtt(drm_fd) ? IGT_DRAW_MMAP_GTT :
@@ -239,7 +239,7 @@ static void fill_fb_subtest(void)
 
 	igt_pipe_crc_collect_crc(pipe_crc, &base_crc);
 
-	get_fill_crc(LOCAL_DRM_FORMAT_MOD_NONE, &crc);
+	get_fill_crc(DRM_FORMAT_MOD_NONE, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
 	get_fill_crc(I915_FORMAT_MOD_X_TILED, &crc);
@@ -309,7 +309,7 @@ static const char *format_str(int format_index)
 static const char *tiling_str(int tiling_index)
 {
 	switch (tilings[tiling_index]) {
-	case LOCAL_DRM_FORMAT_MOD_NONE:
+	case DRM_FORMAT_MOD_NONE:
 		return "untiled";
 	case I915_FORMAT_MOD_X_TILED:
 		return "xtiled";
diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 03c785bd..09762ae8 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1276,7 +1276,7 @@ static void __run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 	if (o->flags & TEST_PAN)
 		o->fb_width *= 2;
 
-	tiling = LOCAL_DRM_FORMAT_MOD_NONE;
+	tiling = DRM_FORMAT_MOD_NONE;
 	if (o->flags & TEST_FENCE_STRESS)
 		tiling = I915_FORMAT_MOD_X_TILED;
 
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 06b62d17..09c87191 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -56,7 +56,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0, &fb[0]);
 
 	igt_plane_set_fb(primary, &fb[0]);
@@ -70,7 +70,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0, &fb[1]);
 	ret = drmModePageFlip(fd, output->config.crtc->crtc_id,
 			      fb[1].fb_id, DRM_MODE_PAGE_FLIP_EVENT,
diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index 48901acb..ed3b759d 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -91,8 +91,8 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t ti
 	width = mode->hdisplay;
 
 	if (tiling[0] != tiling[1] &&
-	    (tiling[0] != LOCAL_DRM_FORMAT_MOD_NONE ||
-	     tiling[1] != LOCAL_DRM_FORMAT_MOD_NONE)) {
+	    (tiling[0] != DRM_FORMAT_MOD_NONE ||
+	     tiling[1] != DRM_FORMAT_MOD_NONE)) {
 		/*
 		 * Since a page flip to a buffer with different stride
 		 * doesn't work, choose width so that the stride of both
@@ -182,7 +182,7 @@ igt_main
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling") {
 		uint64_t tiling[2] = { I915_FORMAT_MOD_X_TILED,
-				       LOCAL_DRM_FORMAT_MOD_NONE };
+				       DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
 
 		for (int i = 0; i < ARRAY_SIZE(tiling); i++)
@@ -198,7 +198,7 @@ igt_main
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Y") {
 		uint64_t tiling[2] = { I915_FORMAT_MOD_Y_TILED,
-				       LOCAL_DRM_FORMAT_MOD_NONE };
+				       DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -218,7 +218,7 @@ igt_main
 	igt_describe("Check pageflip from tiled buffer to linear one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-changes-tiling-Yf") {
 		uint64_t tiling[2] = { I915_FORMAT_MOD_Yf_TILED,
-				       LOCAL_DRM_FORMAT_MOD_NONE };
+				       DRM_FORMAT_MOD_NONE };
 		enum pipe pipe;
 
 		igt_require_fb_modifiers(data.drm_fd);
@@ -309,7 +309,7 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with x tiling");
 	igt_subtest_with_dynamic("flip-to-X-tiled") {
-		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
+		uint64_t tiling[2] = { DRM_FORMAT_MOD_NONE,
 				       I915_FORMAT_MOD_X_TILED };
 		enum pipe pipe;
 
@@ -325,7 +325,7 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with y tiling");
 	igt_subtest_with_dynamic("flip-to-Y-tiled") {
-		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
+		uint64_t tiling[2] = { DRM_FORMAT_MOD_NONE,
 				       I915_FORMAT_MOD_Y_TILED };
 		enum pipe pipe;
 
@@ -345,7 +345,7 @@ igt_main
 
 	igt_describe("Check pageflip from linear buffer to tiled one works correctly with yf tiling");
 	igt_subtest_with_dynamic("flip-to-Yf-tiled") {
-		uint64_t tiling[2] = { LOCAL_DRM_FORMAT_MOD_NONE,
+		uint64_t tiling[2] = { DRM_FORMAT_MOD_NONE,
 				       I915_FORMAT_MOD_Yf_TILED };
 		enum pipe pipe;
 
diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index c2f180aa..496718e2 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -458,7 +458,7 @@ static uint64_t tiling_to_modifier(enum tiling_type tiling)
 {
 	switch (tiling) {
 	case TILING_LINEAR:
-		return LOCAL_DRM_FORMAT_MOD_NONE;
+		return DRM_FORMAT_MOD_NONE;
 	case TILING_X:
 		return I915_FORMAT_MOD_X_TILED;
 	case TILING_Y:
@@ -674,7 +674,7 @@ static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 		  prim_mode_params.mode->vdisplay, tiling, PLANE_PRI,
 		  &s->prim_pri);
 	create_fb(format, prim_mode_params.cursor.w,
-		  prim_mode_params.cursor.h, LOCAL_DRM_FORMAT_MOD_NONE,
+		  prim_mode_params.cursor.h, DRM_FORMAT_MOD_NONE,
 		  PLANE_CUR, &s->prim_cur);
 	create_fb(format, prim_mode_params.sprite.w,
 		  prim_mode_params.sprite.h, tiling, PLANE_SPR, &s->prim_spr);
@@ -691,7 +691,7 @@ static void create_fbs(enum pixel_format format, enum tiling_type tiling)
 		  scnd_mode_params.mode->vdisplay, tiling, PLANE_PRI,
 		  &s->scnd_pri);
 	create_fb(format, scnd_mode_params.cursor.w, scnd_mode_params.cursor.h,
-		  LOCAL_DRM_FORMAT_MOD_NONE, PLANE_CUR, &s->scnd_cur);
+		  DRM_FORMAT_MOD_NONE, PLANE_CUR, &s->scnd_cur);
 	create_fb(format, scnd_mode_params.sprite.w, scnd_mode_params.sprite.h,
 		  tiling, PLANE_SPR, &s->scnd_spr);
 }
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index b47b8a39..ad2dde56 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -120,7 +120,7 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
 	fb_id = igt_create_fb(drm_fd, connector->modes[i].hdisplay,
 			      connector->modes[i].vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+			      DRM_FORMAT_MOD_NONE, &fb);
 
 	ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
 			     &connector->connector_id, 1,
@@ -164,7 +164,7 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
 	fb_id = igt_create_fb(drm_fd, connector->modes[0].hdisplay,
 			      connector->modes[0].vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+			      DRM_FORMAT_MOD_NONE, &fb);
 
 	ret = drmModeSetCrtc(drm_fd, config.crtc->crtc_id, fb_id, 0, 0,
 			     &connector->connector_id, 1,
diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
index 402629ab..f10c0c88 100644
--- a/tests/kms_invalid_dotclock.c
+++ b/tests/kms_invalid_dotclock.c
@@ -73,7 +73,7 @@ test_output(data_t *data)
 	igt_create_fb(data->drm_fd,
 		      mode.hdisplay, mode.vdisplay,
 		      DRM_FORMAT_XRGB8888,
-		      LOCAL_DRM_FORMAT_MOD_NONE,
+		      DRM_FORMAT_MOD_NONE,
 		      &fb);
 
 	for (i = 0; i < data->res->count_crtcs; i++) {
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 3a918c7f..c5c88e14 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -47,69 +47,6 @@
 
 IGT_TEST_DESCRIPTION("Test of CreateLease.");
 
-struct local_drm_mode_create_lease {
-        /** Pointer to array of object ids (__u32) */
-        __u64 object_ids;
-        /** Number of object ids */
-        __u32 object_count;
-        /** flags for new FD (O_CLOEXEC, etc) */
-        __u32 flags;
-
-        /** Return: unique identifier for lessee. */
-        __u32 lessee_id;
-        /** Return: file descriptor to new drm_master file */
-        __u32 fd;
-};
-
-struct local_drm_mode_list_lessees {
-        /** Number of lessees.
-         * On input, provides length of the array.
-         * On output, provides total number. No
-         * more than the input number will be written
-         * back, so two calls can be used to get
-         * the size and then the data.
-         */
-        __u32 count_lessees;
-        __u32 pad;
-
-        /** Pointer to lessees.
-         * pointer to __u64 array of lessee ids
-         */
-        __u64 lessees_ptr;
-};
-
-struct local_drm_mode_get_lease {
-        /** Number of leased objects.
-         * On input, provides length of the array.
-         * On output, provides total number. No
-         * more than the input number will be written
-         * back, so two calls can be used to get
-         * the size and then the data.
-         */
-        __u32 count_objects;
-        __u32 pad;
-
-        /** Pointer to objects.
-         * pointer to __u32 array of object ids
-         */
-        __u64 objects_ptr;
-};
-
-/**
- * Revoke lease
- */
-struct local_drm_mode_revoke_lease {
-        /** Unique ID of lessee
-         */
-        __u32 lessee_id;
-};
-
-
-#define LOCAL_DRM_IOCTL_MODE_CREATE_LEASE     DRM_IOWR(0xC6, struct local_drm_mode_create_lease)
-#define LOCAL_DRM_IOCTL_MODE_LIST_LESSEES     DRM_IOWR(0xC7, struct local_drm_mode_list_lessees)
-#define LOCAL_DRM_IOCTL_MODE_GET_LEASE        DRM_IOWR(0xC8, struct local_drm_mode_get_lease)
-#define LOCAL_DRM_IOCTL_MODE_REVOKE_LEASE     DRM_IOWR(0xC9, struct local_drm_mode_revoke_lease)
-
 typedef struct {
 	int fd;
 	uint32_t lessee_id;
@@ -170,7 +107,7 @@ static int prepare_crtc(lease_t *lease, uint32_t connector_id, uint32_t crtc_id)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(lease->fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
 			    &lease->primary_fb);
 
@@ -203,38 +140,38 @@ static void cleanup_crtc(lease_t *lease, igt_output_t *output)
 	igt_display_commit(display);
 }
 
-static int create_lease(int fd, struct local_drm_mode_create_lease *mcl)
+static int create_lease(int fd, struct drm_mode_create_lease *mcl)
 {
 	int err = 0;
 
-	if (igt_ioctl(fd, LOCAL_DRM_IOCTL_MODE_CREATE_LEASE, mcl))
+	if (igt_ioctl(fd, DRM_IOCTL_MODE_CREATE_LEASE, mcl))
 		err = -errno;
 	return err;
 }
 
-static int revoke_lease(int fd, struct local_drm_mode_revoke_lease *mrl)
+static int revoke_lease(int fd, struct drm_mode_revoke_lease *mrl)
 {
 	int err = 0;
 
-	if (igt_ioctl(fd, LOCAL_DRM_IOCTL_MODE_REVOKE_LEASE, mrl))
+	if (igt_ioctl(fd, DRM_IOCTL_MODE_REVOKE_LEASE, mrl))
 		err = -errno;
 	return err;
 }
 
-static int list_lessees(int fd, struct local_drm_mode_list_lessees *mll)
+static int list_lessees(int fd, struct drm_mode_list_lessees *mll)
 {
 	int err = 0;
 
-	if (igt_ioctl(fd, LOCAL_DRM_IOCTL_MODE_LIST_LESSEES, mll))
+	if (igt_ioctl(fd, DRM_IOCTL_MODE_LIST_LESSEES, mll))
 		err = -errno;
 	return err;
 }
 
-static int get_lease(int fd, struct local_drm_mode_get_lease *mgl)
+static int get_lease(int fd, struct drm_mode_get_lease *mgl)
 {
 	int err = 0;
 
-	if (igt_ioctl(fd, LOCAL_DRM_IOCTL_MODE_GET_LEASE, mgl))
+	if (igt_ioctl(fd, DRM_IOCTL_MODE_GET_LEASE, mgl))
 		err = -errno;
 	return err;
 }
@@ -242,7 +179,7 @@ static int get_lease(int fd, struct local_drm_mode_get_lease *mgl)
 static int make_lease(data_t *data, lease_t *lease)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 	int ret;
 
 	mcl.object_ids = (uint64_t) (uintptr_t) &object_ids[0];
@@ -316,7 +253,7 @@ static void simple_lease(data_t *data)
 static void page_flip_implicit_plane(data_t *data)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 	drmModePlaneRes *plane_resources;
 	uint32_t wrong_plane_id = 0;
 	int i;
@@ -385,7 +322,7 @@ static void page_flip_implicit_plane(data_t *data)
 static void setcrtc_implicit_plane(data_t *data)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 	drmModePlaneRes *plane_resources;
 	uint32_t wrong_plane_id = 0;
 	igt_output_t *output =
@@ -444,7 +381,7 @@ static void setcrtc_implicit_plane(data_t *data)
 static void cursor_implicit_plane(data_t *data)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 
 	mcl.object_ids = (uint64_t) (uintptr_t) &object_ids[0];
 	mcl.object_count = 0;
@@ -480,7 +417,7 @@ static void cursor_implicit_plane(data_t *data)
 static void atomic_implicit_crtc(data_t *data)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 	drmModeRes *resources;
 	drmModeObjectPropertiesPtr props;
 	uint32_t wrong_crtc_id = 0;
@@ -569,7 +506,7 @@ static void atomic_implicit_crtc(data_t *data)
 static void lessee_list(data_t *data)
 {
 	lease_t lease;
-	struct local_drm_mode_list_lessees mll;
+	struct drm_mode_list_lessees mll;
 	uint32_t lessees[1];
 
 	mll.pad = 0;
@@ -620,7 +557,7 @@ static void lessee_list(data_t *data)
 static void lease_get(data_t *data)
 {
 	lease_t lease;
-	struct local_drm_mode_get_lease mgl;
+	struct drm_mode_get_lease mgl;
 	int num_leased_obj = 3;
 	uint32_t objects[num_leased_obj];
 	int o;
@@ -762,7 +699,7 @@ static void lease_unleased_connector(data_t *data)
 static void lease_revoke(data_t *data)
 {
 	lease_t lease;
-	struct local_drm_mode_revoke_lease mrl;
+	struct drm_mode_revoke_lease mrl;
 	int ret;
 
 	/* Create a valid lease */
@@ -905,7 +842,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *))
 static void invalid_create_leases(data_t *data)
 {
 	uint32_t object_ids[4];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 	drmModeRes *resources;
 	int tmp_fd, ret;
 
@@ -1054,7 +991,7 @@ static void check_crtc_masks(int master_fd, int lease_fd, uint32_t crtc_mask)
 static void possible_crtcs_filtering(data_t *data)
 {
 	uint32_t *object_ids;
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 	drmModeRes *resources;
 	drmModePlaneRes *plane_resources;
 	int i;
@@ -1109,7 +1046,7 @@ static bool is_master(int fd)
 static int _create_simple_lease(int master_fd, data_t *data, int expected_ret)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
+	struct drm_mode_create_lease mcl;
 
 	object_ids[0] = data->master.display.pipes[0].crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
@@ -1198,8 +1135,8 @@ static void multimaster_lease(data_t *data)
 static void implicit_plane_lease(data_t *data)
 {
 	uint32_t object_ids[3];
-	struct local_drm_mode_create_lease mcl;
-	struct local_drm_mode_get_lease mgl;
+	struct drm_mode_create_lease mcl;
+	struct drm_mode_get_lease mgl;
 	int ret;
 	uint32_t cursor_id = igt_pipe_get_plane_type(&data->master.display.pipes[0],
 						     DRM_PLANE_TYPE_CURSOR)->drm_plane->plane_id;
@@ -1247,7 +1184,7 @@ static void implicit_plane_lease(data_t *data)
 static void lease_uevent(data_t *data)
 {
 	int lease_fd;
-	struct local_drm_mode_list_lessees mll;
+	struct drm_mode_list_lessees mll;
 	struct udev_monitor *uevent_monitor;
 
 	uevent_monitor = igt_watch_uevents();
diff --git a/tests/kms_mmap_write_crc.c b/tests/kms_mmap_write_crc.c
index b57fbe15..2e323a20 100644
--- a/tests/kms_mmap_write_crc.c
+++ b/tests/kms_mmap_write_crc.c
@@ -86,7 +86,7 @@ static void test(data_t *data)
 
 	/* create a non-white fb where we can write later */
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, fb);
 
 	ptr = dmabuf_mmap_framebuffer(data->drm_fd, fb);
 
@@ -176,7 +176,7 @@ static void prepare_crtc(data_t *data)
 
 	/* create a white reference fb and flip to it */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    1.0, 1.0, 1.0, &data->fb[0]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index b06c4e82..b1dbc73a 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -56,7 +56,7 @@ static void run_test(data_t *data, int valid_outputs)
 	}
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE, &data->fb);
+			      DRM_FORMAT_MOD_NONE, &data->fb);
 
 	/* Collect reference CRC by Committing individually on all outputs*/
 	for_each_connected_output(display, output) {
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 3e42d148..f92dfd04 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -61,7 +61,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	igt_create_pattern_fb(data->drm_fd,
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      &data->fb1);
 
 	/*
@@ -104,7 +104,7 @@ static void test_panel_fitting(data_t *d)
 		/* allocate fb2 with image */
 		igt_create_pattern_fb(d->drm_fd, mode->hdisplay / 2, mode->vdisplay / 2,
 				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE, &d->fb2);
+				      DRM_FORMAT_MOD_NONE, &d->fb2);
 
 		/* Set up display to enable panel fitting */
 		mode->hdisplay = 640;
@@ -195,15 +195,15 @@ test_panel_fitting_fastset(igt_display_t *display, const enum pipe pipe, igt_out
 	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
 	igt_create_color_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    0.f, 0.f, 1.f, &blue);
 
 	igt_create_color_fb(display->drm_fd, 640, 480,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    1.f, 0.f, 0.f, &red);
 
 	igt_create_color_fb(display->drm_fd, 800, 600,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    0.f, 1.f, 0.f, &green);
 
 	igt_plane_set_fb(primary, &blue);
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 67d68ebe..dac7c648 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -89,7 +89,7 @@ static void test_read_crc(data_t *data, enum pipe pipe, unsigned flags)
 		igt_create_color_fb(data->drm_fd,
 					mode->hdisplay, mode->vdisplay,
 					DRM_FORMAT_XRGB8888,
-					LOCAL_DRM_FORMAT_MOD_NONE,
+					DRM_FORMAT_MOD_NONE,
 					colors[c].r,
 					colors[c].g,
 					colors[c].b,
@@ -187,13 +187,13 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
 	igt_create_color_fb(data->drm_fd,
 			mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888,
-			LOCAL_DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_MOD_NONE,
 			1.0, 1.0, 1.0,
 			&fb0);
 	igt_create_color_fb(data->drm_fd,
 			mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888,
-			LOCAL_DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_MOD_NONE,
 			1.0, 1.0, 1.0,
 			&fb1);
 
@@ -244,7 +244,7 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe)
 	igt_create_color_fb(data->drm_fd,
 			    mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 1.0, 0.0, &data->fb);
 	igt_plane_set_fb(igt_output_get_plane(output, 0), &data->fb);
 	igt_display_commit(display);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f22c045d..77b13a33 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -106,7 +106,7 @@ create_fb_for_mode(data_t *data, drmModeModeInfo *mode,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay, mode->vdisplay,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      fb);
 	igt_assert_fd(fb_id);
 
@@ -152,7 +152,7 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 		igt_assert_fd(igt_create_color_fb(data->drm_fd,
 						  mode->hdisplay, mode->vdisplay,
 						  DRM_FORMAT_XRGB8888,
-						  LOCAL_DRM_FORMAT_MOD_NONE,
+						  DRM_FORMAT_MOD_NONE,
 						  fb_color->red, fb_color->green, fb_color->blue,
 						  &fb));
 	}
@@ -224,7 +224,7 @@ test_plane_position_with_output(data_t *data,
 	igt_create_color_fb(data->drm_fd,
 			    64, 64, /* width, height */
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 1.0, 0.0,
 			    &sprite_fb);
 	igt_plane_set_fb(sprite, &sprite_fb);
@@ -306,7 +306,7 @@ create_fb_for_mode_panning(data_t *data, drmModeModeInfo *mode,
 	fb_id = igt_create_fb(data->drm_fd,
 			      mode->hdisplay * 2, mode->vdisplay * 2,
 			      DRM_FORMAT_XRGB8888,
-			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_MOD_NONE,
 			      fb);
 	igt_assert(fb_id);
 
@@ -1044,7 +1044,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &primary_fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &primary_fb);
 
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c..8616169e 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -184,17 +184,17 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_remove_fb(data->gfx_fd, &data->gray_fb);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->xrgb_fb);
 		draw_gradient(&data->xrgb_fb, w, h, 1.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_cov_0);
 		draw_gradient_coverage(&data->argb_fb_cov_0, w, h, 0);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_0);
 
 		cr = igt_get_cairo_ctx(data->gfx_fd, &data->argb_fb_0);
@@ -203,36 +203,36 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 		igt_put_cairo_ctx(cr);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_7e);
 		draw_squares(&data->argb_fb_7e, w, h, 126. / 255.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_cov_7e);
 		draw_squares_coverage(&data->argb_fb_cov_7e, w, h, 0x7e);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_fc);
 		draw_squares(&data->argb_fb_fc, w, h, 252. / 255.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_cov_fc);
 		draw_squares_coverage(&data->argb_fb_cov_fc, w, h, 0xfc);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->argb_fb_100);
 		draw_gradient(&data->argb_fb_100, w, h, 1.);
 
 		igt_create_fb(data->gfx_fd, w, h,
-			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->black_fb);
 
 		igt_create_color_fb(data->gfx_fd, w, h,
-				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 				    .5, .5, .5, &data->gray_fb);
 	}
 
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 4dc5a345..39c7abbe 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -298,7 +298,7 @@ igt_main
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with tiling as none.");
 		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
+			test_planes_on_pipe(&data, DRM_FORMAT_MOD_NONE);
 
 		igt_describe("Tests the visibility of the planes when switching between "
 			     "high and low resolution with x-tiling.");
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 52133cd6..f57f036d 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -110,7 +110,7 @@ get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    color->red, color->green, color->blue,
 			    &data->fb[primary->index]);
 
@@ -240,7 +240,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color,
 		data->plane[i] = plane;
 
 		plane_format = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888;
-		plane_tiling = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? LOCAL_DRM_FORMAT_MOD_NONE : tiling;
+		plane_tiling = data->plane[i]->type == DRM_PLANE_TYPE_CURSOR ? DRM_FORMAT_MOD_NONE : tiling;
 
 		igt_skip_on(!igt_plane_has_format_mod(plane, plane_format,
 						      plane_tiling));
@@ -390,7 +390,7 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
 
 	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, LOCAL_DRM_FORMAT_MOD_NONE);
+		test_plane_position(data, pipe, DRM_FORMAT_MOD_NONE);
 }
 
 static data_t data;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1c68519e..3f47733e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -82,7 +82,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 {
 	igt_display_t *display = &data->display;
 	uint64_t tiling = is_i915_device(data->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_NONE;
 
 	cleanup_crtc(data);
 
@@ -252,7 +252,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 	igt_display_t *display = &d->display;
 	igt_plane_t *plane;
 	uint64_t tiling = is_i915_device(d->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_NONE;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -285,7 +285,7 @@ static void test_scaler_with_rotation_pipe(data_t *d, enum pipe pipe,
 }
 
 static const uint64_t tilings[] = {
-	LOCAL_DRM_FORMAT_MOD_NONE,
+	DRM_FORMAT_MOD_NONE,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
 	I915_FORMAT_MOD_Yf_TILED
@@ -369,7 +369,7 @@ test_plane_scaling_on_pipe(data_t *d, enum pipe pipe, igt_output_t *output)
 	drmModeModeInfo *mode;
 	int primary_plane_scaling = 0; /* For now */
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_X_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_X_TILED : DRM_FORMAT_MOD_NONE;
 
 	igt_require(get_num_scalers(d, pipe) > 0);
 
@@ -617,7 +617,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 	drmModeModeInfo *mode1, *mode2;
 	enum pipe pipe1, pipe2;
 	uint64_t tiling = is_i915_device(display->drm_fd) ?
-		I915_FORMAT_MOD_Y_TILED : LOCAL_DRM_FORMAT_MOD_NONE;
+		I915_FORMAT_MOD_Y_TILED : DRM_FORMAT_MOD_NONE;
 
 	cleanup_crtc(d);
 
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 8cb2ca2a..35f4b5b7 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -125,7 +125,7 @@ static void prepare_fb(int importer_fd, struct dumb_bo *scratch, struct igt_fb *
 	enum igt_color_range color_range = IGT_COLOR_YCBCR_LIMITED_RANGE;
 
 	igt_init_fb(fb, importer_fd, scratch->width, scratch->height,
-		    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+		    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 		    color_encoding, color_range);
 }
 
@@ -215,7 +215,7 @@ static void test_crc(int exporter_fd, int importer_fd)
 
 		igt_create_color_fb(importer_fd,
 				    mode->hdisplay, mode->vdisplay,
-				    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 				    colors[i].r, colors[i].g, colors[i].b,
 				    &fb);
 
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 58a710e7..974f49fa 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -41,7 +41,7 @@ static void prepare_pipe(igt_display_t *display, enum pipe pipe, igt_output_t *o
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, fb);
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, fb);
 
 	igt_output_set_pipe(output, pipe);
 
diff --git a/tests/kms_psr.c b/tests/kms_psr.c
index 97c95d96..8f2fbb8a 100644
--- a/tests/kms_psr.c
+++ b/tests/kms_psr.c
@@ -81,7 +81,7 @@ static void create_cursor_fb(data_t *data)
 	uint32_t fb_id;
 
 	fb_id = igt_create_fb(data->drm_fd, 64, 64,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->fb_white);
 	igt_assert(fb_id);
 
diff --git a/tests/kms_psr2_sf.c b/tests/kms_psr2_sf.c
index d4c19ca9..1be8c3da 100644
--- a/tests/kms_psr2_sf.c
+++ b/tests/kms_psr2_sf.c
@@ -223,7 +223,7 @@ static void prepare(data_t *data)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 1.0, 0.0,
 			    &data->fb_primary);
 
@@ -239,7 +239,7 @@ static void prepare(data_t *data)
 				    data->mode->hdisplay/2,
 				    data->mode->vdisplay/2,
 				    DRM_FORMAT_XRGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    0.0, 0.0, 1.0,
 				    &data->fb_overlay);
 
@@ -247,7 +247,7 @@ static void prepare(data_t *data)
 				    data->mode->hdisplay/2,
 				    data->mode->vdisplay/2,
 				    DRM_FORMAT_XRGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    0.0, 0.0, 1.0,
 				    &data->fb_test);
 
@@ -270,7 +270,7 @@ static void prepare(data_t *data)
 		igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 1.0, 0.0,
 			    &data->fb_test);
 
@@ -287,7 +287,7 @@ static void prepare(data_t *data)
 					    data->mode->hdisplay,
 					    data->mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    LOCAL_DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_NONE,
 					    0.0, 0.0, 1.0,
 					    &data->fb_overlay);
 
@@ -303,14 +303,14 @@ static void prepare(data_t *data)
 		igt_plane_set_position(cursor, 0, 0);
 
 		igt_create_fb(data->drm_fd, CUR_SIZE, CUR_SIZE,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->fb_cursor);
 
 		draw_rect(data, &data->fb_cursor, 0, 0, CUR_SIZE, CUR_SIZE,
 			    0.0, 0.0, 1.0, 1.0);
 
 		igt_create_fb(data->drm_fd, CUR_SIZE, CUR_SIZE,
-			      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE,
 			      &data->fb_test);
 
 		draw_rect(data, &data->fb_test, 0, 0, CUR_SIZE, CUR_SIZE,
diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
index c709065f..a232b3bb 100644
--- a/tests/kms_psr2_su.c
+++ b/tests/kms_psr2_su.c
@@ -112,7 +112,7 @@ static void prepare(data_t *data)
 	igt_create_color_fb(data->drm_fd,
 			    data->mode->hdisplay, data->mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 1.0, 0.0,
 			    &data->fb[0]);
 
@@ -122,7 +122,7 @@ static void prepare(data_t *data)
 		igt_create_color_fb(data->drm_fd,
 				    data->mode->hdisplay, data->mode->vdisplay,
 				    DRM_FORMAT_XRGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    0.0, 1.0, 0.0,
 				    &data->fb[1]);
 
diff --git a/tests/kms_pwrite_crc.c b/tests/kms_pwrite_crc.c
index d6cc0c47..dc32a070 100644
--- a/tests/kms_pwrite_crc.c
+++ b/tests/kms_pwrite_crc.c
@@ -58,7 +58,7 @@ static void test(data_t *data)
 
 	/* create a non-white fb where we can pwrite later */
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, fb);
+			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, fb);
 
 	/* flip to it to make it UC/WC and fully flushed */
 	drmModeSetPlane(data->drm_fd,
@@ -113,7 +113,7 @@ static void prepare_crtc(data_t *data)
 
 	/* create a white reference fb and flip to it */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    1.0, 1.0, 1.0, &data->fb[0]);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 879ea574..a1b9c5ac 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -65,13 +65,13 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &fb);
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE, &fb);
 
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width));
 	do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &cursor_height));
 
 	igt_create_fb(data->drm_fd, cursor_width, cursor_height,
-		      DRM_FORMAT_ARGB8888, LOCAL_DRM_FORMAT_MOD_NONE, &argb_fb);
+		      DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_NONE, &argb_fb);
 
 	/*
 	 * Make sure these buffers are suited for display use
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index c0020cec..1497120c 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -220,7 +220,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
 	unsigned int w, h, ref_w, ref_h, min_w, min_h;
-	uint64_t tiling = data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE;
+	uint64_t tiling = data->override_tiling ?: DRM_FORMAT_MOD_NONE;
 	uint32_t pixel_format = data->override_fmt ?: DRM_FORMAT_XRGB8888;
 	const float flip_opacity = 0.75;
 
@@ -310,7 +310,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
 		* Create a reference CRC for a software-rotated fb.
 		*/
 		igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format,
-			data->override_tiling ?: LOCAL_DRM_FORMAT_MOD_NONE, &data->fb_reference);
+			data->override_tiling ?: DRM_FORMAT_MOD_NONE, &data->fb_reference);
 		paint_squares(data, data->rotation, &data->fb_reference, 1.0);
 
 		igt_plane_set_fb(plane, &data->fb_reference);
@@ -675,13 +675,13 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		uint64_t tiling;
 		struct igt_fb fbs[ARRAY_SIZE(formatlist)][2];
 	} planeconfigs[] = {
-	{IGT_ROTATION_0, .2f, .4f, LOCAL_DRM_FORMAT_MOD_NONE },
+	{IGT_ROTATION_0, .2f, .4f, DRM_FORMAT_MOD_NONE },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_X_TILED },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_0, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
 	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_90, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
-	{IGT_ROTATION_180, .2f, .4f, LOCAL_DRM_FORMAT_MOD_NONE },
+	{IGT_ROTATION_180, .2f, .4f, DRM_FORMAT_MOD_NONE },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_X_TILED },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
 	{IGT_ROTATION_180, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
@@ -1059,7 +1059,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 						AMD_FMT_MOD_SET(TILE, AMD_FMT_MOD_TILE_GFX9_64K_S) |
 						AMD_FMT_MOD_SET(TILE_VERSION, AMD_FMT_MOD_TILE_VER_GFX9);
 				else
-					data.override_tiling = LOCAL_DRM_FORMAT_MOD_NONE;
+					data.override_tiling = DRM_FORMAT_MOD_NONE;
 			}
 			data.rotation = subtest->rot;
 			test_plane_rotation(&data, subtest->plane, false);
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 15afb2f1..bd810a5c 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -104,7 +104,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb);
 
diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index eb9ac189..05084c3a 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -181,7 +181,7 @@ static void create_fb_for_crtc(struct crtc_config *crtc,
 	fb_id = igt_create_pattern_fb(drm_fd, crtc->mode.hdisplay,
 				      crtc->mode.vdisplay,
 				      igt_bpp_depth_to_drm_format(bpp, depth),
-				      LOCAL_DRM_FORMAT_MOD_NONE,
+				      DRM_FORMAT_MOD_NONE,
 				      fb_info);
 	igt_assert_lt(0, fb_id);
 }
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 4366dd4d..c9a9cd47 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -75,22 +75,22 @@ functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pi
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				DRM_FORMAT_XRGB8888,
-				LOCAL_DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_NONE,
 				0.0, 0.0, 0.0,
 				&test->black_fb);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				DRM_FORMAT_XRGB8888,
-				LOCAL_DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_NONE,
 				0.0, 0.0, 1.0,
 				&test->blue_fb);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 				DRM_FORMAT_XRGB8888,
-				LOCAL_DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_NONE,
 				1.0, 1.0, 0.0,
 				&test->yellow_fb);
 	igt_create_color_fb(data->drm_fd, 100, 100,
 				DRM_FORMAT_XRGB8888,
-				LOCAL_DRM_FORMAT_MOD_NONE,
+				DRM_FORMAT_MOD_NONE,
 				1.0, 0.0, 0.0,
 				&test->red_fb);
 
@@ -316,19 +316,19 @@ sanity_test_init(sanity_test_t *test, igt_output_t *output, enum pipe pipe)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 1.0,
 			    &test->blue_fb);
 	igt_create_color_fb(data->drm_fd,
 			    mode->hdisplay + 100, mode->vdisplay + 100,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 1.0,
 			    &test->oversized_fb);
 	igt_create_color_fb(data->drm_fd,
 			    mode->hdisplay - 100, mode->vdisplay - 100,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 1.0,
 			    &test->undersized_fb);
 
@@ -445,12 +445,12 @@ pageflip_test_init(pageflip_test_t *test, igt_output_t *output, enum pipe pipe)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    1.0, 0.0, 0.0,
 			    &test->red_fb);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 1.0,
 			    &test->blue_fb);
 }
@@ -664,19 +664,19 @@ gen9_test_init(gen9_test_t *test, igt_output_t *output, enum pipe pipe)
 	/* Initial framebuffer of full CRTC size */
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 1.0, 0.0,
 			    &test->biggreen_fb);
 
 	/* Framebuffers that only cover a quarter of the CRTC size */
 	igt_create_color_fb(data->drm_fd, test->w, test->h,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    1.0, 0.0, 0.0,
 			    &test->smallred_fb);
 	igt_create_color_fb(data->drm_fd, test->w, test->h,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 1.0,
 			    &test->smallblue_fb);
 }
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 93b01eba..83d5629f 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -81,7 +81,7 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
 			    DRM_FORMAT_XRGB8888,
-			    LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_MOD_NONE,
 			    0.0, 0.0, 0.0,
 			    &data->primary_fb);
 
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e28864f5..14d66905 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -218,11 +218,11 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    0.50, 0.50, 0.50, &data->fb0);
 
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			    0.50, 0.50, 0.50, &data->fb1);
 
 	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb0);
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index 4e92d424..55b429dd 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -71,7 +71,7 @@ static void create_crc_colors(data_t *data,
 				    data->mode->hdisplay,
 				    data->mode->vdisplay,
 				    DRM_FORMAT_XRGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    colors[i].r, colors[i].g, colors[i].b,
 				    &colors[i].fb);
 
@@ -356,7 +356,7 @@ igt_main
 					    data.mode->hdisplay,
 					    data.mode->vdisplay,
 					    DRM_FORMAT_XRGB8888,
-					    LOCAL_DRM_FORMAT_MOD_NONE,
+					    DRM_FORMAT_MOD_NONE,
 					    0.0, 0.0, 0.0,
 					    &data.default_fb);
 			igt_plane_set_fb(data.primary, &data.default_fb);
diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 1575eeb1..8869aba7 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
@@ -167,7 +167,7 @@ static void prepare_crtc(gpu_process_t *gpu)
 
 	/* create a white fb and flip to it */
 	igt_create_color_fb(gpu->drm_fd, mode->hdisplay, mode->vdisplay,
-			DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 			1.0, 1.0, 1.0, &gpu->fb);
 
 	gpu->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index a1c3ed38..25c5f42f 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -1013,7 +1013,7 @@ static void test_flip(int i915, int vgem, unsigned hang)
 					bo[i].width, bo[i].height,
 					DRM_FORMAT_XRGB8888, I915_TILING_NONE,
 					strides, offsets, 1,
-					LOCAL_DRM_MODE_FB_MODIFIERS,
+					DRM_MODE_FB_MODIFIERS,
 					&fb_id[i]) == 0);
 		igt_assert(fb_id[i]);
 	}
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index 937a48f4..74472ed9 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -81,7 +81,7 @@ drmModeRes *resources;
 int drm_fd, modes;
 int test_all_modes = 0, test_preferred_mode = 0, force_mode = 0, test_plane,
     test_stereo_modes, test_aspect_ratio;
-uint64_t tiling = LOCAL_DRM_FORMAT_MOD_NONE;
+uint64_t tiling = DRM_FORMAT_MOD_NONE;
 int sleep_between_modes = 0;
 int do_dpms = 0; /* This aliases to DPMS_ON */
 uint32_t depth = 24, stride, bpp;
diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index fb946056..9026a99e 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -174,7 +174,7 @@ uint8_t bitdepth;
 
 drmModeRes *resources;
 int drm_fd, modes, gen;
-uint64_t tiling = LOCAL_DRM_FORMAT_MOD_NONE;
+uint64_t tiling = DRM_FORMAT_MOD_NONE;
 uint32_t depth = 24, stride, bpp;
 int specified_mode_num = -1, specified_disp_id = -1;
 int width, height;
@@ -356,7 +356,7 @@ static int setup_framebuffers(struct connector *dp_conn)
 	dp_conn->fb = igt_create_fb(drm_fd,
 				    dp_conn->fb_width, dp_conn->fb_height,
 				    DRM_FORMAT_XRGB8888,
-				    LOCAL_DRM_FORMAT_MOD_NONE,
+				    DRM_FORMAT_MOD_NONE,
 				    &dp_conn->fb_video_pattern);
 	igt_assert(dp_conn->fb);
 
@@ -386,7 +386,7 @@ static int setup_failsafe_framebuffer(struct connector *dp_conn)
 					     dp_conn->failsafe_width,
 					     dp_conn->failsafe_height,
 					     DRM_FORMAT_XRGB8888,
-					     LOCAL_DRM_FORMAT_MOD_NONE,
+					     DRM_FORMAT_MOD_NONE,
 					     &dp_conn->fb_failsafe_pattern);
 	igt_assert(dp_conn->failsafe_fb);
 
@@ -423,7 +423,7 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	dp_conn->test_pattern.fb = igt_create_fb(drm_fd,
 						 video_width, video_height,
 						 gen == 10 ? DRM_FORMAT_ARGB8888 : DRM_FORMAT_XRGB8888,
-						 LOCAL_DRM_FORMAT_MOD_NONE,
+						 DRM_FORMAT_MOD_NONE,
 						 &dp_conn->test_pattern.fb_pattern);
 	igt_assert(dp_conn->test_pattern.fb);
 
diff --git a/tools/intel_residency.c b/tools/intel_residency.c
index 789dfcca..5dffea9b 100644
--- a/tools/intel_residency.c
+++ b/tools/intel_residency.c
@@ -273,7 +273,7 @@ static void setup_modeset(void)
 	draw_rect(&fbs[1], IGT_DRAW_BLT, 0x800000);
 
 	igt_create_fb(drm.fd, 64, 64, DRM_FORMAT_ARGB8888,
-		     LOCAL_DRM_FORMAT_MOD_NONE, &cursor);
+		     DRM_FORMAT_MOD_NONE, &cursor);
 	igt_draw_fill_fb(drm.fd, &cursor, 0xFF008000);
 }
 
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index 7bc2bfa8..4c7fc94b 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -155,7 +155,7 @@ uint8_t bitdepth;
 
 drmModeRes *resources;
 int drm_fd, modes, gen;
-uint64_t tiling = LOCAL_DRM_FORMAT_MOD_NONE;
+uint64_t tiling = DRM_FORMAT_MOD_NONE;
 uint32_t depth = 24, stride, bpp;
 int specified_mode_num = -1, specified_disp_id = -1;
 int width, height;
@@ -310,7 +310,7 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
 	dp_conn->test_pattern.fb = igt_create_fb(drm_fd,
 			video_width, video_height,
 			DRM_FORMAT_XRGB8888,
-			LOCAL_DRM_FORMAT_MOD_NONE,
+			DRM_FORMAT_MOD_NONE,
 			&dp_conn->test_pattern.fb_pattern);
 	igt_assert(dp_conn->test_pattern.fb);
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
