Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A346F10E3E1
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:57:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:19:06 +0530
Message-Id: <20230629144910.3055377-78-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 77/81] tests/kms_vblank: Document each subtest
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
 tests/kms_vblank.c | 69 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 1aa8c1083..86ff5fce8 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -40,6 +40,75 @@
 #include <sys/wait.h>
 
 #include <drm.h>
+/**
+ * TEST: kms vblank
+ * Category: Display
+ * Description: Test speed of WaitVblank.
+ *
+ * SUBTEST: crtc-id
+ * Description: check the Vblank and flip events works with given crtc id
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: invalid
+ * Description: Negative test for vblank request
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: pipe-%s-%s
+ * Description: Check if test run while hanging by introducing NOHANG flag (or)
+ *              Check if injected hang is working properly
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @A:
+ * @B:
+ * @C:
+ * @D:
+ * @E:
+ * @F:
+ * @G:
+ * @H:
+ *
+ * arg[2]:
+ *
+ * @accuracy-idle:
+ * @query-busy:
+ * @query-busy-hang:
+ * @query-forked:
+ * @query-forked-busy:
+ * @query-forked-busy-hang:
+ * @query-forked-hang:
+ * @query-idle:
+ * @query-idle-hang:
+ * @ts-continuation-dpms-rpm:
+ * @ts-continuation-dpms-suspend:
+ * @ts-continuation-idle:
+ * @ts-continuation-idle-hang:
+ * @ts-continuation-modeset:
+ * @ts-continuation-modeset-hang:
+ * @ts-continuation-modeset-rpm:
+ * @ts-continuation-suspend:
+ * @wait-busy:
+ * @wait-busy-hang:
+ * @wait-forked:
+ * @wait-forked-busy:
+ * @wait-forked-busy-hang:
+ * @wait-forked-hang:
+ * @wait-idle:
+ * @wait-idle-hang:
+ */
 
 IGT_TEST_DESCRIPTION("Test speed of WaitVblank.");
 
-- 
2.40.0
