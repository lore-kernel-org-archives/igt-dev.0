Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7292A10E6E9
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:16 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:00 +0530
Message-Id: <20230811184655.157060-27-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 26/81] tests/i915/kms_psr: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Add missing "Driver requirement" field

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_psr.c | 213 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 212 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
index 57a749ffb..7858c6a84 100644
--- a/tests/i915/kms_psr.c
+++ b/tests/i915/kms_psr.c
@@ -23,8 +23,9 @@
  */
 
 /**
- * TEST: Tests behaviour of PSR & PSR2
+ * TEST: kms psr
  * Category: Display
+ * Description: Tests behaviour of PSR & PSR2
  */
 
 #include "igt.h"
@@ -37,6 +38,213 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+/**
+ * SUBTEST: basic
+ * Description: Basic check for psr if it is detecting changes made in planes
+ * Driver requirement: any
+ * Functionality: psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: %s_%s
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1]
+ * Driver requirement: i915
+ * Functionality: kms_core, plane, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:             Cursor plane
+ * @primary:            Primary plane
+ * @sprite:             Sprite plane
+ *
+ * arg[2]:
+ *
+ * @mmap_cpu:           MMAP CPU
+ * @mmap_gtt:           MMAP GTT
+ */
+
+/**
+ * SUBTEST: sprite_plane_move
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on sprite planes
+ * Driver requirement: any
+ * Functionality: plane, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: %s_%s
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: any
+ * Functionality: kms_core, plane, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:             Cursor plane
+ * @sprite:             Sprite plane
+ *
+ * arg[2]:
+ *
+ * @blt:                Blitter
+ * @render:             Render
+ * @plane_onoff:        Plane On off
+ */
+
+/**
+ * SUBTEST: primary_%s
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: any
+ * Functionality: kms_core, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @blt:                Blitter
+ * @render:             Render
+ */
+
+/**
+ * SUBTEST: dpms
+ * Description: Check if psr is detecting changes when rendering operation is
+ *              performed  with dpms enabled or disabled
+ * Driver requirement: any
+ * Functionality: dpms, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: no_drrs
+ * Description: Check if psr is detecting changes when drrs is disabled
+ * Driver requirement: any
+ * Functionality: drrs, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: suspend
+ * Description: Check if psr is detecting changes when plane operation
+ *              is performed with suspend resume cycles
+ * Driver requirement: any
+ * Functionality: psr, suspend
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2_dpms
+ * Description: Check if psr is detecting changes when rendering operation
+ *              is performed  with dpms enabled or disabled
+ * Driver requirement: any
+ * Functionality: dpms, psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2_no_drrs
+ * Description: Check if psr is detecting changes when drrs is disabled
+ * Driver requirement: any
+ * Functionality: drrs, psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2_suspend
+ * Description: Check if psr is detecting changes when plane operation is
+ *              performed with suspend resume cycles
+ * Driver requirement: any
+ * Functionality: psr, psr2, suspend
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2_basic
+ * Description: Basic check for psr if it is detecting changes made in planes
+ * Driver requirement: any
+ * Functionality: psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2_%s_%s
+ * Description: Check if psr2 is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: i915
+ * Functionality: kms_core, plane, psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:             Cursor plane
+ * @primary:            Primary plane
+ * @sprite:             Sprite plane
+ *
+ * arg[2]:
+ *
+ * @mmap_cpu:           MMAP CPU
+ * @mmap_gtt:           MMAP GTT
+ */
+
+/**
+ * SUBTEST: psr2_primary_page_flip
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Driver requirement: any
+ * Functionality: plane, psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr2_primary_%s
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on primary planes
+ * Driver requirement: any
+ * Functionality: kms_core, plane, psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @blt:                Blitter
+ * @render:             Render
+ */
+
+/**
+ * SUBTEST: psr2_%s_%s
+ * Description: Check if psr is detecting memory mapping, rendering and plane
+ *              operations performed on %arg[1] planes
+ * Driver requirement: any
+ * Functionality: kms_core, plane, psr, psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:             Cursor plane
+ * @sprite:             Sprite plane
+ *
+ * arg[2]:
+ *
+ * @blt:                Blitter
+ * @render:             Render
+ * @plane_onoff:        Plane On off
+ * @plane_move:         Move plane position
+ */
+
 enum operations {
 	PAGE_FLIP,
 	MMAP_GTT,
@@ -313,6 +521,7 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  * SUBTEST: cursor_plane_move
  * Description: Check if psr is detecting the plane operations performed on
  *		cursor planes
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: psr
@@ -321,6 +530,7 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  * SUBTEST: primary_page_flip
  * Description: Check if psr is detecting page-flipping operations performed
  *		on primary planes
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: psr
@@ -329,6 +539,7 @@ static void fb_dirty_fb_ioctl(data_t *data, struct igt_fb *fb)
  * SUBTEST: sprite_plane_onoff
  * Description: Check if psr is detecting the plane operations performed on
  *		sprite planes
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: psr
-- 
2.40.0
