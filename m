Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1553A6E406
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jun 2021 20:39:46 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
Date: Fri,  4 Jun 2021 13:39:23 -0700
Message-Id: <20210604203927.494340-3-matthew.d.roper@intel.com>
In-Reply-To: <20210604203927.494340-1-matthew.d.roper@intel.com>
References: <20210604203927.494340-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/6] lib/i915: Add intel_display_ver() and
 use it in display tests/libs
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

Display code should check the display version of the platform rather
than the graphics version; on some platforms these versions won't be the
same.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/igt_draw.c                   | 12 ++++++------
 lib/igt_fb.c                     | 14 +++++++-------
 lib/intel_chipset.h              |  1 +
 lib/intel_device_info.c          | 14 ++++++++++++++
 tests/kms_atomic_transition.c    |  2 +-
 tests/kms_big_fb.c               | 10 +++++-----
 tests/kms_ccs.c                  |  2 +-
 tests/kms_draw_crc.c             |  2 +-
 tests/kms_flip_scaled_crc.c      |  2 +-
 tests/kms_flip_tiling.c          |  2 +-
 tests/kms_frontbuffer_tracking.c |  4 ++--
 tests/kms_getfb.c                |  2 +-
 tests/kms_hdmi_inject.c          |  2 +-
 tests/kms_panel_fitting.c        |  2 +-
 tests/kms_plane.c                |  2 +-
 tests/kms_plane_lowres.c         |  4 ++--
 tests/kms_plane_scaling.c        |  8 ++++----
 tests/kms_rotation_crc.c         |  8 ++++----
 tests/kms_universal_plane.c      |  2 +-
 19 files changed, 55 insertions(+), 40 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index a3144b50..295de022 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -339,7 +339,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 
 	/* We didn't implement suport for the older tiling methods yet. */
 	if (tiling != I915_TILING_NONE)
-		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 5);
+		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
 
 	ptr = gem_mmap__cpu(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
 			    PROT_READ | PROT_WRITE);
@@ -389,7 +389,7 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 
 	/* We didn't implement suport for the older tiling methods yet. */
 	if (tiling != I915_TILING_NONE)
-		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 5);
+		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
 
 	ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
 			   PROT_READ | PROT_WRITE);
@@ -440,7 +440,7 @@ static void draw_rect_pwrite_tiled(int fd, struct buf_data *buf,
 	int pixels_written = 0;
 
 	/* We didn't implement suport for the older tiling methods yet. */
-	igt_require(intel_gen(intel_get_drm_devid(fd)) >= 5);
+	igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
 
 	pixel_size = buf->bpp / 8;
 	tmp_size = sizeof(tmp) / pixel_size;
@@ -536,7 +536,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	struct intel_buf *dst;
 	int blt_cmd_len, blt_cmd_tiling, blt_cmd_depth;
 	uint32_t devid = intel_get_drm_devid(fd);
-	int gen = intel_gen(devid);
+	int ver = intel_display_ver(devid);
 	int pitch;
 
 	dst = create_buf(fd, cmd_data->bops, buf, tiling);
@@ -557,9 +557,9 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 		igt_assert(false);
 	}
 
-	blt_cmd_len = (gen >= 8) ?  0x5 : 0x4;
+	blt_cmd_len = (ver >= 8) ?  0x5 : 0x4;
 	blt_cmd_tiling = (tiling) ? XY_COLOR_BLT_TILED : 0;
-	pitch = (gen >= 4 && tiling) ? buf->stride / 4 : buf->stride;
+	pitch = (ver >= 4 && tiling) ? buf->stride / 4 : buf->stride;
 
 	switch_blt_tiling(ibb, tiling, true);
 
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 3e6841fd..585ede38 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -408,7 +408,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		break;
 	case LOCAL_I915_FORMAT_MOD_X_TILED:
 		igt_require_intel(fd);
