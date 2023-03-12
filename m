Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0510E272
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Mar 2023 19:07:12 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Mar 2023 00:34:13 +0530
Message-Id: <20230312190416.1056981-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/i915/gem_caching: Enable
 XY_FAST_COPY_BLT for MTL
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

Test case uses legacy command XY_SRC_COPY_BLT_CMD which is not supported
on PVC and beyond platforms. Modified test to use XY_FAST_COPY_BLT.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 tests/i915/gem_caching.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170abca..70b56e2cd4 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -81,16 +81,20 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 
 	intel_bb_add_intel_buf(ibb, src, false);
 	intel_bb_add_intel_buf(ibb, dst, true);
-
-	intel_bb_out(ibb,
-		     XY_SRC_COPY_BLT_CMD |
-		     XY_SRC_COPY_BLT_WRITE_ALPHA |
-		     XY_SRC_COPY_BLT_WRITE_RGB |
-		     (6 + 2 * has_64b_reloc));
-
-	intel_bb_out(ibb, (3 << 24) | /* 32 bits */
-		     (0xcc << 16) | /* copy ROP */
-		     4096);
+	if (intel_graphics_ver(ibb->devid) >= IP_VER(12, 60)) {
+		intel_bb_out(ibb, XY_FAST_COPY_BLT);
+		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32 | 4096);
+	} else {
+		intel_bb_out(ibb,
+			     XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB |
+			     (6 + 2 * has_64b_reloc));
+
+		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     4096);
+	}
 	intel_bb_out(ibb, 0 << 16 | 0);
 	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
 	intel_bb_emit_reloc_fenced(ibb, dst->handle,
-- 
2.25.1
