Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322FB11A2E7
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 06:29:15 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 Aug 2022 11:29:45 +0530
Message-Id: <20220808055945.11247-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Convert tests to
 dynamic
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

Covert the existing subtests to dynamic subtests at pipe/output level.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_plane_multiple.c | 69 +++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 30 deletions(-)

diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 1679f7ce..3b4c53e9 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -363,15 +363,11 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 }
 
 static void
-test_plane_position(data_t *data, enum pipe pipe, uint64_t modifier)
+test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier)
 {
-	igt_output_t *output;
 	int n_planes = opt.all_planes ?
 			data->display.pipes[pipe].n_planes : DEFAULT_N_PLANES;
 
-	output = igt_get_single_output_for_pipe(&data->display, pipe);
-	igt_require(output);
-
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
@@ -381,30 +377,45 @@ test_plane_position(data_t *data, enum pipe pipe, uint64_t modifier)
 					n_planes, modifier);
 }
 
-static void
-run_tests_for_pipe(data_t *data, enum pipe pipe)
+static void run_test(data_t *data, uint64_t modifier)
 {
-	igt_fixture {
-		igt_require_pipe(&data->display, pipe);
-		igt_require(data->display.pipes[pipe].n_planes > 0);
-	}
-
-	igt_subtest_f("atomic-pipe-%s-tiling-x", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, I915_FORMAT_MOD_X_TILED);
-
-	igt_subtest_f("atomic-pipe-%s-tiling-y", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, I915_FORMAT_MOD_Y_TILED);
+	enum pipe pipe;
+	igt_output_t *output;
 
-	igt_subtest_f("atomic-pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, I915_FORMAT_MOD_Yf_TILED);
+	igt_skip_on(!igt_display_has_format_mod(&data->display,
+						DRM_FORMAT_XRGB8888, modifier));
 
-	igt_subtest_f("atomic-pipe-%s-tiling-4", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, I915_FORMAT_MOD_4_TILED);
+	for_each_pipe(&data->display, pipe) {
+		for_each_valid_output_on_pipe(&data->display, pipe, output) {
+			igt_display_reset(&data->display);
 
-	igt_subtest_f("atomic-pipe-%s-tiling-none", kmstest_pipe_name(pipe))
-		test_plane_position(data, pipe, DRM_FORMAT_MOD_LINEAR);
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
+				test_plane_position(data, pipe, output, modifier);
+		}
+	}
 }
 
+static const struct {
+	const char *name;
+	uint64_t modifier;
+} subtests[] = {
+	{ .name = "tiling-none",
+	  .modifier = DRM_FORMAT_MOD_LINEAR,
+	},
+	{ .name = "tiling-x",
+	  .modifier = I915_FORMAT_MOD_X_TILED,
+	},
+	{ .name = "tiling-y",
+	  .modifier = I915_FORMAT_MOD_Y_TILED,
+	},
+	{ .name = "tiling-yf",
+	  .modifier = I915_FORMAT_MOD_Yf_TILED,
+	},
+	{ .name = "tiling-4",
+	  .modifier = I915_FORMAT_MOD_4_TILED,
+	},
+};
+
 static data_t data;
 
 static int opt_handler(int option, int option_index, void *input)
@@ -447,8 +458,6 @@ struct option long_options[] = {
 
 igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
-	enum pipe pipe;
-
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
@@ -457,16 +466,16 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		igt_require(data.display.is_atomic);
 	}
 
-	for_each_pipe_static(pipe) {
+	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
 		igt_describe("Check that the kernel handles atomic updates of "
 			     "multiple planes correctly by changing their "
 			     "geometry and making sure the changes are "
 			     "reflected immediately after each commit.");
-		igt_subtest_group
-			run_tests_for_pipe(&data, pipe);
+
+		igt_subtest_with_dynamic(subtests[i].name)
+			run_test(&data, subtests[i].modifier);
 	}
 
-	igt_fixture {
+	igt_fixture
 		igt_display_fini(&data.display);
-	}
 }
-- 
2.22.0
