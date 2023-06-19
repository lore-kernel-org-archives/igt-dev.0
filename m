Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DD810E1F0
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jun 2023 12:05:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Jun 2023 17:28:41 +0530
Message-Id: <20230619115858.2013195-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
References: <20230619115858.2013195-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 01/18] lib: Add tiling support for XE
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

Remove the tiling restrictions in all libraries those used by
the Xe driver.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_draw.c     |  5 +----
 lib/igt_fb.c       | 17 ++++++++---------
 lib/intel_bufops.c | 13 +++++++++----
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 6f3629949..a578560ac 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -677,14 +677,11 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	int gen = intel_gen(devid);
 	int pitch;
 
-	if (tiling)
-		igt_require_i915(fd);
-
 	dst = create_buf(fd, cmd_data->bops, buf, tiling);
 	ibb = intel_bb_create(fd, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	if (is_i915_device(fd) && HAS_4TILE(intel_get_drm_devid(fd))) {
+	if (HAS_4TILE(intel_get_drm_devid(fd))) {
 		int buf_height = buf->size / buf->stride;
 
 		switch (buf->bpp) {
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9be312a28..579f25597 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -445,7 +445,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		*height_ret = 1;
 		break;
 	case I915_FORMAT_MOD_X_TILED:
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
 			*height_ret = 16;
@@ -466,7 +466,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
 			*height_ret = 16;
@@ -480,7 +480,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		break;
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		switch (fb_bpp) {
 		case 8:
 			*width_ret = 64;
@@ -753,7 +753,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		(fb->plane_bpp[plane] / 8);
 
 	if (fb->modifier != DRM_FORMAT_MOD_LINEAR &&
-	    is_i915_device(fb->fd) &&
+	    is_intel_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint32_t stride;
 
@@ -822,7 +822,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 {
 	if (fb->modifier != DRM_FORMAT_MOD_LINEAR &&
-	    is_i915_device(fb->fd) &&
+	    is_intel_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint64_t size = (uint64_t) fb->strides[plane] *
 			fb->plane_height[plane];
@@ -899,7 +899,7 @@ static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
 	unsigned int tile_row_size;
 	unsigned int alignment;
 
-	if (!(is_i915_device(fb->fd) &&
+	if (!(is_intel_device(fb->fd) &&
 	      is_gen12_ccs_modifier(fb->modifier) &&
 	      is_yuv_semiplanar_plane(fb, color_plane)))
 		return 0;
@@ -2472,7 +2472,7 @@ static bool fast_blit_ok(const struct igt_fb *fb)
 
 static bool blitter_ok(const struct igt_fb *fb)
 {
-	if (!is_i915_device(fb->fd))
+	if (!is_intel_device(fb->fd))
 		return false;
 
 	if (is_ccs_modifier(fb->modifier))
@@ -2506,12 +2506,11 @@ static bool blitter_ok(const struct igt_fb *fb)
 
 static bool use_enginecopy(const struct igt_fb *fb)
 {
-	if (!is_xe_device(fb->fd) && blitter_ok(fb))
+	if (blitter_ok(fb))
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       is_ccs_modifier(fb->modifier) ||
-	       (is_xe_device(fb->fd) && fb->modifier == DRM_FORMAT_MOD_LINEAR) ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
 }
 
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 524757933..2c91adb88 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -927,7 +927,8 @@ static void __intel_buf_init(struct buf_ops *bops,
 	/* Store gem bo size */
 	buf->bo_size = size;
 
-	set_hw_tiled(bops, buf);
+	if (bops->driver == INTEL_DRIVER_I915)
+		set_hw_tiled(bops, buf);
 }
 
 /**
@@ -1502,14 +1503,18 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		  bops->intel_gen, bops->supported_tiles,
 		  bops->driver == INTEL_DRIVER_I915 ? "i915" : "xe");
 
-	/* No tiling support in XE. */
 	if (bops->driver == INTEL_DRIVER_XE) {
-		bops->supported_hw_tiles = TILE_NONE;
-
 		bops->linear_to_x = copy_linear_to_x;
 		bops->x_to_linear = copy_x_to_linear;
 		bops->linear_to_y = copy_linear_to_y;
 		bops->y_to_linear = copy_y_to_linear;
+		bops->linear_to_tile4 = copy_linear_to_tile4;
+		bops->tile4_to_linear = copy_tile4_to_linear;
+
+		bops->linear_to_yf = NULL;
+		bops->yf_to_linear = NULL;
+		bops->linear_to_ys = NULL;
+		bops->ys_to_linear = NULL;
 
 		return bops;
 	}
-- 
2.40.0
