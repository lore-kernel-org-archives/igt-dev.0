Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1287910E027
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 18:18:54 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 23:47:46 +0530
Message-Id: <20221031181746.4143408-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] test/i915/gem_linear_blits: Added COPY
 Commands modification for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: janga.rahul.kumar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test case uses legacy command which is not supported on MTL.
Modified test to use XY_FAST_COPY_BLT.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Acked-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

---
 tests/i915/gem_close_race.c    |  95 ++++++++++++++++--------
 tests/i915/gem_linear_blits.c  |  64 ++++++++++------
 tests/i915/gem_userptr_blits.c | 131 +++++++++++++++++++++------------
 3 files changed, 190 insertions(+), 100 deletions(-)

diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
index e37a88828..2a939c94c 100644
--- a/tests/i915/gem_close_race.c
+++ b/tests/i915/gem_close_race.c
@@ -70,40 +70,73 @@ static void selfcopy(int fd, uint32_t ctx, uint32_t handle, int loops)
 	struct drm_i915_gem_create create;
 	uint32_t buf[16], *b = buf;
 	int err;
+	uint32_t src_x1 = 0;
 
 	memset(reloc, 0, sizeof(reloc));
 
-	*b = COPY_BLT_CMD | BLT_WRITE_ALPHA | BLT_WRITE_RGB;
-	if (has_64bit_relocations)
-		*b += 2;
-	b++;
-	*b++ = 0xcc << 16 | 1 << 25 | 1 << 24 | (4*1024);
-	*b++ = 0;
-	*b++ = 1 << 16 | 1024;
-
-	reloc[0].offset = (b - buf) * sizeof(*b);
-	reloc[0].target_handle = handle;
-	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
-	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
-	reloc[0].presumed_offset = data_addr;
-	*b++ = data_addr;
-	if (has_64bit_relocations)
-		*b++ = CANONICAL(data_addr) >> 32;
-
-	*b++ = 512 << 16;
-	*b++ = 4*1024;
-
-	reloc[1].offset = (b - buf) * sizeof(*b);
-	reloc[1].target_handle = handle;
-	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
-	reloc[1].write_domain = 0;
-	reloc[1].presumed_offset = data_addr;
-	*b++ = data_addr;
-	if (has_64bit_relocations)
-		*b++ = CANONICAL(data_addr) >> 32;
-
-	*b++ = MI_BATCH_BUFFER_END;
-	*b++ = 0;
+	 if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+                *b++ = XY_FAST_COPY_BLT;
+                *b = XY_FAST_COPY_COLOR_DEPTH_32;
+                if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+                        *b = XY_FAST_COPY_SRC_TILING_Yf |
+                                XY_FAST_COPY_DST_TILING_Yf;
+                b++;
+                *b++ = 0;
+                *b++ = 1 << 16 | 1024;/* dst X2 , y2 */
+
+                reloc[0].offset = (b - buf) * sizeof(*b);
+                reloc[0].target_handle = handle;
+                reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+                reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+
+                *b++ = 0;/* dst address lower bits */
+                *b++ = 0;/* dst address upper bits */
+
+                *b++ = 512 << 16 | src_x1;/* src x1,y1 */
+                *b++ = 4*1024;/* src pitch */
+
+                reloc[1].offset = (b - buf) * sizeof(*b);
+                reloc[1].target_handle = handle;
+                reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+                reloc[1].write_domain = 0;
+
+                *b++ = 0;// src address lower bits
+                *b++ = 0;// src address upper bits
+                *b++ = MI_BATCH_BUFFER_END;
+                *b++ = MI_NOOP;
+        } else {
+		*b = COPY_BLT_CMD | BLT_WRITE_ALPHA | BLT_WRITE_RGB;
+                if (has_64bit_relocations)
+                        *b += 2;
+                b++;
+                *b++ = 0xcc << 16 | 1 << 25 | 1 << 24 | (4*1024);
+                *b++ = 0;
+                *b++ = 1 << 16 | 1024;
+
+                reloc[0].offset = (b - buf) * sizeof(*b);
+                reloc[0].target_handle = handle;
+                reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+                reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+                reloc[0].presumed_offset = data_addr;
+                *b++ = data_addr;
+                if (has_64bit_relocations)
+                        *b++ = CANONICAL(data_addr) >> 32;
+
+                *b++ = 512 << 16;
+                *b++ = 4*1024;
+
+                reloc[1].offset = (b - buf) * sizeof(*b);
+                reloc[1].target_handle = handle;
+                reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+                reloc[1].write_domain = 0;
+                reloc[1].presumed_offset = data_addr;
+                *b++ = data_addr;
+                if (has_64bit_relocations)
+                        *b++ = CANONICAL(data_addr) >> 32;
+
+                *b++ = MI_BATCH_BUFFER_END;
+                *b++ = 0;
+        }
 
 	memset(gem_exec, 0, sizeof(gem_exec));
 	gem_exec[0].handle = handle;
diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index d02751be9..ae9971ca7 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -67,6 +67,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
+	static uint32_t devid;
 	int i = 0;
 
 	memset(obj, 0, sizeof(obj));
