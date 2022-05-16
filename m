Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E1910E172
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 14:09:21 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 19:36:09 +0530
Message-Id: <20220516140617.3428438-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220516140617.3428438-1-bhanuprakash.modem@intel.com>
References: <20220516140617.3428438-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V4 03/11] tests/kms_cursor_legacy: Convert tests to
 dynamic
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

Convert the existing subtests to dynamic subtests.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 254 +++++++++++++++++++++-----------------
 1 file changed, 141 insertions(+), 113 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 47b9b4e1..1e0b2a79 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1424,6 +1424,15 @@ igt_main
 	igt_display_t display = { .drm_fd = -1 };
 	bool intel_psr2_restore = false;
 	int i;
+	const char *modes[flip_test_last+1] = {
+		"legacy",
+		"varying-size",
+		"toggle",
+		"atomic",
+		"atomic-transitions",
+		"atomic-transitions-varying-size"
+	};
+	const char *prefix[2] = {"basic", "short"};
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1440,30 +1449,35 @@ igt_main
 
 	/*Test description for pipe-* and all-pipe-* tests*/
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-		     "on single pipe with different modes, priority and number of processes");
+		     "on single/all pipes with different modes, priority and number of processes");
 	igt_subtest_group {
 		enum pipe n;
-		for_each_pipe_static(n) {
-			errno = 0;
-
-			igt_fixture {
-				igt_require_pipe(&display, n);
-			}
+		struct {
+			const char *name;
+			int ncpus;
+			unsigned flags;
+		} tests[] = {
+			{ "single-bo", 1, DRM_MODE_CURSOR_BO },
+			{ "single-move", 1, DRM_MODE_CURSOR_MOVE },
+			{ "forked-bo", ncpus, DRM_MODE_CURSOR_BO },
+			{ "forked-move", ncpus, DRM_MODE_CURSOR_MOVE },
+			{ "torture-bo", -ncpus, DRM_MODE_CURSOR_BO },
+			{ "torture-move", -ncpus, DRM_MODE_CURSOR_MOVE },
+		};
 
-			igt_subtest_f("pipe-%s-single-bo", kmstest_pipe_name(n))
-				stress(&display, n, 1, DRM_MODE_CURSOR_BO, 20);
-			igt_subtest_f("pipe-%s-single-move", kmstest_pipe_name(n))
-				stress(&display, n, 1, DRM_MODE_CURSOR_MOVE, 20);
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			igt_subtest_with_dynamic(tests[i].name) {
+				for_each_pipe(&display, n) {
+					errno = 0;
 
-			igt_subtest_f("pipe-%s-forked-bo", kmstest_pipe_name(n))
-				stress(&display, n, ncpus, DRM_MODE_CURSOR_BO, 20);
-			igt_subtest_f("pipe-%s-forked-move", kmstest_pipe_name(n))
-				stress(&display, n, ncpus, DRM_MODE_CURSOR_MOVE, 20);
+					igt_dynamic_f("pipe-%s", kmstest_pipe_name(n))
+						stress(&display, n, tests[i].ncpus, tests[i].flags, 20);
+				}
 
-			igt_subtest_f("pipe-%s-torture-bo", kmstest_pipe_name(n))
-				stress(&display, n, -ncpus, DRM_MODE_CURSOR_BO, 20);
-			igt_subtest_f("pipe-%s-torture-move", kmstest_pipe_name(n))
-				stress(&display, n, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
+				errno = 0;
+				igt_dynamic("all-pipes")
+					stress(&display, -1, tests[i].ncpus, tests[i].flags, 20);
+			}
 		}
 	}
 
@@ -1471,22 +1485,6 @@ igt_main
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
 		    "on all pipes with different modes, priority and number of processes");
 	igt_subtest_group {
-
-		igt_subtest("all-pipes-single-bo")
-			stress(&display, -1, 1, DRM_MODE_CURSOR_BO, 20);
-		igt_subtest("all-pipes-single-move")
-			stress(&display, -1, 1, DRM_MODE_CURSOR_MOVE, 20);
-
-		igt_subtest("all-pipes-forked-bo")
-			stress(&display, -1, ncpus, DRM_MODE_CURSOR_BO, 20);
-		igt_subtest("all-pipes-forked-move")
-			stress(&display, -1, ncpus, DRM_MODE_CURSOR_MOVE, 20);
-
-		igt_subtest("all-pipes-torture-bo")
-			stress(&display, -1, -ncpus, DRM_MODE_CURSOR_BO, 20);
-		igt_subtest("all-pipes-torture-move")
-			stress(&display, -1, -ncpus, DRM_MODE_CURSOR_MOVE, 20);
-
 		igt_subtest("nonblocking-modeset-vs-cursor-atomic")
 			nonblocking_modeset_vs_cursor(&display, 1);
 
@@ -1498,36 +1496,49 @@ igt_main
 	igt_describe("This test executes flips on both CRTCs "
 		     "while running cursor updates in parallel");
 	igt_subtest_group {
+		struct {
+			const char *name;
+			int nloops;
+			bool modeset;
+			bool atomic;
+		} tests[] = {
+			{ "2x-flip-vs-cursor-legacy", 8, false, false },
+			{ "2x-flip-vs-cursor-atomic", 8, false, true },
+			{ "2x-long-flip-vs-cursor-legacy", 150, false, false },
+			{ "2x-long-flip-vs-cursor-atomic", 150, false, true },
+			{ "2x-nonblocking-modeset-vs-cursor-atomic", 4, true, true },
+			{ "2x-long-nonblocking-modeset-vs-cursor-atomic", 15, true, true },
+		};
 
-		igt_subtest("2x-flip-vs-cursor-legacy")
-			two_screens_flip_vs_cursor(&display, 8, false, false);
-
-		igt_subtest("2x-flip-vs-cursor-atomic")
-			two_screens_flip_vs_cursor(&display, 8, false, true);
-
-		igt_subtest("2x-cursor-vs-flip-legacy")
-			two_screens_cursor_vs_flip(&display, 8, false);
-
-		igt_subtest("2x-long-flip-vs-cursor-legacy")
-			two_screens_flip_vs_cursor(&display, 150, false, false);
-
-		igt_subtest("2x-long-flip-vs-cursor-atomic")
-			two_screens_flip_vs_cursor(&display, 150, false, true);
-
-		igt_subtest("2x-long-cursor-vs-flip-legacy")
-			two_screens_cursor_vs_flip(&display, 50, false);
-
-		igt_subtest("2x-nonblocking-modeset-vs-cursor-atomic")
-			two_screens_flip_vs_cursor(&display, 4, true, true);
-
-		igt_subtest("2x-cursor-vs-flip-atomic")
-			two_screens_cursor_vs_flip(&display, 8, true);
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			igt_subtest(tests[i].name)
+				two_screens_flip_vs_cursor(&display,
+							   tests[i].nloops,
+							   tests[i].modeset,
+							   tests[i].atomic);
+		}
+	}
 
