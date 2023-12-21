Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDDB10E388
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Dec 2023 20:16:00 +0000 (UTC)
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_mocs: Initialize MOCS values directly
Date: Thu, 21 Dec 2023 12:15:43 -0800
Message-ID: <20231221201543.3162414-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The #define's at the top of the file don't really provide any value and
just make it harder to quickly check which numeric index is associated
with which behavior on a given platform.  Drop them and assign the index
fields directly.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/intel_mocs.c | 31 ++++++++++---------------------
 1 file changed, 10 insertions(+), 21 deletions(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 0659ff50b..4a9c305dc 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -6,17 +6,6 @@
 #include "igt.h"
 #include "intel_mocs.h"
 
-#define DG1_MOCS_UC_IDX				1
-#define DG1_MOCS_WB_IDX				5
-#define DG2_MOCS_UC_IDX				1
-#define DG2_MOCS_WB_IDX				3
-#define MTL_MOCS_UC_IDX				5
-#define MTL_MOCS_WB_IDX				10
-#define GEN12_MOCS_UC_IDX			3
-#define GEN12_MOCS_WB_IDX			2
-#define XE2_MOCS_UC_IDX				3
-#define XE2_MOCS_WB_IDX				4
-
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
 	uint8_t wb_index;
@@ -34,20 +23,20 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 	 * as WB MOCS index based on platform.
 	 */
 	if (intel_graphics_ver(devid) >= IP_VER(20, 0)) {
-		mocs->uc_index = XE2_MOCS_UC_IDX;
-		mocs->wb_index = XE2_MOCS_WB_IDX;
+		mocs->uc_index = 3;
+		mocs->wb_index = 4;
 	} else if (IS_METEORLAKE(devid)) {
-		mocs->uc_index = MTL_MOCS_UC_IDX;
-		mocs->wb_index = MTL_MOCS_WB_IDX;
+		mocs->uc_index = 5;
+		mocs->wb_index = 10;
 	} else if (IS_DG2(devid)) {
-		mocs->uc_index = DG2_MOCS_UC_IDX;
-		mocs->wb_index = DG2_MOCS_WB_IDX;
+		mocs->uc_index = 1;
+		mocs->wb_index = 3;
 	} else if (IS_DG1(devid)) {
-		mocs->uc_index = DG1_MOCS_UC_IDX;
-		mocs->wb_index = DG1_MOCS_WB_IDX;
+		mocs->uc_index = 1;
+		mocs->wb_index = 5;
 	} else if (IS_GEN12(devid)) {
-		mocs->uc_index = GEN12_MOCS_UC_IDX;
-		mocs->wb_index = GEN12_MOCS_WB_IDX;
+		mocs->uc_index = 3;
+		mocs->wb_index = 2;
 	} else {
 		mocs->uc_index = I915_MOCS_PTE;
 		mocs->wb_index = I915_MOCS_CACHED;
-- 
2.43.0
