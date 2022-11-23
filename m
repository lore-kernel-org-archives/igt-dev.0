Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277BD10E1EF
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Nov 2022 14:27:30 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Wed, 23 Nov 2022 19:55:48 +0530
Message-Id: <20221123142548.128038-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5] tests/i915/gem_userptr_blits: Added
 XY_FAST_COPY_BLT Command for MTL
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

From: Arjun Melkaveri <arjun.melkaveri@intel.com>

Test case uses legacy command which is not supported on MTL.
Modified test to use XY_FAST_COPY_BLT.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_userptr_blits.c | 139 ++++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 47 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 698508669..7ed7ce046 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -99,8 +99,9 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
+	uint32_t devid;
 	uint32_t handle;
-	int ret, i=0;
+	int ret, i = 0;
 	uint64_t dst_offset, src_offset, bb_offset;
 	bool has_relocs = gem_has_relocations(fd);
 
@@ -108,29 +109,48 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	dst_offset = bb_offset + 4096;
 	src_offset = dst_offset + WIDTH * HEIGHT * sizeof(uint32_t) * (src != dst);
 
-	batch[i++] = XY_SRC_COPY_BLT_CMD |
-		  XY_SRC_COPY_BLT_WRITE_ALPHA |
-		  XY_SRC_COPY_BLT_WRITE_RGB;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i - 1] |= 8;
-	else
-		batch[i - 1] |= 6;
-
-	batch[i++] = (3 << 24) | /* 32 bits */
-		  (0xcc << 16) | /* copy ROP */
-		  WIDTH*4;
-	batch[i++] = 0; /* dst x1,y1 */
-	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
-	batch[i++] = dst_offset; /* dst reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = dst_offset >> 32;
-	batch[i++] = 0; /* src x1,y1 */
-	batch[i++] = WIDTH*4;
-	batch[i++] = src_offset; /* src reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = src_offset >> 32;
-	batch[i++] = MI_BATCH_BUFFER_END;
-	batch[i++] = MI_NOOP;
+	devid = intel_get_drm_devid(fd);
+
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+		batch[i++] = 0;/* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+		batch[i++] = lower_32_bits(CANONICAL(dst_offset));/* dst address */
+		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		batch[i++] = 0;/* src x1,y1 */
+		batch[i++] = WIDTH*4;/* src pitch */
+		batch[i++] = lower_32_bits(CANONICAL(src_offset));/* src address */
+		batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+
+		batch[i++] = (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = lower_32_bits(CANONICAL(dst_offset));/*dst reloc*/
+		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i++] = dst_offset >> 32;
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4;
+		batch[i++] = lower_32_bits(CANONICAL(src_offset)); /* src reloc */
+		batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i++] = src_offset >> 32;
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	}
 
 	handle = gem_create(fd, 4096);
 	gem_write(fd, handle, 0, batch, sizeof(batch));
@@ -204,31 +224,56 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_execbuffer2 exec;
+	uint32_t devid;
 	uint32_t handle;
-	int n, ret, i=0;
+	int n, ret, i = 0;
+	uint64_t dst_offset, src_offset, bb_offset;
 
-	batch[i++] = XY_SRC_COPY_BLT_CMD |
-		  XY_SRC_COPY_BLT_WRITE_ALPHA |
-		  XY_SRC_COPY_BLT_WRITE_RGB;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i - 1] |= 8;
-	else
-		batch[i - 1] |= 6;
-	batch[i++] = (3 << 24) | /* 32 bits */
-		  (0xcc << 16) | /* copy ROP */
-		  WIDTH*4;
-	batch[i++] = 0; /* dst x1,y1 */
-	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
-	batch[i++] = 0; /* dst reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = 0;
-	batch[i++] = 0; /* src x1,y1 */
-	batch[i++] = WIDTH*4;
-	batch[i++] = 0; /* src reloc */
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = 0;
-	batch[i++] = MI_BATCH_BUFFER_END;
-	batch[i++] = MI_NOOP;
+	bb_offset = 16 << 20;
+	dst_offset = bb_offset + 4096;
+	src_offset = dst_offset + WIDTH * HEIGHT * sizeof(uint32_t) * (src != dst);
+
+	devid = intel_get_drm_devid(fd);
+
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+		batch[i++] = 0;/* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+		batch[i++] = lower_32_bits(CANONICAL(dst_offset));/* dst address */
+		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		batch[i++] = 0;/* src x1,y1 */
+		batch[i++] = WIDTH*4;/* src pitch */
+		batch[i++] = lower_32_bits(CANONICAL(src_offset));//src address
+		batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+		batch[i++] = (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = lower_32_bits(CANONICAL(dst_offset));/* dst reloc */
+		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i++] = 0;
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4;
+		batch[i++] = lower_32_bits(CANONICAL(src_offset)); /* src reloc */
+		batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i++] = 0;
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	}
 
 	handle = gem_create(fd, 4096);
 	gem_write(fd, handle, 0, batch, sizeof(batch));
-- 
2.25.1
