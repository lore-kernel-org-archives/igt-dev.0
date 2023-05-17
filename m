Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71C3610E3BB
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:33 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:30 +0530
Message-Id: <20230517063323.4146387-29-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 28/81] tests/i915/kms_psr2_su: Document each
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
 tests/i915/kms_psr2_su.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
index 65e67b8c9..0818d432c 100644
--- a/tests/i915/kms_psr2_su.c
+++ b/tests/i915/kms_psr2_su.c
@@ -30,6 +30,33 @@
 #include <stdio.h>
 #include <string.h>
 #include <sys/timerfd.h>
+/**
+ * TEST: kms psr2 su
+ * Category: Display
+ * Description: Test PSR2 selective update
+ *
+ * SUBTEST: frontbuffer-XRGB8888
+ * Description: Test that selective update works when screen changes
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: page_flip-%s
+ * Description: Test the selective update with %arg[1] when screen changes
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @NV12:        NV12 format
+ * @P010:        P010 format
+ * @XRGB8888:    XRGB8888 format
+ */
 
 IGT_TEST_DESCRIPTION("Test PSR2 selective update");
 
-- 
2.40.0


