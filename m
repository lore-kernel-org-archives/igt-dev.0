Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1418410E3DF
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:47 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:30 +0530
Message-Id: <20230629144910.3055377-42-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 41/81] tests/kms_cursor_crc: Document each
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
---
 tests/kms_cursor_crc.c | 65 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 0506fd6f1..d91376fa4 100644
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
@@ -641,6 +654,27 @@ static bool require_cursor_size(data_t *data, int w, int h)
 	return !!ret;
 }
 
+/**
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
+ * @dpms:               Check random placement of a cursor with DPMS.
+ * @size-change:        Create a maximum size cursor, then change the size in
+ *                      flight to smaller ones to see that the size is applied
+ *                      correctly.
+ * @suspend:            Check random placement of a cursor with suspend.
+ */
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
 {
 	prepare_crtc(data, cursor_w, cursor_h);
@@ -738,6 +772,37 @@ static bool execution_constraint(enum pipe pipe)
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
