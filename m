Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C645610E278
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:46 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:18:03 +0530
Message-Id: <20230815164815.320904-70-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 69/81] tests/kms_scaling_modes: Document each
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

V2: - Update functionality
V3: - Driver requirement: s/any/i915, xe/

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_scaling_modes.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 31b806ae2..d32e02dac 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -25,6 +25,26 @@
  */
 
 #include "igt.h"
+/**
+ * TEST: kms scaling modes
+ * Category: Display
+ * Description: Test display scaling modes
+ *
+ * SUBTEST: scaling-mode-%s
+ * Description: Tests %arg[1] display scaling mode
+ * Driver requirement: i915, xe
+ * Functionality: eDP, plane, scaling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @center:           center
+ * @full:             full
+ * @full-aspect:      full aspect
+ * @none:             none (no scaling)
+ */
 
 IGT_TEST_DESCRIPTION("Test display scaling modes");
 
-- 
2.40.0
