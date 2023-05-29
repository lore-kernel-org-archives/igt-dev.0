Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F74B10E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:35:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 10:58:00 +0530
Message-Id: <20230529052835.860047-48-bhanuprakash.modem@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 47/82] tests/kms_dp_aux_dev: Document each
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
