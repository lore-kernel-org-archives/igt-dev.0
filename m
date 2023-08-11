Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2080310E6FA
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:56:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:27 +0530
Message-Id: <20230811184655.157060-54-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 53/81] tests/kms_invalid_mode: Document each
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

V2: - Fix test description

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_invalid_mode.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index c26f8befe..c5714c97d 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -22,10 +22,42 @@
  *
  */
 
+/**
+ * TEST: kms invalid mode
+ * Category: Display
+ * Description: Make sure all modesets are rejected when the requested mode is
+ *              invalid
+ */
 #include "igt.h"
 #include <limits.h>
 #include <stdbool.h>
 
+/**
+ * SUBTEST: %s
+ * Description: Make sure all modesets are rejected when the requested mode
+ *              (%arg[1]) is invalid
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bad-hsync-end:    Bad hsync_end
+ * @bad-hsync-start:  Bad hsync_start
+ * @bad-htotal:       Bad htotal
+ * @bad-vsync-end:    Bad vsync_end
+ * @bad-vsync-start:  Bad vsync_start
+ * @bad-vtotal:       Bad vtotal
+ * @clock-too-high:   High clock
+ * @int-max-clock:    Clock as INT_MAX
+ * @uint-max-clock:   Clock as UINT_MAX
+ * @zero-clock:       Clock as zero
+ * @zero-hdisplay:    hdisplay as zero
+ * @zero-vdisplay:    vdisplay as zero
+ */
+
 IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
 
 typedef struct _data data_t;
-- 
2.40.0
