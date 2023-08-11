Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8681D10E6E6
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:09 +0530
Message-Id: <20230811184655.157060-36-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 35/81] tests/kms_atomic_interruptible: Document
 each subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_interruptible.c | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 2acdcb29d..6eb32265b 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -21,6 +21,11 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms atomic interruptible
+ * Category: Display
+ * Description: Tests that interrupt various atomic ioctls.
+ */
 #include <signal.h>
 
 #include "igt.h"
@@ -74,6 +79,61 @@ static drmEventContext drm_events = {
 	.page_flip_handler = ev_page_flip
 };
 
+/**
+ * SUBTEST: %s-setmode
+ * Description: Tests the interrupt properties of %arg[1] modeset
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:      atomic
+ * @legacy:      legacy
+ */
+
+/**
+ * SUBTEST: legacy-cursor
+ * Description: Tests the interrupt properties for Cursor
+ * Driver requirement: any
+ * Functionality: cursor, kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy-dpms
+ * Description: Tests the interrupt properties for DPMS
+ * Driver requirement: any
+ * Functionality: dpms, kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy-pageflip
+ * Description: Tests the interrupt properties for page flip
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: universal-setplane-%s
+ * Description: Tests the interrupt properties for %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_core, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:         Cursor plane
+ * @primary:        Primary plane
+ */
 static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
 			   enum plane_test_type test_type, unsigned plane_type)
 {
-- 
2.40.0
