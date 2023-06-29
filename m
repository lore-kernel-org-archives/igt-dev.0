Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DDD710E3FF
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:51 +0530
Message-Id: <20230629144910.3055377-63-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 62/81] tests/kms_plane_lowres: Document each
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
 tests/kms_plane_lowres.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index 7aaf83c41..65d1dd183 100644
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
@@ -261,6 +267,24 @@ static void test_cleanup(data_t *data)
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
+/**
+ * SUBTEST: tiling-%s
+ * Description: Tests the visibility of the planes when switching between high
+ *              and low resolution with %arg[1]
+ * Driver requirement: any
+ * Functionality: plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @none:        Linear buffer (no tiling)
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
