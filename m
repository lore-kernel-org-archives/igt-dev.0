Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDFE10E3E3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:01 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:16 +0530
Message-Id: <20230629144910.3055377-28-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 27/81] tests/i915/kms_psr2_sf: Document each
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
 tests/i915/kms_psr2_sf.c | 85 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index b4734e5f1..60946ed92 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -30,6 +30,91 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+/**
+ * TEST: kms psr2 sf
+ * Category: Display
+ * Description: Tests to varify PSR2 selective fetch by sending multiple damaged
+ *              areas
+ *
+ * SUBTEST: %s-plane-move-continuous-%s
+ * Description: Test that selective fetch works on moving %arg[1] plane %arg[2]
+ *              visible area (no update)
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:               Cursor
+ * @overlay:              Overlay
+ *
+ * arg[2]:
+ *
+ * @exceed-fully-sf:      exceeding fully
+ * @exceed-sf:            exceeding paritally
+ * @sf:                   default
+ */
+
+/**
+ * SUBTEST: cursor-plane-update-sf
+ * Description: Test that selective fetch works on cursor plane
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: overlay-plane-update-continuous-sf
+ * Description: Test that selective fetch works on overlay plane
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: overlay-plane-update-sf-dmg-area
+ * Description: Test that selective fetch works on overlay plane
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: overlay-primary-update-sf-dmg-area
+ * Description: Test that selective fetch works on primary plane with blended
+ *              overlay plane
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-move-sf-dmg-area
+ * Description: Test that selective fetch works on moving overlay plane
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: primary-plane-update-sf-dmg-area
+ * Description: Test that selective fetch works on primary plane
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: primary-plane-update-sf-dmg-area-big-fb
+ * Description: Test that selective fetch works on primary plane with big fb
+ * Driver requirement: any
+ * Functionality: psr2
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Tests to varify PSR2 selective fetch by sending multiple"
 		     " damaged areas");
-- 
2.40.0
