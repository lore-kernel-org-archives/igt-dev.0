Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D0CC6FD1F
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 18:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C4D10F821;
	Thu, 21 Mar 2024 18:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="blhOI1Ec";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9C8110F80F
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 18:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711045074; x=1742581074;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yPyFKpqcNVZH0tM3HJL14dyi61oAdjvcuShmfJBkLnA=;
 b=blhOI1Ec7Sutt1NBCCk779TALmsvbDj/aCZLWxXlie+sgneYO6xmF8QZ
 y/Zdf50BkDD923fAeF6vsO7QyaImqm2vn55C4zzUYOvLNjdesigBSu00Z
 OLLTXS9ZIKIFW3rcF2Ib7tGrqStDdRvkzv/fWcDvy01R6MOOdhSi1y6MK
 dxRuaPbJDnzfx7ZDQRNBQUL2bxPARqASOBCPGI29LUKZKWIDBnNOXFJNQ
 DvPVNDgls+wFbMGuIwJ26J4m0kXQSug8fSHiltZGeIucgAe235r+wby4t
 eUwyhR/YBghQkQtO2vkdbiv9BRSzTFWcTAoybyECp/wNiQzdr35DNLL9Q A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5894113"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="5894113"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 11:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="14512629"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 11:17:50 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/4] tests/intel/kms_big_joiner: revamp bigjoiner
Date: Thu, 21 Mar 2024 23:58:29 +0530
Message-Id: <20240321182831.1143175-3-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321182831.1143175-1-kunal1.joshi@intel.com>
References: <20240321182831.1143175-1-kunal1.joshi@intel.com>
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

v2: Don't change license (Bhanu)
    Print the pipe name (Bhanu)
    Remove unwanted commit (Bhanu)
    Move combine output logic to igt_fixture (Bhanu)
    split revamp and force joiner (Bhanu)

v3: Ignored fused pipes (Stan)

v4: Ignore master pipes who doesn't have slave (Ankit)
	Retain subtest names (Ankit)
	Use commit instead of try_commit (Ankit)
	Fix typo (Ankit)

Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 tests/intel/kms_big_joiner.c | 416 ++++++++++++++++++-----------------
 1 file changed, 220 insertions(+), 196 deletions(-)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 99b1b898d..eba74cddf 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -44,177 +44,253 @@
  * SUBTEST: basic
  * Description: Verify the basic modeset on big joiner mode on all pipes
  *
- * SUBTEST: 2x-modeset
- * Description: Verify simultaneous modeset on 2 big joiner outputs
  */
 
 IGT_TEST_DESCRIPTION("Test big joiner");
 
-struct bigjoiner_output {
-	uint32_t output_id;
-	drmModeModeInfo mode;
-};
+#define INVALID_TEST_OUTPUT 2
 
 typedef struct {
 	int drm_fd;
-	igt_display_t display;
-	struct igt_fb fb;
+	int big_joiner_output_count;
+	int non_big_joiner_output_count;
+	int combined_output_count;
+	int output_count;
 	int n_pipes;
-	enum pipe pipe1;
-	enum pipe pipe2;
-	struct bigjoiner_output output[2];
+	int master_pipes;
+	uint64_t big_joiner_output[IGT_MAX_PIPES];
+	uint64_t non_big_joiner_output[IGT_MAX_PIPES];
+	uint64_t combined_output[IGT_MAX_PIPES];
+	enum pipe pipe_seq[IGT_MAX_PIPES];
+	igt_display_t display;
 } data_t;
 
 static int max_dotclock;
 
-static void test_invalid_modeset(data_t *data)
+static void set_all_master_pipes_for_platform(data_t *data)
 {
-	igt_output_t *output;
-	igt_display_t *display = &data->display;
-	int ret;
+	enum pipe pipe;
+	enum pipe last_pipe;
+
+	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES; pipe++) {
+		if (data->display.pipes[pipe].enabled) {
+			if (data->display.pipes[pipe+1].enabled) {
+				data->master_pipes |= BIT(pipe);
+				igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
+			}
+			last_pipe = pipe;
+		}
+	}
+	data->master_pipes |= BIT(last_pipe);
+}
 
