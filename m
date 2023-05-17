Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73F410E3BE
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:21 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:03:05 +0530
Message-Id: <20230517063323.4146387-64-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 63/81] tests/kms_plane_multiple: Document each
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_multiple.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 7dd9d586d..6ee648b2d 100644
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
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: tiling-%s
+ * Description: Check that the kernel handles atomic updates of multiple planes
+ *              correctly by changing their geometry and making sure the changes
+ *              are reflected immediately after each commit.
+ * Driver requirement: i915
+ * Functionality: plane
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


