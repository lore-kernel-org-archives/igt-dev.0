Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::609])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0E710E3CB
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 06:58:22 +0000 (UTC)
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 14:57:31 +0800
Message-ID: <20230621065733.840316-6-chiahsuan.chung@amd.com>
In-Reply-To: <20230621065733.840316-1-chiahsuan.chung@amd.com>
References: <20230621065733.840316-1-chiahsuan.chung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 6/8] tests/amdgpu/amd_freesync_video_mode:
 Move the vrr setting and display reset
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[Why]
We don't need to do the display reset and vrr enable/disable in the middle of the test.

[How]
Move the display reset output and vrr enable/disable setting to the begin/end of the test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index fd27c39e5..000de4c84 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -552,12 +552,6 @@ static void prepare_test(
 		enum pipe pipe,
 		drmModeModeInfo *mode)
 {
-	/* Reset output */
-	igt_display_reset(&data->display);
-	igt_output_set_pipe(output, pipe);
-
-	igt_output_override_mode(output, mode);
-
 	/* Prepare resources */
 	if (!data->fb_initialized) {
 		int fb_id;
@@ -581,15 +575,11 @@ static void prepare_test(
 		data->fb_initialized = true;
 	}
 
+	/* set output mode */
+	igt_output_override_mode(output, mode);
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(data->primary, &data->fbs[0]);
-
-	/* Clear vrr_enabled state before enabling it, because
-	 * it might be left enabled if the previous test fails.
-	 */
-	igt_pipe_set_prop_value(&data->display, pipe, IGT_CRTC_VRR_ENABLED, 0);
-
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 }
 
@@ -750,7 +740,6 @@ static void init_data(data_t *data, igt_output_t *output) {
 
 static void finish_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	set_vrr_on_pipe(data, pipe, 0);
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_output_override_mode(output, NULL);
@@ -826,6 +815,8 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	result = flip_and_measure(data, output, pipe, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
 	result = flip_and_measure(data, output, pipe, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
 	igt_assert_f(result > 75, "Target refresh rate not meet 75%% (result=%d%%\n", result);
+	set_vrr_on_pipe(data, pipe, false);
+
 	finish_test(data, pipe, output);
 }
 
@@ -847,6 +838,9 @@ run_test(data_t *data, uint32_t scene)
 
 		for_each_pipe(&data->display, pipe)
 			if (igt_pipe_connector_valid(pipe, output)) {
+				igt_display_reset(&data->display);
+				igt_output_set_pipe(output, pipe);
+
 				igt_dynamic_f("pipe-%s-%s",
 					      kmstest_pipe_name(pipe), output->name)
 				mode_transition(data, pipe, output, scene);
-- 
2.34.1
