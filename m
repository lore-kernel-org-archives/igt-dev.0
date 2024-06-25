Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373BBC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB0EF10E6F5;
	Tue, 25 Jun 2024 17:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ldgyMoCC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446410E701
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337246; x=1750873246;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=98mpziO+95X8ACXDMjMNZ9EZiaoyTaoR7By/aFy04tk=;
 b=ldgyMoCCZYd+KiwdI3BwE8Gbw7Rp8q19Kq29lOlIW/B/RHVUJGTe9mMs
 K9RPtGinXsd67ydEmb7yuc0vVRUOTpUdFprXNjqh4SRWdu2WXcAPPWds+
 x3LXKHAoW33zoIJ9w8kviMLYDK185mzkKcy3xbmInGPZ/LRoTsAK2Pwa6
 Q1qSg04l8p9DVjcf1/NE0PcbXQ5ytL8aXvV6hiEJtac2XRUI+0wsTt52u
 7t4PhhFBjnR19T8/hagV59WmjFpDvNCcLoQ8ASLDVDAvuPOr+Zguol/eG
 6Pmxc7Rq8MaMs0Z0l9ZNmZCaoRyqXthxvBHmT3NBuDqQYVEwG1gx1/fw1 A==;
X-CSE-ConnectionGUID: OZBLMTE+QlqnFMMc0DvTWw==
X-CSE-MsgGUID: uihDI8zoSUm1E75GioPgng==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184375"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:46 -0700
X-CSE-ConnectionGUID: CdANzO1jQEKU2sTipEyXCw==
X-CSE-MsgGUID: fehxLfh7R7ubHc0sG1DpVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701223"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/6] lib/igt_fb: Make igt_calc_fb_size() somewhat usable
Date: Tue, 25 Jun 2024 20:40:30 +0300
Message-ID: <20240625174032.10398-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

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
 tests/intel/kms_big_fb.c | 37 +++++++++++++++--------------
 tests/kms_addfb_basic.c  | 14 ++++++-----
 tests/kms_prime.c        | 12 ++++++++--
 tests/kms_rotation_crc.c | 10 ++++----
 7 files changed, 57 insertions(+), 73 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b7401..9d7808ba8312 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -934,7 +934,15 @@ static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
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
@@ -958,36 +966,9 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
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
@@ -1172,7 +1153,6 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
 	unsigned *strides = &fb->strides[0];
 	bool device_bo = false;
 	int fd = fb->fd;
-	uint64_t size;
 
 	/*
 	 * The current dumb buffer allocation API doesn't really allow to
@@ -1187,11 +1167,7 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
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
index 834aaef54dea..2b5040ce3c6b 100644
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
index 6be19318a50b..97a5fe237b40 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1154,9 +1154,7 @@ static void setup_protected_fb(int i915, int width, int height, igt_fb_t *fb, ui
 
 	igt_init_fb(fb, i915, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
 		    IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE);
-
-	igt_calc_fb_size(i915, width, height, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_NONE,
-			 &fb->size, &fb->strides[0]);
+	igt_calc_fb_size(fb);
 
 	err = create_bo_ext(i915, fb->size, true, &(fb->gem_handle));
 	igt_assert_eq(err, 0);
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1838ee6261ae..bd789ee44d10 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -336,8 +336,7 @@ static bool size_ok(data_t *data, uint64_t size)
 static void max_fb_size(data_t *data, int *width, int *height,
 			uint32_t format, uint64_t modifier)
 {
-	unsigned int stride;
-	uint64_t size;
+	struct igt_fb fb;
 	int i = 0;
 
 	/* max fence stride is only 8k bytes on gen3 */
@@ -345,17 +344,19 @@ static void max_fb_size(data_t *data, int *width, int *height,
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
@@ -840,11 +841,9 @@ static int rmfb(int fd, uint32_t id)
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
 	int ret;
 
@@ -861,29 +860,29 @@ test_addfb(data_t *data)
 	igt_require(igt_display_has_format_mod(&data->display,
 					       format, data->modifier));
 
-	igt_calc_fb_size(data->drm_fd,
-			 data->max_fb_width,
-			 data->max_fb_height,
-			 format, data->modifier,
-			 &size, &strides[0]);
+	igt_init_fb(&fb, data->drm_fd,
+		    data->max_fb_width, data->max_fb_height,
+		    format, data->modifier,
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
 			  data->max_fb_width,
 			  data->max_fb_height,
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
index 0b5dbf06e208..69b1d31457df 100644
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
2.44.2

