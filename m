Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CBD10E130
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Dec 2022 18:01:36 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Dec 2022 23:24:29 +0530
Message-Id: <20221226175429.570-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4] lib/igt_draw: Change MOCS settings for
 MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On MTL, we want the table entry labelled "UC (GO:Mem)"
which has index 5.  This means that the MOCS value is 10.

v2: Add define for MOCS settings. (Lucas)
v3: Extending get_mocs_index and using get_mocs_index
    to get mocs val. (Zbigniew)

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/i915/intel_mocs.c | 12 ++++++++----
 lib/igt_draw.c        |  4 ++--
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
index df541ab0..f757bfbb 100644
--- a/lib/i915/intel_mocs.c
+++ b/lib/i915/intel_mocs.c
@@ -11,6 +11,8 @@
 #define DG1_MOCS_WB_IDX				5
 #define DG2_MOCS_UC_IDX				1
 #define DG2_MOCS_WB_IDX				3
+#define MTL_MOCS_UC_IDX				5
+#define MTL_MOCS_WB_IDX				10
 #define GEN12_MOCS_UC_IDX			3
 #define GEN12_MOCS_WB_IDX			2
 #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
@@ -32,13 +34,15 @@ static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
 	 * This helper function is providing current UC as well
 	 * as WB MOCS index based on platform.
 	 */
-	if (IS_DG1(devid)) {
-		mocs->uc_index = DG1_MOCS_UC_IDX;
-		mocs->wb_index = DG1_MOCS_WB_IDX;
+	if (IS_METEORLAKE(devid)) {
+                mocs->uc_index = MTL_MOCS_UC_IDX;
+                mocs->wb_index = MTL_MOCS_WB_IDX;
 	} else if (IS_DG2(devid)) {
 		mocs->uc_index = DG2_MOCS_UC_IDX;
 		mocs->wb_index = DG2_MOCS_WB_IDX;
-
+	} else if (IS_DG1(devid)) {
+		mocs->uc_index = DG1_MOCS_UC_IDX;
+		mocs->wb_index = DG1_MOCS_WB_IDX;
 	} else if (IS_GEN12(devid)) {
 		mocs->uc_index = GEN12_MOCS_UC_IDX;
 		mocs->wb_index = GEN12_MOCS_WB_IDX;
diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 975d65cd..58ce0539 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -36,6 +36,7 @@
 #include "i830_reg.h"
 #include "i915/gem_create.h"
 #include "i915/gem_mman.h"
+#include "i915/intel_mocs.h"
 
 #ifndef PAGE_ALIGN
 #ifndef PAGE_SIZE
@@ -702,8 +703,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 		pitch = tiling ? buf->stride / 4 : buf->stride;
 
 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
-		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
+		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
-- 
2.36.0
