Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31EA310E25B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 13:13:06 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 18:50:47 +0530
Message-Id: <20231130132050.2132447-2-jeevan.b@intel.com>
In-Reply-To: <20231130132050.2132447-1-jeevan.b@intel.com>
References: <20231130132050.2132447-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/intel/kms_psr: fix documentation
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

From: Swati Sharma <swati2.sharma@intel.com>

Optimize documentation and update mega features accordingly.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_psr.c | 215 +++++++++++++++---------------------------
 1 file changed, 74 insertions(+), 141 deletions(-)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index 05bdd7b98..31d6f779c 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -43,143 +43,93 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: psr_basic
- * Description: Basic check for psr if it is detecting changes made in planes
- * Functionality: psr1
+ * SUBTEST: %s_basic
+ * Description: Basic check for %arg[1] if it is detecting changes made in planes
+ * Functionality: %arg[1]
  *
- * SUBTEST: psr_%s_%s
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1]
- * Driver requirement: i915
- * Functionality: kms_core, plane, psr1
- *
- * arg[1]:
- *
- * @cursor:             Cursor plane
- * @primary:            Primary plane
- * @sprite:             Sprite plane
- *
- * arg[2]:
+ * SUBTEST: %s_dpms
+ * Description: Check if %arg[1] is detecting changes when rendering operation
+ *              is performed with dpms enabled or disabled
+ * Functionality: %arg[1], dpms
  *
