Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457DB10E5D7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jan 2023 17:08:05 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Jan 2023 22:29:44 +0530
Message-Id: <20230104170023.3355190-13-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t v7 12/51] tests/kms_cursor_crc: Add support for
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
 tests/kms_cursor_crc.c | 43 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 17f294d6..804f6876 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -700,6 +700,29 @@ static void test_rapid_movement(data_t *data)
 	igt_assert_lt(usec, 0.9 * 400 * 1000000 / data->refresh);
 }
 
+static bool valid_pipe_output_combo(data_t *data)
+{
+	bool ret = false;
+	igt_display_t *display = &data->display;
+
+	igt_display_reset(display);
+
+	for_each_valid_output_on_pipe(display, data->pipe, data->output) {
+		igt_output_set_pipe(data->output, data->pipe);
+
+		if (!i915_pipe_output_combo_valid(display)) {
+			igt_output_set_pipe(data->output, PIPE_NONE);
+			continue;
+		}
+
+		ret = true;
+		break;
+	}
+	igt_output_set_pipe(data->output, PIPE_NONE);
+
+	return ret;
+}
+
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
@@ -752,6 +775,9 @@ static void run_size_tests(data_t *data, int w, int h)
 			for_each_pipe(&data->display, pipe) {
 				data->pipe = pipe;
 
+				if (!valid_pipe_output_combo(data))
+					continue;
+
 				if (require_cursor_size(data, w, h)) {
 					igt_info("Cursor size %dx%d not supported by driver\n", w, h);
 					continue;
@@ -774,8 +800,6 @@ static void run_tests_on_pipe(data_t *data)
 	int cursor_size;
 
 	igt_fixture {
-		data->output = igt_get_single_output_for_pipe(&data->display, pipe);
-		igt_require(data->output);
 		data->alpha = 1.0;
 		data->flags = 0;
 	}
@@ -787,6 +811,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -801,6 +828,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -815,6 +845,9 @@ static void run_tests_on_pipe(data_t *data)
 		for_each_pipe(&data->display, pipe) {
 			data->pipe = pipe;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name)
@@ -833,6 +866,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
@@ -854,6 +890,9 @@ static void run_tests_on_pipe(data_t *data)
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
-- 
2.39.0
