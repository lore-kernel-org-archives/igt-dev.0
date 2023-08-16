Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BAC10E388
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 16:39:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 22:01:47 +0530
Message-Id: <20230816163206.402705-2-bhanuprakash.modem@intel.com>
In-Reply-To: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
References: <20230816163206.402705-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 01/20] lib: Add tiling support for XE
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
 lib/igt_fb.c       |  8 ++++----
 lib/intel_bufops.c | 13 +++++++++----
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 13b90702c..476778a13 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -677,14 +677,11 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	int ver = intel_display_ver(devid);
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
index 60b0e2669..9b5f7f087 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -494,7 +494,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		break;
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		switch (fb_bpp) {
 		case 8:
 			*width_ret = 64;
@@ -767,7 +767,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 		(fb->plane_bpp[plane] / 8);
 
 	if (fb->modifier != DRM_FORMAT_MOD_LINEAR &&
-	    is_i915_device(fb->fd) &&
+	    is_intel_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint32_t stride;
 
@@ -836,7 +836,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, int plane)
 static uint64_t calc_plane_size(struct igt_fb *fb, int plane)
 {
 	if (fb->modifier != DRM_FORMAT_MOD_LINEAR &&
-	    is_i915_device(fb->fd) &&
+	    is_intel_device(fb->fd) &&
 	    intel_display_ver(intel_get_drm_devid(fb->fd)) <= 3) {
 		uint64_t size = (uint64_t) fb->strides[plane] *
 			fb->plane_height[plane];
@@ -913,7 +913,7 @@ static unsigned int get_plane_alignment(struct igt_fb *fb, int color_plane)
 	unsigned int tile_row_size;
 	unsigned int alignment;
 
-	if (!(is_i915_device(fb->fd) &&
+	if (!(is_intel_device(fb->fd) &&
 	      is_gen12_ccs_modifier(fb->modifier) &&
 	      is_yuv_semiplanar_plane(fb, color_plane)))
 		return 0;
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
