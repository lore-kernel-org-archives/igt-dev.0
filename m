Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A68B10E26B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:18:08 +0530
Message-Id: <20230815164815.320904-75-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 74/81] tests/kms_tiled_display: Document each
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

V2: - Fix commit line (Karthik)
V3: - Driver requirement: s/any/i915, xe/
    - Add "chamelium" to the functionality

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_tiled_display.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index eba1b2764..fbca3890d 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -36,12 +36,37 @@
  * the displays supported by the kernel at the moment.
  */
 
+/**
+ * TEST: kms tiled display
+ * Category: Display
+ * Description: Test for Transcoder Port Sync for Display Port Tiled Displays
+ */
 #include "igt.h"
 #include "poll.h"
 #include "drm_mode.h"
 #include "drm_fourcc.h"
 #include "igt_edid.h"
 
+/**
+ * SUBTEST: basic-test-pattern
+ * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
+ *              for all tiled CRTCs in one vblank (executes on real panel).
+ * Driver requirement: i915, xe
+ * Functionality: tiled_display
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-test-pattern-with-chamelium
+ * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
+ *              for all tiled CRTCs in one vblank (executes on chamelium).
+ * Driver requirement: i915, xe
+ * Functionality: chamelium, tiled_display
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
 IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
 
 typedef struct {
-- 
2.40.0