@@ -83,29 +84,46 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	obj[2].offset = CANONICAL(obj[2].offset);
 	obj[2].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
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
-	batch[i++] = obj[0].offset;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = obj[0].offset >> 32;
-	batch[i++] = 0; /* src x1,y1 */
-	batch[i++] = WIDTH*4;
-	batch[i++] = obj[1].offset;
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = obj[1].offset >> 32;
-	batch[i++] = MI_BATCH_BUFFER_END;
-	batch[i++] = MI_NOOP;
+	devid = intel_get_drm_devid(fd);
+
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+                batch[i++] = XY_FAST_COPY_BLT;
+                batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+                batch[i++] = 0;/* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+                batch[i++] = obj[0].offset;       /* dst address lower bits */
+                batch[i++] = obj[0].offset >> 32; /* dst address upper bits */
+                batch[i++] = 0;/* src x1,y1 */
+                batch[i++] = WIDTH*4;/* src pitch */
+                batch[i++] = obj[1].offset;       /* src address lower bits */
+                batch[i++] = obj[1].offset >> 32; /* src address upper bits */
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        } else {
+		 batch[i++] = XY_SRC_COPY_BLT_CMD |
+                          XY_SRC_COPY_BLT_WRITE_ALPHA |
+                          XY_SRC_COPY_BLT_WRITE_RGB;
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i - 1] |= 8;
+                else
+                        batch[i - 1] |= 6;
+
+                batch[i++] = (3 << 24) | /* 32 bits */
+                          (0xcc << 16) | /* copy ROP */
+                          WIDTH*4;
+                batch[i++] = 0; /* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+                batch[i++] = obj[0].offset;
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i++] = obj[0].offset >> 32;
+                batch[i++] = 0; /* src x1,y1 */
+                batch[i++] = WIDTH*4;
+                batch[i++] = obj[1].offset;
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i++] = obj[1].offset >> 32;
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        }
 
 	gem_write(fd, obj[2].handle, 0, batch, i * sizeof(batch[0]));
 
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 698508669..cc26cf125 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -100,6 +100,7 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
 	uint32_t handle;
+	static uint32_t devid;
 	int ret, i=0;
 	uint64_t dst_offset, src_offset, bb_offset;
 	bool has_relocs = gem_has_relocations(fd);
@@ -108,29 +109,47 @@ static int copy(int fd, uint32_t dst, uint32_t src)
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
+        if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+                batch[i++] = XY_FAST_COPY_BLT;
+                batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+                batch[i++] = 0;/* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+                batch[i++] = 0;/* dst address lower bits */
+                batch[i++] = 0;/* dst address upper bits */
+                batch[i++] = 0;/* src x1,y1 */
+                batch[i++] = WIDTH*4;/* src pitch */
+                batch[i++] = 0;// src address lower bits
+                batch[i++] = 0;// src address upper bits
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        } else {
+                batch[i++] = XY_SRC_COPY_BLT_CMD |
+                             XY_SRC_COPY_BLT_WRITE_ALPHA |
+                             XY_SRC_COPY_BLT_WRITE_RGB;
+
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i - 1] |= 8;
+                else
+                        batch[i - 1] |= 6;
+
+                batch[i++] = (3 << 24) | /* 32 bits */
+                          (0xcc << 16) | /* copy ROP */
+                          WIDTH*4;
+                batch[i++] = 0; /* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+                batch[i++] = dst_offset; /* dst reloc */
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i++] = dst_offset >> 32;
+                batch[i++] = 0; /* src x1,y1 */
+                batch[i++] = WIDTH*4;
+		batch[i++] = src_offset; /* src reloc */
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i++] = src_offset >> 32;
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        }
 
 	handle = gem_create(fd, 4096);
 	gem_write(fd, handle, 0, batch, sizeof(batch));
@@ -206,29 +225,49 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	struct drm_i915_gem_execbuffer2 exec;
 	uint32_t handle;
 	int n, ret, i=0;
-
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
+	static uint32_t devid;
+
+	devid = intel_get_drm_devid(fd);
+
+        if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+                batch[i++] = XY_FAST_COPY_BLT;
+                batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+                batch[i++] = 0;/* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+                batch[i++] = 0;/* dst address lower bits */
+                batch[i++] = 0;/* dst address upper bits */
+                batch[i++] = 0;/* src x1,y1 */
+                batch[i++] = WIDTH*4;/* src pitch */
+                batch[i++] = 0;// src address lower bits
+                batch[i++] = 0;// src address upper bits
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        } else {
+                batch[i++] = XY_SRC_COPY_BLT_CMD |
+                             XY_SRC_COPY_BLT_WRITE_ALPHA |
+                             XY_SRC_COPY_BLT_WRITE_RGB;
+
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i - 1] |= 8;
+                else
+                        batch[i - 1] |= 6;
+
+                batch[i++] = (3 << 24) | /* 32 bits */
+                          (0xcc << 16) | /* copy ROP */
+                          WIDTH*4;
+                batch[i++] = 0; /* dst x1,y1 */
+                batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+                batch[i++] = dst_offset; /* dst reloc */
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i++] = dst_offset >> 32;
+                batch[i++] = 0; /* src x1,y1 */
+                batch[i++] = WIDTH*4;
+                batch[i++] = src_offset; /* src reloc */
+                if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+                        batch[i++] = src_offset >> 32;
+                batch[i++] = MI_BATCH_BUFFER_END;
+                batch[i++] = MI_NOOP;
+        }
 
 	handle = gem_create(fd, 4096);
 	gem_write(fd, handle, 0, batch, sizeof(batch));
-- 
2.25.1
