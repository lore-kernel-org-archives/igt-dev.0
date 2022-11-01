Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054D10E0B4
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Nov 2022 17:13:30 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id 13so38737427ejn.3
 for <igt-dev@lists.freedesktop.org>; Tue, 01 Nov 2022 10:13:30 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  1 Nov 2022 19:13:17 +0200
Message-Id: <20221101171317.7038-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] Revert "tests/kms_cursor_crc: Convert tests
 to dynamic"
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

This reverts commit 9494d53d8283cd5775ebaf7ec20acdedae11b3fd.

This will restore possibility to run these cursor tests on vkms so that
all tests will report success/fail instead of crashing out.

Fixes: 9494d53d ("tests/kms_cursor_crc: Convert tests to dynamic") 

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_cursor_crc.c | 227 +++++++++++++++--------------------------
 1 file changed, 84 insertions(+), 143 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index d51c1f90..19cd0e21 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -589,7 +589,7 @@ static void test_cursor_opaque(data_t *data)
 	test_cursor_alpha(data);
 }
 
-static bool require_cursor_size(data_t *data, int w, int h)
+static void require_cursor_size(data_t *data, int w, int h)
 {
 	igt_fb_t primary_fb;
 	drmModeModeInfo *mode;
@@ -631,11 +631,14 @@ static bool require_cursor_size(data_t *data, int w, int h)
 	igt_remove_fb(data->drm_fd, &primary_fb);
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	return !!ret;
+	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
 }
 
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
 {
+	if (data->fb.fb_id != 0)
+		require_cursor_size(data, cursor_w, cursor_h);
+
 	prepare_crtc(data, cursor_w, cursor_h);
 	testfunc(data);
 	cleanup_crtc(data);
@@ -700,189 +703,125 @@ static void test_rapid_movement(data_t *data)
 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
 }
 
