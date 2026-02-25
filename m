Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418E6FD3758
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C7910E355;
	Wed, 25 Feb 2026 12:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGCR4pZW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6FF10E355
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023887; x=1803559887;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=36WWeNTwQ9vI6wIxE1rCet02CNDCvZK6+3EItDZaaEc=;
 b=hGCR4pZWnUx9tiwnsxpkbmJFJEVaTX+KpnG8rkaUPBz16azTRMIHcHot
 f5wK8mUx6CvXY35rfsOpam2HLViNJFtnO2NpGOaoHCYWQhHyI2Y2+LDi7
 1nCDy+UDNrxkLPc6SG+Aks6XDh0++P5ngh5NYmTXisBudkk43Nu6SL0B3
 vEIxbGSaBp/lgfbOnBICzG01rv00SlVRUMfyO7kHxJSqCSEcajDa7mC76
 aQCJOerknFE56qNnHzxyk75SDaivuD4E3gLQwlC1lzin/7Kwpv4dttNrY
 37GD+GFoh7iXAGzJnGL99Krld52PwBv8BBh8zsFHiD+KZV56N844TMR9I w==;
X-CSE-ConnectionGUID: AjuEoTSfQ9Kih6i1pBirjw==
X-CSE-MsgGUID: B73mTKBxQByYV1F/83ZjNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72934478"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72934478"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:27 -0800
X-CSE-ConnectionGUID: 6zcDd6SRQumC81yg2kDp/A==
X-CSE-MsgGUID: yrq1pWIiRlytzTDBRe4qpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215331969"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:26 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/19] tests/kms: Consolidate igt_crtc_for_pipe() calls
Date: Wed, 25 Feb 2026 14:50:53 +0200
Message-ID: <20260225125108.31119-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Several tests have igt_crtc_for_pipe() calls sprinkled all over
the place. Consolidate them better, and assign each to local
variable, to better see what's actually going on.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_mode_switch.c          |  5 +++--
 tests/amdgpu/amd_multidisplay_modeset.c |  7 +++++--
 tests/amdgpu/amd_odm.c                  |  4 +---
 tests/intel/gem_eio.c                   | 11 ++++++----
 tests/intel/gem_exec_reloc.c            |  9 ++++++---
 tests/intel/kms_cdclk.c                 | 11 +++++-----
 tests/intel/kms_pipe_stress.c           | 27 ++++++++++++++-----------
 tests/kms_bw.c                          |  5 +++--
 tests/kms_rotation_crc.c                | 15 ++++++++------
 9 files changed, 54 insertions(+), 40 deletions(-)

diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 98e1fc06ce08..4da07c412996 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -96,6 +96,8 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 	/* First supported mode */
 
 	for (j = 0; j < num_pipes; j++) {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, j);
+
 		output = data->output[j];
 		if (!igt_output_is_connected(output))
 			continue;
