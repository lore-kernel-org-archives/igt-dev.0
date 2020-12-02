Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B989B6EA0E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Dec 2020 09:09:17 +0000 (UTC)
From: nidhi1.gupta@intel.com
Date: Wed,  2 Dec 2020 14:47:47 +0530
Message-Id: <20201202091747.409-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Check for available outputs
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nidhi Gupta <nidhi1.gupta@intel.com>

In kms_cursor_legacy will test all the
pipes defined in IGT which is 6 weather the output
is available or not.Later it has to be analysed and
discard it as valid skip.To save this time updated
in test to first check the available outputs and
then execute the test.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_cursor_legacy.c | 160 ++++++++++++++++++++------------------
 1 file changed, 86 insertions(+), 74 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9959fe32..1f2718ea 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1366,7 +1366,8 @@ igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
-	int i;
+	int i, count = 0;
+	enum pipe p;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1416,104 +1417,115 @@ igt_main
 	igt_subtest("all-pipes-torture-move")
 		stress(&display, -1, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
 
-	igt_subtest("nonblocking-modeset-vs-cursor-atomic")
-		nonblocking_modeset_vs_cursor(&display, 1);
+	igt_subtest_with_dynamic("dual-output-tests") {
+		for_each_pipe(&display, p) {
+			count++;
+		}
 
-	igt_subtest("long-nonblocking-modeset-vs-cursor-atomic")
-		nonblocking_modeset_vs_cursor(&display, 16);
+		igt_skip_on_f(count < 2, "Less than required outputs.\n");
 
-	igt_subtest("2x-flip-vs-cursor-legacy")
-		two_screens_flip_vs_cursor(&display, 8, false, false);
+		if (count >= 2) {
 
-	igt_subtest("2x-flip-vs-cursor-atomic")
-		two_screens_flip_vs_cursor(&display, 8, false, true);
+			igt_dynamic_f("nonblocking-modeset-vs-cursor-atomic")
+				nonblocking_modeset_vs_cursor(&display, 1);
 
-	igt_subtest("2x-cursor-vs-flip-legacy")
-		two_screens_cursor_vs_flip(&display, 8, false);
+			igt_dynamic_f("long-nonblocking-modeset-vs-cursor-atomic")
+				nonblocking_modeset_vs_cursor(&display, 16);
 
-	igt_subtest("2x-long-flip-vs-cursor-legacy")
-		two_screens_flip_vs_cursor(&display, 150, false, false);
+			igt_dynamic_f("2x-flip-vs-cursor-legacy")
+				two_screens_flip_vs_cursor(&display, 8, false, false);
 
-	igt_subtest("2x-long-flip-vs-cursor-atomic")
-		two_screens_flip_vs_cursor(&display, 150, false, true);
+			igt_dynamic_f("2x-flip-vs-cursor-atomic")
+				two_screens_flip_vs_cursor(&display, 8, false, true);
 
-	igt_subtest("2x-long-cursor-vs-flip-legacy")
-		two_screens_cursor_vs_flip(&display, 50, false);
+			igt_dynamic_f("2x-cursor-vs-flip-legacy")
+				two_screens_cursor_vs_flip(&display, 8, false);
 
-	igt_subtest("2x-nonblocking-modeset-vs-cursor-atomic")
-		two_screens_flip_vs_cursor(&display, 4, true, true);
+			igt_dynamic_f("2x-long-flip-vs-cursor-legacy")
+				two_screens_flip_vs_cursor(&display, 150, false, false);
 
-	igt_subtest("2x-cursor-vs-flip-atomic")
-		two_screens_cursor_vs_flip(&display, 8, true);
+			igt_dynamic_f("2x-long-flip-vs-cursor-atomic")
+				two_screens_flip_vs_cursor(&display, 150, false, true);
 
-	igt_subtest("2x-long-nonblocking-modeset-vs-cursor-atomic")
-		two_screens_flip_vs_cursor(&display, 15, true, true);
+			igt_dynamic_f("2x-long-cursor-vs-flip-legacy")
+				two_screens_cursor_vs_flip(&display, 50, false);
 
-	igt_subtest("2x-long-cursor-vs-flip-atomic")
-		two_screens_cursor_vs_flip(&display, 50, true);
+			igt_dynamic_f("2x-nonblocking-modeset-vs-cursor-atomic")
+				two_screens_flip_vs_cursor(&display, 4, true, true);
 
-	igt_subtest("flip-vs-cursor-crc-legacy")
-		flip_vs_cursor_crc(&display, false);
+			igt_dynamic_f("2x-cursor-vs-flip-atomic")
+				two_screens_cursor_vs_flip(&display, 8, true);
 
-	igt_subtest("flip-vs-cursor-crc-atomic")
-		flip_vs_cursor_crc(&display, true);
+			igt_dynamic_f("2x-long-nonblocking-modeset-vs-cursor-atomic")
+				two_screens_flip_vs_cursor(&display, 15, true, true);
 
-	igt_subtest("flip-vs-cursor-busy-crc-legacy")
-		flip_vs_cursor_busy_crc(&display, false);
+			igt_dynamic_f("2x-long-cursor-vs-flip-atomic")
+				two_screens_cursor_vs_flip(&display, 50, true);
 
-	igt_subtest("flip-vs-cursor-busy-crc-atomic")
-		flip_vs_cursor_busy_crc(&display, true);
+			igt_dynamic_f("flip-vs-cursor-crc-legacy")
+				flip_vs_cursor_crc(&display, false);
 
-	for (i = 0; i <= flip_test_last; i++) {
-		const char *modes[flip_test_last+1] = {
-			"legacy",
-			"varying-size",
-			"toggle",
-			"atomic",
-			"atomic-transitions",
-			"atomic-transitions-varying-size"
-		};
-		const char *prefix = "short-";
+			igt_dynamic_f("flip-vs-cursor-crc-atomic")
+				flip_vs_cursor_crc(&display, true);
 
-		switch (i) {
-		case flip_test_legacy:
-		case flip_test_varying_size:
-		case flip_test_atomic:
-			prefix = "basic-";
-			break;
-		default: break;
-		}
+			igt_dynamic_f("flip-vs-cursor-busy-crc-legacy")
+				flip_vs_cursor_busy_crc(&display, false);
 
-		igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
-			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
+			igt_dynamic_f("flip-vs-cursor-busy-crc-atomic")
+				flip_vs_cursor_busy_crc(&display, true);
 
-		if (!cursor_slowpath(i)) {
-			igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
-				igt_require_gem(display.drm_fd);
-				basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
-						  BASIC_BUSY);
-			}
-		}
+			for (i = 0; i <= flip_test_last; i++) {
+				const char *modes[flip_test_last+1] = {
+					"legacy",
+					"varying-size",
+					"toggle",
+					"atomic",
+					"atomic-transitions",
+					"atomic-transitions-varying-size"
+				};
+				const char *prefix = "short-";
 
-		igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
-			basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
+				switch (i) {
+				case flip_test_legacy:
+				case flip_test_varying_size:
+				case flip_test_atomic:
+					prefix = "basic-";
+					break;
+				default: break;
+				}
+
+				igt_dynamic_f("%sflip-before-cursor-%s", prefix, modes[i])
+					basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
+
+				if (!cursor_slowpath(i)) {
+					igt_dynamic_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
+						igt_require_gem(display.drm_fd);
+						basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
+								  BASIC_BUSY);
+					}
+				}
 
-		igt_subtest_f("flip-vs-cursor-%s", modes[i])
-			flip_vs_cursor(&display, i, 150);
-		igt_subtest_f("cursor-vs-flip-%s", modes[i])
-			cursor_vs_flip(&display, i, 50);
+				igt_dynamic_f("%sflip-after-cursor-%s", prefix, modes[i])
+					basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
 
-		igt_subtest_f("cursorA-vs-flipA-%s", modes[i])
-			flip(&display, 0, 0, 10, i);
+				igt_dynamic_f("flip-vs-cursor-%s", modes[i])
+					flip_vs_cursor(&display, i, 150);
+				igt_dynamic_f("cursor-vs-flip-%s", modes[i])
+					cursor_vs_flip(&display, i, 50);
 
-		igt_subtest_f("cursorA-vs-flipB-%s", modes[i])
-			flip(&display, 0, 1, 10, i);
+				igt_dynamic_f("cursorA-vs-flipA-%s", modes[i])
+					flip(&display, 0, 0, 10, i);
 
-		igt_subtest_f("cursorB-vs-flipA-%s", modes[i])
-			flip(&display, 1, 0, 10, i);
+				igt_dynamic_f("cursorA-vs-flipB-%s", modes[i])
+					flip(&display, 0, 1, 10, i);
 
-		igt_subtest_f("cursorB-vs-flipB-%s", modes[i])
-			flip(&display, 1, 1, 10, i);
+				igt_dynamic_f("cursorB-vs-flipA-%s", modes[i])
+					flip(&display, 1, 0, 10, i);
+
+				igt_dynamic_f("cursorB-vs-flipB-%s", modes[i])
+					flip(&display, 1, 1, 10, i);
+			}
+		}
 	}
 
 	igt_fixture {
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
