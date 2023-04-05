Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F06910E887
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 08:52:55 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Apr 2023 14:21:41 +0530
Message-Id: <20230405085141.40355-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_cursor_crc: Reduce the
 execution time on simulation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As the test execution is taking more time on simulation, limit the
execution to two (first & last) pipes. This optimization is for
simulation and hardware.

This patch will also provide an option (command line flag '-e') to
execute on all pipes.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_crc.c | 60 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index 962ff27f..cc9dfcb1 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -83,6 +83,11 @@ typedef struct {
 	cursorarea oldcursorarea[MAXCURSORBUFFER];
 } data_t;
 
+static bool extended;
+static enum pipe active_pipes[IGT_MAX_PIPES];
+static uint32_t last_pipe;
+
+
 #define TEST_DPMS (1<<0)
 #define TEST_SUSPEND (1<<1)
 
@@ -716,6 +721,17 @@ static bool valid_pipe_output_combo(data_t *data)
 	return ret;
 }
 
+static bool execution_constraint(enum pipe pipe)
+{
+	if (!extended &&
+	    pipe != active_pipes[0] &&
+	    pipe != active_pipes[last_pipe])
+		return true;
+
+	return false;
+}
+
+
 static void run_size_tests(data_t *data, int w, int h)
 {
 	enum pipe pipe;
@@ -766,6 +782,9 @@ static void run_size_tests(data_t *data, int w, int h)
 			}
 
 			for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+				if (execution_constraint(pipe))
+					continue;
+
 				data->pipe = pipe;
 
 				if (!valid_pipe_output_combo(data))
@@ -802,6 +821,9 @@ static void run_tests_on_pipe(data_t *data)
 		     "correctly.");
 	igt_subtest_with_dynamic("cursor-size-change") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
 			data->pipe = pipe;
 
 			if (!valid_pipe_output_combo(data))
@@ -819,6 +841,9 @@ static void run_tests_on_pipe(data_t *data)
 		     "plane, i.e., alpha channel equal to 1.0.");
 	igt_subtest_with_dynamic("cursor-alpha-opaque") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
 			data->pipe = pipe;
 
 			if (!valid_pipe_output_combo(data))
@@ -836,6 +861,9 @@ static void run_tests_on_pipe(data_t *data)
 		     "plane, i.e., alpha channel equal to 0.0.");
 	igt_subtest_with_dynamic("cursor-alpha-transparent") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
 			data->pipe = pipe;
 
 			if (!valid_pipe_output_combo(data))
@@ -856,6 +884,9 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Check random placement of a cursor with DPMS.");
 	igt_subtest_with_dynamic("cursor-dpms") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
 			data->pipe = pipe;
 			data->flags = TEST_DPMS;
 
@@ -874,6 +905,9 @@ static void run_tests_on_pipe(data_t *data)
 	igt_describe("Check random placement of a cursor with suspend.");
 	igt_subtest_with_dynamic("cursor-suspend") {
 		for_each_pipe_with_single_output(&data->display, pipe, data->output) {
+			if (execution_constraint(pipe))
+				continue;
+
 			data->pipe = pipe;
 			data->flags = TEST_SUSPEND;
 
@@ -915,16 +949,40 @@ static void run_tests_on_pipe(data_t *data)
 
 static data_t data;
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'e':
+		extended = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str =
+	"  -e \tExtended tests.\n";
+
+igt_main_args("e", NULL, help_str, opt_handler, NULL)
 {
 	uint64_t cursor_width = 64, cursor_height = 64;
 	int ret;
 
 	igt_fixture {
+		enum pipe pipe;
+
+		last_pipe = 0;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 
 		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &cursor_width);
 		igt_assert(ret == 0 || errno == EINVAL);
-- 
2.25.1
