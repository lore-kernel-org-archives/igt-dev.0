Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8210EC65
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 06:13:26 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 28 Apr 2023 11:37:50 +0530
Message-Id: <20230428060818.2446308-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230428060818.2446308-1-bhanuprakash.modem@intel.com>
References: <20230428060818.2446308-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 18/46] lib/igt_draw: Add gpu draw routine
 support for XE
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

Add GPU blt, render & WC draw routine support for XE driver.

V2: - Rebase

Credits-to: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Acked-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 lib/igt_draw.c | 81 +++++++++++++++++++++++++++++++++++---------------
 lib/igt_draw.h |  2 ++
 2 files changed, 59 insertions(+), 24 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index c5f2fdfe2..d719b2400 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -37,6 +37,7 @@
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
 #include "i915/intel_mocs.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
 #ifndef PAGE_ALIGN
@@ -494,24 +495,29 @@ static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 {
 	uint32_t *ptr;
 
-	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
-		       I915_GEM_DOMAIN_GTT);
-
-	/* We didn't implement suport for the older tiling methods yet. */
-	if (tiling != I915_TILING_NONE)
-		igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
-
-	if (gem_has_lmem(fd))
-		ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
-					     PAGE_ALIGN(buf->size),
-					     PROT_READ | PROT_WRITE);
-	else if (gem_has_legacy_mmap(fd))
-		ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
-				   PROT_READ | PROT_WRITE);
-	else
-		ptr = gem_mmap_offset__wc(fd, buf->handle, 0,
-					  PAGE_ALIGN(buf->size),
-					  PROT_READ | PROT_WRITE);
+	if (is_i915_device(fd)) {
+		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
+			       I915_GEM_DOMAIN_GTT);
+
+		/* We didn't implement suport for the older tiling methods yet. */
+		if (tiling != I915_TILING_NONE)
+			igt_require(intel_display_ver(intel_get_drm_devid(fd)) >= 5);
+
+		if (gem_has_lmem(fd))
+			ptr = gem_mmap_offset__fixed(fd, buf->handle, 0,
+						     PAGE_ALIGN(buf->size),
+						     PROT_READ | PROT_WRITE);
+		else if (gem_has_legacy_mmap(fd))
+			ptr = gem_mmap__wc(fd, buf->handle, 0, PAGE_ALIGN(buf->size),
+					   PROT_READ | PROT_WRITE);
+		else
+			ptr = gem_mmap_offset__wc(fd, buf->handle, 0,
+						  PAGE_ALIGN(buf->size),
+						  PROT_READ | PROT_WRITE);
+	} else {
+		ptr = xe_bo_mmap_ext(fd, buf->handle, buf->size,
+				     PROT_READ | PROT_WRITE);
+	}
 
 	switch (tiling) {
 	case I915_TILING_NONE:
@@ -671,11 +677,14 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	int gen = intel_gen(devid);
 	int pitch;
 
+	if (tiling)
+		igt_require_i915(fd);
+
 	dst = create_buf(fd, cmd_data->bops, buf, tiling);
 	ibb = intel_bb_create(fd, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	if (HAS_4TILE(intel_get_drm_devid(fd))) {
+	if (is_i915_device(fd) && HAS_4TILE(intel_get_drm_devid(fd))) {
 		int buf_height = buf->size / buf->stride;
 
 		switch (buf->bpp) {
@@ -780,11 +789,21 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 
 	/* We create a temporary buffer and copy from it using rendercopy. */
 	tmp.size = rect->w * rect->h * pixel_size;
-	tmp.handle = gem_create(fd, tmp.size);
+	if (is_i915_device(fd))
+		tmp.handle = gem_create(fd, tmp.size);
+	else
+		tmp.handle = xe_bo_create_flags(fd, 0,
+						ALIGN(tmp.size, xe_get_default_alignment(fd)),
+						vram_if_possible(fd, 0));
+
 	tmp.stride = rect->w * pixel_size;
 	tmp.bpp = buf->bpp;
-	draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
-			   I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
+	if (is_i915_device(fd))
+		draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
+				   I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
+	else
+		draw_rect_mmap_wc(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
+				  I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
 
 	src = create_buf(fd, cmd_data->bops, &tmp, I915_TILING_NONE);
 	dst = create_buf(fd, cmd_data->bops, buf, tiling);
@@ -912,7 +931,21 @@ void igt_draw_rect_fb(int fd, struct buf_ops *bops,
 void igt_draw_fill_fb(int fd, struct igt_fb *fb, uint32_t color)
 {
 	igt_draw_rect_fb(fd, NULL, 0, fb,
-			 gem_has_mappable_ggtt(fd) ? IGT_DRAW_MMAP_GTT :
-						     IGT_DRAW_MMAP_WC,
+			 igt_draw_supports_method(fd, IGT_DRAW_MMAP_GTT) ?
+			 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
 			 0, 0, fb->width, fb->height, color);
 }
+
+bool igt_draw_supports_method(int fd, enum igt_draw_method method)
+{
+	if (method == IGT_DRAW_MMAP_GTT)
+		return is_i915_device(fd) && gem_has_mappable_ggtt(fd);
+
+	if (method == IGT_DRAW_MMAP_WC)
+		return (is_i915_device(fd) && gem_mmap__has_wc(fd)) || is_xe_device(fd);
+
+	if (method == IGT_DRAW_MMAP_CPU || method == IGT_DRAW_PWRITE)
+		return is_i915_device(fd);
+
+	return true;
+}
diff --git a/lib/igt_draw.h b/lib/igt_draw.h
index 2d18ef6c9..fe7531b79 100644
--- a/lib/igt_draw.h
+++ b/lib/igt_draw.h
@@ -50,6 +50,8 @@ enum igt_draw_method {
 
 const char *igt_draw_get_method_name(enum igt_draw_method method);
 
+bool igt_draw_supports_method(int fd, enum igt_draw_method method);
+
 void igt_draw_rect(int fd, struct buf_ops *bops, uint32_t ctx,
 		   uint32_t buf_handle, uint32_t buf_size, uint32_t buf_stride,
 		   uint32_t tiling, enum igt_draw_method method,
-- 
2.40.0
