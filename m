Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF82C10E3E1
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:19 +0530
Message-Id: <20230629144910.3055377-31-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 30/81] tests/i915/kms_pwrite_crc: Document each
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
 tests/i915/kms_pwrite_crc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
index 7bddeecba..38f466bae 100644
--- a/tests/i915/kms_pwrite_crc.c
+++ b/tests/i915/kms_pwrite_crc.c
@@ -29,6 +29,21 @@
 #include <stdio.h>
 #include <string.h>
 
+/**
+ * TEST: kms pwrite crc
+ * Category: Display
+ * Description: Use the display CRC support to validate pwrite to an already
+ *              uncached future scanout buffer.
+ *
+ * SUBTEST:
+ * Description: Use the display CRC support to validate pwrite to an already
+ *              uncached future scanout buffer.
+ * Driver requirement: i915
+ * Functionality: kms_gem_interop
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate pwrite to an already uncached future scanout buffer.");
-- 
2.40.0
