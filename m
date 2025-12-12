Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D90D59D6A
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4CF10E903;
	Fri, 12 Dec 2025 15:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJ8Sg9nh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583D310E907
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554404; x=1797090404;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lD4EPWDlMXtZ3wnDxccjGFl3H3wsFX0TKJx7ACG7bXg=;
 b=LJ8Sg9nhNIx3zrHojWNPCstvg5QLluMu6EygRCdCw3byOJMQz6WQU4kU
 hcej7RzxtAtqjDFHJmkXpLcdGxRlqmQNQdpu66wapT469m8WAn2THrQix
 2pLhwfa7IUq9dGXEVi1gkDLmJFDb0CC1CYD/Hy9YqLuJH6/c/783PovBf
 MjXhrpgWDhhp0ZUeBQELoc2iPvGwc0Q3DUD5UK+j48fC8G33+pqSHIKT6
 bxbDgcw0cEE/+8+NQzVFNfTzMAw+5L6sfGvLrrC2t6epHIVLIkO7yxX3+
 /kVOvdGGOyfw7qFcfh/yZTQvAxTmDHYakRCRY2G85qnZoEA0ydBeqhPdy Q==;
X-CSE-ConnectionGUID: j4NDRin/TX6G79ENpDy9lQ==
X-CSE-MsgGUID: HMWmKD7hRimDFuVDNmg+zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="70141982"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="70141982"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:44 -0800
X-CSE-ConnectionGUID: 8a8JYyqDR4G1EZHf86Sd2w==
X-CSE-MsgGUID: blIvepgoSj60aWM1WqM2Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="220491010"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:41 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 03/10] lib/kms: Use igt_display_n_crtcs() everywhere
Date: Fri, 12 Dec 2025 17:46:19 +0200
Message-ID: <20251212154626.29471-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
References: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Replace all igt_display_get_n_pipes() and naked
display->n_pipes uses with igt_display_n_crtcs().

One step towards using 'crtcs' instead of 'pipes'.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
@@
- igt_display_get_n_pipes(...) { ... }

@@
expression DISPLAY;
@@
- igt_display_get_n_pipes(DISPLAY)
+ igt_display_n_crtcs(DISPLAY)

@@
igt_display_t DISPLAY;
expression E;
@@
(
 DISPLAY.n_pipes = E;
|
- DISPLAY.n_pipes
+ igt_display_n_crtcs(&DISPLAY)
)

@@
igt_display_t *DISPLAY;
expression E;
@@
(
 DISPLAY->n_pipes = E;
|
- DISPLAY->n_pipes
+ igt_display_n_crtcs(DISPLAY)
)

@@
identifier DISPLAY;
@@
igt_display_n_crtcs(igt_display_t *DISPLAY)
{
<...
- igt_display_n_crtcs(DISPLAY)
+ DISPLAY->n_pipes
...>
}

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                           | 42 ++++++++++---------------
 lib/igt_kms.h                           |  1 -
 tests/amdgpu/amd_dp_dsc.c               |  3 +-
 tests/amdgpu/amd_hotplug.c              |  2 +-
 tests/amdgpu/amd_mode_switch.c          |  2 +-
 tests/amdgpu/amd_multidisplay_modeset.c |  2 +-
 tests/amdgpu/amd_plane.c                |  2 +-
 tests/amdgpu/amd_subvp.c                |  3 +-
 tests/intel/gem_eio.c                   |  2 +-
 tests/kms_bw.c                          |  2 +-
 tests/kms_cursor_legacy.c               |  2 +-
 tests/kms_tiled_display.c               |  4 +--
 12 files changed, 30 insertions(+), 37 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5b8598305f8c..a6bc41fb357d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2870,7 +2870,7 @@ static void igt_fill_display_format_mod(igt_display_t *display);
  */
 void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 {
-	igt_skip_on_f(pipe >= display->n_pipes || !display->pipes[pipe].valid,
+	igt_skip_on_f(pipe >= igt_display_n_crtcs(display) || !display->pipes[pipe].valid,
 			"Pipe %s does not exist\n",
 			kmstest_pipe_name(pipe));
 }
@@ -3107,8 +3107,10 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     resources->count_crtcs, IGT_MAX_PIPES);
 
 	display->n_pipes = IGT_MAX_PIPES;
-	display->pipes = calloc(display->n_pipes, sizeof(igt_pipe_t));
-	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", display->n_pipes);
+	display->pipes = calloc(igt_display_n_crtcs(display),
+				sizeof(igt_pipe_t));
+	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n",
+		     igt_display_n_crtcs(display));
 
 	for (i = 0; i < resources->count_crtcs; i++) {
 		igt_pipe_t *pipe;
@@ -3260,14 +3262,14 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 out:
 	LOG_UNINDENT(display);
 
-	if (display->n_pipes && display->n_outputs) {
+	if (igt_display_n_crtcs(display) && display->n_outputs) {
 		igt_enable_connectors(drm_fd);
 
 		igt_handle_spurious_hpd(display);
 	}
 	else {
 		igt_skip("No KMS driver or no outputs, pipes: %d, outputs: %d\n",
-			 display->n_pipes, display->n_outputs);
+			 igt_display_n_crtcs(display), display->n_outputs);
 	}
 }
 
