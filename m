Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBAB10E3E8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:55:44 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:01 +0530
Message-Id: <20230629144910.3055377-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 12/81] tests/i915/kms_busy: Document each
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
 tests/i915/kms_busy.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
index ecc7f02d9..e5a6049f2 100644
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