-	igt_info("Bigjoiner test on ");
-	for_each_connected_output(display, output){
-		enum pipe p = output->pending_pipe;
-		drmModeModeInfo *mode;
-		igt_pipe_t *pipe;
-		igt_plane_t *plane;
+static igt_output_t *get_output_by_id_or_assert(data_t *data, uint64_t id)
+{
+	igt_output_t *output;
 
-		if (p == PIPE_NONE)
-			continue;
+	for_each_connected_output(&data->display, output) {
+		if (output->id == id)
+			return output;
+	}
+	igt_assert_f(false, "Output not found\n");
+	return NULL;
+}
 
-		mode = igt_output_get_mode(output);
-		igt_info("pipe:%s, output:%s, mode:", kmstest_pipe_name(p), igt_output_name(output));
-		kmstest_dump_mode(mode);
+static enum pipe get_next_master_pipe(data_t *data, unsigned int available_pipe_mask)
+{
+	if ((data->master_pipes & available_pipe_mask) == 0)
+		return PIPE_NONE;
 
-		pipe = &display->pipes[p];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	return ffs(data->master_pipes & available_pipe_mask) - 1;
+}
 
-		igt_plane_set_fb(plane, &data->fb);
-		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
-		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	}
+static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, unsigned int available_pipe_mask)
+{
+	enum pipe master_pipe;
+	unsigned int attempt_mask;
 
-	igt_assert(!igt_check_bigjoiner_support(display));
+	attempt_mask = BIT(pipe);
+	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 
-	/* This commit is expectd to fail as this pipe is being used for big joiner */
-	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
-					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (master_pipe == PIPE_NONE)
+		return PIPE_NONE;
 
-	igt_display_reset(&data->display);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
+			kmstest_pipe_name(pipe + 1), output->name);
+	igt_output_set_pipe(output, pipe);
 
-	igt_assert_lt(ret, 0);
+	return master_pipe;
 }
 
