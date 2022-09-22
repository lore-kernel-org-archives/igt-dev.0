Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A58010EA7E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Sep 2022 16:03:56 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 22 Sep 2022 21:29:24 +0530
Message-Id: <20220922160004.2041598-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
References: <20220922160004.2041598-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 12/52] tests/kms_cursor_crc: Add support for
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

V2: - Use updated helper name

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 47 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 53f18f4f..45088d15 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -687,6 +687,21 @@ static void test_rapid_movement(data_t *data)
 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
 }
 
+static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
+{
+	bool ret = true;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+
+	igt_output_set_pipe(data->output, pipe);
+	if (!i915_pipe_output_combo_valid(display))
+		ret = false;
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	return ret;
+}
+
 static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 			   int w, int h)
 {
@@ -708,15 +723,18 @@ static void run_size_tests(data_t *data, void (*testfunc)(data_t *),
 	}
 
 	create_cursor_fb(data, w, h);
-	if (require_cursor_size(data, w, h)) {
-		igt_info("Cursor size %dx%d not supported by driver\n", w, h);
-
-		igt_remove_fb(data->drm_fd, &data->fb);
-		return;
-	}
-
 	for_each_pipe(&data->display, pipe) {
 		data->pipe = pipe;
+
+		if (!pipe_output_combo_valid(data, pipe))
+			continue;
+
+		if (require_cursor_size(data, w, h)) {
+			igt_info("Cursor size %dx%d not supported by driver\n", w, h);
+
+			continue;
+		}
+
 		igt_dynamic_f("pipe-%s-%s",
 			      kmstest_pipe_name(pipe), igt_output_name(data->output))
 			run_test(data, testfunc, w, h);
@@ -761,6 +779,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -775,6 +796,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -789,6 +813,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -807,6 +834,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
@@ -828,6 +858,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
-- 
2.37.3
