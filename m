Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1FF910E187
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:47:02 +0530
Message-Id: <20230515081720.3713293-62-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 61/79] tests/kms_plane_lowres: Document each
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
