Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F3110E532
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Mar 2023 13:37:00 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	karolina.stolarek@intel.com
Date: Fri, 24 Mar 2023 19:03:44 +0530
Message-Id: <20230324133346.2284000-3-vikas.srivastava@intel.com>
In-Reply-To: <20230324133346.2284000-1-vikas.srivastava@intel.com>
References: <20230324133346.2284000-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/i915/gem_caching: Enable
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
is not supported on newer platforms. Modified test to
use XY_FAST_COPY_BLT.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 tests/i915/gem_caching.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170abca..6a7f9fad06 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -39,6 +39,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "i915/i915_blt.h"
 
 IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
 		     " cachelines.");
@@ -81,16 +82,22 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 
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
+	} else
+		igt_assert_f(0, "No supported blit command found\n");
 
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
