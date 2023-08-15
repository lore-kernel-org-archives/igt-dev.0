Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B99D10E266
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:23 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:49 +0530
Message-Id: <20230815164815.320904-56-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 55/81] tests/kms_multipipe_modeset: Document
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

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_multipipe_modeset.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 1fdfb9a9f..801e3144b 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -25,6 +25,20 @@
  */
 
 #include "igt.h"
+/**
+ * TEST: kms multipipe modeset
+ * Category: Display
+ * Description: Test simultaneous modeset on all the supported pipes
+ *
+ * SUBTEST: basic-max-pipe-crc-check
+ * Description: Verify if simultaneous modesets on all the supported pipes is
+ *              successful. Validate using CRC verification
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pipes");
 
-- 
2.40.0
