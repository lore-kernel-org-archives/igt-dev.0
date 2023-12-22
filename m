Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EDB10E7C2
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 14:32:27 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 08/15] lib/igt_fb: Make igt_calc_fb_size() somewhat
 usable
Date: Fri, 22 Dec 2023 16:31:52 +0200
Message-ID: <20231222143159.24662-9-ville.syrjala@linux.intel.com>
In-Reply-To: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
References: <20231222143159.24662-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

igt_calc_fb_size() is very awkward to use in combinations
with planar/compressed formats. To fix it we either need
to add tons of output parameters (strides/offsets/etc.),
or we just get rid of it and promote calc_fb_size() to
take its place. I chose the latter approach. This does
mean that the callers will need to have a struct igt_fb
around, but I think that's nicer than adding tons of
output parameters.

v2: Fix a misplaced fb->size

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c             | 50 +++++++++++-----------------------------
 lib/igt_fb.h             |  3 +--
 tests/intel/gem_pxp.c    |  4 +---
 tests/intel/kms_big_fb.c | 33 +++++++++++++-------------
 tests/kms_addfb_basic.c  | 14 ++++++-----
 tests/kms_prime.c        | 12 ++++++++--
 tests/kms_rotation_crc.c | 10 ++++----
 7 files changed, 55 insertions(+), 71 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d7d8840fa432..4ed08e44070e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -936,7 +936,15 @@ static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
 	return alignment;
 }
 
