Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B2110E169
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 06:57:52 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org,
	karolina.stolarek@intel.com
Date: Tue,  4 Apr 2023 12:24:27 +0530
Message-Id: <20230404065429.3381075-3-vikas.srivastava@intel.com>
In-Reply-To: <20230404065429.3381075-1-vikas.srivastava@intel.com>
References: <20230404065429.3381075-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4 v3] tests/i915/gem_caching: Enable
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
 tests/i915/gem_caching.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170abca..3783dc2b33 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -39,6 +39,7 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+#include "i915/i915_blt.h"
 
 IGT_TEST_DESCRIPTION("Test snoop consistency when touching partial"
 		     " cachelines.");
@@ -82,15 +83,23 @@ copy_bo(struct intel_bb *ibb, struct intel_buf *src, struct intel_buf *dst)
 	intel_bb_add_intel_buf(ibb, src, false);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	intel_bb_out(ibb,
-		     XY_SRC_COPY_BLT_CMD |
-		     XY_SRC_COPY_BLT_WRITE_ALPHA |
-		     XY_SRC_COPY_BLT_WRITE_RGB |
-		     (6 + 2 * has_64b_reloc));
+	if (blt_has_xy_src_copy(ibb->i915)) {
+		intel_bb_out(ibb,
+			     XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB |
+			     (6 + 2 * has_64b_reloc));
+
+		intel_bb_out(ibb, (3 << 24) | /* 32 bits */
+			     (0xcc << 16) | /* copy ROP */
+			     4096);
+	} else if (blt_has_fast_copy(ibb->i915)) {
+		intel_bb_out(ibb, XY_FAST_COPY_BLT);
+		intel_bb_out(ibb, XY_FAST_COPY_COLOR_DEPTH_32 | 4096);
+	} else {
+		igt_assert_f(0, "No supported blit command found\n");
+	}
 
-	intel_bb_out(ibb, (3 << 24) | /* 32 bits */
-		     (0xcc << 16) | /* copy ROP */
-		     4096);
 	intel_bb_out(ibb, 0 << 16 | 0);
 	intel_bb_out(ibb, (BO_SIZE/4096) << 16 | 1024);
 	intel_bb_emit_reloc_fenced(ibb, dst->handle,
-- 
2.25.1
