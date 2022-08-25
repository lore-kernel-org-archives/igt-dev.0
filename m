Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4474410FE47
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Aug 2022 09:57:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, juhapekka.heikkila@gmail.com,
 swati2.sharma@intel.com
Date: Thu, 25 Aug 2022 15:25:03 +0530
Message-Id: <20220825095503.61189-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
References: <20220809165832.1717990-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2] tests/kms_cursor_crc: Add max-size test back
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

This patch reverts the max-size test but keeps the clean-up
part of the original commit.

This reverts commit 5a8fa05a824032aab4c8980727a075f71065e27c.

V2:
- Separate test for max-size

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 58 +++++++++++++++++++++++++-----------------
 1 file changed, 35 insertions(+), 23 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 14d4c4ca..53f18f4f 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -690,14 +690,26 @@ static void test_rapid_movement(data_t *data)
 static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 			   int w, int h)
 {
-	char name[32];
 	enum pipe pipe;
 
-	snprintf(name, sizeof(name), "%dx%d", w, h);
+	if (w == 0 && h == 0) {
+		w = data->cursor_max_w;
+		h = data->cursor_max_h;
+
+		/*
+		 * No point in doing the "max-size" test if
+		 * it was already covered by the other tests.
+		 */
+		if ((w == h) && (w <= 512) && (h <= 512) &&
+		    is_power_of_two(w) && is_power_of_two(h)) {
+			igt_info("Cursor max size %dx%d already covered by other tests\n", w, h);
+			return;
+		}
+	}
 
 	create_cursor_fb(data, w, h);
 	if (require_cursor_size(data, w, h)) {
-		igt_debug("Cursor size %dx%d not supported by driver\n", w, h);
+		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
 
 		igt_remove_fb(data->drm_fd, &data->fb);
 		return;
@@ -705,8 +717,8 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 
 	for_each_pipe(&data->display, pipe) {
 		data->pipe = pipe;
-		igt_dynamic_f("pipe-%s-%s-%s",
-			      kmstest_pipe_name(pipe), data->output->name, name)
+		igt_dynamic_f("pipe-%s-%s",
+			      kmstest_pipe_name(pipe), igt_output_name(data->output))
 			run_test(data, testfunc, w, h);
 	}
 
@@ -837,25 +849,25 @@ static void run_tests_on_pipe(data_t *data)
 	for (i = 0; i < ARRAY_SIZE(size_tests); i++) {
 		igt_describe(size_tests[i].desc);
 		igt_subtest_group {
-			igt_subtest_with_dynamic_f("%s", size_tests[i].name) {
-				for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
-					int w = cursor_size;
-					int h = cursor_size;
-
-					igt_subtest_group
-						run_size_tests(data, size_tests[i].testfunc, w, h);
-
-					/*
-					 * Test non-square cursors a bit on the platforms
-					 * that support such things. And make it a bit more
-					 * interesting by using a non-pot height.
-					 */
-					h /= 3;
-
-					igt_subtest_group
-						run_size_tests(data, size_tests[i].testfunc, w, h);
-				}
+			for (cursor_size = 32; cursor_size <= 512; cursor_size *= 2) {
+				int w = cursor_size;
+				int h = cursor_size;
+
+				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
+					run_size_tests(data, size_tests[i].testfunc, w, h);
+
+				/*
+				 * Test non-square cursors a bit on the platforms
+				 * that support such things. And make it a bit more
+				 * interesting by using a non-pot height.
+				 */
+				h /= 3;
+				igt_subtest_with_dynamic_f("%s-%dx%d", size_tests[i].name, w, h)
+					run_size_tests(data, size_tests[i].testfunc, w, h);
 			}
+
+			igt_subtest_with_dynamic_f("%s-max-size", size_tests[i].name)
+				run_size_tests(data, size_tests[i].testfunc, 0, 0);
 		}
 	}
 }
-- 
2.35.1