-static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
+static void run_size_tests(data_t *data, enum pipe pipe,
 			   int w, int h)
 {
-	enum pipe pipe;
+	char name[16];
 
-	if (w == 0 && h == 0) {
-		w = data->cursor_max_w;
-		h = data->cursor_max_h;
+	if (w == 0 && h == 0)
+		strcpy(name, "max-size");
+	else
+		snprintf(name, sizeof(name), "%dx%d", w, h);
 
-		/*
-		 * No point in doing the "max-size" test if
-		 * it was already covered by the other tests.
-		 */
-		if ((w == h) && (w <= 512) && (h <= 512) &&
-		    is_power_of_two(w) && is_power_of_two(h)) {
-			igt_info("Cursor max size %dx%d already covered by other tests\n", w, h);
-			return;
+	igt_fixture {
+		if (w == 0 && h == 0) {
+			w = data->cursor_max_w;
+			h = data->cursor_max_h;
+			/*
+			 * No point in doing the "max-size" test if
+			 * it was already covered by the other tests.
+			 */
+			igt_require_f(w != h || w > 512 || h > 512 ||
+				      !is_power_of_two(w) || !is_power_of_two(h),
+				      "Cursor max size %dx%d already covered by other tests\n",
+				      w, h);
 		}
+		create_cursor_fb(data, w, h);
 	}
 
-	create_cursor_fb(data, w, h);
-	if (require_cursor_size(data, w, h)) {
-		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
+	/* Using created cursor FBs to test cursor support */
+	igt_describe("Check if a given-size cursor is well-positioned inside the screen.");
+	igt_subtest_f("pipe-%s-cursor-%s-onscreen", kmstest_pipe_name(pipe), name)
+		run_test(data, test_crc_onscreen, w, h);
 
-		igt_remove_fb(data->drm_fd, &data->fb);
-		return;
-	}
+	igt_describe("Check if a given-size cursor is well-positioned outside the "
+		     "screen.");
+	igt_subtest_f("pipe-%s-cursor-%s-offscreen", kmstest_pipe_name(pipe), name)
+		run_test(data, test_crc_offscreen, w, h);
 
-	for_each_pipe(&data->display, pipe) {
-		data->pipe = pipe;
-		igt_dynamic_f("pipe-%s-%s",
-			      kmstest_pipe_name(pipe), igt_output_name(data->output))
-			run_test(data, testfunc, w, h);
-	}
+	igt_describe("Check the smooth and pixel-by-pixel given-size cursor "
+		     "movements on horizontal, vertical and diagonal.");
+	igt_subtest_f("pipe-%s-cursor-%s-sliding", kmstest_pipe_name(pipe), name)
+		run_test(data, test_crc_sliding, w, h);
 
-	igt_remove_fb(data->drm_fd, &data->fb);
+	igt_describe("Check random placement of a cursor with given size.");
+	igt_subtest_f("pipe-%s-cursor-%s-random", kmstest_pipe_name(pipe), name)
+		run_test(data, test_crc_random, w, h);
+
+	igt_describe("Check the rapid update of given-size cursor movements.");
+	igt_subtest_f("pipe-%s-cursor-%s-rapid-movement", kmstest_pipe_name(pipe), name)
+		run_test(data, test_rapid_movement, w, h);
+
+	igt_fixture
+		igt_remove_fb(data->drm_fd, &data->fb);
 }
 
-static void run_tests_on_pipe(data_t *data)
+static void run_tests_on_pipe(data_t *data, enum pipe pipe)
 {
-	enum pipe pipe;
 	int cursor_size;
-	int i;
-	struct {
-		const char *name;
-		void (*testfunc)(data_t *);
-		const char *desc;
-	} size_tests[] = {
-		{ "cursor-onscreen", test_crc_onscreen,
-			"Check if a given-size cursor is well-positioned inside the screen." },
-		{ "cursor-offscreen", test_crc_offscreen,
-			"Check if a given-size cursor is well-positioned outside the screen." },
-		{ "cursor-sliding", test_crc_sliding,
-			"Check the smooth and pixel-by-pixel given-size cursor movements on horizontal, vertical and diagonal." },
-		{ "cursor-random", test_crc_random,
-			"Check random placement of a cursor with given size." },
-		{ "cursor-rapid-movement", test_rapid_movement,
-			"Check the rapid update of given-size cursor movements." },
-	};
 
 	igt_fixture {
+		data->pipe = pipe;
 		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
 		igt_require(data->output);
 		data->alpha = 1.0;
-		data->flags = 0;
 	}
 
 	igt_describe("Create a maximum size cursor, then change the size in "
 		     "flight to smaller ones to see that the size is applied "
 		     "correctly.");
-	igt_subtest_with_dynamic("cursor-size-change") {
-		for_each_pipe(&data->display, pipe) {
-			data->pipe = pipe;
-
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name)
-				run_test(data, test_cursor_size,
-					 data->cursor_max_w, data->cursor_max_h);
-		}
-	}
+	igt_subtest_f("pipe-%s-cursor-size-change", kmstest_pipe_name(pipe))
+		run_test(data, test_cursor_size,
+			 data->cursor_max_w, data->cursor_max_h);
 
 	igt_describe("Validates the composition of a fully opaque cursor "
 		     "plane, i.e., alpha channel equal to 1.0.");
-	igt_subtest_with_dynamic("cursor-alpha-opaque") {
-		for_each_pipe(&data->display, pipe) {
-			data->pipe = pipe;
-
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name)
-				run_test(data, test_cursor_opaque,
-					 data->cursor_max_w, data->cursor_max_h);
-		}
-	}
+	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
+		run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_max_h);
 
 	igt_describe("Validates the composition of a fully transparent cursor "
 		     "plane, i.e., alpha channel equal to 0.0.");
