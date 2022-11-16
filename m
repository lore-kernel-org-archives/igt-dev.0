Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B1F10E4A8
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Nov 2022 13:30:54 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Nov 2022 18:59:21 +0530
Message-Id: <20221116132921.1509627-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_linear_blits: Added
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

Extend New copy commands for MTL.Tests were failing
due to legacy command which is not supported on MTL

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

---
 tests/i915/gem_linear_blits.c | 66 ++++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 25 deletions(-)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index d02751be..75f389e7 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -68,6 +68,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
 	int i = 0;
+	static uint32_t devid;
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = dst;
@@ -82,31 +83,46 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 			4096, ALIGNMENT);
 	obj[2].offset = CANONICAL(obj[2].offset);
 	obj[2].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-
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
-
+	devid = intel_get_drm_devid(fd);
+
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+		batch[i++] = 0;/* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
+		batch[i++] = obj[0].offset;       /* dst address lower bits */
+		batch[i++] = obj[0].offset >> 32; /* dst address upper bits */
+		batch[i++] = 0;/* src x1,y1 */
+		batch[i++] = WIDTH*4;/* src pitch */
+		batch[i++] = obj[1].offset;       /* src address lower bits */
+		batch[i++] = obj[1].offset >> 32; /* src address upper bits */
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+				XY_SRC_COPY_BLT_WRITE_ALPHA |
+				XY_SRC_COPY_BLT_WRITE_RGB;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+				batch[i - 1] |= 8;
+		else
+				batch[i - 1] |= 6;
+
+		batch[i++] = (3 << 24) | /* 32 bits */
+				(0xcc << 16) | /* copy ROP */
+				WIDTH*4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = obj[0].offset;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+				batch[i++] = obj[0].offset >> 32;
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH*4;
+		batch[i++] = obj[1].offset;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+				batch[i++] = obj[1].offset >> 32;
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+}
 	gem_write(fd, obj[2].handle, 0, batch, i * sizeof(batch[0]));
 
 	memset(reloc, 0, sizeof(reloc));
-- 
2.25.1
