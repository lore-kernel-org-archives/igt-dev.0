Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1420C10E264
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:57:35 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:56 +0530
Message-Id: <20230815164815.320904-63-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 62/81] tests/kms_plane_multiple: Document each
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

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_multiple.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1f2bd65c3..c381d2e5a 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -22,6 +22,11 @@
  *
  */
 
+/**
+ * TEST: kms plane multiple
+ * Category: Display
+ * Description: Test atomic mode setting with multiple planes.
+ */
 #include "igt.h"
 #include "drmtest.h"
 #include <errno.h>
@@ -373,6 +378,34 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
 					n_planes, modifier);
 }
 
+/**
+ * SUBTEST: tiling-none
+ * Description: Check that the kernel handles atomic updates of multiple planes
+ *              correctly by changing their geometry and making sure the changes
+ *              are reflected immediately after each commit.
+ * Driver requirement: i915, xe
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: tiling-%s
+ * Description: Check that the kernel handles atomic updates of multiple planes
+ *              correctly by changing their geometry and making sure the changes
+ *              are reflected immediately after each commit.
+ * Driver requirement: i915, xe
+ * Functionality: plane, tiling
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @4:           4-tiling
+ * @x:           x-tiling
+ * @y:           y-tiling
+ * @yf:          yf-tiling
+ */
 static void run_test(data_t *data, uint64_t modifier)
 {
 	enum pipe pipe;
-- 
2.40.0