-		if (intel_gen(intel_get_drm_devid(fd)) == 2) {
+		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
 			*height_ret = 16;
 		} else {
@@ -422,7 +422,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC:
 	case LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS:
 		igt_require_intel(fd);
-		if (intel_gen(intel_get_drm_devid(fd)) == 2) {
+		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
 			*height_ret = 16;
 		} else if (IS_915(intel_get_drm_devid(fd))) {
@@ -693,7 +693,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 
 	if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE &&
 	    is_i915_device(fb->fd) &&
-	    intel_gen(intel_get_drm_devid(fb->fd)) <= 3) {
+	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint32_t stride;
 
 		/* Round the tiling up to the next power-of-two and the region
@@ -758,7 +758,7 @@ static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 {
 	if (fb->modifier != LOCAL_DRM_FORMAT_MOD_NONE &&
 	    is_i915_device(fb->fd) &&
-	    intel_gen(intel_get_drm_devid(fb->fd)) <= 3) {
+	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint64_t min_size = (uint64_t) fb->strides[plane] *
 			fb->plane_height[plane];
 		uint64_t size;
@@ -2118,12 +2118,12 @@ struct fb_blit_upload {
 
 static bool fast_blit_ok(const struct igt_fb *fb)
 {
-	int gen = intel_gen(intel_get_drm_devid(fb->fd));
+	int ver = intel_display_ver(intel_get_drm_devid(fb->fd));
 
-	if (gen < 9)
+	if (ver < 9)
 		return false;
 
-	if (gen < 12)
+	if (ver < 12)
 		return true;
 
 	return fb->modifier != I915_FORMAT_MOD_X_TILED;
diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
index 8e81ffa9..87b3bbc4 100644
--- a/lib/intel_chipset.h
+++ b/lib/intel_chipset.h
@@ -84,6 +84,7 @@ struct intel_device_info {
 const struct intel_device_info *intel_get_device_info(uint16_t devid) __attribute__((pure));
 
 unsigned intel_gen(uint16_t devid) __attribute__((pure));
+unsigned intel_display_ver(uint16_t devid) __attribute__((pure));
 
 extern enum pch_type intel_pch;
 
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 4ab236e4..0c09f5cd 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -535,3 +535,17 @@ unsigned intel_gen(uint16_t devid)
 {
 	return intel_get_device_info(devid)->graphics_ver ?: -1u;
 }
+
+/**
+ * intel_display_ver:
+ * @devid: pci device id
+ *
+ * Computes the Intel GFX display version for the given device id.
+ *
+ * Returns:
+ * The display version on successful lookup, -1u on failure.
+ */
+unsigned intel_display_ver(uint16_t devid)
+{
+	return intel_get_device_info(devid)->display_ver ?: -1u;
+}
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index d8085ef3..f4131071 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -141,7 +141,7 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return false;
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) < 11)
+	if (intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 11)
 		return false;
 
 	/*
diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
index b35727a0..81bf0542 100644
--- a/tests/kms_big_fb.c
+++ b/tests/kms_big_fb.c
@@ -153,7 +153,7 @@ static bool size_ok(data_t *data, uint64_t size)
 	 * The kernel limits scanout to the
 	 * mappable portion of ggtt on gmch platforms.
 	 */
