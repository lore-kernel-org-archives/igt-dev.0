Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB49410E205
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:35:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 10:58:01 +0530
Message-Id: <20230529052835.860047-49-bhanuprakash.modem@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 48/82] tests/kms_dp_tiled_display: Document
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
 tests/kms_dp_tiled_display.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
index 07b803a50..cd792ec51 100644
--- a/tests/kms_dp_tiled_display.c
+++ b/tests/kms_dp_tiled_display.c
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
 IGT_TEST_DESCRIPTION("Test for Transcoder Port Sync for Display Port Tiled Displays");
 
 typedef struct {
-- 
2.40.0