-		igt_subtest("2x-long-nonblocking-modeset-vs-cursor-atomic")
-			two_screens_flip_vs_cursor(&display, 15, true, true);
+	igt_describe("This test executes flips on both CRTCs "
+		     "while running cursor updates in parallel");
+	igt_subtest_group {
+		struct {
+			const char *name;
+			int nloops;
+			bool atomic;
+		} tests[] = {
+			{ "2x-cursor-vs-flip-legacy", 8, false },
+			{ "2x-long-cursor-vs-flip-legacy", 50, false },
+			{ "2x-cursor-vs-flip-atomic", 8, true },
+			{ "2x-long-cursor-vs-flip-atomic", 50, true },
+		};
 
-		igt_subtest("2x-long-cursor-vs-flip-atomic")
-			two_screens_cursor_vs_flip(&display, 50, true);
+		for (i = 0; i < ARRAY_SIZE(tests); i++) {
+			igt_subtest(tests[i].name)
+				two_screens_cursor_vs_flip(&display,
+							   tests[i].nloops,
+							   tests[i].atomic);
+		}
 	}
 
 	/*Test description for cursor-crc tests*/
@@ -1556,69 +1567,86 @@ igt_main
 			flip_vs_cursor_busy_crc(&display, true);
 	}
 
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
+	for (i = 0; i < ARRAY_SIZE(prefix); i++) {
+		int j;
 
-		switch (i) {
-		case flip_test_legacy:
-		case flip_test_varying_size:
-		case flip_test_atomic:
-			prefix = "basic-";
-			break;
-		default: break;
-		}
-
-	igt_describe("Adds variety of tests: "
-		     "varying-size: change the size of cursor b/w 64*64 to maxw x maxh. "
-		     "atomic-transition: alternates between a full screen sprite plane. "
+		igt_describe("Adds variety of tests: "
+			"varying-size: change the size of cursor b/w 64*64 to maxw x maxh. "
+			"atomic-transition: alternates between a full screen sprite plane. "
 						"and full screen primary plane. "
-		     "toggle: which toggles cursor visibility and make sure cursor moves between updates.");
-	igt_subtest_group {
-		igt_subtest_f("%sflip-before-cursor-%s", prefix, modes[i])
-			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR, 0);
-
-		igt_subtest_f("%sbusy-flip-before-cursor-%s", prefix, modes[i]) {
-			igt_require(!cursor_slowpath(&display, i));
-			igt_require_gem(display.drm_fd);
-			basic_flip_cursor(&display, i, FLIP_BEFORE_CURSOR,
-					  BASIC_BUSY);
-		}
-	}
-
-		igt_describe("The essence of the basic test is that neither the cursor nor the "
-			     "nonblocking flip stall the application of the next");
+			"toggle: which toggles cursor visibility and make sure cursor moves between updates.");
 		igt_subtest_group {
+			igt_subtest_with_dynamic_f("%s-flip-before-cursor", prefix[i]) {
+				for (j = 0; j <= flip_test_last; j++) {
+					igt_dynamic_f("%s", modes[j])
+						basic_flip_cursor(&display, j, FLIP_BEFORE_CURSOR, 0);
+				}
+			}
 
-			igt_subtest_f("%sflip-after-cursor-%s", prefix, modes[i])
-				basic_flip_cursor(&display, i, FLIP_AFTER_CURSOR, 0);
+			igt_subtest_with_dynamic_f("%s-busy-flip-before-cursor", prefix[i]) {
+				igt_require(!cursor_slowpath(&display, i));
+				igt_require_gem(display.drm_fd);
 
-			igt_subtest_f("flip-vs-cursor-%s", modes[i])
-				flip_vs_cursor(&display, i, 150);
+				for (j = 0; j <= flip_test_last; j++) {
+					igt_dynamic_f("%s", modes[j])
+						basic_flip_cursor(&display, j, FLIP_BEFORE_CURSOR, BASIC_BUSY);
+				}
+			}
 
-			igt_subtest_f("cursor-vs-flip-%s", modes[i])
-				cursor_vs_flip(&display, i, 50);
+			igt_subtest_with_dynamic_f("%s-flip-after-cursor", prefix[i]) {
+				for (j = 0; j <= flip_test_last; j++) {
+					igt_dynamic_f("%s", modes[j])
+						basic_flip_cursor(&display, j, FLIP_AFTER_CURSOR, 0);
+				}
+			}
+		}
+	}
 
