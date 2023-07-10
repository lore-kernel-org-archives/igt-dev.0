Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC1010E214
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 07:58:36 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 10 Jul 2023 15:57:45 +0800
Message-ID: <20230710075749.2377896-6-chiahsuan.chung@amd.com>
In-Reply-To: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
References: <20230710075749.2377896-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [i-g-t,
 v4 5/8] tests/amdgpu/amd_freesync_video_mode: Add/remove some test
 progress messages
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

1. Add/remove some test progress messages.
2. Change the variable name "range" to "vrr_range" to make the code clear.
3. Switch to igt_subtest_with_dynamic.
   It can get more progress messages during the test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 45 +++++++++++++++-----------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 0927f4307..5e6474292 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -59,7 +59,7 @@ typedef struct data {
 	uint32_t	*fb_mem[2];
 	int		front;
 	bool		fb_initialized;
-	range_t		range;
+	range_t		vrr_range;
 
 	drmModeConnector *connector;
 	drmModeModeInfo *modes;
@@ -432,14 +432,15 @@ static drmModeModeInfo *select_mode(
 		break;
 
 	default:
-		igt_assert("Cannot find mode with specified rate and type.");
+		igt_skip("Cannot find the specified mode type.\n");
 		break;
 	}
 
 	if (mode) {
 		igt_info("selected mode:\n");
 		kmstest_dump_mode(mode);
-	}
+	} else
+		igt_skip("Cannot find the mode with specified rate and type.\n");
 
 	return mode;
 }
@@ -463,10 +464,10 @@ static int prepare_custom_mode(
 		return -1;
 	}
 
-	if (refresh_rate < data->range.min ||
-			refresh_rate > data->range.max) {
+	if (refresh_rate < data->vrr_range.min ||
+			refresh_rate > data->vrr_range.max) {
 		igt_warn("The given refresh rate(%u) should be between the rage of: min=%d, max=%d\n",
-				refresh_rate, data->range.min, data->range.max);
+				refresh_rate, data->vrr_range.min, data->vrr_range.max);
 		return -1;
 	}
 
@@ -525,6 +526,7 @@ get_vrr_range(data_t *data, igt_output_t *output)
 
 	igt_assert(start_loc = strstr(buf, "Max: "));
 	igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
+	igt_info("VRR Range: %u-%u Hz\n", range.min, range.max);
 
 	return range;
 }
@@ -635,7 +637,7 @@ flip_and_measure(
 	do_flip(data);
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
-	igt_info("interval_ns=%lu\n", interval_ns);
+	igt_debug("interval_ns=%lu\n", interval_ns);
 
 	for (;;) {
 		uint64_t event_ns, wait_ns;
@@ -688,8 +690,9 @@ flip_and_measure(
 			;
 	}
 
-	igt_info("Completed %u flips, %u were in threshold for (%llu Hz) %"PRIu64"ns.\n",
-		 total_flip, total_pass, (NSECS_PER_SEC / interval_ns), interval_ns);
+	igt_info("Completed %u flips, %u were in threshold (Rate: %u%%) for (%llu Hz) %"PRIu64"ns.\n",
+		total_flip, total_pass, total_flip ? ((total_pass * 100) / total_flip) : 0,
+		(NSECS_PER_SEC / interval_ns), interval_ns);
 
 	return total_flip ? ((total_pass * 100) / total_flip) : 0;
 }
@@ -736,7 +739,6 @@ static void init_data(data_t *data, igt_output_t *output)
 			}
 		}
 	}
-	igt_info("preferred=%d, base=%d\n", data->preferred_mode_index, data->base_mode_index);
 
 	for (i = 0; i < connector->count_modes; i++) {
 		drmModeModeInfo *mode = &connector->modes[i];
@@ -745,7 +747,7 @@ static void init_data(data_t *data, igt_output_t *output)
 			igt_debug("mode[%d] is freesync video mode.\n", i);
 	}
 
