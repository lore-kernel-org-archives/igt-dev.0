Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B4B10E6EC
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:15 +0530
Message-Id: <20230811184655.157060-42-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 41/81] tests/kms_cursor_crc: Document each
 subtest for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_crc.c | 79 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 0506fd6f1..a8dc2f316 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -29,6 +29,19 @@
 #include <stdio.h>
 #include <string.h>
 
+/**
+ * TEST: kms cursor crc
+ * Category: Display
+ * Description: Use the display CRC support to validate cursor plane functionality.
+ *              The test will position the cursor plane either fully onscreen,
+ *              partially onscreen, or fully offscreen, using either a fully
+ *              opaque or fully transparent surface. In each case, it enables
+ *              the cursor plane and then reads the PF CRC (hardware test) and
+ *              compares it with the CRC value obtained when the cursor plane
+ *              was disabled and its drawing is directly inserted on the PF by
+ *              software.
+ */
+
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate cursor plane functionality. "
    "The test will position the cursor plane either fully onscreen, "
@@ -641,6 +654,41 @@ static bool require_cursor_size(data_t *data, int w, int h)
 	return !!ret;
 }
 
+/**
+ * SUBTEST: cursor-dpms
+ * Description: Check random placement of a cursor with DPMS.
+ * Driver requirement: any
+ * Functionality: cursor, dpms
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: cursor-suspend
+ * Description: Check random placement of a cursor with suspend.
+ * Driver requirement: any
+ * Functionality: cursor, suspend
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: cursor-%s
+ * Description: %arg[1]
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @alpha-opaque:       Validates the composition of a fully opaque cursor plane,
+ *                      i.e., alpha channel equal to 1.0.
+ * @alpha-transparent:  Validates the composition of a fully transparent cursor
+ *                      plane, i.e., alpha channel equal to 0.0.
+ * @size-change:        Create a maximum size cursor, then change the size in
+ *                      flight to smaller ones to see that the size is applied
+ *                      correctly.
+ */
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
 {
 	prepare_crtc(data, cursor_w, cursor_h);
@@ -738,6 +786,37 @@ static bool execution_constraint(enum pipe pipe)
 }
 
 
+/**
+ * SUBTEST: cursor-%s-%s
+ * Description: Check if a %arg[2] cursor is %arg[1].
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @offscreen:             well-positioned outside the screen
+ * @onscreen:              well-positioned inside the screen
+ * @random:                randomly placed
+ * @rapid-movement:        rapidly udates for movements
+ * @sliding:               smooth for horizontal, vertical & diagonal movements
+ *
+ * arg[2]:
+ *
+ * @128x128:               128x128 size
+ * @128x42:                128x42 size
+ * @256x256:               256x256 size
+ * @256x85:                256x85 size
+ * @32x10:                 32x10 size
+ * @32x32:                 32x32 size
+ * @512x170:               512x170 size
+ * @512x512:               512x512 size
+ * @64x21:                 64x21 size
+ * @64x64:                 64x64 size
+ * @max-size:              Max supported size
+ */
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
-- 
2.40.0