-	igt_subtest_with_dynamic("cursor-alpha-transparent") {
-		for_each_pipe(&data->display, pipe) {
-			data->pipe = pipe;
-
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name)
-				run_test(data, test_cursor_transparent,
-					 data->cursor_max_w, data->cursor_max_h);
-		}
-	}
+	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pipe))
+		run_test(data, test_cursor_transparent, data->cursor_max_w, data->cursor_max_h);
 
 	igt_fixture {
 		create_cursor_fb(data, data->cursor_max_w, data->cursor_max_h);
 	}
 
-	igt_describe("Check random placement of a cursor with DPMS.");
-	igt_subtest_with_dynamic("cursor-dpms") {
-		for_each_pipe(&data->display, pipe) {
-			data->pipe = pipe;
-			data->flags = TEST_DPMS;
-
-			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
-				igt_debug("Cursor size %dx%d not supported by driver\n",
-					  data->cursor_max_w, data->cursor_max_h);
-				continue;
-			}
-
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name)
-				run_test(data, test_crc_random,
-					 data->cursor_max_w, data->cursor_max_h);
-		}
-		data->flags = 0;
+	igt_subtest_f("pipe-%s-cursor-dpms", kmstest_pipe_name(pipe)) {
+		data->flags = TEST_DPMS;
+		run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
 	}
+	data->flags = 0;
 
-	igt_describe("Check random placement of a cursor with suspend.");
-	igt_subtest_with_dynamic("cursor-suspend") {
-		for_each_pipe(&data->display, pipe) {
-			data->pipe = pipe;
-			data->flags = TEST_SUSPEND;
-
-			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
-				igt_debug("Cursor size %dx%d not supported by driver\n",
-					  data->cursor_max_w, data->cursor_max_h);
-				continue;
-			}
-
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(pipe),
-				      data->output->name)
-				run_test(data, test_crc_random,
-					 data->cursor_max_w, data->cursor_max_h);
-		}
-		data->flags = 0;
+	igt_subtest_f("pipe-%s-cursor-suspend", kmstest_pipe_name(pipe)) {
+		data->flags = TEST_SUSPEND;
+		run_test(data, test_crc_random, data->cursor_max_w, data->cursor_max_h);
 	}
+	data->flags = 0;
 
 	igt_fixture
 		igt_remove_fb(data->drm_fd, &data->fb);
 
-	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
-		igt_describe(size_tests[i].desc);
-		igt_subtest_group {
-			for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
-				int w = cursor_size;
-				int h = cursor_size;
-
-				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
-					run_size_tests(data, size_tests[i].testfunc, w, h);
-
-				/*
-				 * Test non-square cursors a bit on the platforms
-				 * that support such things. And make it a bit more
-				 * interesting by using a non-pot height.
-				 */
-				h /= 3;
-				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
-					run_size_tests(data, size_tests[i].testfunc, w, h);
-			}
+	for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
+		int w = cursor_size;
+		int h = cursor_size;
 
-			igt_subtest_with_dynamic_f("%s-max-size", size_tests[i].name)
-				run_size_tests(data, size_tests[i].testfunc, 0, 0);
-		}
+		igt_subtest_group
+			run_size_tests(data, pipe, w, h);
+
+		/*
+		 * Test non-square cursors a bit on the platforms
+		 * that support such things. And make it a bit more
+		 * interesting by using a non-pot height.
+		 */
+		h /= 3;
+
+		igt_subtest_group
+			run_size_tests(data, pipe, w, h);
 	}
+
+	run_size_tests(data, pipe, 0, 0);
 }
 
 static data_t data;
@@ -891,6 +830,7 @@ igt_main
 {
 	uint64_t cursor_width = 64, cursor_height = 64;
 	int ret;
+	enum pipe pipe;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -914,8 +854,9 @@ igt_main
 	data.cursor_max_w = cursor_width;
 	data.cursor_max_h = cursor_height;
 
-	igt_subtest_group
-		run_tests_on_pipe(&data);
+	for_each_pipe_static(pipe)
+		igt_subtest_group
+			run_tests_on_pipe(&data, pipe);
 
 	igt_fixture {
 		if (data.pipe_crc != NULL) {
-- 
2.25.1