-static void test_basic_modeset(data_t *data)
+static void test_single_joiner(data_t *data, int output_count)
 {
+	int i;
+	enum pipe pipe, master_pipe;
+	unsigned int available_pipe_mask = BIT(data->n_pipes) - 1;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	uint64_t *outputs;
+	igt_fb_t fb;
 	drmModeModeInfo *mode;
-	igt_output_t *output, *bigjoiner_output = NULL;
-	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
 
-	igt_display_reset(display);
+	outputs = data->big_joiner_output;
 
-	for_each_connected_output(display, output) {
-		if (data->output[0].output_id == output->id) {
-			bigjoiner_output = output;
-			break;
+	for (i = 0; i < output_count; i++) {
+		output = get_output_by_id_or_assert(data, outputs[i]);
+		for (pipe = 0; pipe < data->n_pipes-1; pipe++) {
+			igt_display_reset(&data->display);
+			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
+			if (master_pipe == PIPE_NONE)
+				continue;
+			mode = igt_output_get_mode(output);
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &fb);
+			igt_plane_set_fb(primary, &fb);
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+			igt_plane_set_fb(primary, NULL);
+			igt_remove_fb(data->drm_fd, &fb);
 		}
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
+static void test_multi_joiner(data_t *data, int output_count)
 {
+	int i;
+	unsigned int available_pipe_mask;
+	enum pipe pipe, master_pipe;
+	uint64_t *outputs;
+	igt_output_t *output;
+	igt_plane_t *primary[output_count];
+	igt_fb_t fb[output_count];
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
+	available_pipe_mask = BIT(data->n_pipes) - 1;
+	outputs = data->big_joiner_output;
+
+	igt_display_reset(&data->display);
+	for (i = 0; i < output_count; i++) {
+		output = get_output_by_id_or_assert(data, outputs[i]);
+		for (pipe = 0; pipe < data->n_pipes; pipe++) {
+			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
+			if (master_pipe == PIPE_NONE)
+				continue;
+			mode = igt_output_get_mode(output);
+			primary[i] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &fb[i]);
+			igt_plane_set_fb(primary[i], &fb[i]);
+
+			available_pipe_mask &= ~BIT(master_pipe);
+			available_pipe_mask &= ~BIT(master_pipe + 1);
 			break;
+		}
 	}
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+	for (i = 0; i < output_count; i++) {
+		igt_plane_set_fb(primary[i], NULL);
+		igt_remove_fb(data->drm_fd, &fb[i]);
+	}
+}
 
-	igt_output_set_pipe(bigjoiner_output[0], data->pipe1);
-	igt_output_set_pipe(bigjoiner_output[1], data->pipe2);
-
-	/* Set up first big joiner output on Pipe A*/
-	mode = &data->output[0].mode;
-	igt_output_override_mode(bigjoiner_output[0], mode);
+static void test_invalid_modeset_two_joiner(data_t *data,
+					    bool combined)
+{
+	int i, j, ret;
+	unsigned int available_pipe_mask;
+	unsigned int attempt_mask;
+	enum pipe master_pipe;
+	uint64_t *outputs;
+	igt_output_t *output;
+	igt_plane_t *primary[INVALID_TEST_OUTPUT];
+	igt_fb_t fb[INVALID_TEST_OUTPUT];
+	drmModeModeInfo *mode;
 
-	pipe = &display->pipes[data->pipe1];
-	plane1 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	available_pipe_mask = BIT(data->n_pipes) - 1;
+	outputs = combined ? data->combined_output : data->big_joiner_output;
 
-	igt_plane_set_fb(plane1, &data->fb);
-	igt_fb_set_size(&data->fb, plane1, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane1, mode->hdisplay, mode->vdisplay);
+	for (i = 0; i < data->n_pipes-1; i++) {
+		igt_display_reset(&data->display);
+		attempt_mask = BIT(data->pipe_seq[i]);
+		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 
-	/* Set up second big joiner output on Pipe C*/
-	mode = &data->output[1].mode;
-	igt_output_override_mode(bigjoiner_output[1], mode);
+		if (master_pipe == PIPE_NONE)
+			continue;
 
-	pipe = &display->pipes[data->pipe2];
-	plane2 = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
+			output = get_output_by_id_or_assert(data, outputs[j]);
+			igt_output_set_pipe(output, data->pipe_seq[i + j]);
+			mode = igt_output_get_mode(output);
+			igt_info(" Assigning pipe %s to %s with mode %dx%d@%d%s",
+				 kmstest_pipe_name(data->pipe_seq[i + j]),
+				 igt_output_name(output), mode->hdisplay,
+				 mode->vdisplay, mode->vrefresh,
+				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
+			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+								  DRM_FORMAT_MOD_LINEAR, &fb[j]);
+			igt_plane_set_fb(primary[j], &fb[j]);
+		}
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
+			igt_plane_set_fb(primary[j], NULL);
+			igt_remove_fb(data->drm_fd, &fb[j]);
+		}
+		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
+	}
+}
 