@@ -3282,17 +3284,6 @@ int igt_display_n_crtcs(igt_display_t *display)
 	return display->n_pipes;
 }
 
-/**
- * igt_display_get_n_pipes:
- * @display: A pointer to an #igt_display_t structure
- *
- * Returns: Total number of pipes for the given @display
- */
-int igt_display_get_n_pipes(igt_display_t *display)
-{
-	return igt_display_n_crtcs(display);
-}
-
 /**
  * igt_display_require_output:
  * @display: A pointer to an #igt_display_t structure
@@ -3469,7 +3460,7 @@ void igt_display_fini(igt_display_t *display)
 		}
 	}
 
-	for (i = 0; i < display->n_pipes; i++)
+	for (i = 0; i < igt_display_n_crtcs(display); i++)
 		igt_pipe_fini(&display->pipes[i]);
 
 	for (i = 0; i < display->n_outputs; i++)
@@ -3539,7 +3530,7 @@ static igt_pipe_t *igt_output_get_driving_pipe(igt_output_t *output)
 		pipe = output->pending_pipe;
 	}
 
-	igt_assert(pipe >= 0 && pipe < display->n_pipes);
+	igt_assert(pipe >= 0 && pipe < igt_display_n_crtcs(display));
 
 	return &display->pipes[pipe];
 }
@@ -3663,9 +3654,10 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	igt_output_t *output;
 	int i, j;
 
-	memset(chosen_outputs, 0, sizeof(*chosen_outputs) * display->n_pipes);
+	memset(chosen_outputs, 0,
+	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
 
-	for (i = 0; i < display->n_pipes; i++) {
+	for (i = 0; i < igt_display_n_crtcs(display); i++) {
 		igt_pipe_t *pipe = &display->pipes[i];
 		if (pipe->valid)
 			full_pipe_mask |= (1 << i);
@@ -3676,7 +3668,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	 * it, start with the outputs restricted to 1 pipe, then increase
 	 * number of pipes until we assign connectors to all pipes.
 	 */
