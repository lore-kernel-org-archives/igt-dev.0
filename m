Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A436010E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:56 +0530
Message-Id: <20230517063323.4146387-55-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 54/81] tests/kms_invalid_mode: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_invalid_mode.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index ec0483055..465169d10 100644
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
+ * Description: Make sure all modesets are rejected when the requested mode is
+ *              invalid
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @bad-hsync-end:
+ * @bad-hsync-start:
+ * @bad-htotal:
+ * @bad-vsync-end:
+ * @bad-vsync-start:
+ * @bad-vtotal:
+ * @clock-too-high:
+ * @int-max-clock:
+ * @uint-max-clock:
+ * @zero-clock:
+ * @zero-hdisplay:
+ * @zero-vdisplay:
+ */
+
 IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
 
 typedef struct _data data_t;
-- 
2.40.0


