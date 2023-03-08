Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6192A10E66F
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Mar 2023 11:21:10 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Mar 2023 12:20:59 +0100
Message-Id: <51d432224fb7e5edee4720620328aeb1ba5cc60d.1678273325.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1678273325.git.karolina.stolarek@intel.com>
References: <cover.1678273325.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/7] tests/i915/gem_blits: Use new copy
 instruction
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>, Arjun Melkaveri <arjun.melkaveri@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Arjun Melkaveri <arjun.melkaveri@intel.com>

The test uses legacy command which is not supported on
newer GPU generations. Use XY_FAST_COPY_BLT on newer GPU generations.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Co-developed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
---
 lib/intel_batchbuffer.c | 10 ++---
 lib/intel_batchbuffer.h |  6 +++
 tests/i915/gem_blits.c  | 87 +++++++++++++++++++++++++----------------
 3 files changed, 64 insertions(+), 39 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 59c788e6..4ea1256e 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -92,8 +92,8 @@ static uint32_t fast_copy_pitch(unsigned int stride, unsigned int tiling)
 		return stride;
 }
 
-static uint32_t fast_copy_dword0(unsigned int src_tiling,
-				 unsigned int dst_tiling)
+uint32_t fast_copy_dword0(unsigned int src_tiling,
+			  unsigned int dst_tiling)
 {
 	uint32_t dword0 = 0;
 
@@ -136,9 +136,9 @@ static uint32_t fast_copy_dword0(unsigned int src_tiling,
 	return dword0;
 }
 
-static uint32_t fast_copy_dword1(unsigned int src_tiling,
-				 unsigned int dst_tiling,
-				 int bpp)
+uint32_t fast_copy_dword1(unsigned int src_tiling,
+			  unsigned int dst_tiling,
+			  int bpp)
 {
 	uint32_t dword1 = 0;
 
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 37db0ffa..81830d77 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -31,6 +31,12 @@ enum i915_compression {
 	I915_COMPRESSION_MEDIA,
 };
 
+uint32_t fast_copy_dword0(unsigned int src_tiling,
+			  unsigned int dst_tiling);
+uint32_t fast_copy_dword1(unsigned int src_tiling,
+			  unsigned int dst_tiling,
+			  int bpp);
+
 void igt_blitter_src_copy(int fd,
 			  uint64_t ahnd,
 			  uint32_t ctx,
diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
index d9296cf2..f704dbdd 100644
--- a/tests/i915/gem_blits.c
+++ b/tests/i915/gem_blits.c
@@ -22,10 +22,12 @@
  *
  */
 
+#include "intel_batchbuffer.h"
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_x86.h"
+#include "i915/i915_blt.h"
 
 #define MI_FLUSH_DW (0x26 << 23)
 
@@ -33,6 +35,8 @@
 #define BCS_SRC_Y (1 << 0)
 #define BCS_DST_Y (1 << 1)
 
+static uint32_t devid;
+
 struct device {
 	int fd;
 	int gen;
@@ -147,8 +151,7 @@ static void buffer_set_tiling(const struct device *device,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const bool has_64b_reloc = device->gen >= 8;
-	uint32_t stride, size, pitch;
-	uint32_t *batch;
+	uint32_t stride, size, pitch, *batch, dword1;
 	int i;
 
 	if (buffer->tiling == tiling)
@@ -209,19 +212,25 @@ static void buffer_set_tiling(const struct device *device,
 		batch[i++] = mask;
 	}
 
-	batch[i] = (XY_SRC_COPY_BLT_CMD |
-		    XY_SRC_COPY_BLT_WRITE_ALPHA |
-		    XY_SRC_COPY_BLT_WRITE_RGB);
-	if (device->gen >= 4 && buffer->tiling)
-		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
-	if (device->gen >= 4 && tiling)
-		batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
-	batch[i++] |= 6 + 2 * has_64b_reloc;
-
 	pitch = stride;
 	if (device->gen >= 4 && tiling)
 		pitch /= 4;
-	batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
+
+	if (!blt_has_xy_src_copy(device->fd)) {
+		batch[i++] = fast_copy_dword0(buffer->tiling, tiling);
+		dword1 = fast_copy_dword1(buffer->tiling, tiling, 32);
+		batch[i++] = dword1 | pitch;
+	} else {
+		batch[i] = (XY_SRC_COPY_BLT_CMD |
+			    XY_SRC_COPY_BLT_WRITE_ALPHA |
+			    XY_SRC_COPY_BLT_WRITE_RGB);
+		if (device->gen >= 4 && buffer->tiling)
+			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
+		if (device->gen >= 4 && tiling)
+			batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
+		batch[i++] |= 6 + 2 * has_64b_reloc;
+		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
+	}
 	batch[i++] = 0;
 	batch[i++] = buffer->height << 16 | buffer->width;
 	reloc[0].target_handle = obj[0].handle;
@@ -298,8 +307,7 @@ static bool blit_to_linear(const struct device *device,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const bool has_64b_reloc = device->gen >= 8;
-	uint32_t *batch;
-	uint32_t pitch;
+	uint32_t *batch, pitch, dword1;
 	int i = 0;
 
 	igt_assert(buffer->tiling);
@@ -354,14 +362,19 @@ static bool blit_to_linear(const struct device *device,
 		batch[i++] = mask;
 	}
 
-	batch[i] = (XY_SRC_COPY_BLT_CMD |
-		    XY_SRC_COPY_BLT_WRITE_ALPHA |
-		    XY_SRC_COPY_BLT_WRITE_RGB);
-	if (device->gen >= 4 && buffer->tiling)
-		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
-	batch[i++] |= 6 + 2 * has_64b_reloc;
-
-	batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
+	if (!blt_has_xy_src_copy(device->fd)) {
+		batch[i++] = fast_copy_dword0(buffer->tiling, I915_TILING_NONE);
+		dword1 = fast_copy_dword1(buffer->tiling, I915_TILING_NONE, 32);
+		batch[i++] = dword1 | buffer->stride;
+	} else {
+		batch[i] = (XY_SRC_COPY_BLT_CMD |
+			    XY_SRC_COPY_BLT_WRITE_ALPHA |
+			    XY_SRC_COPY_BLT_WRITE_RGB);
+		if (device->gen >= 4 && buffer->tiling)
+			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
+		batch[i++] |= 6 + 2 * has_64b_reloc;
+		batch[i++] = 3 << 24 | 0xcc << 16 | buffer->stride;
+	}
 	batch[i++] = 0;
 	batch[i++] = buffer->height << 16 | buffer->width;
 	reloc[0].target_handle = obj[0].handle;
@@ -600,8 +613,7 @@ blit(const struct device *device,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
 	const bool has_64b_reloc = device->gen >= 8;
-	uint32_t *batch;
-	uint32_t pitch;
+	uint32_t *batch, dword1, pitch;
 	int i = 0;
 
 	if (src_x < 0) {
@@ -689,20 +701,25 @@ blit(const struct device *device,
 		batch[i++] = mask;
 	}
 
-	batch[i] = (XY_SRC_COPY_BLT_CMD |
-		    XY_SRC_COPY_BLT_WRITE_ALPHA |
-		    XY_SRC_COPY_BLT_WRITE_RGB);
-	if (device->gen >= 4 && src->tiling)
-		batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
-	if (device->gen >= 4 && dst->tiling)
-		batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
-	batch[i++] |= 6 + 2 * has_64b_reloc;
-
 	pitch = dst->stride;
 	if (device->gen >= 4 && dst->tiling)
 		pitch /= 4;
-	batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
 
+	if (!blt_has_xy_src_copy(device->fd)) {
+		batch[i++] = fast_copy_dword0(src->tiling, dst->tiling);
+		dword1 = fast_copy_dword1(src->tiling, dst->tiling, 32);
+		batch[i++] = dword1 | pitch;
+	} else {
+		batch[i] = (XY_SRC_COPY_BLT_CMD |
+			    XY_SRC_COPY_BLT_WRITE_ALPHA |
+			    XY_SRC_COPY_BLT_WRITE_RGB);
+		if (device->gen >= 4 && src->tiling)
+			batch[i] |= XY_SRC_COPY_BLT_SRC_TILED;
+		if (device->gen >= 4 && dst->tiling)
+			batch[i] |= XY_SRC_COPY_BLT_DST_TILED;
+		batch[i++] |= 6 + 2 * has_64b_reloc;
+		batch[i++] = 3 << 24 | 0xcc << 16 | pitch;
+	}
 	batch[i++] = dst_y << 16 | dst_x;
 	batch[i++] = (height + dst_y) << 16 | (width + dst_x);
 	reloc[0].target_handle = obj[0].handle;
@@ -794,6 +811,8 @@ igt_main
 		struct buffer *src, *dst;
 		unsigned int x, y;
 
+		devid = intel_get_drm_devid(device.fd);
+
 		for (unsigned int height = 1; height <= 16; height <<= 2) {
 			for (unsigned int y0 = ZERO; y0 <= (height > 2 ? BELOW : ZERO); y0++) {
 				for (unsigned int width = 1; width <= 64; width <<= 2) {
-- 
2.25.1
