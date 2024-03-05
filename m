Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75864C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 16:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BB1112BF2;
	Tue,  5 Mar 2024 16:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PiuE1K3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431CA112BED
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709655947; x=1741191947;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+PloaqBdZXRrH6QYqSwvE+2YrOkreB7XJGuR1Rwhyw=;
 b=PiuE1K3LBqDzrG55KjHoETCKK9oxsOEqhnaesghQ+LAv29+NJTc561Qr
 n/e3ESgKPcNu8L2uEmEX9UrJluIImmQ009+W3HibteFYDmQLOt/r9KWpJ
 by2lVzuNQ2JLduu7KdjjZ1AzQmOQL1Gr4QGuizcoHRxdvojJ9oO4pIfXU
 IEY22ilUXvcLFTjpLspz0Qb/12cjwoUziEMcKxDrQaMHV8mbUGIhdxns+
 B4JrdhOLR2uzVS7imBP7aH+K0BEZ6+T2/m1aSG26i7UYfGTE79cHFZGM5
 UB5Ar2fomf2dqv9Q+RcJiA+HDWMojm64Q4Yf1hlrSg5yLS/iRr51l2mxj g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4079938"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4079938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 08:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="14010216"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 08:25:45 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_big_joiner: revamp kms_big_joiner
Date: Tue,  5 Mar 2024 22:06:07 +0530
Message-Id: <20240305163607.688251-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240305163607.688251-1-kunal1.joshi@intel.com>
References: <20240305163607.688251-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

big joiner outputs are statically assigned to pipe,
rewrite to assign dynamically

v2: Don't change license (Bhanu)
    Add documentation for generate_combinations (Bhanu)
    Print the pipe name (Bhanu)
    Remove unwanted commit (Bhanu)
    Move combine output logic to igt_fixture (Bhanu)
    split revamp and force joiner (Bhanu)

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 392 +++++++++++++++++------------------
 1 file changed, 187 insertions(+), 205 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 28678b958..2bbc23fb5 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -43,16 +43,19 @@
  *
  * SUBTEST: basic
  * Description: Verify the basic modeset on big joiner mode on all pipes
- *
- * SUBTEST: 2x-modeset
- * Description: Verify simultaneous modeset on 2 big joiner outputs
  */
-
 IGT_TEST_DESCRIPTION("Test big joiner");
 
