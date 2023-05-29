Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE9DF10E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 05:35:40 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 29 May 2023 10:58:29 +0530
Message-Id: <20230529052835.860047-77-bhanuprakash.modem@intel.com>
In-Reply-To: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 76/82] tests/kms_tv_load_detect: Document each
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
 tests/kms_tv_load_detect.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 80ced9918..5cbe6f65f 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -23,6 +23,19 @@
  */
 
 #include "igt.h"
+/**
+ * TEST: kms tv load detect
+ * Category: Display
+ * Description: Check tv load detection works correctly.
+ *
+ * SUBTEST: load-detect
+ * Description: Check tv load detection works correctly.
+ * Driver requirement: any
+ * Functionality: obsolete
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
 
-- 
2.40.0
