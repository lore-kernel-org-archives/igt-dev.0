Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2250810E261
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Mar 2023 15:22:13 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Mar 2023 20:51:51 +0530
Message-Id: <20230306152151.24200-3-kunal1.joshi@intel.com>
In-Reply-To: <20230306152151.24200-1-kunal1.joshi@intel.com>
References: <20230306152151.24200-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] RFC tests/kms_psr2_sf Extended test to
 validate panel replay
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Extended kms_psr2_sf test to run on sink which supports
panel replay. All debugfs infois assumed and driver
may not expose it as currently referred.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/i915/kms_psr2_sf.c | 137 ++++++++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 32 deletions(-)

diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
index 2d761d31..eae6d007 100644
--- a/tests/i915/kms_psr2_sf.c
+++ b/tests/i915/kms_psr2_sf.c
@@ -63,6 +63,12 @@ enum plane_move_postion {
 	POS_RIGHT,
 };
 
+enum test_mode {
+	PSR2,
+	PR,
+	END,
+};
+
 typedef struct {
 	int drm_fd;
 	int debugfs_fd;
@@ -86,6 +92,7 @@ typedef struct {
 	cairo_t *cr;
 	uint32_t screen_changes;
 	int cur_x, cur_y;
+	int test_mode;
 	enum pipe pipe;
 	enum {
 		FEATURE_NONE  = 0,
@@ -600,10 +607,23 @@ static void damaged_plane_move(data_t *data)
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	if (data->test_mode == PSR2)
+		igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	else
+		igt_assert(pr_wait_entry(data->debugfs_fd, PR_MODE_1));
+
+	/*
+	 * Add checks if SU region was transmitted via early transport
+	 * if in PR mode
+	 *
+	 * When in PR active source can go to DC6/DC6v
+	 * panel goes to PM_State 3/PM_State 1b with LCT1 register DPCD 0x202
+	 * Add a check for above
+	 */
 
 	expected_output(data);
 }
+
 static void get_target_coords(data_t *data, int *x, int *y)
 {
 	int target_x, target_y, exceed_x, exceed_y;
@@ -700,7 +720,10 @@ static void plane_move_continuous(data_t *data)
 {
 	int target_x, target_y;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	if (data->test_mode == PSR2)
+		igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	else
+		igt_assert(pr_wait_entry(data->debugfs_fd, PR_MODE_1));
 
 	get_target_coords(data, &target_x, &target_y);
 
@@ -718,6 +741,14 @@ static void plane_move_continuous(data_t *data)
 		igt_plane_set_position(data->test_plane, data->cur_x, data->cur_y);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	}
+	/*
+	 * Add checks if SU region was transmitted via early transport
+	 * if in PR mode
+	 *
+	 * When in PR active source can go to DC6/DC6v
+	 * panel goes to PM_State 3/PM_State 1b with LCT1 register DPCD 0x202
+	 * Add a check for above
+	 */
 
 	expected_output(data);
 }
@@ -777,7 +808,19 @@ static void damaged_plane_update(data_t *data)
 	igt_plane_set_position(data->test_plane, 0, 0);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	if (data->test_mode == PSR2)
+		igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	else
+		igt_assert(pr_wait_entry(data->debugfs_fd, PR_MODE_1));
+
+	/*
+	 * Add checks if SU region was transmitted via early transport
+	 * if in PR mode
+	 *
+	 * When in PR active source can go to DC6/DC6v
+	 * panel goes to PM_State 3/PM_State 1b with LCT1 register DPCD 0x202
+	 * Add a check for above
+	 */
 
 	expected_output(data);
 }
@@ -786,7 +829,11 @@ static void run(data_t *data)
 {
 	int i;
 
-	igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	if (data->test_mode == PSR2)
+		igt_assert(psr_wait_entry(data->debugfs_fd, PSR_MODE_2));
+	else
+		igt_assert(pr_wait_entry(data->debugfs_fd, PR_MODE_1));
+
 
 	data->screen_changes = 0;
 
@@ -859,14 +906,21 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
-static int check_psr2_support(data_t *data)
+static int check_psr2_or_pr_support(data_t *data, const char *mode_str)
 {
 	int status;
 
 	prepare(data);
-	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
-	cleanup(data);
+	/*
+	 * Add PR wait check once confirmed what state
+	 * it goes to when PR active
+	 */
+	if (strcmp(mode_str, "psr2") == 0)
+		status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2);
+	if (strcmp(mode_str, "pr") == 0)
+		status = pr_wait_entry(data->debugfs_fd, PR_MODE_1);
 
+	cleanup(data);
 	return status;
 }
 
@@ -878,6 +932,8 @@ igt_main
 	int pipes[IGT_MAX_PIPES * IGT_MAX_PIPES];
 	int n_pipes = 0;
 	int coexist_features[IGT_MAX_PIPES * IGT_MAX_PIPES];
+	bool psr_support, pr_support;
+	const char *mode_str;
 
 	igt_fixture {
 		drmModeResPtr res;
@@ -886,16 +942,36 @@ igt_main
 		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 
-		igt_require_f(psr_sink_support(data.drm_fd,
-					       data.debugfs_fd, PSR_MODE_2),
-			      "Sink does not support PSR2\n");
+		/*
+		 * Both PSR and PR are mutually exclusive
+		 * Hence any of the one will be enabled by driver
+		 */
+		psr_support = psr_sink_support(data.drm_fd, data.debugfs_fd, PSR_MODE_2);
+		pr_support = pr_sink_support(data.drm_fd, data.debugfs_fd, PR_MODE_1);
+		igt_require_f(psr_support || pr_support,
+			      "Sink does not support PSR2/PR\n");
 
 		display_init(&data);
 
-		/* Test if PSR2 can be enabled */
-		igt_require_f(psr_enable(data.drm_fd,
-					 data.debugfs_fd, PSR_MODE_2_SEL_FETCH),
-			      "Error enabling PSR2\n");
+		if (psr_support) {
+			/* Test if PSR2 can be enabled */
+			igt_require_f(psr_enable(data.drm_fd,
+				      data.debugfs_fd, PSR_MODE_2),
+				      "Error enabling PSR2\n");
+
+			igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
+				      "PSR2 selective fetch not enabled\n");
+			data.test_mode = PSR2;
+			mode_str = "psr2";
+		} else {
+			igt_require_f(psr_enable(data.drm_fd,
+				      data.debugfs_fd, PR_MODE_1),
+				      "Error enabling PR\n");
+			igt_require_f(pr_selective_fetch_check(data.debugfs_fd),
+				      "PR selective fetch not enabled\n");
+			data.test_mode = PR;
+			mode_str = "pr";
+		}
 
 		data.damage_area_count = MAX_DAMAGE_AREAS;
 		data.op = PLANE_UPDATE;
@@ -909,12 +985,9 @@ igt_main
 		igt_info("Big framebuffer size %dx%d\n",
 			 data.big_fb_width, data.big_fb_height);
 
-		igt_require_f(psr2_selective_fetch_check(data.debugfs_fd),
-			      "PSR2 selective fetch not enabled\n");
-
 		for_each_pipe_with_valid_output(&data.display, data.pipe, data.output) {
 			coexist_features[n_pipes] = 0;
-			if (check_psr2_support(&data)) {
+			if (check_psr2_or_pr_support(&data, mode_str)) {
 				pipes[n_pipes] = data.pipe;
 				outputs[n_pipes] = data.output;
 
@@ -928,12 +1001,12 @@ igt_main
 
 	/* Verify primary plane selective fetch */
 	igt_describe("Test that selective fetch works on primary plane");
-	igt_subtest_with_dynamic_f("primary-%s-sf-dmg-area", op_str(data.op)) {
+	igt_subtest_with_dynamic_f("primary-sf-dmg-area-%s", op_str(data.op)) {
 		for (i = 0; i < n_pipes; i++) {
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -959,7 +1032,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -985,7 +1058,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1011,7 +1084,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1033,7 +1106,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1055,7 +1128,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1077,7 +1150,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1101,7 +1174,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1126,7 +1199,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 				data.pipe = pipes[i];
@@ -1148,7 +1221,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1170,7 +1243,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1194,7 +1267,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
@@ -1224,7 +1297,7 @@ igt_main
 			for (j = FEATURE_NONE; j < FEATURE_COUNT; j++) {
 				if (j != FEATURE_NONE && !(coexist_features[i] & j))
 					continue;
-				igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(pipes[i]),
+				igt_dynamic_f("%s-pipe-%s-%s%s", mode_str, kmstest_pipe_name(pipes[i]),
 					      igt_output_name(outputs[i]),
 					      coexist_feature_str(j)) {
 					data.pipe = pipes[i];
-- 
2.25.1
