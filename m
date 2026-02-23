Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB757E98E06
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 08:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550CD10E26C;
	Mon, 23 Feb 2026 08:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cd48hsZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65BC810E27C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771834334; x=1803370334;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jsvFmc8VivDgGyiL/MQ1mf4XF1nfPeaqGpXvFz4H4Iw=;
 b=cd48hsZt0uIM4po4UQif66xEafRi0nt6JoWEszbDig+fo0QIXulEOdul
 s16yiz+6yUVR/hEqeMg9mSi4Q0q5YeRMYQXGQJ9WGlLjsWZf6BgZINJr0
 Z//eTWcwRoeXHEomSwIsJC1sfMqqDdqk54+FDRGraszOep7CxXaWfGR9y
 NLMMbH5wIGLfwZtPXqRcqwgSVx9gkoHkCtTVRSTu4+6cEsul1mKb58tDi
 ACu0yZm4s/uKbCb6Uxw9XjVPz//b4feWR4esA5kNjTivTK5kLGopnlTtS
 eabOfa070UBA39P4QoZE/FsIF8uhG375eZ7FJgY/CTHZ37TArcpLH9pW7 g==;
X-CSE-ConnectionGUID: q4WY/Wz1T96dMcHGtSmpXQ==
X-CSE-MsgGUID: c/gLlyX7RfGJA6Det29jxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75431407"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="75431407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:12:14 -0800
X-CSE-ConnectionGUID: SHt5Nw/eSJa6Xrc7JnpyKQ==
X-CSE-MsgGUID: gaVYj+UHTUOa7ewJjDbHHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215625121"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:12:13 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 1/2] tests/kms_pipe_stress: make pipe assignment
 joiner-aware
Date: Mon, 23 Feb 2026 14:02:58 +0530
Message-ID: <20260223083259.187783-2-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223083259.187783-1-sowmiya.s@intel.com>
References: <20260223083259.187783-1-sowmiya.s@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use joiner-aware pipe allocation in kms_pipe_stress
by replacing linear output-to-pipe mapping with
igt_assign_pipes_for_outputs(). Assign outputs
incrementally, skip outputs that cannot get valid
pipe blocks, and proceed when at least one output
is assignable. Track outputs by driving CRTC pipe
(output_by_pipe) and iterate setup/stress using
assigned pipes.
Copy selected connector modes into owned storage
to avoid stale mode pointers after output refresh.
Clear temporary CRTC mappings after assignment to
preserve the test’s progressive modeset flow.

v2: Add close tag for the gitlab issue

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6928
Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
---
 tests/intel/kms_pipe_stress.c | 198 +++++++++++++++++-----------------
 tests/meson.build             |   1 +
 2 files changed, 103 insertions(+), 96 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 47e7524c6..3caef8e18 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -19,6 +19,8 @@
 #include <semaphore.h>
 #include "i915/gem.h"
 #include "xe/xe_query.h"