-	if ((intel_gen(data->devid) < 5 ||
+	if ((intel_display_ver(data->devid) < 5 ||
 	     IS_VALLEYVIEW(data->devid) ||
 	     IS_CHERRYVIEW(data->devid)) &&
 	    size > data->mappable_size / 2)
@@ -182,7 +182,7 @@ static void max_fb_size(data_t *data, int *width, int *height,
 	*height = data->max_fb_height;
 
 	/* max fence stride is only 8k bytes on gen3 */
-	if (intel_gen(data->devid) < 4 &&
+	if (intel_display_ver(data->devid) < 4 &&
 	    format == DRM_FORMAT_XRGB8888)
 		*width = min(*width, 8192 / 4);
 
@@ -553,7 +553,7 @@ test_addfb(data_t *data)
 	 * max fb size of 4k pixels, hence we can't test
 	 * with 32bpp and must use 16bpp instead.
 	 */
-	if (intel_gen(data->devid) == 3)
+	if (intel_display_ver(data->devid) == 3)
 		format = DRM_FORMAT_RGB565;
 	else
 		format = DRM_FORMAT_XRGB8888;
@@ -570,7 +570,7 @@ test_addfb(data_t *data)
 	bo = gem_create(data->drm_fd, size);
 	igt_require(bo);
 
-	if (intel_gen(data->devid) < 4)
+	if (intel_display_ver(data->devid) < 4)
 		gem_set_tiling(data->drm_fd, bo,
 			       igt_fb_mod_to_tiling(data->modifier), strides[0]);
 
@@ -660,7 +660,7 @@ igt_main
 		 * On gen2 we could use either, but let's go for the
 		 * blitter there as well.
 		 */
-		if (intel_gen(data.devid) >= 4)
+		if (intel_display_ver(data.devid) >= 4)
 			data.render_copy = igt_get_render_copyfunc(data.devid);
 
 		data.bops = buf_ops_create(data.drm_fd);
diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
index 01e3b979..a3eac1f8 100644
--- a/tests/kms_ccs.c
+++ b/tests/kms_ccs.c
@@ -573,7 +573,7 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
 
-		igt_require(intel_gen(intel_get_drm_devid(data.drm_fd)) >= 9);
+		igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 9);
 		kmstest_set_vt_graphics_mode();
 		igt_require_pipe_crc(data.drm_fd);
 
diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index e1fdcef6..dcda2e04 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -245,7 +245,7 @@ static void fill_fb_subtest(void)
 	get_fill_crc(LOCAL_I915_FORMAT_MOD_X_TILED, &crc);
 	igt_assert_crc_equal(&crc, &base_crc);
 
-	if (intel_gen(intel_get_drm_devid(drm_fd)) >= 9) {
+	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
 		get_fill_crc(LOCAL_I915_FORMAT_MOD_Y_TILED, &crc);
 		igt_assert_crc_equal(&crc, &base_crc);
 	}
diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
index bb796caf..d81ad352 100644
--- a/tests/kms_flip_scaled_crc.c
+++ b/tests/kms_flip_scaled_crc.c
@@ -261,7 +261,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-		data.gen = intel_gen(intel_get_drm_devid(data.drm_fd));
+		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 		igt_require(data.gen >= 9);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
diff --git a/tests/kms_flip_tiling.c b/tests/kms_flip_tiling.c
index 09e99580..573cc337 100644
--- a/tests/kms_flip_tiling.c
+++ b/tests/kms_flip_tiling.c
@@ -155,7 +155,7 @@ igt_main
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-		data.gen = intel_gen(intel_get_drm_devid(data.drm_fd));
+		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 
 		data.testformat = DRM_FORMAT_XRGB8888;
 
diff --git a/tests/kms_frontbuffer_tracking.c b/tests/kms_frontbuffer_tracking.c
index 906caa4c..97902c08 100644
--- a/tests/kms_frontbuffer_tracking.c
+++ b/tests/kms_frontbuffer_tracking.c
@@ -2647,7 +2647,7 @@ static void scaledprimary_subtest(const struct test_mode *t)
 	struct igt_fb new_fb, *old_fb;
 	struct modeset_params *params = pick_params(t);
 	struct fb_region *reg = &params->primary;
-	int gen = intel_gen(intel_get_drm_devid(drm.fd));
+	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
 	int src_y_upscale = ALIGN(reg->h / 4, 4);
 
 	igt_require_f(gen >= 9,
@@ -2831,7 +2831,7 @@ static void farfromfence_subtest(const struct test_mode *t)
 	struct draw_pattern_info *pattern = &pattern1;
 	struct fb_region *target;
 	int max_height, assertions = 0;
-	int gen = intel_gen(intel_get_drm_devid(drm.fd));
+	int gen = intel_display_ver(intel_get_drm_devid(drm.fd));
 
 	igt_skip_on(t->method == IGT_DRAW_MMAP_GTT &&
 		    !gem_has_mappable_ggtt(drm.fd));
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 917b57bb..14be74d6 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -92,7 +92,7 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	igt_require(has_addfb2_iface(fd));
 	igt_require_intel(fd);
 
-	if ((intel_gen(intel_get_drm_devid(fd))) >= 12) {
+	if ((intel_display_ver(intel_get_drm_devid(fd))) >= 12) {
 		add.modifier[0] = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
 		add.modifier[1] = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
 
diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
index 1769df08..b47b8a39 100644
--- a/tests/kms_hdmi_inject.c
+++ b/tests/kms_hdmi_inject.c
@@ -87,7 +87,7 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
 	devid = intel_get_drm_devid(drm_fd);
 
 	/* 4K requires at least HSW */
-	igt_require(IS_HASWELL(devid) || intel_gen(devid) >= 8);
+	igt_require(IS_HASWELL(devid) || intel_display_ver(devid) >= 8);
 
 	edid = igt_kms_get_4k_edid();
 	kmstest_force_edid(drm_fd, connector, edid);
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 1623f34e..3e42d148 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -243,7 +243,7 @@ static void test_atomic_fastset(data_t *data)
 		if (stat("/sys/module/i915/parameters/fastboot", &sb) == 0)
 			igt_set_module_param_int(data->drm_fd, "fastboot", 1);
 
-		igt_require(intel_gen(intel_get_drm_devid(display->drm_fd)) >= 5);
+		igt_require(intel_display_ver(intel_get_drm_devid(display->drm_fd)) >= 5);
 	}
 
 	igt_require(display->is_atomic);
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d7cbe892..ba419bbd 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -999,7 +999,7 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 	if (plane->type == DRM_PLANE_TYPE_CURSOR)
 		return false;
 
-	if (intel_gen(intel_get_drm_devid(data->drm_fd)) < 11)
+	if (intel_display_ver(intel_get_drm_devid(data->drm_fd)) < 11)
 		return false;
 
 	/*
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index a4def89f..7fd02180 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -80,14 +80,14 @@ static igt_plane_t *first_sdr_plane(igt_output_t *output, uint32_t devid)
 {
         int index;
 
-        index = intel_gen(devid) <= 9 ? 0 : SDR_PLANE_BASE;
+        index = intel_display_ver(devid) <= 9 ? 0 : SDR_PLANE_BASE;
 
         return igt_output_get_plane(output, index);
 }
 
 static bool is_sdr_plane(const igt_plane_t *plane, uint32_t devid)
 {
-        if (intel_gen(devid) <= 9)
+        if (intel_display_ver(devid) <= 9)
                 return true;
 
         return plane->index >= SDR_PLANE_BASE;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 7464b5bd..2aa46ac8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -52,9 +52,9 @@ static int get_num_scalers(data_t* d, enum pipe pipe)
 	if (!is_i915_device(d->drm_fd))
 		return 1;
 
-	igt_require(intel_gen(d->devid) >= 9);
+	igt_require(intel_display_ver(d->devid) >= 9);
 
-	if (intel_gen(d->devid) >= 10)
+	if (intel_display_ver(d->devid) >= 10)
 		return 2;
 	else if (pipe != PIPE_C)
 		return 2;
@@ -167,7 +167,7 @@ static bool can_rotate(data_t *d, unsigned format, uint64_t tiling,
 
 	switch (format) {
 	case DRM_FORMAT_RGB565:
-		if (intel_gen(d->devid) >= 11)
+		if (intel_display_ver(d->devid) >= 11)
 			break;
 		/* fall through */
 	case DRM_FORMAT_C8:
@@ -198,7 +198,7 @@ static bool can_scale(data_t *d, unsigned format)
 	case DRM_FORMAT_XBGR16161616F:
 	case DRM_FORMAT_ARGB16161616F:
 	case DRM_FORMAT_ABGR16161616F:
-		if (intel_gen(d->devid) >= 11)
+		if (intel_display_ver(d->devid) >= 11)
 			return true;
 		/* fall through */
 	case DRM_FORMAT_C8:
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index bcbb9bdc..20556c82 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -517,7 +517,7 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 			/* Only support partial covering primary plane on gen9+ */
 			if (is_amdgpu_device(data->gfx_fd) ||
 				(plane_type == DRM_PLANE_TYPE_PRIMARY &&
-			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9)) {
+			    intel_display_ver(intel_get_drm_devid(data->gfx_fd)) < 9)) {
 				if (i != rectangle)
 					continue;
 				else
@@ -730,12 +730,12 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 						 */
 						if (p[0].format == DRM_FORMAT_RGB565 &&
 						     (planeconfigs[i].rotation & (IGT_ROTATION_90 | IGT_ROTATION_270))
-						     && intel_gen(data->devid) < 11)
+						     && intel_display_ver(data->devid) < 11)
 							continue;
 
 						if (p[1].format == DRM_FORMAT_RGB565 &&
 						     (planeconfigs[j].rotation & (IGT_ROTATION_90 | IGT_ROTATION_270))
-						     && intel_gen(data->devid) < 11)
+						     && intel_display_ver(data->devid) < 11)
 							continue;
 						/*
 						 * if using packed formats crc's will be
@@ -1024,7 +1024,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.gfx_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_AMDGPU);
 		if (is_i915_device(data.gfx_fd)) {
 			data.devid = intel_get_drm_devid(data.gfx_fd);
-			gen = intel_gen(data.devid);
+			gen = intel_display_ver(data.devid);
 		}
 
 		kmstest_set_vt_graphics_mode();
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index aae3fc52..26e5e8eb 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -798,7 +798,7 @@ igt_main
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
-		data.gen = intel_gen(intel_get_drm_devid(data.drm_fd));
+		data.gen = intel_display_ver(intel_get_drm_devid(data.drm_fd));
 
 		kmstest_set_vt_graphics_mode();
 
-- 
2.25.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