-	data->range = get_vrr_range(data, output);
+	data->vrr_range = get_vrr_range(data, output);
 }
 
 static void finish_test(data_t *data, enum pipe pipe, igt_output_t *output)
@@ -783,7 +785,6 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	init_data(data, output);
 	sprite_anim_init();
 
-	igt_info("stage-1:\n");
 	switch (scene) {
 	case SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE:
 		mode_start = select_mode(data, FSV_BASE_MODE, 0);
@@ -813,12 +814,14 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	}
 	igt_assert_f(mode_start && mode_playback,
 			"Failure on selecting mode with given type and refresh rate.\n");
+
+	igt_info("stage-1: fps:%d\n", mode_start->vrefresh);
 	prepare_test(data, output, pipe, mode_start);
 	interval = nsec_per_frame(mode_start->vrefresh);
-	set_vrr_on_pipe(data, pipe, 1);
+	set_vrr_on_pipe(data, pipe, true);
 	result = flip_and_measure(data, output, pipe, interval, TEST_DURATION_NS, ANIM_TYPE_SMPTE);
 
-	igt_info("stage-2: simple animation as video playback\n");
+	igt_info("stage-2: simple animation as video playback fps:%d\n", mode_playback->vrefresh);
 	prepare_test(data, output, pipe, mode_playback);
 	interval = nsec_per_frame(mode_playback->vrefresh);
 	/* Do a short run with VRR before measure to make sure we measure in a stable state */
@@ -828,6 +831,7 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	finish_test(data, pipe, output);
 }
 
+/* Runs tests on outputs that are VRR capable. */
 static void
 run_test(data_t *data, uint32_t scene)
 {
@@ -837,11 +841,14 @@ run_test(data_t *data, uint32_t scene)
 	for_each_connected_output(&data->display, output) {
 		enum pipe pipe;
 
-		if (!has_vrr(output))
+		if (!has_vrr(output)) {
+			igt_info("%s is not a vrr capable output. Skip it.\n", output->name);
 			continue;
+		}
 
 		for_each_pipe(&data->display, pipe)
 			if (igt_pipe_connector_valid(pipe, output)) {
+				igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
 				mode_transition(data, pipe, output, scene);
 				found = true;
 				break;
@@ -870,22 +877,22 @@ igt_main {
 
 	/* Expectation: Modeset happens instantaneously without blanking */
 	igt_describe("Test switch from base freesync mode to various freesync video modes");
-	igt_subtest("freesync-base-to-various")
+	igt_subtest_with_dynamic("freesync-base-to-various")
 	run_test(&data, SCENE_BASE_MODE_TO_VARIOUS_FSV_MODE);
 
 	/* Expectation: Modeset happens instantaneously without blanking */
 	igt_describe("Test switching from lower refresh freesync mode to another freesync mode with higher refresh rate");
-	igt_subtest("freesync-lower-to-higher")
+	igt_subtest_with_dynamic("freesync-lower-to-higher")
 	run_test(&data, SCENE_LOWER_FSV_MODE_TO_HIGHER_FSV_MODE);
 
 	/* Expectation: Full modeset is triggered. */
 	igt_describe("Test switching from non preferred video mode to one of freesync video mode");
-	igt_subtest("freesync-non-preferred-to-freesync")
+	igt_subtest_with_dynamic("freesync-non-preferred-to-freesync")
 	run_test(&data, SCENE_NON_FSV_MODE_TO_FSV_MODE);
 
 	/* Expectation: Modeset happens instantaneously without blanking */
 	igt_describe("Add custom mode through xrandr based on base freesync mode and apply the new mode");
-	igt_subtest("freesync-custom-mode")
+	igt_subtest_with_dynamic("freesync-custom-mode")
 	run_test(&data, SCENE_BASE_MODE_TO_CUSTUM_MODE);
 
 	igt_info("end of test\n");
-- 
2.25.1
