Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F0510F377
 for <igt-dev@lists.freedesktop.org>; Tue, 10 May 2022 08:04:52 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 10 May 2022 13:32:01 +0530
Message-Id: <20220510080203.3319182-5-bhanuprakash.modem@intel.com>
In-Reply-To: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
References: <20220510080203.3319182-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v3 4/6] tests/kms_cursor_crc: Convert tests to dynamic
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

Convert the existing subtests to dynamic subtests at pipe level.

V2:
* Fix nested igt_fixture in igt_subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 192 ++++++++++++++++++++++++-----------------
 1 file changed, 114 insertions(+), 78 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 513c9715..126db6b8 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -688,125 +688,162 @@ static void test_rapid_movement(data_t *data)
 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
 }
 
-static void run_size_tests(data_t *data, enum pipe pipe,
+static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 			   int w, int h)
 {
 	char name[16];
+	enum pipe pipe;
 
 	if (w == 0 && h == 0)
 		strcpy(name, "max-size");
 	else
 		snprintf(name, sizeof(name), "%dx%d", w, h);
 
-	igt_fixture {
-		if (w == 0 && h == 0) {
-			w = data->cursor_max_w;
-			h = data->cursor_max_h;
-			/*
-			 * No point in doing the "max-size" test if
-			 * it was already covered by the other tests.
-			 */
-			igt_require_f(w != h || w > 512 || h > 512 ||
-				      !is_power_of_two(w) || !is_power_of_two(h),
-				      "Cursor max size %dx%d already covered by other tests\n",
-				      w, h);
-		}
-		create_cursor_fb(data, w, h);
+	if (w == 0 && h == 0) {
+		w = data->cursor_max_w;
+		h = data->cursor_max_h;
+		/*
+		 * No point in doing the "max-size" test if
+		 * it was already covered by the other tests.
+		 */
+		igt_require_f(w != h || w > 512 || h > 512 ||
+			      !is_power_of_two(w) || !is_power_of_two(h),
+			      "Cursor max size %dx%d already covered by other tests\n",
+			      w, h);
 	}
+	create_cursor_fb(data, w, h);
 
-	/* Using created cursor FBs to test cursor support */
-	igt_describe("Check if a given-size cursor is well-positioned inside the screen.");
-	igt_subtest_f("pipe-%s-cursor-%s-onscreen", kmstest_pipe_name(pipe), name)
-		run_test(data, test_crc_onscreen, w, h);
-
-	igt_describe("Check if a given-size cursor is well-positioned outside the "
-		     "screen.");
-	igt_subtest_f("pipe-%s-cursor-%s-offscreen", kmstest_pipe_name(pipe), name)
-		run_test(data, test_crc_offscreen, w, h);
-
-	igt_describe("Check the smooth and pixel-by-pixel given-size cursor "
-		     "movements on horizontal, vertical and diagonal.");
-	igt_subtest_f("pipe-%s-cursor-%s-sliding", kmstest_pipe_name(pipe), name)
-		run_test(data, test_crc_sliding, w, h);
-
-	igt_describe("Check random placement of a cursor with given size.");
-	igt_subtest_f("pipe-%s-cursor-%s-random", kmstest_pipe_name(pipe), name)
-		run_test(data, test_crc_random, w, h);
-
-	igt_describe("Check the rapid update of given-size cursor movements.");
-	igt_subtest_f("pipe-%s-cursor-%s-rapid-movement", kmstest_pipe_name(pipe), name)
-		run_test(data, test_rapid_movement, w, h);
+	for_each_pipe(&data->display, pipe) {
+		data->pipe = pipe;
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), name)
+			run_test(data, testfunc, w, h);
+	}
 
