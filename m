Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D99110E3B9
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:21 +0530
Message-Id: <20230517063323.4146387-20-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 19/81] tests/i915/kms_fence_pin_leak: Document
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/i915/kms_fence_pin_leak.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
index 63657a742..7c6251837 100644
--- a/tests/i915/kms_fence_pin_leak.c
+++ b/tests/i915/kms_fence_pin_leak.c
@@ -30,6 +30,19 @@
 
 #include "i915/gem.h"
 #include "igt.h"
+/**
+ * TEST: kms fence pin leak
+ * Category: Display
+ * Description: Exercises full ppgtt fence pin_count leak in the kernel.
+ *
+ * SUBTEST:
+ * Description: Exercises full ppgtt fence pin_count leak in the kernel.
+ * Driver requirement: i915
+ * Functionality: kms_core, synchronization
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in the "
 		     "kernel.");
-- 
2.40.0