-	for (i = 0; i <= display->n_pipes; i++) {
+	for (i = 0; i <= igt_display_n_crtcs(display); i++) {
 		for_each_connected_output(display, output) {
 			uint32_t pipe_mask = output->config.valid_crtc_idx_mask & full_pipe_mask;
 			bool found = false;
@@ -3693,7 +3685,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 			} else if (__builtin_popcount(pipe_mask) != i)
 				continue;
 
-			for (j = 0; j < display->n_pipes; j++) {
+			for (j = 0; j < igt_display_n_crtcs(display); j++) {
 				bool pipe_assigned = assigned_pipes & (1 << j);
 
 				if (pipe_assigned || !(pipe_mask & (1 << j)))
@@ -3733,7 +3725,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
  */
 igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe)
 {
-	igt_output_t *chosen_outputs[display->n_pipes];
+	igt_output_t *chosen_outputs[igt_display_n_crtcs(display)];
 
 	igt_assert(pipe != PIPE_NONE);
 	igt_require_pipe(display, pipe);
@@ -4969,7 +4961,7 @@ static int do_display_commit(igt_display_t *display,
 	LOG_INDENT(display, "commit");
 
 	/* someone managed to bypass igt_display_require, catch them */
-	assert(display->n_pipes && display->n_outputs);
+	assert(igt_display_n_crtcs(display) && display->n_outputs);
 
 	igt_display_refresh(display);
 
@@ -5022,7 +5014,7 @@ int igt_display_try_commit_atomic(igt_display_t *display, uint32_t flags, void *
 	int ret;
 
 	/* someone managed to bypass igt_display_require, catch them */
-	assert(display->n_pipes && display->n_outputs);
+	assert(igt_display_n_crtcs(display) && display->n_outputs);
 
 	LOG_INDENT(display, "commit");
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4171e2baef61..6e7cf112b1e2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -574,7 +574,6 @@ int  igt_display_try_commit_atomic(igt_display_t *display, uint32_t flags, void
 void igt_display_commit_atomic(igt_display_t *display, uint32_t flags, void *user_data);
 int  igt_display_try_commit2(igt_display_t *display, enum igt_commit_style s);
 int  igt_display_drop_events(igt_display_t *display);
-int  igt_display_get_n_pipes(igt_display_t *display);
 void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 int igt_display_n_crtcs(igt_display_t *display);
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 30d7c898f907..788ff911691d 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -73,7 +73,8 @@ static void test_init(data_t *data)
 						 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
+	for (i = 0,
+	     n = 0; i < display->n_outputs && n < igt_display_n_crtcs(display); ++i) {
 		igt_output_t *output = &display->outputs[i];
 		data->output[n] = output;
 
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 9038b2ed9208..8d875a5b888f 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -51,7 +51,7 @@ typedef struct data {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i, n, max_pipes = display->n_pipes;
+	int i, n, max_pipes = igt_display_n_crtcs(display);
 
 	for_each_pipe(display, i) {
 		data->pipe_id[i] = PIPE_A + i;
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 57b2b98023f5..8b6b93d68df7 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -88,7 +88,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 
 	test_init(data);
 
-	igt_skip_on_f(num_pipes > igt_display_get_n_pipes(&data->display) ||
+	igt_skip_on_f(num_pipes > igt_display_n_crtcs(&data->display) ||
 			      num_pipes > data->display.n_outputs,
 		      "ASIC does not have %d outputs/pipes\n", num_pipes);
 
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index a53cf668fb5c..4e97438ad978 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -235,7 +235,7 @@ static void multiple_display_test(struct data_t *data, enum sub_test test_mode)
 
 	igt_info("Connected num_disps:%d\n", num_disps);
 
-	igt_skip_on_f(num_disps > igt_display_get_n_pipes(&data->display) ||
+	igt_skip_on_f(num_disps > igt_display_n_crtcs(&data->display) ||
 			      num_disps > data->display.n_outputs,
 		      "ASIC does not have %d outputs/pipes\n", num_disps);
 
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 8bf776f35770..ad7d921d2aa3 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -152,7 +152,7 @@ enum test {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i, n, max_pipes = display->n_pipes;
+	int i, n, max_pipes = igt_display_n_crtcs(display);
 
 	for_each_pipe(display, i) {
 		data->pipe_id[i] = PIPE_A + i;
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 7d29bcf10d18..fca9d6036ca2 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -73,7 +73,8 @@ static void test_init(struct data *data)
 						     IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-	for (i = 0, n = 0; i < display->n_outputs && n < display->n_pipes; ++i) {
+	for (i = 0,
+	     n = 0; i < display->n_outputs && n < igt_display_n_crtcs(display); ++i) {
 		igt_output_t *output = &display->outputs[i];
 
 		data->output[n] = output;
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 290f3e2e870f..5f58cfe699a4 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1034,7 +1034,7 @@ static void display_helper(igt_display_t *dpy, int *done)
 		igt_output_t *output;
 		int pipe;
 
-		pipe = rand() % dpy->n_pipes;
+		pipe = rand() % igt_display_n_crtcs(dpy);
 		if (!dpy->pipes[pipe].valid)
 			continue;
 		output = igt_get_single_output_for_pipe(dpy, pipe);
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 75b98f149665..9100dd329e30 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -119,7 +119,7 @@ static drmModeModeInfo test_mode[] = {
 static void test_init(data_t *data, bool physical)
 {
 	igt_display_t *display = &data->display;
-	int i, max_pipes = display->n_pipes;
+	int i, max_pipes = igt_display_n_crtcs(display);
 	igt_output_t *output;
 	data->connected_outputs = 0;
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 63175fe4c8f5..ec35992bac6a 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -287,7 +287,7 @@ static void stress(igt_display_t *display,
 	arg.handle = kmstest_dumb_create(display->drm_fd, 64, 64, 32, NULL, NULL);
 
 	if (pipe < 0) {
-		num_crtcs = display->n_pipes;
+		num_crtcs = igt_display_n_crtcs(display);
 		for_each_pipe(display, n) {
 			arg.crtc_id = crtc_id[n] = display->pipes[n].crtc_id;
 			do_ioctl(display->drm_fd, DRM_IOCTL_MODE_CURSOR, &arg);
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index f50ac5f17a76..d6f5eda7d841 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -513,7 +513,7 @@ static void override_edid(data_t *data)
 	int num_outputs = 0;
 	int num_tiles = 0;
 
-	igt_require(data->display.n_pipes >= 2);
+	igt_require(igt_display_n_crtcs(&data->display) >= 2);
 
 	for_each_connected_output(&data->display, output) {
 		drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -530,7 +530,7 @@ static void override_edid(data_t *data)
 
 	igt_require(num_outputs >= 2);
 
-	num_tiles = min(num_outputs, data->display.n_pipes);
+	num_tiles = min(num_outputs, igt_display_n_crtcs(&data->display));
 
 	/* disable everything so that we are sure to get a full modeset */
 	igt_display_reset(&data->display);
-- 
2.51.2

