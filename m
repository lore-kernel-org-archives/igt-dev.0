Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC0C10E3BB
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:32 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:25 +0530
Message-Id: <20230517063323.4146387-24-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 23/81] tests/i915/kms_legacy_colorkey: Document
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
 tests/i915/kms_legacy_colorkey.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
index 5b2fd64ba..b21e0f1a9 100644
--- a/tests/i915/kms_legacy_colorkey.c
+++ b/tests/i915/kms_legacy_colorkey.c
@@ -24,6 +24,27 @@
 #include "igt.h"
 #include <errno.h>
 
+/**
+ * TEST: kms legacy colorkey
+ * Category: Display
+ * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
+ *
+ * SUBTEST: basic
+ * Description: Test to check the legacy set colorkey ioctl only works for sprite planes.
+ * Driver requirement: i915
+ * Functionality: xorg_xv
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid-plane
+ * Description: Check invalid plane id's, zero and outrange
+ * Driver requirement: i915
+ * Functionality: xorg_xv
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on sprite planes.");
 
-- 
2.40.0


