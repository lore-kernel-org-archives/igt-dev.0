Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7488510E205
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Sep 2023 07:54:23 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 18 Sep 2023 13:24:48 +0530
Message-Id: <20230918075448.247197-4-swati2.sharma@intel.com>
In-Reply-To: <20230918075448.247197-1-swati2.sharma@intel.com>
References: <20230918075448.247197-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_vblank: update testplan doc
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

After introducing dynamic subtests, testplan documentation needs
to be updated.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_vblank.c | 81 ++++++++--------------------------------------
 1 file changed, 13 insertions(+), 68 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 507421382..0433e7d46 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -56,107 +56,63 @@
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-dpms-rpm
+ * SUBTEST: ts-continuation-dpms-rpm
  * Description: Test TS continuty with DPMS & RPM while hanging by introducing
- *              NOHANG flag on %arg[1]
+ *              NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: dpms, hang, rpm, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-dpms-suspend
+ * SUBTEST: ts-continuation-dpms-suspend
  * Description: Test TS continuty with DPMS & Suspend while hanging by introducing
- *              NOHANG flag on %arg[1]
+ *              NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: dpms, hang, suspend, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-ts-continuation-suspend
+ * SUBTEST: ts-continuation-suspend
  * Description: Test TS continuty with Suspend while hanging by introducing NOHANG
- *              flag on %arg[1]
+ *              flag
  * Driver requirement: i915, xe
  * Functionality: hang, suspend, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
  * SUBTEST: pipe-%s-ts-continuation-modeset-rpm
  * Description: Test TS continuty during Modeset with Suspend while hanging by
- *              introducing NOHANG flag on %arg[1]
+ *              introducing NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: hang, rpm, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
- *
- * arg[1]:
- *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
  */
 
 /**
- * SUBTEST: pipe-%s-accuracy-idle
+ * SUBTEST: accuracy-idle
  * Description: Test Accuracy of vblank events while hanging by introducing NOHANG
- *              flag on %arg[1]
+ *              flag
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: pipe-%s-%s
- * Description: Test %arg[2] while hanging by introducing NOHANG flag on %arg[1]
+ * SUBTEST: %s
+ * Description: Test %arg[1] while hanging by introducing NOHANG flag
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * SUBTEST: pipe-%s-%s-hang
- * Description: Test %arg[2] with injected hang is working properly on %arg[1]
+ * SUBTEST: %s-hang
+ * Description: Test %arg[1] with injected hang is working properly
  * Driver requirement: i915, xe
  * Functionality: hang, vblank
  * Mega feature: General Display Features
@@ -164,17 +120,6 @@
  *
  * arg[1]:
  *
- * @A:     pipe A
- * @B:     pipe B
- * @C:     pipe C
- * @D:     pipe D
- * @E:     pipe E
- * @F:     pipe F
- * @G:     pipe G
- * @H:     pipe H
- *
- * arg[2]:
- *
  * @query-idle:              Time taken to Query vblank counters
  * @query-forked:            Time taken to Query vblank counters (multithreaded)
  * @query-busy:              Time taken to Query vblank counters (during V-active)
-- 
2.25.1