+#include "intel/kms_joiner_helper.h"
+
 /**
  * TEST: kms pipe stress
  * Category: Display
@@ -161,8 +163,7 @@ struct data {
 	struct gpu_context gpu_context[IGT_MAX_PIPES];
 	pthread_mutex_t gpu_fill_lock;
 	drmModeModeInfo *highest_mode[IGT_MAX_PIPES];
-	drmModeConnectorPtr *connectors;
-	drmModeRes *mode_resources;
+	igt_output_t *output_by_pipe[IGT_MAX_PIPES];
 	int number_of_cores;
 	igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
 };
@@ -505,7 +506,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 	return data_rate;
 }
 
-
 static drmModeModeInfo *find_highest_mode(drmModeConnector *connector)
 {
 	drmModeModeInfo *highest_mode = NULL;
@@ -526,72 +526,26 @@ static drmModeModeInfo *find_highest_mode(drmModeConnector *connector)
 	return highest_mode;
 }
 
-typedef drmModeConnector *drmModeConnectorPtr;
-
-static void fill_connector_to_pipe_array(struct data *data,
-					 drmModeRes *mode_resources,
-					 drmModeConnectorPtr *connectors)
-{
-	int pipe = 0;
-	int i;
-
-	memset(connectors, 0, sizeof(drmModeConnectorPtr) *
-	       mode_resources->count_connectors);
-
-	igt_info("Got %d connectors\n", mode_resources->count_connectors);
-
-	for (i = 0; i < mode_resources->count_connectors; i++) {
-		drmModeConnector *connector;
-
-		connector = drmModeGetConnector(data->drm_fd,
-						mode_resources->connectors[i]);
-
-		if (!connector) {
-			igt_warn("could not get connector %i: %s\n",
-				 mode_resources->connectors[i], strerror(errno));
-			continue;
-		}
-
-		if (connector->connection == DRM_MODE_CONNECTED) {
-			igt_info("Connector %d connected to pipe %d\n", i, pipe);
-			connectors[pipe] = (drmModeConnectorPtr)connector;
-			++pipe;
-			if (pipe == IGT_MAX_PIPES)
-				break;
-		} else {
-			igt_info("Connector %d connection status %d\n",
-				 i, connector->connection);
-			drmModeFreeConnector(connector);
-		}
-	}
-}
-
-static void release_connectors(drmModeConnectorPtr *connectors)
-{
-	int i;
-
-	for (i = 0; i < IGT_MAX_PIPES; i++) {
-		if (connectors[i])
-			drmModeFreeConnector(connectors[i]);
-	}
-	free(connectors);
-}
 
 static void stress_pipes(struct data *data, struct timespec *start,
 			 struct timespec *end)
 {
 	igt_display_t *display = &data->display;
-	int pipe = 0;
 	int ret = 0;
 	igt_output_t *output;
 	igt_crc_t crc, crc2;
+	igt_crtc_t *crtc;
 
-	for_each_connected_output(&data->display, output) {
+	for_each_crtc(display, crtc) {
+		enum pipe pipe = crtc->pipe;
 
+		output = data->output_by_pipe[pipe];
+		if (!output)
+			continue;
 		if (!data->highest_mode[pipe])
 			continue;
 
-		igt_assert_f(igt_crtc_for_pipe(display, pipe)->n_planes < MAX_PLANES,
+		igt_assert_f(crtc->n_planes < MAX_PLANES,
 			     "Currently we don't support more than %d planes!",
 			     MAX_PLANES);
 
@@ -607,8 +561,6 @@ static void stress_pipes(struct data *data, struct timespec *start,
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
 		igt_assert_crc_equal(&crc, &crc2);
-
-		++pipe;
 	}
 }
 
@@ -740,6 +692,79 @@ static void create_framebuffers(struct data *data)
 	}
 }
 
+static void assign_outputs_to_pipes(struct data *data)
+{
+	igt_display_t *display = &data->display;
+	igt_output_t *output;
+	igt_output_t *connected_outputs[IGT_MAX_PIPES];
+	igt_output_t *single_output[1];
+	uint32_t valid_pipes_mask = 0, used_pipes_mask = 0, master_pipes_mask = 0;
+	int connected_output_count = 0, assigned_output_count = 0;
+	int n_pipes = igt_display_n_crtcs(display);
+	enum pipe pipe;
+	int i;
+
+	for (i = 0; i < n_pipes; i++) {
+		if (igt_crtc_for_pipe(display, i)->valid)
+			valid_pipes_mask |= BIT(i);
+	}
+	igt_set_all_master_pipes_for_platform(display, &master_pipes_mask);
+
+	memset(data->highest_mode, 0, sizeof(drmModeModeInfo *) * IGT_MAX_PIPES);
+	for_each_connected_output(display, output) {
+		if (connected_output_count >= n_pipes)
+			break;
+		connected_outputs[connected_output_count++] = output;
+	}
+	igt_require_f(connected_output_count > 0, "No connected output found\n");
+
+	for (i = 0; i < connected_output_count; i++) {
+		igt_crtc_t *crtc;
+		uint32_t next_used_pipes_mask = used_pipes_mask;
+
+		output = connected_outputs[i];
+		single_output[0] = output;
+		if (!igt_assign_pipes_for_outputs(data->drm_fd,
+						  single_output,
+						  1,
+						  n_pipes,
+						  &next_used_pipes_mask,
+						  master_pipes_mask,
+						  valid_pipes_mask)) {
+			igt_info("Skipping output %s: no available pipes for joiner requirements\n",
+				 output->name);
+			continue;
+		}
+
+		used_pipes_mask = next_used_pipes_mask;
+		crtc = igt_output_get_driving_crtc(output);
+		igt_assert(crtc);
+		pipe = crtc->pipe;
+
+		if (output->config.connector && output->config.connector->count_modes) {
+			drmModeModeInfo *mode = find_highest_mode(output->config.connector);
+
+			if (mode) {
+				data->highest_mode[pipe] = malloc(sizeof(*mode));
+				igt_assert(data->highest_mode[pipe]);
+				*data->highest_mode[pipe] = *mode;
+			}
+		}
+		igt_assert(data->highest_mode[pipe]);
+		data->output_by_pipe[pipe] = output;
+		assigned_output_count++;
+	}
+	igt_require_f(assigned_output_count > 0,
+		      "No output could be assigned to available pipes with joiner constraints\n");
+
+	/*
+	 * Clear pending CRTC mappings from the pipe assignment stage so the test
+	 * keeps its original progressive modeset flow.
+	 */
+	for (i = 0; i < connected_output_count; i++)
+		igt_output_set_crtc(connected_outputs[i], NULL);
+}
+
 static void destroy_framebuffers(struct data *data)
 {
 	igt_display_t *display = &data->display;
@@ -768,11 +793,13 @@ static void destroy_framebuffers(struct data *data)
 static void prepare_test(struct data *data)
 {
 	igt_display_t *display = &data->display;
+	enum pipe pipe;
 	int i, j;
-	int num_connectors;
 	int num_cpus = (int) sysconf(_SC_NPROCESSORS_ONLN);
+	igt_crtc_t *crtc;
 
 	data->number_of_cores = min(num_cpus, MAX_CORES);
+	igt_display_reset(display);
 
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
 		for (j = 0; j < MAX_PLANES; j++)
@@ -780,49 +807,26 @@ static void prepare_test(struct data *data)
 		data->cursor_fb[i].fb_id = 0;
 		data->num_planes[i] = -1;
 		data->last_mode[i] = NULL;
+		data->highest_mode[i] = NULL;
+		data->output_by_pipe[i] = NULL;
 		sem_init(&data->gpu_thread_pause_ack[i], 0, 0);
 	}
 
 	start_cpu_threads(data);
-	data->mode_resources = drmModeGetResources(data->drm_fd);
-	if (!data->mode_resources) {
-		igt_warn("drmModeGetResources failed: %s\n", strerror(errno));
-		return;
-	}
-
-	num_connectors = data->mode_resources->count_connectors;
-	num_connectors = max(num_connectors, IGT_MAX_PIPES);
-	memset(data->highest_mode, 0, sizeof(drmModeModeInfo *) * IGT_MAX_PIPES);
-	data->connectors =
-		(drmModeConnectorPtr *)calloc(sizeof(drmModeConnectorPtr) * num_connectors, 1);
-	fill_connector_to_pipe_array(data, data->mode_resources, data->connectors);
-
-	for (i = 0; i < IGT_MAX_PIPES; i++) {
-		drmModeConnector *connector = (drmModeConnector *)data->connectors[i];
+	assign_outputs_to_pipes(data);
 
-		if (!connector)
+	for_each_crtc(display, crtc) {
+		pipe = crtc->pipe;
+		if (!data->output_by_pipe[pipe])
 			continue;
+		igt_info("Using mode:\n");
+		kmstest_dump_mode(data->highest_mode[pipe]);
+		data->pipe_crc[pipe] = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 
-		if (!data->highest_mode[i]) {
-			if (connector->count_modes)
-				data->highest_mode[i] = find_highest_mode(connector);
-		}
-		igt_assert(data->highest_mode[i]);
-
-		if (data->highest_mode[i]) {
-			igt_info("Using mode: \n");
-			kmstest_dump_mode(data->highest_mode[i]);
-			data->pipe_crc[i] = igt_crtc_crc_new(igt_crtc_for_pipe(display, i),
-							     IGT_PIPE_CRC_SOURCE_AUTO);
-		} else
-			data->pipe_crc[i] = NULL;
-
-		if (data->num_planes[i] == -1)
-			data->num_planes[i] = igt_crtc_for_pipe(display,
-								i)->n_planes;
-
+		if (data->num_planes[pipe] == -1)
+			data->num_planes[pipe] = crtc->n_planes;
 		igt_info("Max number of planes is %d for pipe %d\n",
-			 data->num_planes[i], i);
+			 data->num_planes[pipe], pipe);
 	}
 
 	create_framebuffers(data);
@@ -848,11 +852,13 @@ static void finish_test(struct data *data)
 		data->last_mode[i] = NULL;
 		if (data->pipe_crc[i])
 			igt_pipe_crc_free(data->pipe_crc[i]);
+		if (data->highest_mode[i]) {
+			free(data->highest_mode[i]);
+			data->highest_mode[i] = NULL;
+		}
 	}
 
 	stop_cpu_threads(data);
-	release_connectors(data->connectors);
-	drmModeFreeResources(data->mode_resources);
 }
 
 struct data data = {
diff --git a/tests/meson.build b/tests/meson.build
index 7f356de9b..b8b287f50 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -399,6 +399,7 @@ extra_sources = {
            join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
 	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
+	'kms_pipe_stress': [ join_paths ('intel', 'kms_joiner_helper.c') ],
 	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
 }
 
-- 
2.43.0

