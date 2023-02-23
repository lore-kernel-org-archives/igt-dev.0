Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDBF10E068
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 16:56:40 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 22:23:36 +0530
Message-Id: <20230223165336.570697-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/i915/gem_userptr_blits: Use softpinning
 support for MTL
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

MTL and other platforms which are gen12 must use softpinning
instead of relocations so adding no reloc supoprt for MTL target.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 tests/i915/gem_userptr_blits.c | 105 ++++++++++++++++++++++-----------
 1 file changed, 70 insertions(+), 35 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 698508669..483570d0a 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -204,65 +204,100 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 *obj;
 	struct drm_i915_gem_execbuffer2 exec;
+	uint32_t devid;
 	uint32_t handle;
 	int n, ret, i=0;
+	uint64_t src_offset, dst_offset;
+	uint32_t size = HEIGHT * WIDTH * 4;
+	bool has_relocs = gem_has_relocations(fd);
 
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
+	src_offset = src * size;
+	dst_offset = dst * size;
 
+	devid = intel_get_drm_devid(fd);
 	handle = gem_create(fd, 4096);
-	gem_write(fd, handle, 0, batch, sizeof(batch));
+	memset(&exec, 0, sizeof(exec));
+	obj = calloc(n_bo + 1, sizeof(*obj));
+	for (n = 0; n < n_bo; n++) {
+		obj[n].handle = all_bo[n];
+		obj[n].offset = all_bo[n] * size;
+		obj[n].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		if (all_bo[n] == dst)
+			obj[n].flags |= EXEC_OBJECT_WRITE;
+		if (!has_relocs)
+			obj[n].flags |= EXEC_OBJECT_PINNED;
+	}
+
+	obj[n].handle = handle;
+	obj[n].offset = handle * size;
+	obj[n].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	obj[n].relocation_count = 2;
+	obj[n].relocs_ptr = to_user_pointer(reloc);
+	if (!has_relocs) {
+		obj[n].flags |= EXEC_OBJECT_PINNED;
+		obj[n].relocation_count = 0;
+	}
 
 	reloc[0].target_handle = dst;
 	reloc[0].delta = 0;
 	reloc[0].offset = 4 * sizeof(batch[0]);
-	reloc[0].presumed_offset = 0;
+	reloc[0].presumed_offset = dst_offset;
 	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
 
 	reloc[1].target_handle = src;
 	reloc[1].delta = 0;
 	reloc[1].offset = 7 * sizeof(batch[0]);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+	if (intel_gen(devid) >= 8)
 		reloc[1].offset += sizeof(batch[0]);
-	reloc[1].presumed_offset = 0;
+	reloc[1].presumed_offset = src_offset;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[1].write_domain = 0;
 
-	memset(&exec, 0, sizeof(exec));
-	obj = calloc(n_bo + 1, sizeof(*obj));
-	for (n = 0; n < n_bo; n++) {
-		obj[n].handle = all_bo[n];
-		obj[n].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = lower_32_bits(dst_offset); /* dst address */
+		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4; /* src pitch */
+		batch[i++] = lower_32_bits(src_offset); /* src address */
+		batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB;
+		if (intel_gen(devid) >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+		batch[i++] = (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = lower_32_bits(dst_offset);
+		if (intel_gen(devid) >= 8)
+			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4;
+		batch[i++] = lower_32_bits(src_offset);
+		if (intel_gen(devid) >= 8)
+			batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
 	}
-	obj[n].handle = handle;
-	obj[n].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-	obj[n].relocation_count = 2;
-	obj[n].relocs_ptr = to_user_pointer(reloc);
+
+	gem_write(fd, handle, 0, batch, sizeof(batch));
 
 	exec.buffers_ptr = to_user_pointer(obj);
 	exec.buffer_count = n_bo + 1;
 	exec.flags = HAS_BLT_RING(intel_get_drm_devid(fd)) ? I915_EXEC_BLT : 0;
+	exec.flags |= I915_EXEC_NO_RELOC;
 
 	ret = __gem_execbuf(fd, &exec);
 	gem_close(fd, handle);
-- 
2.25.1