-	igt_fixture
-		igt_remove_fb(data->drm_fd, &data->fb);
+	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
-static void run_tests_on_pipe(data_t *data, enum pipe pipe)
+static void run_tests_on_pipe(data_t *data)
 {
+	enum pipe pipe;
 	int cursor_size;
+	int i;
+	struct {
+		const char *name;
+		void (*testfunc)(data_t *);
+		const char *desc;
+	} size_tests[] = {
+		{ "cursor-onscreen", test_crc_onscreen,
+			"Check if a given-size cursor is well-positioned inside the screen." },
+		{ "cursor-offscreen", test_crc_offscreen,
+			"Check if a given-size cursor is well-positioned outside the screen." },
+		{ "cursor-sliding", test_crc_sliding,
+			"Check the smooth and pixel-by-pixel given-size cursor movements on horizontal, vertical and diagonal." },
+		{ "cursor-random", test_crc_random,
+			"Check random placement of a cursor with given size." },
+		{ "cursor-rapid-movement", test_rapid_movement,
+			"Check the rapid update of given-size cursor movements." },
+	};
 
 	igt_fixture {
-		data->pipe = pipe;
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
 		data->alpha = 1.0;
+		data->flags = 0;
 	}
 
 	igt_describe("Create a maximum size cursor, then change the size in "
 		     "flight to smaller ones to see that the size is applied "
 		     "correctly.");
-	igt_subtest_f("pipe-%s-cursor-size-change", kmstest_pipe_name(pipe))
-		run_test(data, test_cursor_size,
-			 data->cursor_max_w, data->cursor_max_h);
+	igt_subtest_with_dynamic("cursor-size-change") {
+		for_each_pipe(&data->display, pipe) {
+			data->pipe = pipe;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_test(data, test_cursor_size,
+					 data->cursor_max_w, data->cursor_max_h);
+		}
+	}
 
 	igt_describe("Validates the composition of a fully opaque cursor "
 		     "plane, i.e., alpha channel equal to 1.0.");
-	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
-		run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
+	igt_subtest_with_dynamic("cursor-alpha-opaque") {
+		for_each_pipe(&data->display, pipe) {
+			data->pipe = pipe;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
+		}
+	}
 
 	igt_describe("Validates the composition of a fully transparent cursor "
 		     "plane, i.e., alpha channel equal to 0.0.");
-	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
-		run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
+	igt_subtest_with_dynamic("cursor-alpha-transparent") {
+		for_each_pipe(&data->display, pipe) {
+			data->pipe = pipe;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
+		}
+	}
 
 	igt_fixture {
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
 	}
 
-	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
-		data->flags = TEST_DPMS;
-		run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
+	igt_describe("Check random placement of a cursor with DPMS.");
+	igt_subtest_with_dynamic("cursor-dpms") {
+		for_each_pipe(&data->display, pipe) {
+			data->pipe = pipe;
+			data->flags = TEST_DPMS;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
+		}
+		data->flags = 0;
 	}
-	data->flags = 0;
 
-	igt_subtest_f("pipe-%s-cursor-suspend", kmstest_pipe_name(pipe)) {
-		data->flags = TEST_SUSPEND;
-		run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
+	igt_describe("Check random placement of a cursor with suspend.");
+	igt_subtest_with_dynamic("cursor-suspend") {
+		for_each_pipe(&data->display, pipe) {
+			data->pipe = pipe;
+			data->flags = TEST_SUSPEND;
+
+			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
+				run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
+		}
+		data->flags = 0;
 	}
-	data->flags = 0;
 
 	igt_fixture
 		igt_remove_fb(data->drm_fd, &data->fb);
 
-	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
-		int w = cursor_size;
-		int h = cursor_size;
-
-		igt_subtest_group
-			run_size_tests(data, pipe, w, h);
-
-		/*
-		 * Test non-square cursors a bit on the platforms
-		 * that support such things. And make it a bit more
-		 * interesting by using a non-pot height.
-		 */
-		h /= 3;
-
-		igt_subtest_group
-			run_size_tests(data, pipe, w, h);
+	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
+		igt_describe(size_tests[i].desc);
+		igt_subtest_group {
+			igt_subtest_with_dynamic_f("%s", size_tests[i].name) {
+				for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
+					int w = cursor_size;
+					int h = cursor_size;
+
+					igt_subtest_group
+						run_size_tests(data, size_tests[i].testfunc, w, h);
+
+					/*
+					 * Test non-square cursors a bit on the platforms
+					 * that support such things. And make it a bit more
+					 * interesting by using a non-pot height.
+					 */
+					h /= 3;
+
+					igt_subtest_group
+						run_size_tests(data, size_tests[i].testfunc, w, h);
+				}
+
+				igt_subtest_group
+					run_size_tests(data, size_tests[i].testfunc, 0, 0);
+			}
+		}
 	}
-
-	run_size_tests(data, pipe, 0, 0);
 }
 
 static data_t data;
@@ -815,7 +852,6 @@ igt_main
 {
 	uint64_t cursor_width = 64, cursor_height = 64;
 	int ret;
-	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -831,6 +867,7 @@ igt_main
 		igt_require_pipe_crc(data.drm_fd);
 
 		igt_display_require(&data.display, data.drm_fd);
+		igt_display_require_output(&data.display);
 		igt_display_reset(&data.display);
 		igt_display_commit2(&data.display, data.display.is_atomic ?
 				    COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -839,9 +876,8 @@ igt_main
 	data.cursor_max_w = cursor_width;
 	data.cursor_max_h = cursor_height;
 
-	for_each_pipe_static(pipe)
-		igt_subtest_group
-			run_tests_on_pipe(&data, pipe);
+	igt_subtest_group
+		run_tests_on_pipe(&data);
 
 	igt_fixture {
 		if (data.pipe_crc != NULL) {
-- 
2.35.1
