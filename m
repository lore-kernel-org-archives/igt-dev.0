Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B25B010E78F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 16:27:10 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 21:53:01 +0530
Message-Id: <20230118162301.222158-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230104170023.3355190-13-bhanuprakash.modem@intel.com>
References: <20230104170023.3355190-13-bhanuprakash.modem@intel.com>
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
 tests/kms_cursor_crc.c | 52 +++++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index d5a4b30b..f67a2040 100644
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
@@ -749,9 +772,12 @@ static void run_size_tests(data_t *data, int w, int h)
 				}
 			}
 
-			for_each_pipe(&data->display, pipe) {
+			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
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
@@ -784,10 +808,10 @@ static void run_tests_on_pipe(data_t *data)
 		     "flight to smaller ones to see that the size is applied "
 		     "correctly.");
 	igt_subtest_with_dynamic("cursor-size-change") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
-			if(!igt_pipe_connector_valid(pipe, data->output)) {
+			if (!valid_pipe_output_combo(data)) {
 				igt_debug("Invalid connector on pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name);
@@ -805,10 +829,10 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Validates the composition of a fully opaque cursor "
 		     "plane, i.e., alpha channel equal to 1.0.");
 	igt_subtest_with_dynamic("cursor-alpha-opaque") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
-			if(!igt_pipe_connector_valid(pipe, data->output)) {
+			if (!valid_pipe_output_combo(data)) {
 				igt_debug("Invalid connector on pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name);
@@ -826,10 +850,10 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Validates the composition of a fully transparent cursor "
 		     "plane, i.e., alpha channel equal to 0.0.");
 	igt_subtest_with_dynamic("cursor-alpha-transparent") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 
-			if(!igt_pipe_connector_valid(pipe, data->output)) {
+			if (!valid_pipe_output_combo(data)) {
 				igt_debug("Invalid connector on pipe-%s-%s",
 				      kmstest_pipe_name(pipe),
 				      data->output->name);
@@ -850,10 +874,13 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check random placement of a cursor with DPMS.");
 	igt_subtest_with_dynamic("cursor-dpms") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
+			if (!valid_pipe_output_combo(data))
+				continue;
+
 			if (require_cursor_size(data, data->cursor_max_w, data->cursor_max_h)) {
 				igt_debug("Cursor size %dx%d not supported by driver\n",
 					  data->cursor_max_w, data->cursor_max_h);
@@ -871,10 +898,13 @@ static void run_tests_on_pipe(data_t *data)
 
 	igt_describe("Check random placement of a cursor with suspend.");
 	igt_subtest_with_dynamic("cursor-suspend") {
-		for_each_pipe(&data->display, pipe) {
+		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
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
