Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE74C10E3B7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:39:03 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:15 +0530
Message-Id: <20230517063323.4146387-14-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 13/81] tests/i915/kms_busy: Document each
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
 tests/i915/kms_busy.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index 20d3058fb..94590c86e 100644
--- a/tests/i915/kms_busy.c
+++ b/tests/i915/kms_busy.c
@@ -21,6 +21,11 @@
  * IN THE SOFTWARE.
  */
 
+/**
+ * TEST: kms busy
+ * Category: Display
+ * Description: Basic check of KMS ABI with busy framebuffers.
+ */
 #include <sys/poll.h>
 #include <signal.h>
 #include <time.h>
@@ -131,6 +136,23 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 	put_ahnd(ahnd);
 }
 
+/**
+ * SUBTEST: basic
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: basic-hang
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void test_flip(igt_display_t *dpy, int pipe,
 		      igt_output_t *output, bool modeset)
 {
@@ -223,6 +245,37 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 	put_ahnd(ahnd);
 }
 
+/**
+ * SUBTEST: extended-modeset-hang-%s
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @newfb:                New framebuffer
+ * @oldfb:                Old framebuffer
+ * @newfb-with-reset:     New framebuffer with reset
+ * @oldfb-with-reset:     Old framebuffer with reset
+ */
+
+/**
+ * SUBTEST: extended-pageflip-hang-%s
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @newfb:     New framebuffer
+ * @oldfb:     Old framebuffer
+ */
 static void test_hang(igt_display_t *dpy,
 		      enum pipe pipe, igt_output_t *output,
 		      bool modeset, bool hang_newfb)
@@ -270,6 +323,15 @@ static void test_hang(igt_display_t *dpy,
 	igt_remove_fb(dpy->drm_fd, &fb[0]);
 }
 
+/**
+ * SUBTEST: extended-pageflip-modeset-hang-oldfb
+ * Description: Test for basic check of KMS ABI with busy framebuffers.
+ * Driver requirement: i915
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void
 test_pageflip_modeset_hang(igt_display_t *dpy,
 			   igt_output_t *output, enum pipe pipe)
-- 
2.40.0