-	igt_plane_set_fb(plane2, &data->fb);
-	igt_fb_set_size(&data->fb, plane2, mode->hdisplay, mode->vdisplay);
-	igt_plane_set_size(plane2, mode->hdisplay, mode->vdisplay);
+static void test_big_joiner_on_last_pipe(data_t *data)
+{
+	int i, len, ret;
+	uint64_t *outputs;
+	igt_output_t *output;
+	igt_plane_t *primary;
+	igt_fb_t fb;
+	drmModeModeInfo *mode;
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	len = data->big_joiner_output_count;
+	outputs = data->big_joiner_output;
 
-	/* Clean up */
-	igt_output_set_pipe(bigjoiner_output[0], PIPE_NONE);
-	igt_output_set_pipe(bigjoiner_output[1], PIPE_NONE);
-	igt_plane_set_fb(plane1, NULL);
-	igt_plane_set_fb(plane2, NULL);
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	for (i = 0; i < len; i++) {
+		igt_display_reset(&data->display);
+		output = get_output_by_id_or_assert(data, outputs[i]);
+		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
+		mode = igt_output_get_mode(output);
+		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
+				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
+				 igt_output_name(output), mode->hdisplay,
+				 mode->vdisplay, mode->vrefresh);
+		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
+							  DRM_FORMAT_MOD_LINEAR, &fb);
+		igt_plane_set_fb(primary, &fb);
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
+	}
 }
 
 igt_main
 {
-	data_t data;
+	int i, j;
 	igt_output_t *output;
 	drmModeModeInfo mode;
-	int valid_output = 0, i, count = 0, j = 0;
-	uint16_t width = 0, height = 0;
-	enum pipe pipe_seq[IGT_MAX_PIPES];
+	data_t data;
 
 	igt_fixture {
+		data.big_joiner_output_count = 0;
+		data.non_big_joiner_output_count = 0;
+		data.combined_output_count = 0;
+		data.output_count = 0;
+		j = 0;
+
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
-
 		igt_display_require(&data.display, data.drm_fd);
+		set_all_master_pipes_for_platform(&data);
 		igt_require(data.display.is_atomic);
-
 		max_dotclock = igt_get_max_dotclock(data.drm_fd);
 
 		for_each_connected_output(&data.display, output) {
@@ -228,105 +304,53 @@ igt_main
 			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
 
 			if (found) {
-				data.output[count].output_id = output->id;
-				memcpy(&data.output[count].mode, &mode, sizeof(drmModeModeInfo));
-				count++;
-
-				width = max(width, mode.hdisplay);
-				height = max(height, mode.vdisplay);
+				data.big_joiner_output[data.big_joiner_output_count++] = output->config.connector->connector_id;
+				igt_output_override_mode(output, &mode);
+			} else {
+				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output->config.connector->connector_id;
 			}
-			valid_output++;
+			data.output_count++;
+		}
+		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
+			data.combined_output[data.combined_output_count++] = data.big_joiner_output[0];
+			data.combined_output[data.combined_output_count++] = data.non_big_joiner_output[0];
 		}
-
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
-		}
+			igt_require_f(data.big_joiner_output_count > 0,
+				      "No bigjoiner output found\n");
+			igt_require_f(data.n_pipes > 1,
+				      "Minimum 2 pipes required\n");
+			igt_dynamic_f("single-joiner")
+				test_single_joiner(&data, data.big_joiner_output_count);
+			if (data.big_joiner_output_count > 1)
+				igt_dynamic_f("multi-joiner")
+					test_multi_joiner(&data, data.big_joiner_output_count);
 	}
 
-	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
-		     "when the pipe is active with a big joiner modeset");
 	igt_subtest_with_dynamic("invalid-modeset") {
-		data.pipe1 = pipe_seq[j - 1];
-
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
-
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
-
-	igt_describe("Verify simultaneous modeset on 2 big joiner outputs");
-	igt_subtest_with_dynamic("2x-modeset") {
-		igt_require_f(count > 1, "2 outputs with big joiner modes are required\n");
-		igt_require_f(data.n_pipes > 3, "Minumum of 4 pipes are required\n");
-		for (i = 0; (i + 2) < data.n_pipes - 1; i++) {
-			data.pipe1 = pipe_seq[i];
-			data.pipe2 = pipe_seq[i + 2];
-			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe_seq[i]), kmstest_pipe_name(pipe_seq[i + 2]))
-				test_dual_display(&data);
-		}
+		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
+		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
+		if (data.big_joiner_output_count >= 1)
+			igt_dynamic_f("big_joiner_on_last_pipe")
+				test_big_joiner_on_last_pipe(&data);
+		if (data.big_joiner_output_count > 1)
+			igt_dynamic_f("invalid_combinations")
+				test_invalid_modeset_two_joiner(&data, false);
+		if (data.combined_output_count)
+			igt_dynamic_f("combined_output")
+				test_invalid_modeset_two_joiner(&data, true);
 	}
 
 	igt_fixture {
-		igt_remove_fb(data.drm_fd, &data.fb);
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
 	}
-- 
2.34.1

