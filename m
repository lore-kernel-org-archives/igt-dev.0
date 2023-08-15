Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECAA10E253
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:29 +0530
Message-Id: <20230815164815.320904-36-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 35/81] tests/kms_atomic_interruptible: Document
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

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic_interruptible.c | 60 ++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 2acdcb29d..c8a8ba447 100644
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
+ * Driver requirement: i915, xe
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
+ * Driver requirement: i915, xe
+ * Functionality: cursor, kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy-dpms
+ * Description: Tests the interrupt properties for DPMS
+ * Driver requirement: i915, xe
+ * Functionality: dpms, kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy-pageflip
+ * Description: Tests the interrupt properties for page flip
+ * Driver requirement: i915, xe
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: universal-setplane-%s
+ * Description: Tests the interrupt properties for %arg[1]
+ * Driver requirement: i915, xe
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
