Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60CA10EBCB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 15:15:29 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 23 Feb 2023 20:39:39 +0530
Message-Id: <20230223151018.2565040-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v8 12/51] tests/kms_cursor_crc: Add support for
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
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_cursor_crc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 0b5aac30b..962ff27f5 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -700,6 +700,22 @@ static void test_rapid_movement(data_t *data)
 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
 }
 
+static bool valid_pipe_output_combo(data_t *data)
+{
+	bool ret = false;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+	igt_output_set_pipe(data->output, data->pipe);
+
+	if (i915_pipe_output_combo_valid(display))
+		ret = true;
+
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	return ret;
+}
+
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
@@ -752,6 +768,9 @@ static void run_size_tests(data_t *data, int w, int h)
 			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 				data->pipe = pipe;
 
+				if (!valid_pipe_output_combo(data))
+					continue;
+
 				if (require_cursor_size(data, w, h)) {
 					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
 					continue;
@@ -785,6 +804,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -799,6 +821,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -813,6 +838,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -831,6 +859,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -846,6 +877,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
-- 
2.39.1
