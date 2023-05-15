Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828CE10E17D
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:23:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:46:46 +0530
Message-Id: <20230515081720.3713293-46-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 45/79] tests/kms_dp_aux_dev: Document each subtest
 for testplan
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
 tests/kms_dp_aux_dev.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 69edc1585..fc8cb91e3 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -31,6 +31,19 @@
 
 #include "igt.h"
 #include "igt_kms.h"
+/**
+ * TEST: kms dp aux dev
+ * Category: Display
+ * Description: Test that /dev/drm_dp_aux reads work
+ *
+ * SUBTEST:
+ * Description: Test that /dev/drm_dp_aux reads work
+ * Driver requirement: any
+ * Functionality: dp
+ * Mega feature: DP
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
 
-- 
2.40.0
