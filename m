Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16EF10E044
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Nov 2022 17:10:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Nov 2022 22:38:15 +0530
Message-Id: <20221115170855.196572-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v5 12/52] tests/kms_cursor_crc: Add support for
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
 tests/kms_cursor_crc.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 68bed666..99a7c717 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -700,6 +700,21 @@ static void test_rapid_movement(data_t *data)
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
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
@@ -757,6 +772,9 @@ static void run_size_tests(data_t *data, int w, int h)
 					continue;
 				}
 
+				if (!pipe_output_combo_valid(data, pipe))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), igt_output_name(data->output))
 					run_test(data, size_tests[i].testfunc, w, h);
@@ -787,6 +805,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -801,6 +822,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -815,6 +839,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -833,6 +860,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
@@ -854,6 +884,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
+			if (!pipe_output_combo_valid(data, pipe))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
-- 
2.38.0
