Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9CF10E411
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 11:00:44 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  3 Apr 2023 16:27:11 +0530
Message-Id: <20230403105714.3299450-2-vikas.srivastava@intel.com>
In-Reply-To: <20230403105714.3299450-1-vikas.srivastava@intel.com>
References: <20230403105714.3299450-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4 v3] tests/i915/gem_linear_blits: Enable
 XY_FAST_COPY_BLT copy instruction
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

Test case uses legacy command XY_SRC_COPY_BLT_CMD which is
not supported on newer platforms. Modify test to
use XY_FAST_COPY_BLT.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Co-developed-by: Vikas Srivastava <vikas.srivastava@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_linear_blits.c | 68 +++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index fac25095f5..17fbbd3710 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -48,6 +48,7 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 #include "igt_types.h"
+#include "i915/i915_blt.h"
 
 IGT_TEST_DESCRIPTION("Test doing many blits with a working set larger than the"
 		     " aperture size.");
@@ -67,6 +68,7 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
 	struct drm_i915_gem_execbuffer2 exec;
+	static uint32_t devid;
 	int i = 0;
 
 	memset(obj, 0, sizeof(obj));
@@ -83,29 +85,49 @@ static void copy(int fd, uint64_t ahnd, uint32_t dst, uint32_t src,
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
+
+	if (blt_has_xy_src_copy(fd)) {
+		batch[i++] = XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB;
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i - 1] |= 8;
+		else
+			batch[i - 1] |= 6;
+
+		batch[i++] = (3 << 24) | /* 32 bits */
+			  (0xcc << 16) | /* copy ROP */
+			  WIDTH * 4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = obj[0].offset;
+		if (intel_gen(devid) >= 8)
+			batch[i++] = obj[0].offset >> 32;
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH * 4;
+		batch[i++] = obj[1].offset;
+		if (intel_gen(devid) >= 8)
+			batch[i++] = obj[1].offset >> 32;
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else if (blt_has_fast_copy(fd)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH * 4;
+		batch[i++] = 0; /* dst x1,y1 */
+		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
+		batch[i++] = obj[0].offset; /* dst address lower bits */
+		batch[i++] = obj[0].offset >> 32; /* dst address upper bits */
+		batch[i++] = 0; /* src x1,y1 */
+		batch[i++] = WIDTH * 4; /* src pitch */
+		batch[i++] = obj[1].offset; /* src address lower bits */
+		batch[i++] = obj[1].offset >> 32; /* src address upper bits */
+		batch[i++] = MI_BATCH_BUFFER_END;
+		batch[i++] = MI_NOOP;
+	} else {
+		igt_assert_f(0, "No supported blit command found\n");
+	}
 
 	gem_write(fd, obj[2].handle, 0, batch, i * sizeof(batch[0]));
 
-- 
2.25.1
