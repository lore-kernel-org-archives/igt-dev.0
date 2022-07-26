Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF44118B29C
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jul 2022 03:13:50 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 petri.latvala@intel.com
Date: Tue, 26 Jul 2022 08:41:16 +0530
Message-Id: <20220726031116.974261-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_cursor_crc: Drop max-size test
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

As we already covering it by the other tests, there is no point in
doing the "max-size" test. Hence dropping it.

This patch will also do some cleanup to avoid skips in igt_dynamic.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 47 ++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 25 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index f07a045a..14d4c4ca 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -576,7 +576,7 @@ static void test_cursor_opaque(data_t *data)
 	test_cursor_alpha(data);
 }
 
-static void require_cursor_size(data_t *data, int w, int h)
+static bool require_cursor_size(data_t *data, int w, int h)
 {
 	igt_fb_t primary_fb;
 	drmModeModeInfo *mode;
@@ -618,14 +618,11 @@ static void require_cursor_size(data_t *data, int w, int h)
 	igt_remove_fb(data->drm_fd, &primary_fb);
 	igt_output_set_pipe(output, PIPE_NONE);
 
-	igt_skip_on_f(ret, "Cursor size %dx%d not supported by driver\n", w, h);
+	return !!ret;
 }
 
 static void run_test(data_t *data, void (*testfunc)(data_t *), int cursor_w, int cursor_h)
 {
-	if (data->fb.fb_id != 0)
-		require_cursor_size(data, cursor_w, cursor_h);
-
 	prepare_crtc(data, cursor_w, cursor_h);
 	testfunc(data);
 	cleanup_crtc(data);
@@ -696,24 +693,15 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 	char name[32];
 	enum pipe pipe;
 
-	if (w == 0 && h == 0)
-		strcpy(name, "max-size");
-	else
-		snprintf(name, sizeof(name), "%dx%d", w, h);
-
-	if (w == 0 && h == 0) {
-		w = data->cursor_max_w;
-		h = data->cursor_max_h;
-		/*
-		 * No point in doing the "max-size" test if
-		 * it was already covered by the other tests.
-		 */
-		igt_require_f(w != h || w > 512 || h > 512 ||
-			      !is_power_of_two(w) || !is_power_of_two(h),
-			      "Cursor max size %dx%d already covered by other tests\n",
-			      w, h);
-	}
+	snprintf(name, sizeof(name), "%dx%d", w, h);
+
 	create_cursor_fb(data, w, h);
+	if (require_cursor_size(data, w, h)) {
+		igt_debug("Cursor size %dx%d not supported by driver\n", w, h);
+
+		igt_remove_fb(data->drm_fd, &data->fb);
+		return;
+	}
 
 	for_each_pipe(&data->display, pipe) {
 		data->pipe = pipe;
@@ -807,6 +795,12 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
+				igt_debug("Cursor size %dx%d not supported by driver\n",
+					  data->cursor_max_w, data->cursor_max_h);
+				continue;
+			}
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -822,6 +816,12 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
+			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
+				igt_debug("Cursor size %dx%d not supported by driver\n",
+					  data->cursor_max_w, data->cursor_max_h);
+				continue;
+			}
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -855,9 +855,6 @@ static void run_tests_on_pipe(data_t *data)
 					igt_subtest_group
 						run_size_tests(data, size_tests[i].testfunc, w, h);
 				}
-
-				igt_subtest_group
-					run_size_tests(data, size_tests[i].testfunc, 0, 0);
 			}
 		}
 	}
-- 
2.35.1
