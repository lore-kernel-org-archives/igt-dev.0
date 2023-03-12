Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A505910E272
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Mar 2023 19:07:14 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Mar 2023 00:34:15 +0530
Message-Id: <20230312190416.1056981-3-vikas.srivastava@intel.com>
In-Reply-To: <20230312190416.1056981-1-vikas.srivastava@intel.com>
References: <20230312190416.1056981-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/i915/gem_userptr_blits: Enable
 COPY Command for gen12+
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

Test case uses legacy command which is not supported on gen12+.
Modified test to use XY_FAST_COPY_BLT.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: vikas srivastava <vikas.srivastava@intel.com>
---
 tests/i915/gem_userptr_blits.c | 65 ++++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 07a453229a..611e9c9037 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -99,6 +99,7 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
+	static uint32_t devid;
 	uint32_t handle;
 	int ret, i=0;
 	uint64_t dst_offset, src_offset, bb_offset;
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
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+		batch[i++] = 0;/* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+		batch[i++] = lower_32_bits(dst_offset); /* dst address */
+		batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		batch[i++] = 0;/* src x1,y1 */
+		batch[i++] = WIDTH*4;/* src pitch */
+		batch[i++] = lower_32_bits(src_offset); /* src address */
+		batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB;
+
+		if (intel_gen(devid) >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+
+		batch[i++] = (3 << 24) | /* 32 bits */
+			  (0xcc << 16) | /* copy ROP */
+			  WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = lower_32_bits(dst_offset); /*dst reloc*/
+		if (intel_gen(devid) >= 8)
+			batch[i++] = upper_32_bits(CANONICAL(dst_offset));
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4;
+		batch[i++] = lower_32_bits(src_offset); /* src reloc */
+		if (intel_gen(devid) >= 8)
+			batch[i++] = upper_32_bits(CANONICAL(src_offset));
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	}
 
 	handle = gem_create(fd, 4096);
 	gem_write(fd, handle, 0, batch, sizeof(batch));
-- 
2.25.1
