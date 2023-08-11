Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2130010E6EE
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:45 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:17 +0530
Message-Id: <20230811184655.157060-44-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 43/81] tests/kms_cursor_legacy: Document each
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

V2: - Document subtest 'modeset-atomic-cursor-hotspot'

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_legacy.c | 227 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 226 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 87cfb9e64..a8a7633fb 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -23,8 +23,9 @@
  */
 
 /**
- * TEST: Stress legacy cursor ioctl
+ * TEST: kms cursor legacy
  * Category: Display
+ * Description: Stress legacy cursor ioctl
  */
 
 #include <sched.h>
@@ -77,6 +78,28 @@ static void override_output_modes(igt_display_t *display,
 	igt_output_set_pipe(output2, PIPE_NONE);
 }
 
+/**
+ * SUBTEST: %s-%s
+ * Description: Test checks how many cursor updates we can fit between vblanks
+ *              on single/all pipes with different modes, priority and number
+ *              of processes
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @single:      Single
+ * @torture:     Torture
+ * @forked:      Forked
+ *
+ * arg[2]:
+ *
+ * @bo:          BO
+ * @move:        Move
+ */
 static void stress(igt_display_t *display,
 		   enum pipe pipe, int num_children, unsigned mode,
 		   int timeout)
@@ -550,11 +573,20 @@ enum basic_flip_cursor {
 /**
  * SUBTEST: basic-busy-flip-before-cursor-%s
  * Description: Cursor test with %arg[1] mode
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: cursor
  * Mega feature: General Display Features
  *
+ * SUBTEST: basic-busy-flip-before-cursor-varying-size
+ * Description: Change the size of cursor b/w 64*64 to maxw x maxh.
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
  * arg[1]:
  *
  * @atomic:	atomic
@@ -564,6 +596,7 @@ enum basic_flip_cursor {
 /**
  * SUBTEST: basic-flip-after-cursor-%s
  * Description: Cursor test with %arg[1]
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: cursor
@@ -571,6 +604,7 @@ enum basic_flip_cursor {
  *
  * SUBTEST: basic-flip-before-cursor-%s
  * Description: Cursor test with %arg[1]
+ * Driver requirement: any
  * Test category: functionality test
  * Run type: BAT
  * Functionality: cursor
@@ -582,6 +616,53 @@ enum basic_flip_cursor {
  * @legacy:        legacy mode
  * @varying-size:  varying size
  */
+
+/**
+ * SUBTEST: %s-flip-before-cursor-%s
+ * Description: Adds variety of tests:
+ *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
+ *		- atomic-transition: alternates between a full screen sprite plane
+ *		                     and full screen primary plane.\n"
+ *		- toggle: which toggles cursor visibility and make sure cursor moves
+ *		          between updates.
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @short:
+ * @short-busy:
+ *
+ * arg[2]:
+ *
+ * @atomic-transitions:
+ * @atomic-transitions-varying-size:
+ * @toggle:
+ */
+
+/**
+ * SUBTEST: short-flip-after-cursor-%s
+ * Description: Adds variety of tests:
+ *		- varying-size: change the size of cursor b/w 64*64 to maxw x maxh.\n
+ *		- atomic-transition: alternates between a full screen sprite plane
+ *		                     and full screen primary plane.\n"
+ *		- toggle: which toggles cursor visibility and make sure cursor moves
+ *		          between updates.
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic-transitions:
+ * @atomic-transitions-varying-size:
+ * @toggle:
+ */
 static void basic_flip_cursor(igt_display_t *display,
 			      enum flip_test mode,
 			      enum basic_flip_cursor order,
@@ -903,6 +984,25 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 		igt_remove_fb(display->drm_fd, &cursor_fb2);
 }
 
+/**
+ * SUBTEST: long-nonblocking-modeset-vs-cursor-atomic
+ * Description: Test checks how many cursor updates we can fit between vblanks
+ *              on all pipes with different modes, priority and number of processes
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: nonblocking-modeset-vs-cursor-atomic
+ * Description: Test checks how many cursor updates we can fit between vblanks
+ *              on all pipes with different modes, priority and number of processes
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 {
 	struct igt_fb fb_info, cursor_fb;
@@ -1002,6 +1102,44 @@ static void wait_for_modeset(igt_display_t *display, unsigned flags, int timeout
 	igt_reset_timeout();
 }
 
+/**
+ * SUBTEST: 2x-%s-%s
+ * Description: This test executes flips on both CRTCs while running cursor
+ *              updates in parallel
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @flip-vs-cursor:
+ * @flip-vs-cursor:
+ * @long-flip-vs-cursor:
+ * @long-flip-vs-cursor:
+ *
+ * arg[2]:
+ *
+ * @atomic:
+ * @legacy:
+ */
+
+/**
+ * SUBTEST: 2x-%s-atomic
+ * Description: This test executes flips on both CRTCs while running cursor
+ *              updates in parallel
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @long-nonblocking-modeset-vs-cursor:
+ * @nonblocking-modeset-vs-cursor:
+ */
 static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool modeset, bool atomic)
 {
 	struct drm_mode_cursor arg1[2], arg2[2];
@@ -1189,6 +1327,34 @@ done:
 	munmap((void *)shared, PAGE_SIZE);
 }
 
+/**
+ * SUBTEST: %s-%s
+ * Description: The essence of the basic test is that neither the cursor nor the
+ *              nonblocking flip stall the application of the next
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor-vs-flip:
+ * @cursorA-vs-flipA:
+ * @cursorA-vs-flipB:
+ * @cursorB-vs-flipA:
+ * @cursorB-vs-flipB:
+ * @flip-vs-cursor:
+ *
+ * arg[2]:
+ *
+ * @atomic:
+ * @atomic-transitions:
+ * @atomic-transitions-varying-size:
+ * @legacy:
+ * @toggle:
+ * @varying-size:
+ */
 static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloops)
 {
 	struct drm_mode_cursor arg[2];
@@ -1301,6 +1467,27 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 		igt_remove_fb(display->drm_fd, &cursor_fb2);
 }
 
+/**
+ * SUBTEST: 2x-%s-%s
+ * Description: This test executes flips on both CRTCs while running cursor updates in parallel
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @cursor-vs-flip:
+ * @cursor-vs-flip:
+ * @long-cursor-vs-flip:
+ * @long-cursor-vs-flip:
+ *
+ * arg[2]:
+ *
+ * @atomic:
+ * @legacy:
+ */
 static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool atomic)
 {
 	struct drm_mode_cursor arg[2][2];
@@ -1429,6 +1616,20 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	munmap((void *)shared, PAGE_SIZE);
 }
 
+/**
+ * SUBTEST: flip-vs-cursor-crc-%s
+ * Description: this test perform a page flip followed by a cursor update
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:
+ * @legacy:
+ */
 static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 {
 	struct drm_mode_cursor arg[2];
@@ -1501,6 +1702,20 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	igt_remove_fb(display->drm_fd, &cursor_fb);
 }
 
+/**
+ * SUBTEST: flip-vs-cursor-busy-crc-%s
+ * Description: this test perform a busy bo update followed by a cursor update
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @atomic:
+ * @legacy:
+ */
 static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 {
 	struct drm_mode_cursor arg[2];
@@ -1613,6 +1828,16 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	put_ahnd(ahnd);
 }
 
+/**
+ * SUBTEST: modeset-atomic-cursor-hotspot
+ * Description: Test changes the cursor hotspot and checks that the property is
+ *              updated accordignly
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 {
 	struct igt_fb cursor_fb;
-- 
2.40.0
