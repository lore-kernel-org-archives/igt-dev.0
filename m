Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5441310E3E3
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:41 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:24 +0530
Message-Id: <20230629144910.3055377-36-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 35/81] tests/kms_atomic_interruptible: Document
 each subtest for testplan
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
 tests/kms_atomic_interruptible.c | 50 ++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 2acdcb29d..10bfa6c1b 100644
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
@@ -74,6 +79,51 @@ static drmEventContext drm_events = {
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
+ * SUBTEST: legacy-%s
+ * Description: Tests the interrupt properties for %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor:         Cursor
+ * @dpms:           DPMS
+ * @pageflip:       Page flip
+ */
+
+/**
+ * SUBTEST: universal-setplane-%s
+ * Description: Tests the interrupt properties for %arg[1]
+ * Driver requirement: any
+ * Functionality: kms_core
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