@@ -113,8 +115,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 					    DRM_FORMAT_MOD_NONE, 1.f, 0.f,
 					    0.f, buffer1[j]);
 		}
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, j));
+		igt_output_set_crtc(output, crtc);
 		force_output_mode(data, output, kmode);
 		igt_plane_set_fb(data->primary[j], buffer1[j]);
 		drmModeFreeConnector(conn);
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 5eb61b54a43d..a2853e73225a 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -279,6 +279,8 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 			igt_info("\n\nnmode loop:%d -----\n", i);
 		j = 0;
 		for_each_connected_output(display, output) {
+			igt_crtc_t *crtc;
+
 			if (test_mode == DISPLAY_ENABLE_DISABLE) {
 				/* only enable display mapping to
 				 * bitmap_disps with value 1
@@ -323,12 +325,13 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 				igt_output_override_mode(output, kmode);
 			}
 
+			crtc = igt_crtc_for_pipe(display, j);
+
 			igt_create_pattern_fb(data->fd, kmode->hdisplay,
 					kmode->vdisplay, DRM_FORMAT_XRGB8888,
 					0, (buf + j));
 
-			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(display, j));
+			igt_output_set_crtc(output, crtc);
 			igt_plane_set_fb(data->primary[j], (buf + j));
 			j++;
 		}
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 85873880e7a5..ac6b839847a2 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -110,7 +110,6 @@ static void run_test_odmc(struct data *data, enum odmc_mode m, const drmModeMode
 	struct igt_fb buffer;
 	char buf[256];
 	int ret, seg, fd;
-	int i = 0;
 
 	test_init(data);
 
@@ -121,8 +120,7 @@ static void run_test_odmc(struct data *data, enum odmc_mode m, const drmModeMode
 			    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
 			    &buffer);
 
-	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, i));
+	igt_output_set_crtc(data->output, data->crtc);
 
 	igt_plane_set_fb(data->primary, &buffer);
 
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 09ea3bf6b8cd..361fd24744c4 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1032,17 +1032,20 @@ static void display_helper(igt_display_t *dpy, int *done)
 		drmModeModeInfoPtr mode;
 		igt_plane_t *primary;
 		igt_output_t *output;
+		igt_crtc_t *crtc;
 		int pipe;
 
 		pipe = rand() % igt_display_n_crtcs(dpy);
-		if (!igt_crtc_for_pipe(dpy, pipe)->valid)
+
+		crtc = igt_crtc_for_pipe(dpy, pipe);
+		if (!crtc || !crtc->valid)
 			continue;
-		output = igt_get_single_output_for_pipe(dpy, pipe);
+
+		output = igt_get_single_output_for_pipe(dpy, crtc->pipe);
 		if (!output)
 			continue;
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(dpy, pipe));
+		igt_output_set_crtc(output, crtc);
 		mode = igt_output_get_mode(output);
 
 		if (fb.width != mode->hdisplay || fb.height != mode->vdisplay) {
diff --git a/tests/intel/gem_exec_reloc.c b/tests/intel/gem_exec_reloc.c
index c2c5765a543f..53d8a1e9aa7e 100644
--- a/tests/intel/gem_exec_reloc.c
+++ b/tests/intel/gem_exec_reloc.c
@@ -1510,15 +1510,18 @@ static void scanout(int i915,
 		.rsvd1 = ctx->id,
 	};
 	igt_output_t *output;
+	igt_crtc_t *crtc;
 	struct igt_fb fb;
 	uint64_t *map;
 
 	igt_display_reset(dpy);
 
-	output = igt_get_single_output_for_pipe(dpy, PIPE_A);
+	crtc = igt_crtc_for_pipe(dpy, PIPE_A);
+
+	output = igt_get_single_output_for_pipe(dpy, crtc->pipe);
 	igt_require(output);
-	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(dpy, PIPE_A));
+
+	igt_output_set_crtc(output, crtc);
 
 	/*
 	 * Find where the scanout is in our GTT; on !full-ppgtt this will be
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 9f2b81985361..73cb962c0fe9 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -239,12 +239,10 @@ static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
 		     igt_output_t **valid_outputs, struct igt_fb fb)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc;
-	igt_plane_t *plane;
 
 	for (int i = 0; i < count; i++) {
-		crtc = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
+		igt_plane_t *plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_output_override_mode(valid_outputs[i], &mode[i]);
 
@@ -289,14 +287,15 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 		      "Number of valid outputs (%d) must be greater than or equal to 2\n", count);
 
 	for (int i = 0; i < count; i++) {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
+
 		mode = igt_output_get_mode(valid_outputs[i]);
 		igt_assert(mode);
 
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		igt_output_set_crtc(valid_outputs[i],
-				    igt_crtc_for_pipe(display, i));
+		igt_output_set_crtc(valid_outputs[i], crtc);
 		igt_output_override_mode(valid_outputs[i], &mode_highres[i]);
 	}
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 7b7a65ff5630..72f8a7be23cc 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -594,25 +594,25 @@ static void stress_pipes(struct data *data, struct timespec *start,
 	igt_crc_t crc, crc2;
 
 	for_each_connected_output(&data->display, output) {
+		igt_crtc_t *crtc;
 
 		if (!data->highest_mode[pipe])
 			continue;
 
-		igt_assert_f(igt_crtc_for_pipe(display, pipe)->n_planes < MAX_PLANES,
+		crtc = igt_crtc_for_pipe(display, pipe);
+
+		igt_assert_f(crtc->n_planes < MAX_PLANES,
 			     "Currently we don't support more than %d planes!",
 			     MAX_PLANES);
 
-		ret = pipe_stress(data, output,
-				  igt_crtc_for_pipe(display, pipe),
+		ret = pipe_stress(data, output, crtc,
 				  data->highest_mode[pipe]);
 		if (ret)
 			break;
 
 		igt_pipe_crc_start(data->pipe_crc[pipe]);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc);
-		get_vblank(data->display.drm_fd,
-			   igt_crtc_for_pipe(display, pipe),
-			   DRM_VBLANK_NEXTONMISS);
+		get_vblank(data->display.drm_fd, crtc, DRM_VBLANK_NEXTONMISS);
 		igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc[pipe], &crc2);
 		igt_pipe_crc_stop(data->pipe_crc[pipe]);
 		igt_assert_crc_equal(&crc, &crc2);
@@ -755,14 +755,16 @@ static void destroy_framebuffers(struct data *data)
 	int i, j;
 
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
+		igt_crtc_t *crtc;
 
 		if (!data->highest_mode[i])
 			continue;
 
+		crtc = igt_crtc_for_pipe(display, i);
+
 		for (j = 0; j < MAX_PLANES; j++) {
 			if (data->fb[i * MAX_PLANES + j].fb_id) {
-				igt_plane_set_fb(&igt_crtc_for_pipe(display, i)->planes[j],
-						 NULL);
+				igt_plane_set_fb(&crtc->planes[j], NULL);
 				igt_remove_fb(data->display.drm_fd, &data->fb[i * MAX_PLANES + j]);
 				data->fb[i * MAX_PLANES + j].fb_id = 0;
 			}
@@ -808,6 +810,7 @@ static void prepare_test(struct data *data)
 
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
 		drmModeConnector *connector = (drmModeConnector *)data->connectors[i];
+		igt_crtc_t *crtc;
 
 		if (!connector)
 			continue;
@@ -818,17 +821,17 @@ static void prepare_test(struct data *data)
 		}
 		igt_assert(data->highest_mode[i]);
 
+		crtc = igt_crtc_for_pipe(display, i);
+
 		if (data->highest_mode[i]) {
 			igt_info("Using mode: \n");
 			kmstest_dump_mode(data->highest_mode[i]);
-			data->pipe_crc[i] = igt_crtc_crc_new(igt_crtc_for_pipe(display, i),
-							     IGT_PIPE_CRC_SOURCE_AUTO);
+			data->pipe_crc[i] = igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 		} else
 			data->pipe_crc[i] = NULL;
 
 		if (data->num_planes[i] == -1)
-			data->num_planes[i] = igt_crtc_for_pipe(display,
-								i)->n_planes;
+			data->num_planes[i] = crtc->n_planes;
 
 		igt_info("Max number of planes is %d for pipe %d\n",
 			 data->num_planes[i], i);
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 778900d8c9f1..690e28958b38 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -210,6 +210,8 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 
 	/* create buffers */
 	for (i = 0; i <= pipe; i++) {
+		crtc = igt_crtc_for_pipe(display, i);
+
 		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output) {
 			continue;
@@ -222,8 +224,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 				    DRM_FORMAT_MOD_LINEAR, 1.f, 0.f, 0.f,
 				    &buffer[i]);
 
-		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, i));
+		igt_output_set_crtc(output, crtc);
 
 		igt_plane_set_fb(data->primary[i], &buffer[i]);
 		igt_info("Assigning pipe %s to output %s with mode %s\n",
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index cd0873b3bf8d..6240e112cb29 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1314,6 +1314,8 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Rotation test on both planes by making them fully visible");
 	igt_subtest_f("multiplane-rotation") {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(&data.display, PIPE_A);
+
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
@@ -1322,13 +1324,14 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.4f;
 		data.planepos[1].y = .1f;
-		test_multi_plane_rotation(&data,
-					  igt_crtc_for_pipe(&data.display, PIPE_A));
+		test_multi_plane_rotation(&data, crtc);
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
 			"right/top corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-top") {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(&data.display, PIPE_A);
+
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
@@ -1337,13 +1340,14 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.15f;
-		test_multi_plane_rotation(&data,
-					  igt_crtc_for_pipe(&data.display, PIPE_A));
+		test_multi_plane_rotation(&data, crtc);
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
 			"and right/bottom corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-bottom") {
+		igt_crtc_t *crtc = igt_crtc_for_pipe(&data.display, PIPE_A);
+
 		igt_require(gen >= 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_bottom | p_left;
@@ -1352,8 +1356,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_bottom | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.20f;
-		test_multi_plane_rotation(&data,
-					  igt_crtc_for_pipe(&data.display, PIPE_A));
+		test_multi_plane_rotation(&data, crtc);
 	}
 
 	/*
-- 
2.52.0

