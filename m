Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD0610E5E2
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Dec 2022 13:30:54 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@linux.intel.com
Date: Thu,  1 Dec 2022 18:59:08 +0530
Message-Id: <20221201132908.668499-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915: Tests modified to use COPY
 Command modification for gen12+ platforms
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

gem_partial_pwrite_pread , gem_evict_everythig and gem_evict_alignment
were using legacy command which is not supported on gen12+ platforms.
Modified test to use XY_FAST_COPY_BLT.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: vikas srivastava <vikas.srivastava@intel.com>
---
 tests/i915/gem_evict_alignment.c      | 25 ++++++++++++++++---------
 tests/i915/gem_evict_everything.c     | 25 ++++++++++++++++---------
 tests/i915/gem_partial_pwrite_pread.c | 17 +++++++++++------
 3 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_evict_alignment.c b/tests/i915/gem_evict_alignment.c
index 0b560ab03..36045de20 100644
--- a/tests/i915/gem_evict_alignment.c
+++ b/tests/i915/gem_evict_alignment.c
@@ -64,15 +64,22 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo,
 	struct drm_i915_gem_execbuffer2 exec;
 	uint32_t handle;
 	int n, i=0;
-
-	batch[i++] = (XY_SRC_COPY_BLT_CMD |
-		    XY_SRC_COPY_BLT_WRITE_ALPHA |
-		    XY_SRC_COPY_BLT_WRITE_RGB | 6);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i - 1] += 2;
-	batch[i++] = (3 << 24) | /* 32 bits */
-		  (0xcc << 16) | /* copy ROP */
-		  WIDTH*4;
+	uint32_t devid;
+
+	devid = intel_get_drm_devid(fd);
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+	} else {
+		batch[i++] = (XY_SRC_COPY_BLT_CMD |
+			      XY_SRC_COPY_BLT_WRITE_ALPHA |
+			      XY_SRC_COPY_BLT_WRITE_RGB | 6);
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i - 1] += 2;
+		batch[i++] = (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     WIDTH*4;
+	}
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 	batch[i++] = 0; /* dst reloc */
diff --git a/tests/i915/gem_evict_everything.c b/tests/i915/gem_evict_everything.c
index 120f89072..995df2e82 100644
--- a/tests/i915/gem_evict_everything.c
+++ b/tests/i915/gem_evict_everything.c
@@ -64,15 +64,22 @@ copy(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
 	struct drm_i915_gem_execbuffer2 exec;
 	uint32_t handle;
 	int n, ret, i=0;
-
-	batch[i++] = (XY_SRC_COPY_BLT_CMD |
-		    XY_SRC_COPY_BLT_WRITE_ALPHA |
-		    XY_SRC_COPY_BLT_WRITE_RGB | 6);
-	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i - 1] += 2;
-	batch[i++] = (3 << 24) | /* 32 bits */
-		  (0xcc << 16) | /* copy ROP */
-		  WIDTH*4;
+	uint32_t devid;
+
+	devid = intel_get_drm_devid(fd);
+	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
+		batch[i++] = XY_FAST_COPY_BLT;
+		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
+	} else {
+		batch[i++] = (XY_SRC_COPY_BLT_CMD |
+			      XY_SRC_COPY_BLT_WRITE_ALPHA |
+			      XY_SRC_COPY_BLT_WRITE_RGB | 6);
+		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
+			batch[i - 1] += 2;
+		batch[i++] = (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     WIDTH*4;
+	}
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
 	batch[i++] = 0; /* dst reloc */
diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index 474149d48..9b5b05700 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -86,12 +86,17 @@ static void copy_bo(struct intel_bb *ibb,
 	intel_bb_add_intel_buf(ibb, src, false);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	intel_bb_out(ibb,
-		     XY_SRC_COPY_BLT_CMD |
-		     XY_SRC_COPY_BLT_WRITE_ALPHA |
-		     XY_SRC_COPY_BLT_WRITE_RGB |
-		     (6 + 2 * has_64b_reloc));
-	intel_bb_out(ibb, 3 << 24 | 0xcc << 16 | 4096);
+	if (intel_graphics_ver(ibb->devid) >= IP_VER(12, 60)) {
+		intel_bb_out(ibb, XY_FAST_COPY_BLT);
+		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32  | 4096);
+	} else {
+		intel_bb_out(ibb,
+			     XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB |
+			     (6 + 2 * has_64b_reloc));
+		intel_bb_out(ibb, 3 << 24 | 0xcc << 16 | 4096);
+	}
 	intel_bb_out(ibb, 0 << 16 | 0);
 	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
 	intel_bb_emit_reloc_fenced(ibb, dst->handle,
-- 
2.25.1
