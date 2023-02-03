Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B9B10E1F7
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 05:54:11 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Feb 2023 11:19:37 +0530
Message-Id: <20230203054937.1081680-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230203021525.32429-1-nidhi1.gupta@intel.com>
References: <20230203021525.32429-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 3/7] tests/kms_pipe_crc_basic: Limit the
 execution to two pipes
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

Example: ./kms_pipe_crc_basic -e --run-subtest read-crc

V2: - Edited commit message (Bhanu)
V3: - New function for simulation constraints (Kamil)
    - Update commit message (Bhanu)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_pipe_crc_basic.c | 45 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 91a1b8ab1..376b94983 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -30,6 +30,9 @@
 #include <string.h>
 #include <fcntl.h>
 
+static bool extended = false;
+static enum pipe active_pipes[IGT_MAX_PIPES];
+static uint32_t last_pipe = 0;
 
 typedef struct {
 	int drm_fd;
@@ -46,6 +49,16 @@ static struct {
 	{ .r = 0.0, .g = 1.0, .b = 1.0 },
 };
 
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
 static void test_bad_source(data_t *data)
 {
 	errno = 0;
@@ -276,7 +289,23 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 
 data_t data = {0, };
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+		case 'e':
+			extended = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
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
 	enum pipe pipe;
 	igt_output_t *output;
@@ -312,6 +341,11 @@ igt_main
 		igt_require_pipe_crc(data.drm_fd);
 
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
+
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 	}
 
 	igt_describe("Tests error handling when the bad source is set.");
@@ -322,6 +356,9 @@ igt_main
 		igt_describe(tests[i].desc);
 		igt_subtest_with_dynamic(tests[i].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
+				if (simulation_constraint(pipe))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 					if (tests[i].flags & TEST_SUSPEND) {
 						test_read_crc(&data, pipe, output, 0);
@@ -350,6 +387,9 @@ igt_main
 		     "does not cause issues.");
 	igt_subtest_with_dynamic("disable-crc-after-crtc") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_disable_crc_after_crtc(&data, pipe, output);
 		}
@@ -358,6 +398,9 @@ igt_main
 	igt_describe("Basic sanity check for CRC mismatches");
 	igt_subtest_with_dynamic("compare-crc-sanitycheck") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
+			if (simulation_constraint(pipe))
+				continue;
+
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				test_compare_crc(&data, pipe, output);
 		}
-- 
2.39.0