-struct bigjoiner_output {
-	uint32_t output_id;
-	drmModeModeInfo mode;
+#define MAX_OUTPUTS 256
+#define MAX_COMBINATIONS 1000
+#define INVALID_TEST_OUTPUT 2
+typedef struct {
+    int combination[MAX_OUTPUTS];
+} Combination;
+
+enum joiner_type {
+	BIG_JOINER = 1 << 1,
+	INVALID_JOINER = -1,
 };
 
 typedef struct {
@@ -60,274 +63,253 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb;
 	int n_pipes;
-	enum pipe pipe1;
-	enum pipe pipe2;
-	struct bigjoiner_output output[2];
+	uint64_t big_joiner_outputs[IGT_MAX_PIPES];
+	uint64_t non_big_joiner_outputs[IGT_MAX_PIPES];
+	uint64_t combined_outputs[IGT_MAX_PIPES];
+	int big_joiner_output_count;
+	int non_big_joiner_output_count;
+	int combined_output_count;
+	int output_count;
+	enum pipe pipe_seq[IGT_MAX_PIPES];
 } data_t;
 
 static int max_dotclock;
 
-static void test_invalid_modeset(data_t *data)
+/*
+ * The generate_combinations function generates combinations of pipe allocations
+ * for a given number of outputs
+ *
+ * @output_count: Number of outputs to allocate pipes for.
+ * @pipe_count: Total number of available pipes.
+ * @pipes_per_output: Number of pipes to be allocated for a single output.
+ * @combinations: Array to store generated combinations.
+ * @num_combinations: Pointer to a variable that stores the number of generated combinations.
+ *
+ * Example (output_count=2, pipe_count=4, pipes_per_output=2):
+ * Combination 1: 0 2
+ * Combination 2: 1 3
+*/
+static void generate_combinations(int output_count, int pipe_count,
+				  int pipes_per_output,
+				  Combination combinations[MAX_COMBINATIONS],
+				  uint64_t *num_combinations)
 {
-	igt_output_t *output;
-	igt_display_t *display = &data->display;
-	int ret;
-
-	igt_info("Bigjoiner test on ");
-	for_each_connected_output(display, output){
-		enum pipe p = output->pending_pipe;
-		drmModeModeInfo *mode;
-		igt_pipe_t *pipe;
-		igt_plane_t *plane;
+	int i, index;
+	int current_combination[MAX_OUTPUTS];
 
-		if (p == PIPE_NONE)
-			continue;
+	for (i = 0; i < output_count; ++i)
+		current_combination[i] = i * pipes_per_output;
 
-		mode = igt_output_get_mode(output);
-		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
-		kmstest_dump_mode(mode);
+	while (*num_combinations < MAX_COMBINATIONS && current_combination[0] <= pipe_count - output_count * pipes_per_output) {
+		for (i = 0; i < output_count; ++i)
+			combinations[*num_combinations].combination[i] = current_combination[i];
 
-		pipe = &display->pipes[p];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		(*num_combinations)++;
 
-		igt_plane_set_fb(plane, &data->fb);
-		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	}
+		index = output_count - 1;
+		while (index >= 0 && current_combination[index] == pipe_count - (output_count - index) * pipes_per_output)
+			index--;
 
-	igt_assert(!igt_check_bigjoiner_support(display));
+		if (index < 0)
+			break;
 
-	/* This commit is expectd to fail as this pipe is being used for big joiner */
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		current_combination[index]++;
+		for (i = index + 1; i < output_count; ++i)
+			current_combination[i] = current_combination[i - 1] + pipes_per_output;
+    }
+}
 
-	igt_display_reset(&data->display);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t output_id)
+{
+	igt_output_t *output;
 
-	igt_assert_lt(ret, 0);
+	for_each_connected_output(&data->display, output) {
+		if (output->id == output_id)
+			return output;
+	}
+	igt_assert("Output not found\n");
+	return NULL;
 }
 