-			igt_subtest_f("cursorA-vs-flipA-%s", modes[i])
-				flip(&display, 0, 0, 10, i);
+	igt_describe("The essence of the basic test is that neither the cursor nor the "
+		     "nonblocking flip stall the application of the next");
+	igt_subtest_group {
+		igt_subtest_with_dynamic("flip-vs-cursor") {
+			for (i = 0; i <= flip_test_last; i++) {
+				igt_dynamic_f("%s", modes[i])
+					flip_vs_cursor(&display, i, 150);
+			}
+		}
+
+		igt_subtest_with_dynamic("cursor-vs-flip") {
+			for (i = 0; i <= flip_test_last; i++) {
+				igt_dynamic_f("%s", modes[i])
+					cursor_vs_flip(&display, i, 50);
+			}
+		}
+
+		igt_subtest_with_dynamic("cursorA-vs-flipA") {
+			for (i = 0; i <= flip_test_last; i++) {
+				igt_dynamic_f("%s", modes[i])
+					flip(&display, 0, 0, 10, i);
+			}
+		}
 
-			igt_subtest_f("cursorA-vs-flipB-%s", modes[i])
-				flip(&display, 0, 1, 10, i);
+		igt_subtest_with_dynamic("cursorA-vs-flipB") {
+			for (i = 0; i <= flip_test_last; i++) {
+				igt_dynamic_f("%s", modes[i])
+					flip(&display, 0, 1, 10, i);
+			}
+		}
 
-			igt_subtest_f("cursorB-vs-flipA-%s", modes[i])
-				flip(&display, 1, 0, 10, i);
+		igt_subtest_with_dynamic("cursorB-vs-flipA") {
+			for (i = 0; i <= flip_test_last; i++) {
+				igt_dynamic_f("%s", modes[i])
+					flip(&display, 1, 0, 10, i);
+			}
+		}
 
-			igt_subtest_f("cursorB-vs-flipB-%s", modes[i])
-				flip(&display, 1, 1, 10, i);
+		igt_subtest_with_dynamic("cursorB-vs-flipB") {
+			for (i = 0; i <= flip_test_last; i++) {
+				igt_dynamic_f("%s", modes[i])
+					flip(&display, 1, 1, 10, i);
 			}
 		}
+	}
 
 	igt_fixture {
 		if (intel_psr2_restore)
-- 
2.35.1