-static uint64_t calc_fb_size(struct igt_fb *fb)
+/**
+ * igt_calc_fb_size:
+ * @fb: the framebuffer
+ *
+ * This function calculates the framebuffer size/strides/offsets/etc.
+ * appropriately. The framebuffer needs to be sufficiently initialized
+ * beforehand eg. with igt_init_fb().
+ */
+void igt_calc_fb_size(struct igt_fb *fb)
 {
 	uint64_t size = 0;
 	int plane;
@@ -960,36 +968,9 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 	if (is_xe_device(fb->fd))
 		size = ALIGN(size, xe_get_default_alignment(fb->fd));
 
-	return size;
-}
-
-/**
- * igt_calc_fb_size:
- * @fd: the DRM file descriptor
- * @width: width of the framebuffer in pixels
- * @height: height of the framebuffer in pixels
- * @format: drm fourcc pixel format code
- * @modifier: tiling layout of the framebuffer (as framebuffer modifier)
- * @size_ret: returned size for the framebuffer
- * @stride_ret: returned stride for the framebuffer
- *
- * This function returns valid stride and size values for a framebuffer with the
- * specified parameters.
- */
-void igt_calc_fb_size(int fd, int width, int height, uint32_t drm_format, uint64_t modifier,
-		      uint64_t *size_ret, unsigned *stride_ret)
-{
-	struct igt_fb fb;
-
-	igt_init_fb(&fb, fd, width, height, drm_format, modifier,
-		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
-
-	fb.size = calc_fb_size(&fb);
-
-	if (size_ret)
-		*size_ret = fb.size;
-	if (stride_ret)
-		*stride_ret = fb.strides[0];
+	/* Respect the size requested by the caller. */
+	if (fb->size == 0)
+		fb->size = size;
 }
 
 /**
@@ -1174,7 +1155,6 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 	unsigned *strides = &fb->strides[0];
 	bool device_bo = false;
 	int fd = fb->fd;
-	uint64_t size;
 
 	/*
 	 * The current dumb buffer allocation API doesn't really allow to
@@ -1189,11 +1169,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 		device_bo = true;
 
 	/* Sets offets and stride if necessary. */
-	size = calc_fb_size(fb);
-
-	/* Respect the size requested by the caller. */
-	if (fb->size == 0)
-		fb->size = size;
+	igt_calc_fb_size(fb);
 
 	if (device_bo) {
 		fb->is_dumb = false;
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 0b85819b0f9e..b1b40b858610 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -125,8 +125,7 @@ enum igt_text_align {
 
 void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 			  unsigned *width_ret, unsigned *height_ret);
-void igt_calc_fb_size(int fd, int width, int height, uint32_t format, uint64_t modifier,
-		      uint64_t *size_ret, unsigned *stride_ret);
+void igt_calc_fb_size(struct igt_fb *fb);
 void igt_init_fb(struct igt_fb *fb, int fd, int width, int height,
 		 uint32_t drm_format, uint64_t modifier,
 		 enum igt_color_encoding color_encoding,
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index dff4a5d25222..8af4f1fd60c4 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1128,9 +1128,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 
 	igt_init_fb(fb, i915, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
-
-	igt_calc_fb_size(i915, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
-			 &fb->size, &fb->strides[0]);
+	igt_calc_fb_size(fb);
 
 	err = create_bo_ext(i915, fb->size, true, &(fb->gem_handle));
 	igt_assert_eq(err, 0);
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index f9584392f1ab..d219b466ec30 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -341,8 +341,7 @@ static bool size_ok(data_t *data, uint64_t size)
 static void max_fb_size(data_t *data, int *width, int *height,
 			uint32_t format, uint64_t modifier)
 {
-	unsigned int stride;
-	uint64_t size;
+	struct igt_fb fb;
 	int i = 0;
 
 	if (data->max_hw_stride_test) {
@@ -365,17 +364,19 @@ static void max_fb_size(data_t *data, int *width, int *height,
 	    format == DRM_FORMAT_XRGB8888)
 		*width = min(*width, 8192 / 4);
 
-	igt_calc_fb_size(data->drm_fd, *width, *height,
-			 format, modifier, &size, &stride);
+	igt_init_fb(&fb, data->drm_fd, *width, *height, format, modifier,
+		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+	igt_calc_fb_size(&fb);
 
-	while (!size_ok(data, size)) {
+	while (!size_ok(data, fb.size)) {
 		if (i++ & 1)
 			*width >>= 1;
 		else
 			*height >>= 1;
 
-		igt_calc_fb_size(data->drm_fd, *width, *height,
-				 format, modifier, &size, &stride);
+		igt_init_fb(&fb, data->drm_fd, *width, *height, format, modifier,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&fb);
 	}
 
 	igt_info("Max usable framebuffer size for format "IGT_FORMAT_FMT" / modifier 0x%"PRIx64": %dx%d\n",
@@ -838,11 +839,9 @@ static int rmfb(int fd, uint32_t id)
 static void
 test_addfb(data_t *data)
 {
-	uint64_t size;
+	struct igt_fb fb;
 	uint32_t fb_id;
 	uint32_t bo;
-	uint32_t offsets[4] = {};
-	uint32_t strides[4] = {};
 	uint32_t format;
 	int width, height;
 	int ret;
@@ -862,26 +861,26 @@ test_addfb(data_t *data)
 
 	max_fb_size(data, &width, &height, format, data->modifier);
 
-	igt_calc_fb_size(data->drm_fd, width, height,
-			 format, data->modifier,
-			 &size, &strides[0]);
+	igt_init_fb(&fb, data->drm_fd, width, height, format, data->modifier,
+		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+	igt_calc_fb_size(&fb);
 
 	if (is_i915_device(data->drm_fd))
-		bo = gem_buffer_create_fb_obj(data->drm_fd, size);
+		bo = gem_buffer_create_fb_obj(data->drm_fd, fb.size);
 	else
 		bo = xe_bo_create(data->drm_fd, 0,
-				  ALIGN(size, xe_get_default_alignment(data->drm_fd)),
+				  ALIGN(fb.size, xe_get_default_alignment(data->drm_fd)),
 				  vram_if_possible(data->drm_fd, 0), 0);
 	igt_require(bo);
 
 	if (is_i915_device(data->drm_fd) && intel_display_ver(data->devid) < 4)
 		gem_set_tiling(data->drm_fd, bo,
-			       igt_fb_mod_to_tiling(data->modifier), strides[0]);
+			       igt_fb_mod_to_tiling(data->modifier), fb.strides[0]);
 
 	ret = __kms_addfb(data->drm_fd, bo,
 			  width, height,
 			  format, data->modifier,
-			  strides, offsets, 1,
+			  fb.strides, fb.offsets, fb.num_planes,
 			  DRM_MODE_FB_MODIFIERS, &fb_id);
 	igt_assert_eq(ret, 0);
 
diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
index 5c812a49fce8..8fe22ec05166 100644
--- a/tests/kms_addfb_basic.c
+++ b/tests/kms_addfb_basic.c
@@ -294,19 +294,21 @@ static void invalid_tests(int fd)
 	igt_describe("Check if addfb2 with a system memory gem object "
 		     "fails correctly if device requires local memory framebuffers");
 	igt_subtest("invalid-smem-bo-on-discrete") {
-		uint32_t handle, stride;
-		uint64_t size;
+		struct igt_fb fb;
+		uint32_t handle;
 
 		igt_require_intel(fd);
-		igt_calc_fb_size(fd, f.width, f.height,
-				DRM_FORMAT_XRGB8888, 0, &size, &stride);
+		igt_init_fb(&fb, fd, f.width, f.height,
+			    DRM_FORMAT_XRGB8888, 0,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&fb);
 
 		if (is_i915_device(fd)) {
 			igt_require(gem_has_lmem(fd));
-			handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
+			handle = gem_create_in_memory_regions(fd, fb.size, REGION_SMEM);
 		} else {
 			igt_require(xe_has_vram(fd));
-			handle = xe_bo_create(fd, 0, size, system_memory(fd), 0);
+			handle = xe_bo_create(fd, 0, fb.size, system_memory(fd), 0);
 		}
 
 		f.handles[0] = handle;
diff --git a/tests/kms_prime.c b/tests/kms_prime.c
index 135c7516819d..3784cec59d9d 100644
--- a/tests/kms_prime.c
+++ b/tests/kms_prime.c
@@ -149,8 +149,16 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
 		ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
 					      scratch->size, PROT_WRITE);
 	} else {
-		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR, &scratch->size, &scratch->pitch);
+		struct igt_fb fb;
+
+		igt_init_fb(&fb, exporter_fd, mode->hdisplay, mode->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+		igt_calc_fb_size(&fb);
+
+		scratch->size = fb.size;
+		scratch->pitch = fb.strides[0];
+
 		if (gem_has_lmem(exporter_fd))
 			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
 								       REGION_LMEM(0), REGION_SMEM);
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8d8c53b5ff84..9888ac6ac3c4 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1091,8 +1091,8 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	int fd = data->gfx_fd;
 	drmModeModeInfo *mode;
 	struct igt_fb fb[MAX_FENCES+1] = {};
-	uint64_t size;
-	unsigned int stride, w, h;
+	struct igt_fb tmp_fb;
+	unsigned int w, h;
 	uint64_t total_aperture_size, total_fbs_size;
 	int i;
 
@@ -1106,13 +1106,15 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	w = mode->hdisplay;
 	h = mode->vdisplay;
 
-	igt_calc_fb_size(fd, w, h, format, modifier, &size, &stride);
+	igt_init_fb(&tmp_fb, fd, w, h, format, modifier,
+		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
+	igt_calc_fb_size(&tmp_fb);
 
 	/*
 	 * Make sure there is atleast 90% of the available GTT space left
 	 * for creating (MAX_FENCES+1) framebuffers.
 	 */
-	total_fbs_size = size * (MAX_FENCES + 1);
+	total_fbs_size = tmp_fb.size * (MAX_FENCES + 1);
 	total_aperture_size = gem_available_aperture_size(fd);
 	igt_require(total_fbs_size < total_aperture_size * 0.9);
 
-- 
2.41.0
