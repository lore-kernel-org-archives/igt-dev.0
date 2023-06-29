Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6C1810E3E6
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:48 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:36 +0530
Message-Id: <20230629144910.3055377-48-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 47/81] tests/kms_dp_tiled_display: Document
 each subtest for testplan
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
 tests/kms_tiled_display.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index eba1b2764..4652ef4e4 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -36,12 +36,33 @@
  * the displays supported by the kernel at the moment.
  */
 
+/**
+ * TEST: kms dp tiled display
+ * Category: Display
+ * Description: Test for Transcoder Port Sync for Display Port Tiled Displays
+ */
 #include "igt.h"
 #include "poll.h"
 #include "drm_mode.h"
 #include "drm_fourcc.h"
 #include "igt_edid.h"
 
+/**
+ * SUBTEST: basic-test-%s
+ * Description: Make sure the Tiled CRTCs are synchronized and we get page flips
+ *              for all tiled CRTCs in one vblank (%arg[1]).
+ * Driver requirement: any
+ * Functionality: tiled_display
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @pattern:                  executes on real panel
+ * @pattern-with-chamelium:   executes on chamelium.
+ */
+
 IGT_TEST_DESCRIPTION("Test for genlocked CRTCs with tiled displays");
 
 typedef struct {
-- 
2.40.0
