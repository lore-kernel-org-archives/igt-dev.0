Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E0C10E747
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 16:32:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 21:57:27 +0530
Message-Id: <20230413162732.1155058-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
References: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/7] lib/igt_fb: Add copy engine support for XE
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

Add copy engine support for kms framebuffer mappings.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_fb.c | 30 ++++++++++++++++++++++++++----
 lib/igt_fb.h |  2 ++
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7379b99aa8a..7bcba5c0cc8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -45,6 +45,7 @@
 #include "igt_amd.h"
 #include "igt_x86.h"
 #include "igt_nouveau.h"
+#include "igt_syncobj.h"
 #include "ioctl_wrappers.h"
 #include "intel_batchbuffer.h"
 #include "intel_chipset.h"
@@ -2489,12 +2490,13 @@ static bool blitter_ok(const struct igt_fb *fb)
 
 static bool use_enginecopy(const struct igt_fb *fb)
 {
-	if (blitter_ok(fb))
+	if (!is_xe_device(fb->fd) && blitter_ok(fb))
 		return false;
 
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       is_ccs_modifier(fb->modifier) ||
-	       !gem_has_mappable_ggtt(fb->fd);
+	       (is_xe_device(fb->fd) && fb->modifier == DRM_FORMAT_MOD_LINEAR) ||
+	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
 }
 
 static bool use_blitter(const struct igt_fb *fb)
@@ -2504,7 +2506,7 @@ static bool use_blitter(const struct igt_fb *fb)
 
 	return fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
-	       !gem_has_mappable_ggtt(fb->fd);
+	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd));
 }
 
 static void init_buf_ccs(struct intel_buf *buf, int ccs_idx,
@@ -2701,7 +2703,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 
-	if (!gem_has_relocations(dst_fb->fd)) {
+	if (is_i915_device(dst_fb->fd) && !gem_has_relocations(dst_fb->fd)) {
 		igt_require(gem_has_contexts(dst_fb->fd));
 		ctx = gem_context_create(dst_fb->fd);
 		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
@@ -2781,6 +2783,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 	} else if (is_nouveau_device(fd)) {
 		igt_nouveau_fb_blit(fb, &linear->fb);
 		igt_nouveau_delete_bo(&linear->fb);
+	} else if (is_xe_device(fd)) {
+		gem_munmap(linear->map, linear->fb.size);
+		copy_with_engine(blit, fb, &linear->fb);
+
+		/* TODO: Syncobj_wait to sync for last used engine. */
+		gem_close(fd, linear->fb.gem_handle);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
 		gem_set_domain(fd, linear->fb.gem_handle,
@@ -2858,6 +2866,11 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
 		igt_nouveau_fb_blit(&linear->fb, fb);
 
 		linear->map = igt_nouveau_mmap_bo(&linear->fb, PROT_READ | PROT_WRITE);
+	} else if (is_xe_device(fd)) {
+		copy_with_engine(blit, &linear->fb, fb);
+
+		linear->map = xe_bo_mmap_ext(fd, linear->fb.gem_handle,
+					     linear->fb.size, PROT_READ | PROT_WRITE);
 	} else {
 		/* Copy fb content to linear BO */
 		gem_set_domain(fd, linear->fb.gem_handle,
@@ -2915,6 +2928,9 @@ static void create_cairo_surface__gpu(int fd, struct igt_fb *fb)
  */
 int igt_dirty_fb(int fd, struct igt_fb *fb)
 {
+	if (fb->syncobj)
+		syncobj_wait(fd, &fb->syncobj, 1, INT64_MAX, 0, NULL);
+
 	return drmModeDirtyFB(fb->fd, fb->fb_id, NULL, 0);
 }
 
@@ -2964,6 +2980,9 @@ static void *map_bo(int fd, struct igt_fb *fb)
 				      PROT_READ | PROT_WRITE);
 	else if (is_nouveau_device(fd))
 		ptr = igt_nouveau_mmap_bo(fb, PROT_READ | PROT_WRITE);
+	else if (is_xe_device(fd))
+		ptr = xe_bo_mmap_ext(fd, fb->gem_handle,
+				     fb->size, PROT_READ | PROT_WRITE);
 	else
 		igt_assert(false);
 
@@ -4248,6 +4267,9 @@ void igt_remove_fb(int fd, struct igt_fb *fb)
 	if (!fb || !fb->fb_id)
 		return;
 
+	if (fb->syncobj)
+		syncobj_destroy(fd, fb->syncobj);
+
 	cairo_surface_destroy(fb->cairo_surface);
 	do_or_die(drmModeRmFB(fd, fb->fb_id));
 	if (fb->is_dumb)
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 73bdfc8669d..a127a8128a4 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -62,6 +62,7 @@ typedef struct _igt_crc igt_crc_t;
  * @fb_id: KMS ID of the framebuffer
  * @fd: DRM device fd this framebuffer is created on
  * @gem_handle: GEM handler of the underlying backing storage
+ * @syncobj: Syncobj to sync to for last drawing operation
  * @is_dumb: Whether this framebuffer was allocated using the dumb buffer API
  * @drm_format: DRM FOURCC code
  * @width: width in pixels
@@ -84,6 +85,7 @@ typedef struct igt_fb {
 	uint32_t fb_id;
 	int fd;
 	uint32_t gem_handle;
+	uint32_t syncobj;
 	bool is_dumb;
 	uint32_t drm_format;
 	int width;
-- 
2.40.0
