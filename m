Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7688B10E3BA
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:38 +0530
Message-Id: <20230517063323.4146387-37-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 36/81] tests/kms_atomic_transition: Document
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
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_atomic_transition.c | 100 ++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 9f39d033d..446ce571f 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -21,6 +21,10 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms atomic transition
+ * Category: Display
+ */
 #include "igt.h"
 #include "igt_rand.h"
 #include "drmtest.h"
@@ -58,6 +62,15 @@ int *timeline;
 pthread_t *thread;
 int *seqno;
 
+/**
+ * SUBTEST: plane-primary-toggle-with-vblank-wait
+ * Description: Check toggling of primary plane with vblank
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void
 run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
@@ -470,6 +483,77 @@ static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking,
 	}
 }
 
+/**
+ * SUBTEST: plane-all-modeset-%s
+ * Description: Modeset test for all plane combinations %arg[1]
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition:                           default
+ * @transition-fencing:                   with fencing commit
+ */
+
+/**
+ * SUBTEST: plane-all-modeset-%s
+ * Description: Modeset test for all plane combinations %arg[1]
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: eDP
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition-fencing-internal-panels:   on internal panels with fencing commit
+ * @transition-internal-panels:           on internal panels
+ */
+
+/**
+ * SUBTEST: plane-all-%s
+ * Description: Transition test for all plane combinations %arg[1]
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition:                           default
+ * @transition-fencing:                   with fencing commit
+ * @transition-nonblocking:               with non-blocking commit
+ * @transition-nonblocking-fencing:       with non-blocking & fencing commit
+ */
+
+/**
+ * SUBTEST: plane-toggle-modeset-transition
+ * Description: Check toggling and modeset transition on plane
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: plane-use-after-nonblocking-%s
+ * Description: Transition test with non %arg[1] and make sure commit of disabled
+ *              plane has to complete before atomic commit on that plane
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @unbind:           blocking commit
+ * @unbind-fencing:   blocking commit with fencing
+ */
+
 /*
  * 1. Set primary plane to a known fb.
  * 2. Make sure getcrtc returns the correct fb id.
@@ -959,6 +1043,22 @@ retry:
 	}
 }
 
+/**
+ * SUBTEST: modeset-%s
+ * Description: Modeset transition tests for combinations of %arg[1]
+ * Driver requirement: any
+ * Functionality: watermark
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @transition:                     crtc enabled
+ * @transition-fencing:             crtc enabled with fencing commit
+ * @transition-nonblocking:         crtc enabled with nonblocking commit
+ * @transition-nonblocking-fencing: crtc enabled with nonblocking & fencing commit
+ */
 static void run_modeset_transition(data_t *data, int requested_outputs, bool nonblocking, bool fencing)
 {
 	igt_output_t *outputs[IGT_MAX_PIPES] = {};
-- 
2.40.0


