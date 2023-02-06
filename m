Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAC010E138
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 23:32:23 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 05:08:07 +0530
Message-Id: <20230206233810.16696-3-nidhi1.gupta@intel.com>
In-Reply-To: <20230206233810.16696-1-nidhi1.gupta@intel.com>
References: <20230206233810.16696-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/kms_plane_alpha_blend: Limit the
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

Example: ./kms_plane_alpha_blend -e --run-subtest alpha-7efc

V2: - Edited commit message (Bhanu)
V3: - New function for simulation constraints (Kamil)
    - Update commit message (Bhanu)

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_plane_alpha_blend.c | 58 +++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 38272ccb..1d180215 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -28,6 +28,10 @@
 
 IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
 
+static bool extended;
+static enum pipe active_pipes[IGT_MAX_PIPES];
+static uint32_t last_pipe;
+
 typedef struct {
 	int gfx_fd;
 	igt_display_t display;
@@ -482,8 +486,10 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *plane;
+	int first_plane = -1;
+	int last_plane = -1;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 
@@ -496,6 +502,19 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
 
+		if (first_plane < 0)
+			first_plane = j__;
+
+		last_plane = j__;
+	}
+
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (j__ != first_plane && j__ != last_plane)
+			continue;
+
+		/* reset plane alpha properties between each plane */
+		reset_alpha(display, pipe);
+
 		igt_info("Testing plane %u\n", plane->index);
 		test(data, pipe, plane);
 		igt_plane_set_fb(plane, NULL);
@@ -611,6 +630,16 @@ static bool pipe_check(data_t *data, enum pipe pipe,
 	}
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
 static void run_subtests(data_t *data)
 {
 	igt_output_t *output;
@@ -621,6 +650,8 @@ static void run_subtests(data_t *data)
 
 		igt_subtest_with_dynamic(subtests[i].name) {
 			for_each_pipe_with_single_output(&data->display, pipe, output) {
+				if (simulation_constraint(pipe))
+					continue;
 				prepare_crtc(data, output, pipe);
 				if (!pipe_check(data, pipe, subtests[i].blend, subtests[i].must_multiply))
 					continue;
@@ -633,15 +664,38 @@ static void run_subtests(data_t *data)
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
 		data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require_pipe_crc(data.gfx_fd);
 		igt_display_require(&data.display, data.gfx_fd);
 		igt_require(data.display.is_atomic);
+		/* Get active pipes. */
+		for_each_pipe(&data.display, pipe)
+			active_pipes[last_pipe++] = pipe;
+		last_pipe--;
 	}
 
 	run_subtests(&data);
-- 
2.39.0
