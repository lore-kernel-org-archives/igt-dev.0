Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521AC6E8BB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 04:18:26 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Tue,  2 Mar 2021 09:57:36 +0530
Message-Id: <20210302042736.28431-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_legacy: added test
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_cursor_legacy.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 6034ad04..746e1153 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1365,6 +1365,9 @@ igt_main
 		igt_display_require(&display, display.drm_fd);
 	}
 
+	/*Test description for pipe-* and all-pipe-* tests*/
+	igt_describe("Test checks how many cursor updates we can fit between vblanks"
+		     "on single pipe with different modes, priority and number of processes");
 	igt_subtest_group {
 		enum pipe n;
 		for_each_pipe_static(n) {
@@ -1412,6 +1415,10 @@ igt_main
 	igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
 		nonblocking_modeset_vs_cursor(&display, 16);
 
+	/*Test Description for 2x-* tests*/
+	igt_describe("This test executes flips on both CRTCs"
+		     "while running cursor updates in parallel");
+
 	igt_subtest("2x-flip-vs-cursor-legacy")
 		two_screens_flip_vs_cursor(&display, 8, false, false);
 
@@ -1442,18 +1449,28 @@ igt_main
 	igt_subtest("2x-long-cursor-vs-flip-atomic")
 		two_screens_cursor_vs_flip(&display, 50, true);
 
+	/*Test description for cursor-crc tests*/
+	igt_describe("Test will first does a page flip and then cursor update");
 	igt_subtest("flip-vs-cursor-crc-legacy")
 		flip_vs_cursor_crc(&display, false);
 
 	igt_subtest("flip-vs-cursor-crc-atomic")
 		flip_vs_cursor_crc(&display, true);
 
+	/*Test description for busy-crc tests*/
+	igt_describe("this test perform a busy bo update followed by a cursor update");
 	igt_subtest("flip-vs-cursor-busy-crc-legacy")
 		flip_vs_cursor_busy_crc(&display, false);
 
 	igt_subtest("flip-vs-cursor-busy-crc-atomic")
 		flip_vs_cursor_busy_crc(&display, true);
 
+	igt_describe("Adds variety of tests:"
+		     "varying-size: change the size of cursor b/w 64*64 to maxw x maxh"
+		     "atomic-transition: alternates between a full screen sprite plane"
+				         "and full screen primary plane"
+		     "toggle: which toggles cursor visibility and make sure cursor moves"
+			      "between updates");
 	for (i = 0; i <= flip_test_last; i++) {
 		const char *modes[flip_test_last+1] = {
 			"legacy",
@@ -1485,11 +1502,14 @@ igt_main
 			}
 		}
 
+		igt_describe("The essence of the basic test is that neither the cursor nor the"
+			     "nonblocking flip stall the application of the next");
 		igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
 			basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
 
 		igt_subtest_f("flip-vs-cursor-%s", modes[i])
 			flip_vs_cursor(&display, i, 150);
+
 		igt_subtest_f("cursor-vs-flip-%s", modes[i])
 			cursor_vs_flip(&display, i, 50);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
