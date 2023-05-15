Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643C510E17E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:46:56 +0530
Message-Id: <20230515081720.3713293-56-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 55/79] tests/kms_multipipe_modeset: Document each
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
 tests/kms_multipipe_modeset.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 1fdfb9a9f..a06a6c4b5 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -25,6 +25,20 @@
  */
 
 #include "igt.h"
+/**
+ * TEST: kms multipipe modeset
+ * Category: Display
+ * Description: Test simultaneous modeset on all the supported pipes
+ *
+ * SUBTEST: basic-max-pipe-crc-check
+ * Description: Verify if simultaneous modesets on all the supported pipes is
+ *              successful. Validate using CRC verification
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pipes");
 
-- 
2.40.0