-static void test_basic_modeset(data_t *data)
+static void test_invalid_modeset_two_joiner(data_t *data, bool combined)
 {
+	int i, j, ret;
+	igt_output_t *output;
+	uint64_t *outputs;
+	igt_plane_t *primary[INVALID_TEST_OUTPUT];
+	igt_fb_t fb[INVALID_TEST_OUTPUT];
 	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output = NULL;
-	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-
-	igt_display_reset(display);
 
-	for_each_connected_output(display, output) {
-		if (data->output[0].output_id == output->id) {
-			bigjoiner_output = output;
-			break;
+	outputs = combined ? data->combined_outputs : data->big_joiner_outputs;
+
+	for (i = 0; i < data->n_pipes-1; i++) {
+		igt_display_reset(&data->display);
+		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
+			output = get_output_by_id_or_assert(data, outputs[j]);
+			igt_assert(output);
+			igt_output_set_pipe(output, data->pipe_seq[i + j]);
+			mode = igt_output_get_mode(output);
+			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
+				 kmstest_pipe_name(data->pipe_seq[i + j]),
+				 igt_output_name(output), mode->hdisplay,
+				 mode->vdisplay, mode->vrefresh,
+				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
+			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
+			igt_plane_set_fb(primary[j], &fb[j]);
 		}
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
 	}
-
-	igt_output_set_pipe(bigjoiner_output, data->pipe1);
-
-	mode = &data->output[0].mode;
-	igt_output_override_mode(bigjoiner_output, mode);
-
-	pipe = &display->pipes[data->pipe1];
-	plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane, &data->fb);
-	igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	igt_output_set_pipe(bigjoiner_output, PIPE_NONE);
-	igt_plane_set_fb(plane, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
 }
 
-static void test_dual_display(data_t *data)
+static void tets_big_joiner_on_last_pipe(data_t *data)
 {
+	int i, ret;
+	uint64_t *outputs;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	igt_fb_t fb;
 	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output[2];
-	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane1, *plane2;
-	int count = 0;
-
-	igt_display_reset(display);
-
-	for_each_connected_output(display, output) {
-		if (data->output[count].output_id == output->id) {
-			bigjoiner_output[count] = output;
-			count++;
-		}
 
-		if (count > 1)
-			break;
+	outputs = data->big_joiner_outputs;
+	for (i = 0; i < data->big_joiner_output_count; i++) {
+		igt_display_reset(&data->display);
+		output = get_output_by_id_or_assert(data, outputs[i]);
+		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
+		mode = igt_output_get_mode(output);
+		igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
+				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
+				 igt_output_name(output), mode->hdisplay,
+				 mode->vdisplay, mode->vrefresh);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+							  DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(primary, &fb);
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
 	}
+}
 
-	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
-	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
-
-	/* Set up first big joiner output on Pipe A*/
-	mode = &data->output[0].mode;
-	igt_output_override_mode(bigjoiner_output[0], mode);
-
-	pipe = &display->pipes[data->pipe1];
-	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane1, &data->fb);
-	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
-
-	/* Set up second big joiner output on Pipe C*/
-	mode = &data->output[1].mode;
-	igt_output_override_mode(bigjoiner_output[1], mode);
-
-	pipe = &display->pipes[data->pipe2];
-	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-	igt_plane_set_fb(plane2, &data->fb);
-	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
-
-	igt_display_commit2(display, COMMIT_ATOMIC);
+static void test_basic_modeset(data_t *data, int num_outputs,
+			       Combination combinations[MAX_COMBINATIONS],
+			       uint64_t num_combinations)
+{
+	int i, j, ret;
+	igt_display_t *display = &data->display;
+	igt_output_t *output[num_outputs];
+	igt_plane_t *primary[num_outputs];
+	igt_fb_t fb[num_outputs];
+	drmModeModeInfo *mode;
 
-	/* Clean up */
-	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
-	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
-	igt_plane_set_fb(plane1, NULL);
-	igt_plane_set_fb(plane2, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	for (i = 0; i < num_combinations; i++) {
+		igt_display_reset(display);
+		for (j = 0; j < num_outputs; j++) {
+			output[j] = get_output_by_id_or_assert(data,
+						     data->big_joiner_outputs[j]);
+			igt_info("Assigning pipe %s to %s%s",
+				 kmstest_pipe_name(data->pipe_seq[combinations[i].combination[j]]),
+				 output[j]->name, j == num_outputs - 1 ? "\n" : ", ");
+			igt_output_set_pipe(output[j], data->pipe_seq[combinations[i].combination[j]]);
+			primary[j] = igt_output_get_plane_type(output[j], DRM_PLANE_TYPE_PRIMARY);
+			mode = igt_output_get_mode(output[j]);
+			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
+			igt_plane_set_fb(primary[j], &fb[j]);
+		}
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_assert_f(ret == 0, "Commit failed\n");
+    }
 }
 
 igt_main
 {
+	int i, j;
 	data_t data;
 	igt_output_t *output;
-	drmModeModeInfo mode;
-	int valid_output = 0, i, count = 0, j = 0;
-	uint16_t width = 0, height = 0;
-	enum pipe pipe_seq[IGT_MAX_PIPES];
+	drmModeModeInfo default_mode;
 
+	i = j = 0;
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
-
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(data.display.is_atomic);
-
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
+		data.big_joiner_output_count = 0;
+		data.non_big_joiner_output_count = 0;
+		data.combined_output_count = 0;
+		data.output_count = 0;
 
 		for_each_connected_output(&data.display, output) {
 			bool found = false;
 			drmModeConnector *connector = output->config.connector;
-
-			/*
-			 * Bigjoiner will come in to the picture when the
-			 * resolution > 5K or clock > max-dot-clock.
-			 */
 			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock);
-
 			if (found) {
-				data.output[count].output_id = output->id;
-				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
-				count++;
-
-				width = max(width, mode.hdisplay);
-				height = max(height, mode.vdisplay);
+				data.big_joiner_outputs[data.big_joiner_output_count++] = output->id;
+				igt_output_override_mode(output, &connector->modes[0]);
+			} else {
+				data.non_big_joiner_outputs[data.non_big_joiner_output_count++] = output->id;
+				kmstest_get_connector_default_mode(data.drm_fd, connector, &default_mode);
+				igt_output_override_mode(output, &default_mode);
 			}
-			valid_output++;
+			data.output_count++;
+		}
+
+		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count > 0) {
+			data.combined_outputs[data.combined_output_count++] = data.big_joiner_outputs[0];
+			data.combined_outputs[data.combined_output_count++] = data.non_big_joiner_outputs[0];
 		}
 
 		data.n_pipes = 0;
 		for_each_pipe(&data.display, i) {
 			data.n_pipes++;
-			pipe_seq[j] = i;
+			data.pipe_seq[j] = i;
 			j++;
 		}
