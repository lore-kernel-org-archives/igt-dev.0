Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382B210E3BC
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:50 +0530
Message-Id: <20230517063323.4146387-49-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 48/81] tests/kms_flip: Document each subtest
 for testplan
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
 tests/kms_flip.c | 178 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 2 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index f1e0700c1..e5a4406b9 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -22,8 +22,9 @@
  */
 
 /**
- * TEST: Tests for validating modeset, dpms and pageflips
+ * TEST: kms flip
  * Category: Display
+ * Description: Tests for validating modeset, dpms and pageflips
  */
 
 #include "config.h"
@@ -39,6 +40,169 @@
 #include <sys/poll.h>
 #include <sys/time.h>
 #include <sys/ioctl.h>
+/**
+ * SUBTEST: 2x-flip-vs-fences
+ * Description: Test for validating modeset, dpms and pageflips with a pair of connected displays
+ * Driver requirement: i915
+ * Functionality: gtt, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-flip-vs-fences-interruptible
+ * Description: Interrupt test for validating modeset, dpms and pageflips with pair of connected displays
+ * Driver requirement: any
+ * Functionality: gtt, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flip-vs-fences
+ * Description: Basic test for validating modeset, dpms and pageflips
+ * Driver requirement: i915
+ * Functionality: gtt, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: flip-vs-fences-interruptible
+ * Description: Interrupt test for validating modeset, dpms and pageflips
+ * Driver requirement: i915
+ * Functionality: gtt, vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
+
+/**
+ * SUBTEST: %s
+ * Description: Basic test for validating modeset, dpms and pageflips
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @dpms-off-confusion:
+ * @bo-too-big:
+ */
+
+/**
+ * SUBTEST: %s
+ * Description: Basic test for validating modeset, dpms and pageflips
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-%s
+ * Description: Test for validating modeset, dpms and pageflips with a pair of
+ *              connected displays
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @wf_vblank-ts-check:
+ * @blocking-wf_vblank:
+ * @absolute-wf_vblank:
+ * @blocking-absolute-wf_vblank:
+ * @busy-flip:
+ * @plain-flip-ts-check:
+ * @plain-flip-fb-recreate:
+ * @flip-vs-rmfb:
+ * @flip-vs-panning:
+ * @flip-vs-expired-vblank:
+ * @flip-vs-absolute-wf_vblank:
+ * @flip-vs-blocking-wf-vblank:
+ * @flip-vs-modeset-vs-hang:
+ * @flip-vs-panning-vs-hang:
+ * @flip-vs-dpms-off-vs-modeset:
+ * @single-buffer-flip-vs-dpms-off-vs-modeset:
+ * @nonexisting-fb:
+ * @dpms-vs-vblank-race:
+ * @modeset-vs-vblank-race:
+ * @flip-vs-suspend:
+ */
+
+/**
+ * SUBTEST: 2x-%s
+ * Description: Test for validating modeset, dpms and pageflips with a pair of
+ *              connected displays
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @plain-flip:
+ * @flip-vs-dpms:
+ * @flip-vs-modeset:
+ * @flip-vs-wf_vblank:
+ */
+
+/**
+ * SUBTEST: %s-interruptible
+ * Description: Basic test for validating modeset, dpms and pageflips
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @dpms-off-confusion:
+ * @bo-too-big:
+ */
+
+/**
+ * SUBTEST: %s-interruptible
+ * Description: Basic test for validating modeset, dpms and pageflips
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: 2x-%s-interruptible
+ * Description: Test for validating modeset, dpms and pageflips with a pair of
+ *              connected displays
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @wf_vblank-ts-check:
+ * @absolute-wf_vblank:
+ * @blocking-absolute-wf_vblank:
+ * @plain-flip:
+ * @plain-flip-ts-check:
+ * @plain-flip-fb-recreate:
+ * @flip-vs-rmfb:
+ * @flip-vs-panning:
+ * @flip-vs-expired-vblank:
+ * @flip-vs-absolute-wf_vblank:
+ * @flip-vs-wf_vblank:
+ * @flip-vs-dpms-off-vs-modeset:
+ * @single-buffer-flip-vs-dpms-off-vs-modeset:
+ * @nonexisting-fb:
+ * @dpms-vs-vblank-race:
+ * @modeset-vs-vblank-race:
+ * @flip-vs-suspend:
+ */
+
 #ifdef HAVE_LINUX_KD_H
 #include <linux/kd.h>
 #elif HAVE_SYS_KD_H
@@ -1564,6 +1728,7 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
 /**
  * SUBTEST: basic-flip-vs-%s
  * Description: Basic test to valide %arg[1]
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: vblank
@@ -1577,12 +1742,12 @@ static void run_test_on_crtc_set(struct test_output *o, int *crtc_idxs,
  *
  * SUBTEST: basic-plain-flip
  * Description: Basic test for validating page flip
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: vblank
  * Mega feature: General Display Features
  */
-
 static void run_test(int duration, int flags)
 {
 	struct test_output o;
@@ -1759,6 +1924,15 @@ static void kms_flip_exit_handler(int sig)
 		kmstest_set_connector_dpms(drm_fd, last_connector, DRM_MODE_DPMS_ON);
 }
 
+/**
+ * SUBTEST: nonblocking-read
+ * Description: Tests that nonblocking reading fails correctly
+ * Driver requirement: any
+ * Functionality: vblank
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_nonblocking_read(int in)
 {
 	char buffer[1024];
-- 
2.40.0


