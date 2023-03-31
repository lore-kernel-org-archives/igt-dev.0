Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF0210E09F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Mar 2023 12:24:50 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	karolina.stolarek@intel.com
Date: Fri, 31 Mar 2023 17:51:30 +0530
Message-Id: <20230331122133.3000215-2-vikas.srivastava@intel.com>
In-Reply-To: <20230331122133.3000215-1-vikas.srivastava@intel.com>
References: <20230331122133.3000215-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4 v2] tests/i915/gem_caching: Enable
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

Test case uses legacy command XY_SRC_COPY_BLT_CMD which
is not supported on newer platforms. Modify test to
use XY_FAST_COPY_BLT.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
Cc: Karolina Stolarek <karolina.stolarek@intel.com>
---
 tests/i915/gem_caching.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170abca..8d1e738002 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -39,6 +39,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "i915/i915_blt.h"
 
 IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
 		     " cachelines.");
@@ -81,16 +82,23 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 
 	intel_bb_add_intel_buf(ibb, src, false);
 	intel_bb_add_intel_buf(ibb, dst, true);
+	if (blt_has_fast_copy(ibb->i915)) {
+		intel_bb_out(ibb, XY_FAST_COPY_BLT);
+		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32 | 4096);
+	} else if (blt_has_xy_src_copy(ibb->i915)) {
+		intel_bb_out(ibb,
+			     XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB |
+			     (6 + 2 * has_64b_reloc));
+
+		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     4096);
+	} else {
+		igt_assert_f(0, "No supported blit command found\n");
+	}
 
-	intel_bb_out(ibb,
-		     XY_SRC_COPY_BLT_CMD |
-		     XY_SRC_COPY_BLT_WRITE_ALPHA |
-		     XY_SRC_COPY_BLT_WRITE_RGB |
-		     (6 + 2 * has_64b_reloc));
-
-	intel_bb_out(ibb, (3 << 24) | /* 32 bits */
-		     (0xcc << 16) | /* copy ROP */
-		     4096);
 	intel_bb_out(ibb, 0 << 16 | 0);
 	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
 	intel_bb_emit_reloc_fenced(ibb, dst->handle,
-- 
2.25.1
