Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B70710E1A3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 23:32:27 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 05:08:08 +0530
Message-Id: <20230206233810.16696-4-nidhi1.gupta@intel.com>
In-Reply-To: <20230206233810.16696-1-nidhi1.gupta@intel.com>
References: <20230206233810.16696-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/kms_color: Limit the execution to
 two pipes
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
simulation only and hence there will be no impact on real hardware.

This patch will also provide an option (command line flag '-e') to
execute on all pipes.

Example: ./kms_color -e --run-subtest ctm-0-50

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_color.c | 43 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index e0c6a8bf..9b0dccff 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -26,6 +26,10 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+static bool extended;
+static enum pipe active_pipes[IGT_MAX_PIPES];
+static uint32_t last_pipe;
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -876,6 +880,16 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 	test_cleanup(data);
 }
 
+static bool simulation_constraint(enum pipe pipe)
+{
+	if (igt_run_in_simulation() && !extended &&
+	    pipe != active_pipes[0] &&
+	    pipe != active_pipes[last_pipe])
+		return true;
+
+	return false;
+}
+
 static void
 run_invalid_tests_for_pipe(data_t *data)
 {
@@ -900,6 +914,8 @@ run_invalid_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
+				if (simulation_constraint(pipe))
+					continue;
 				prep_pipe(data, pipe);
 
 				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
@@ -1020,6 +1036,8 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f("%s", ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
 			for_each_pipe(&data->display, pipe) {
+				if (simulation_constraint(pipe))
+					continue;
 				run_ctm_tests_for_pipe(data, pipe,
 						       ctm_tests[i].colors,
 						       ctm_tests[i].ctm,
@@ -1039,9 +1057,28 @@ run_tests_for_pipe(data_t *data)
 	}
 }
 
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
 	data_t data = {};
+	enum pipe pipe;
+
+	last_pipe = 0;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1050,6 +1087,10 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 	}
 
 	igt_subtest_group
-- 
2.39.0
