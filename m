Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C2B10E3E8
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:38:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:01:52 +0530
Message-Id: <20230523063243.669540-32-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 31/82] tests/i915/kms_pwrite_crc: Document each
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
index 3278d876d..7a358d045 100644
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
