Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A62B10E0D2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 23:32:21 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 05:08:06 +0530
Message-Id: <20230206233810.16696-2-nidhi1.gupta@intel.com>
In-Reply-To: <20230206233810.16696-1-nidhi1.gupta@intel.com>
References: <20230206233810.16696-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] tests/kms_cursor_edge_walk: Limit the
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

Example: ./kms_cursor_edge_walk -e --run-subtest read-crc

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_cursor_edge_walk.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index e653b9ab..1c9d8def 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -60,6 +60,10 @@ enum {
 	EDGE_BOTTOM = 0x8,
 };
 
+static bool extended;
+static enum pipe active_pipes[IGT_MAX_PIPES];
+static uint32_t last_pipe;
+
 static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
 {
 	cairo_t *cr;
@@ -273,6 +277,16 @@ static void test_crtc(data_t *data, unsigned int edges)
 	cleanup_crtc(data);
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
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -287,6 +301,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'j':
 		data->jump = true;
 		break;
+	case 'e':
+		extended = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -305,7 +322,8 @@ static const struct option long_opts[] = {
 static const char *help_str =
 	"  --colored\t\tUse a colored cursor (disables CRC checks)\n"
 	"  --disable\t\tDisable the cursor between each step\n"
-	"  --jump\t\tJump the cursor to middle of the screen between each step)\n";
+	"  --jump\t\tJump the cursor to middle of the screen between each step)\n"
+	"  --e \tExtended tests.\n";
 
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
@@ -319,6 +337,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		{ "top-bottom", EDGE_BOTTOM },
 	};
 	int i;
+	enum pipe pipe;
+
+	last_pipe = 0;
 
 	igt_fixture {
 		int ret;
@@ -340,6 +361,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 	}
 
 	igt_describe("Checking cursor by walking left/right/top/bottom edge of screen");
@@ -347,6 +372,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (i = 0; i < ARRAY_SIZE(tests); i++) {
 			igt_subtest_with_dynamic(tests[i].name) {
 				for_each_pipe_with_single_output(&data.display, data.pipe, data.output) {
+					if (simulation_constraint(pipe))
+						continue;
 					for (data.curw = 64; data.curw <= 256; data.curw *= 2) {
 						data.curh = data.curw;
 						igt_require(data.curw <= max_curw && data.curh <= max_curh);
-- 
2.39.0
