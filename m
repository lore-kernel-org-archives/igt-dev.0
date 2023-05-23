Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 074D310E3D4
 for <igt-dev@lists.freedesktop.org>; Tue, 23 May 2023 06:39:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 23 May 2023 12:02:24 +0530
Message-Id: <20230523063243.669540-64-bhanuprakash.modem@intel.com>
In-Reply-To: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
References: <20230523063243.669540-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 63/82] tests/kms_plane_lowres: Document each
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
 tests/kms_plane_lowres.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index db9f5a54c..1d5635c97 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -22,6 +22,12 @@
  *
  */
 
+/**
+ * TEST: kms plane lowres
+ * Category: Display
+ * Description: Test atomic mode setting with a plane by switching between high
+ *              and low resolutions
+ */
 #include "igt.h"
 #include "drmtest.h"
 #include <errno.h>
@@ -261,6 +267,32 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+/**
+ * SUBTEST: tiling-none
+ * Description: Tests the visibility of the planes when switching between high
+ *              and low resolution with tiling-none
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: tiling-%s
+ * Description: Tests the visibility of the planes when switching between high
+ *              and low resolution with %arg[1]
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
