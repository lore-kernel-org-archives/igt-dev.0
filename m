Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1171B10E285
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 11:33:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	zbigniew.kempczynski@intel.com
Date: Thu, 27 Apr 2023 16:59:08 +0530
Message-Id: <20230427112908.2421803-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230426114725.2244653-17-bhanuprakash.modem@intel.com>
References: <20230426114725.2244653-17-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 16/45] lib/igt_fb: Add copy engine support for
 XE
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

V2: - Drop unused syncobj(Zbigniew)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_fb.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 76f2e1245..cf24d9e66 100644
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
@@ -2706,7 +2708,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 
-	if (!gem_has_relocations(dst_fb->fd)) {
+	if (is_i915_device(dst_fb->fd) && !gem_has_relocations(dst_fb->fd)) {
 		igt_require(gem_has_contexts(dst_fb->fd));
 		ctx = gem_context_create(dst_fb->fd);
 		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
@@ -2786,6 +2788,12 @@ static void free_linear_mapping(struct fb_blit_upload *blit)
 	} else if (is_nouveau_device(fd)) {
 		igt_nouveau_fb_blit(fb, &linear->fb);
 		igt_nouveau_delete_bo(&linear->fb);
+	} else if (is_xe_device(fd)) {
+		gem_munmap(linear->map, linear->fb.size);
+		copy_with_engine(blit, fb, &linear->fb);
+
+		syncobj_wait(fd, &blit->ibb->engine_syncobj, 1, INT64_MAX, 0, NULL);
+		gem_close(fd, linear->fb.gem_handle);
 	} else {
 		gem_munmap(linear->map, linear->fb.size);
 		gem_set_domain(fd, linear->fb.gem_handle,
@@ -2863,6 +2871,11 @@ static void setup_linear_mapping(struct fb_blit_upload *blit)
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
@@ -2969,6 +2982,9 @@ static void *map_bo(int fd, struct igt_fb *fb)
 				      PROT_READ | PROT_WRITE);
 	else if (is_nouveau_device(fd))
 		ptr = igt_nouveau_mmap_bo(fb, PROT_READ | PROT_WRITE);
+	else if (is_xe_device(fd))
+		ptr = xe_bo_mmap_ext(fd, fb->gem_handle,
+				     fb->size, PROT_READ | PROT_WRITE);
 	else
 		igt_assert(false);
 
-- 
2.40.0