-
-		igt_require_f(count > 0, "No output with 5k+ mode (or) clock > max-dot-clock found\n");
-
-		igt_create_pattern_fb(data.drm_fd, width, height, DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR, &data.fb);
 	}
 
 	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
 	igt_subtest_with_dynamic("basic") {
-		for (i = 0; i < data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe_seq[i]))
-				test_basic_modeset(&data);
+		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
+
+		for (i = 0; i < data.big_joiner_output_count; i++) {
+			uint64_t num_combinations = 0;
+			Combination combinations[MAX_COMBINATIONS];
+
+			generate_combinations(i+1, data.n_pipes, BIG_JOINER, combinations, &num_combinations);
+			igt_info("Number of combinations for %d outputs and %d pipes are %ld\n",
+					 i+1, data.n_pipes, num_combinations);
+
+			if (num_combinations > 0)
+				igt_dynamic_f("%dx-big-joiner", i+1)
+					test_basic_modeset(&data, i+1, combinations, num_combinations);
+			else
+				break;
 		}
 	}
 
-	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
-		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset") {
-		data.pipe1 = pipe_seq[j - 1];
+		igt_require_f(data.big_joiner_output_count > 0, "Big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
 
-		igt_display_reset(&data.display);
-		for_each_connected_output(&data.display, output) {
-			if (data.output[0].output_id != output->id)
-				continue;
-
-			mode = data.output[0].mode;
-			igt_output_set_pipe(output, data.pipe1);
-			igt_output_override_mode(output, &mode);
-
-			igt_dynamic_f("pipe-%s-%s",
-				      kmstest_pipe_name(data.pipe1),
-				      igt_output_name(output))
-				test_invalid_modeset(&data);
-		}
+		if (data.big_joiner_output_count >= 1)
+			igt_dynamic_f("big_joiner_on_last_pipe")
+				tets_big_joiner_on_last_pipe(&data);
 
-		if(valid_output > 1) {
-			for (i = 0; i < data.n_pipes - 1; i++) {
-				igt_output_t *first_output = NULL, *second_output = NULL;
-
-				data.pipe1 = pipe_seq[i];
-				data.pipe2 = pipe_seq[i + 1];
-
-				igt_display_reset(&data.display);
-				for_each_connected_output(&data.display, output) {
-					if (data.output[0].output_id == output->id) {
-						first_output = output;
-						mode = data.output[0].mode;
-
-						igt_output_set_pipe(output, data.pipe1);
-						igt_output_override_mode(output, &mode);
-					} else if (second_output == NULL) {
-						second_output = output;
-						igt_output_set_pipe(output, data.pipe2);
-
-						break;
-					}
-				}
-
-				igt_dynamic_f("pipe-%s-%s-pipe-%s-%s",
-					      kmstest_pipe_name(data.pipe1),
-					      igt_output_name(first_output),
-					      kmstest_pipe_name(data.pipe2),
-					      igt_output_name(second_output))
-					test_invalid_modeset(&data);
-			}
-		}
-	}
+		if (data.big_joiner_output_count > 1)
+			igt_dynamic_f("invalid_combinations_with_two_bigjoiner")
+				test_invalid_modeset_two_joiner(&data, false);
 
-	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
-	igt_subtest_with_dynamic("2x-modeset") {
-		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
-		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
-		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			data.pipe2 = pipe_seq[i + 2];
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
-				test_dual_display(&data);
+		if (data.combined_output_count) {
+			igt_dynamic_f("invalid_combinations_with_bigjoiner_non_bigjoiner")
+				test_invalid_modeset_two_joiner(&data, true);
 		}
 	}
 
 	igt_fixture {
-		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-}
-- 
2.25.1

