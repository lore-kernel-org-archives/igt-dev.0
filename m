Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9161310E26E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:17 +0530
Message-Id: <20230815164815.320904-24-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 23/81] tests/i915/kms_legacy_colorkey: Document
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

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_legacy_colorkey.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index 450cb2e3f..f022bab19 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -24,6 +24,27 @@
 #include "igt.h"
 #include <errno.h>
 
+/**
+ * TEST: kms legacy colorkey
+ * Category: Display
+ * Description: Test to check the legacy set colorkey ioctl on sprite planes.
+ *
+ * SUBTEST: basic
+ * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
+ * Driver requirement: i915
+ * Functionality: plane, xorg_xv
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-plane
+ * Description: Check invalid plane id's, zero and outrange
+ * Driver requirement: i915
+ * Functionality: plane, xorg_xv
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on sprite planes.");
 
-- 
2.40.0
