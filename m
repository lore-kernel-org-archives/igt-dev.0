Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B6010E403
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:57:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:04 +0530
Message-Id: <20230629144910.3055377-76-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 75/81] tests/kms_tv_load_detect: Document each
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
index c8e5338d2..ceefe26d2 100644
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
