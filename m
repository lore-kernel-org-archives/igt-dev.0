Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D0B10E1EC
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 09:43:16 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Nov 2022 15:11:34 +0530
Message-Id: <20221125094134.256669-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_caching: Used
 XY_FAST_COPY_BLT for executing this on MTL
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

Cc: Prasad Nallani <prasad.nallani@intel.com>
Cc: Telukuntla Sreedhar <sreedhar.telukuntla@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/i915/gem_caching.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170abc..a818a53c2 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -82,15 +82,19 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 	intel_bb_add_intel_buf(ibb, src, false);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
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
+		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     4096);
+	}
 	intel_bb_out(ibb, 0 << 16 | 0);
 	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
 	intel_bb_emit_reloc_fenced(ibb, dst->handle,
-- 
2.25.1