- * @mmap_cpu:           MMAP CPU
- * @mmap_gtt:           MMAP GTT
- */
-
-/**
- * SUBTEST: psr_sprite_plane_move
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on sprite planes
- * Functionality: plane, psr1
+ * SUBTEST: %s_no_drrs
+ * Description: Check if %arg[1] is detecting changes when drrs is disabled
+ * Functionality: %arg[1], drrs
  *
- * SUBTEST: psr_%s_%s
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1] planes
- * Functionality: kms_core, plane, psr1
+ * SUBTEST: %s_suspend
+ * Description: Check if %arg[1] is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Functionality: %arg[1], suspend
  *
  * arg[1]:
  *
- * @cursor:             Cursor plane
- * @sprite:             Sprite plane
- *
- * arg[2]:
- *
- * @blt:                Blitter
- * @render:             Render
- * @plane_onoff:        Plane On off
+ * @psr:             psr1
+ * @psr2:            psr2
  */
 
 /**
- * SUBTEST: psr_primary_%s
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1] planes
- * Functionality: kms_core, psr1
+ * SUBTEST: %s_%s_%s
+ * Description: Check if %arg[1] is detecting memory mapping %arg[3] operations
+ * 		performed on %arg[2] planes
+ * Driver requirement: i915
+ * Functionality: %arg[1], plane
  *
  * arg[1]:
  *
- * @blt:                Blitter
- * @render:             Render
- */
-
-/**
- * SUBTEST: psr_dpms
- * Description: Check if psr is detecting changes when rendering operation is
- *              performed  with dpms enabled or disabled
- * Functionality: dpms, psr1
- *
- * SUBTEST: psr_no_drrs
- * Description: Check if psr is detecting changes when drrs is disabled
- * Functionality: drrs, psr1
- *
- * SUBTEST: psr_suspend
- * Description: Check if psr is detecting changes when plane operation
- *              is performed with suspend resume cycles
- * Functionality: psr1, suspend
- *
- * SUBTEST: psr2_dpms
- * Description: Check if psr is detecting changes when rendering operation
- *              is performed  with dpms enabled or disabled
- * Functionality: dpms, psr2
- *
- * SUBTEST: psr2_no_drrs
- * Description: Check if psr is detecting changes when drrs is disabled
- * Functionality: drrs, psr2
- *
- * SUBTEST: psr2_suspend
- * Description: Check if psr is detecting changes when plane operation is
- *              performed with suspend resume cycles
- * Functionality: psr2, suspend
- *
- * SUBTEST: psr2_basic
- * Description: Basic check for psr if it is detecting changes made in planes
- * Functionality: psr2
+ * @psr:		psr1
+ * @psr2:		psr2
  *
- * SUBTEST: psr2_%s_%s
- * Description: Check if psr2 is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1] planes
- * Driver requirement: i915
- * Functionality: kms_core, plane, psr2
- *
- * arg[1]:
+ * arg[2]:
  *
  * @cursor:             Cursor plane
  * @primary:            Primary plane
  * @sprite:             Sprite plane
  *
- * arg[2]:
+ * arg[3]:
  *
  * @mmap_cpu:           MMAP CPU
  * @mmap_gtt:           MMAP GTT
  */
 
 /**
- * SUBTEST: psr2_primary_page_flip
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on primary planes
- * Functionality: plane, psr2
+ * SUBTEST: %s_primary_page_flip
+ * Description: Check if %arg[1] is detecting page-flipping operation
+ * 		performed on primary plane
+ * Functionality: %arg[1], plane
  *
- * SUBTEST: psr2_primary_%s
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on primary planes
- * Functionality: kms_core, plane, psr2
+ * SUBTEST: %s_primary_%s
+ * Description: Check if %arg[1] is detecting rendering operations %arg[2]
+ * 		when performed on primary plane
+ * Functionality: %arg[1], plane
  *
  * arg[1]:
  *
+ * @psr:		psr1
+ * @psr2:		psr2
+ *
+ * arg[2]:
+ *
  * @blt:                Blitter
  * @render:             Render
  */
 
 /**
- * SUBTEST: psr2_%s_%s
- * Description: Check if psr is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1] planes
- * Functionality: kms_core, plane, psr2
+ * SUBTEST: %s_%s_%s
+ * Description: Check if %arg[1] is detecting rendering and plane
+ *              operations %arg[3] performed on %arg[2] planes
+ * Functionality: %arg[1], plane
  *
  * arg[1]:
  *
+ * @psr:		psr1
+ * @psr2:		psr2
+ *
+ * arg[2]:
+ *
  * @cursor:             Cursor plane
  * @sprite:             Sprite plane
  *
- * arg[2]:
+ * arg[3]:
  *
  * @blt:                Blitter
  * @render:             Render
@@ -188,36 +138,36 @@
  */
 
 /**
+ * SUBTEST: pr_basic
+ * Description: Basic check for pr if it is detecting changes made in planes
+ * Functionality: pr
+ * Mega feature: DP2.0
+ *
  * SUBTEST: pr_dpms
  * Description: Check if pr is detecting changes when rendering operation
  *              is performed with dpms enabled or disabled
- * Functionality: dpms, pr
- * Mega feature: Panel Replay
+ * Functionality: pr, dpms
+ * Mega feature: DP2.0
  *
  * SUBTEST: pr_no_drrs
  * Description: Check if pr is detecting changes when drrs is disabled
- * Functionality: drrs, pr
- * Mega feature: Panel Replay
+ * Functionality: pr, drrs
+ * Mega feature: DP2.0
  *
  * SUBTEST: pr_suspend
  * Description: Check if pr is detecting changes when plane operation is
  *              performed with suspend resume cycles
  * Functionality: pr, suspend
- * Mega feature: Panel Replay
- *
- * SUBTEST: pr_basic
- * Description: Basic check for pr if it is detecting changes made in planes
- * Functionality: pr
- * Mega feature: Panel Replay
+ * Mega feature: DP2.0
  */
 
 /**
  * SUBTEST: pr_%s_%s
- * Description: Check if pr is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1] planes
+ * Description: Check if pr is detecting memory mapping %arg[2] operations
+ * 		performed on %arg[1] planes
  * Driver requirement: i915
- * Functionality: kms_core, plane, pr
- * Mega feature: Panel Replay
+ * Functionality: pr, plane
+ * Mega feature: DP2.0
  *
  * arg[1]:
  *
@@ -233,16 +183,16 @@
 
 /**
  * SUBTEST: pr_primary_page_flip
- * Description: Check if pr is detecting memory mapping, rendering and plane
- *              operations performed on primary planes
- * Functionality: plane, pr
- * Mega feature: Panel Replay
+ * Description: Check if pr is detecting page-flipping operation
+ * 		performed on primary plane
+ * Functionality: pr, plane
+ * Mega feature: DP2.0
  *
  * SUBTEST: pr_primary_%s
- * Description: Check if pr is detecting memory mapping, rendering and plane
- *              operations performed on primary planes
- * Functionality: kms_core, plane, pr
- * Mega feature: Panel Replay
+ * Description: Check if pr is detecting rendering operations %arg[1]
+ * 		when performed on primary plane
+ * Functionality: pr, plane
+ * Mega feature: DP2.0
  *
  * arg[1]:
  *
@@ -252,10 +202,10 @@
 
 /**
  * SUBTEST: pr_%s_%s
- * Description: Check if pr is detecting memory mapping, rendering and plane
- *              operations performed on %arg[1] planes
- * Functionality: kms_core, plane, pr
- * Mega feature: Panel Replay
+ * Description: Check if pr is detecting rendering and plane
+ *              operations %arg[2] performed on %arg[1] planes
+ * Functionality: pr, plane
+ * Mega feature: DP2.0
  *
  * arg[1]:
  *
@@ -270,23 +220,6 @@
  * @plane_move:         Move plane position
  */
 
-/**
- * SUBTEST: psr_cursor_plane_move
- * Description: Check if psr is detecting the plane operations performed on
- *		cursor planes
- * Functionality: psr1
- *
- * SUBTEST: psr_primary_page_flip
- * Description: Check if psr is detecting page-flipping operations performed
- *		on primary planes
- * Functionality: psr1
- *
- * SUBTEST: psr_sprite_plane_onoff
- * Description: Check if psr is detecting the plane operations performed on
- *		sprite planes
- * Functionality: psr1
- */
-
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
-- 
2.25.1
