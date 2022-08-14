Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA18898C63
 for <igt-dev@lists.freedesktop.org>; Sun, 14 Aug 2022 18:12:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 14 Aug 2022 23:38:29 +0530
Message-Id: <20220814180908.2553394-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
References: <20220814180908.2553394-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 12/51] tests/kms_cursor_crc: Add support for
 Bigjoiner
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

This patch will add a check to Skip the subtest if a selected pipe/output
combo won't support Bigjoiner or 8K mode.

Example:
* Pipe-D wont support a mode > 5K
* To use 8K mode on a pipe then consecutive pipe must be available & free.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 49 +++++++++++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 14d4c4ca..65004a84 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -687,6 +687,21 @@ static void test_rapid_movement(data_t *data)
 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
 }
 
+static bool is_valid_combo(data_t *data, enum pipe pipe)
+{
+	bool ret = true;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(data->output, pipe);
+	if (!igt_test_constraint(display))
+		ret = false;
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	return ret;
+}
+
 static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 			   int w, int h)
 {
@@ -695,22 +710,21 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 
 	snprintf(name, sizeof(name), "%dx%d", w, h);
 
-	create_cursor_fb(data, w, h);
-	if (require_cursor_size(data, w, h)) {
-		igt_debug("Cursor size %dx%d not supported by driver\n", w, h);
-
-		igt_remove_fb(data->drm_fd, &data->fb);
-		return;
-	}
-
 	for_each_pipe(&data->display, pipe) {
 		data->pipe = pipe;
+
+		if (!is_valid_combo(data, pipe))
+			continue;
+
+		if (require_cursor_size(data, w, h)) {
+			igt_debug("Cursor size %dx%d not supported by driver\n", w, h);
+			continue;
+		}
+
 		igt_dynamic_f("pipe-%s-%s-%s",
 			      kmstest_pipe_name(pipe), data->output->name, name)
 			run_test(data, testfunc, w, h);
 	}
-
-	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
 static void run_tests_on_pipe(data_t *data)
@@ -749,6 +763,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!is_valid_combo(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -763,6 +780,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!is_valid_combo(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -777,6 +797,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!is_valid_combo(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -795,6 +818,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (!is_valid_combo(data, pipe))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
@@ -816,6 +842,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
+			if (!is_valid_combo(data, pipe))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
-- 
2.35.1
