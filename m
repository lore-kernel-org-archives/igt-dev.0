Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C7ECD6C1
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9E810E628;
	Wed, 11 Feb 2026 16:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJVxgURT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A03710E628
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827719; x=1802363719;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4YunSbEy0I5H2fQSNUofkOT7CCPQ5YDMWLmu6MlVXvI=;
 b=cJVxgURTUct0hRUMMe3JUBZVVyvBW/4W0nRaBpogfvBBMxqlwXWtRFTK
 hPVxLCOIPnCHDi4Hp1kacnXhUm0vUQnlPRnvwLhWnYYZv20UZLCx1pJVX
 nAhgkdrv8Z6ocPx+dKmZdZJrKkUKoACHR+e3B0n3u7eEOg+W4r+Eljzp3
 P7tiaZOqhTCeOsT6/NREnCzUUIYg6nvjYWqpLhTzTHIWV5A7RCO9zukt6
 QYraik6rpmwTgw3pv/oPULNpcpOofrARhNBqbpWd4+8cv5IbvX+lmA1/m
 7+5FeFNwViOECInUEVlqGushq9WhWAgYtFcKVydwqMy4pl/bs0F4ks2rl A==;
X-CSE-ConnectionGUID: iHLSVd3aRreYWjHi8smj9g==
X-CSE-MsgGUID: 9SkoKx9sSBmJkoh7IkDUMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="71695387"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="71695387"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:19 -0800
X-CSE-ConnectionGUID: wnutZYjPS6iboZ3n162k5Q==
X-CSE-MsgGUID: ULPymUKTQJSahxAc8GKSHA==
X-ExtLoop1: 1
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:35:17 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 17/17] tests/kms: Use igt_crtc_t instead of enum pipe
Date: Wed, 11 Feb 2026 18:34:04 +0200
Message-ID: <20260211163404.2018-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
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

Convert the use of enum pipe to igt_crtc_t in
various kms tests.

These are all pretty straightforward conversions.

 #include "scripts/iterators.cocci"

@func1@
typedef igt_output_t;
typedef igt_crtc_t;
identifier FUNC, PIPE, CRTC;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
+	,igt_crtc_t *CRTC
	,...)
{
...
(
- igt_crtc_t *CRTC = igt_crtc_for_pipe(..., PIPE);
|
- igt_crtc_t *CRTC;
... when != PIPE = ...
- CRTC = igt_crtc_for_pipe(..., PIPE);
)
<... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ CRTC
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ CRTC->pipe
)
...>
}

@depends on func1@
identifier func1.FUNC;
expression list[func1.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@func2@
typedef igt_crtc_t;
identifier FUNC, PIPE;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
+	,igt_crtc_t *crtc
	,...)
{
<+... when != PIPE = ...
(
- igt_crtc_for_pipe(..., PIPE)
+ crtc
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(crtc)
|
- PIPE
+ crtc->pipe
)
...+>
}

@depends on func2@
identifier func2.FUNC;
expression list[func2.N] EP;
expression PIPE;
@@
FUNC(EP
-	,PIPE
+	,igt_crtc_for_pipe(display, PIPE)
	,...)

@@
igt_crtc_t *CRTC;
@@
- igt_crtc_for_pipe(..., CRTC->pipe)
+ CRTC

@@
typedef igt_display_t;
identifier DISPLAY;
@@
- igt_display_t *DISPLAY = ...;
... when != DISPLAY

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_freesync_video_mode.c |  15 +--
 tests/intel/kms_busy.c                 |  80 +++++++------
 tests/intel/kms_fence_pin_leak.c       |   7 +-
 tests/intel/kms_flip_scaled_crc.c      |  36 +++---
 tests/kms_atomic.c                     | 151 ++++++++++++++++---------
 tests/kms_atomic_interruptible.c       |  57 ++++++----
 tests/kms_dither.c                     |  25 ++--
 tests/kms_panel_fitting.c              |  40 ++++---
 tests/kms_pipe_crc_basic.c             |  59 +++++-----
 tests/kms_rmfb.c                       |   8 +-
 tests/kms_scaling_modes.c              |   8 +-
 tests/kms_universal_plane.c            |  81 +++++++------
 12 files changed, 327 insertions(+), 240 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 31c842ee8917..3a82464e8d69 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -546,10 +546,8 @@ static bool has_vrr(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
+static void set_vrr_on_pipe(data_t *data, igt_crtc_t *crtc, bool enabled)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED,
 				    enabled);
@@ -772,7 +770,8 @@ static void finish_test(data_t *data, igt_output_t *output)
 }
 
 static void
-mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t scene)
+mode_transition(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		uint32_t scene)
 {
 	int ret;
 	uint32_t result;
@@ -815,7 +814,7 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	igt_info("stage-1: fps:%d\n", mode_start->vrefresh);
 	prepare_test(data, output, mode_start);
 	interval = nsec_per_frame(mode_start->vrefresh);
-	set_vrr_on_pipe(data, pipe, true);
+	set_vrr_on_pipe(data, crtc, true);
 	result = flip_and_measure(data, output, interval, TEST_DURATION_NS, ANIM_TYPE_SMPTE);
 
 	igt_info("stage-2: simple animation as video playback fps:%d\n", mode_playback->vrefresh);
@@ -825,7 +824,7 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 	result = flip_and_measure(data, output, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
 	result = flip_and_measure(data, output, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
 	igt_assert_f(result > 75, "Target refresh rate not meet 75%% (result=%d%%\n", result);
-	set_vrr_on_pipe(data, pipe, false);
+	set_vrr_on_pipe(data, crtc, false);
 
 	finish_test(data, output);
 }
@@ -854,7 +853,9 @@ run_test(data_t *data, uint32_t scene)
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      output->name)
-				mode_transition(data, crtc->pipe, output,
+				mode_transition(data,
+						crtc,
+						output,
 						scene);
 				found = true;
 				break;
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index dd65585d41a2..b109766fc4f0 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -73,13 +73,13 @@ IGT_TEST_DESCRIPTION("Basic check of KMS ABI with busy framebuffers.");
 static bool all_pipes = false;
 
 static void
-set_fb_on_crtc(igt_display_t *dpy, enum pipe pipe,
+set_fb_on_crtc(igt_display_t *dpy, igt_crtc_t *crtc,
 	       igt_output_t *output, struct igt_fb *fb)
 {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(dpy, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -106,7 +106,7 @@ static void do_cleanup_display(igt_display_t *dpy)
 	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-static void flip_to_fb(igt_display_t *dpy, enum pipe pipe,
+static void flip_to_fb(igt_display_t *dpy, igt_crtc_t *crtc,
 		       igt_output_t *output,
 		       struct igt_fb *fb, int timeout,
 		       const char *name, bool modeset)
@@ -130,7 +130,7 @@ static void flip_to_fb(igt_display_t *dpy, enum pipe pipe,
 		igt_assert(gem_bo_busy(dpy->drm_fd, fb->gem_handle));
 		if (!modeset)
 			do_or_die(drmModePageFlip(dpy->drm_fd,
-						  igt_crtc_for_pipe(dpy, pipe)->crtc_id, fb->fb_id,
+						  crtc->crtc_id, fb->fb_id,
 						  DRM_MODE_PAGE_FLIP_EVENT, fb));
 		else {
 			igt_plane_set_fb(igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY), fb);
@@ -161,10 +161,10 @@ static void flip_to_fb(igt_display_t *dpy, enum pipe pipe,
 		gem_quiescent_gpu(dpy->drm_fd);
 
 		/* Clear old mode blob. */
-		igt_crtc_refresh(igt_crtc_for_pipe(dpy, pipe), true);
+		igt_crtc_refresh(crtc, true);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(dpy, pipe));
+				    crtc);
 		igt_display_commit2(dpy, COMMIT_ATOMIC);
 	}
 
@@ -172,7 +172,7 @@ static void flip_to_fb(igt_display_t *dpy, enum pipe pipe,
 	put_ahnd(ahnd);
 }
 
-static void test_flip(igt_display_t *dpy, enum pipe pipe,
+static void test_flip(igt_display_t *dpy, igt_crtc_t *crtc,
 		      igt_output_t *output, bool modeset)
 {
 	struct igt_fb fb[2];
@@ -184,11 +184,12 @@ static void test_flip(igt_display_t *dpy, enum pipe pipe,
 		igt_require(dpy->is_atomic);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	igt_display_reset(dpy);
 
-	set_fb_on_crtc(dpy, pipe, output, &fb[0]);
+	set_fb_on_crtc(dpy, crtc, output,
+		       &fb[0]);
 	igt_display_commit2(dpy, COMMIT_LEGACY);
 
 	igt_create_pattern_fb(dpy->drm_fd,
@@ -205,7 +206,7 @@ static void test_flip(igt_display_t *dpy, enum pipe pipe,
 		struct drm_event_vblank ev;
 
 		do_or_die(drmModePageFlip(dpy->drm_fd,
-					  igt_crtc_for_pipe(dpy, pipe)->crtc_id,
+					  crtc->crtc_id,
 					  fb[warmup[i]].fb_id,
 					  DRM_MODE_PAGE_FLIP_EVENT,
 					  &fb[warmup[i]]));
@@ -215,10 +216,12 @@ static void test_flip(igt_display_t *dpy, enum pipe pipe,
 	igt_info("Using timeout of %dms\n", timeout);
 
 	/* Make the frontbuffer busy and try to flip to itself */
-	flip_to_fb(dpy, pipe, output, &fb[0], timeout, "fb[0]", modeset);
+	flip_to_fb(dpy, crtc, output,
+		   &fb[0], timeout, "fb[0]", modeset);
 
 	/* Repeat for flip to second buffer */
-	flip_to_fb(dpy, pipe, output, &fb[1], timeout, "fb[1]", modeset);
+	flip_to_fb(dpy, crtc, output,
+		   &fb[1], timeout, "fb[1]", modeset);
 
 	do_cleanup_display(dpy);
 	igt_remove_fb(dpy->drm_fd, &fb[1]);
@@ -264,19 +267,20 @@ static void test_atomic_commit_hang(igt_display_t *dpy, igt_plane_t *primary,
 	put_ahnd(ahnd);
 }
 
-static void test_hang(igt_display_t *dpy,
-		      enum pipe pipe, igt_output_t *output,
+static void test_hang(igt_display_t *dpy, igt_crtc_t *crtc,
+		      igt_output_t *output,
 		      bool modeset, bool hang_newfb)
 {
 	struct igt_fb fb[2];
 	igt_plane_t *primary;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	igt_display_reset(dpy);
 
-	set_fb_on_crtc(dpy, pipe, output, &fb[0]);
+	set_fb_on_crtc(dpy, crtc, output,
+		       &fb[0]);
 	igt_display_commit2(dpy, COMMIT_ATOMIC);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -295,7 +299,7 @@ static void test_hang(igt_display_t *dpy,
 		/* Test modeset enable with hang */
 		igt_plane_set_fb(primary, &fb[0]);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(dpy, pipe));
+				    crtc);
 		test_atomic_commit_hang(dpy, primary, &fb[!hang_newfb]);
 	} else {
 		/*
@@ -314,7 +318,7 @@ static void test_hang(igt_display_t *dpy,
 
 static void
 test_pageflip_modeset_hang(igt_display_t *dpy,
-			   igt_output_t *output, enum pipe pipe)
+			   igt_output_t *output, igt_crtc_t *crtc)
 {
 	struct igt_fb fb;
 	struct drm_event_vblank ev;
@@ -323,11 +327,12 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
 	uint64_t ahnd = get_reloc_ahnd(dpy->drm_fd, 0);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	igt_display_reset(dpy);
 
-	set_fb_on_crtc(dpy, pipe, output, &fb);
+	set_fb_on_crtc(dpy, crtc, output,
+		       &fb);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_display_commit2(dpy, dpy->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -337,7 +342,7 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
 			 .dependency = fb.gem_handle,
 			 .flags = IGT_SPIN_NO_PREEMPTION);
 
-	do_or_die(drmModePageFlip(dpy->drm_fd, igt_crtc_for_pipe(dpy, pipe)->crtc_id, fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT, &fb));
+	do_or_die(drmModePageFlip(dpy->drm_fd, crtc->crtc_id, fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT, &fb));
 
 	/* Kill crtc with hung fb */
 	igt_plane_set_fb(primary, NULL);
@@ -353,13 +358,13 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
 
 static bool
 pipe_output_combo_valid(igt_display_t *dpy,
-			igt_output_t *output, enum pipe pipe)
+			igt_output_t *output, igt_crtc_t *crtc)
 {
 	bool ret = true;
 
 	igt_display_reset(dpy);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(dpy, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(dpy))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -455,13 +460,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test for basic check of KMS ABI with busy framebuffers.");
 	igt_subtest_with_dynamic("basic") { /* just run on the first pipe */
 		for_each_crtc_with_single_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, output, crtc->pipe))
+			if (!pipe_output_combo_valid(&display, output, crtc))
 				continue;
 
 			igt_dynamic("flip")
-				test_flip(&display, crtc->pipe, output, false);
+				test_flip(&display,
+					  crtc,
+					  output, false);
 			igt_dynamic("modeset")
-				test_flip(&display, crtc->pipe, output, true);
+				test_flip(&display,
+					  crtc,
+					  output, true);
 			break;
 		}
 	}
@@ -471,7 +480,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		errno = 0;
 
 		for_each_crtc_with_single_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, output, crtc->pipe))
+			if (!pipe_output_combo_valid(&display, output, crtc))
 				continue;
 
 			if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -479,9 +488,13 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				continue;
 
 			igt_dynamic_f("flip-pipe-%s", igt_crtc_name(crtc))
-				test_flip(&display, crtc->pipe, output, false);
+				test_flip(&display,
+					  crtc,
+					  output, false);
 			igt_dynamic_f("modeset-pipe-%s", igt_crtc_name(crtc))
-				test_flip(&display, crtc->pipe, output, true);
+				test_flip(&display,
+					  crtc,
+					  output, true);
 		}
 
 		igt_disallow_hang(display.drm_fd, hang);
@@ -492,7 +505,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		errno = 0;
 
 		for_each_crtc_with_single_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, output, crtc->pipe))
+			if (!pipe_output_combo_valid(&display, output, crtc))
 				continue;
 
 			if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -501,7 +514,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 			igt_dynamic_f("pipe-%s", igt_crtc_name(crtc))
 				test_pageflip_modeset_hang(&display, output,
-							   crtc->pipe);
+							   crtc);
 		}
 
 		igt_disallow_hang(display.drm_fd, hang);
@@ -527,7 +540,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 			for_each_crtc_with_single_output(&display, crtc,
 							 output) {
-				if (!pipe_output_combo_valid(&display, output, crtc->pipe))
+				if (!pipe_output_combo_valid(&display, output, crtc))
 					continue;
 
 				if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -538,7 +551,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 					if (tests[i].reset)
 						igt_set_module_param_int(display.drm_fd, "force_reset_modeset_test", 1);
 
-					test_hang(&display, crtc->pipe,
+					test_hang(&display,
+						  crtc,
 						  output,
 						  tests[i].modeset, tests[i].hang_newfb);
 
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index 3d9ce4fc1563..aad6550f7498 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -130,10 +130,10 @@ static void free_fence_objs(data_t *data)
 		intel_buf_destroy(data->bos[i]);
 }
 
-static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
+static void run_single_test(data_t *data, igt_crtc_t *crtc,
+			    igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	struct igt_fb fb[2];
@@ -221,7 +221,8 @@ static void run_test(data_t *data)
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		run_single_test(data, crtc->pipe, output);
+		run_single_test(data, crtc,
+				output);
 
 		return; /* one time ought to be enough */
 	}
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 0dc594f45fe9..9a0b99e46ddd 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -680,10 +680,8 @@ static void free_fbs(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->big_fb);
 }
 
-static void set_lut(data_t *data, enum pipe pipe)
+static void set_lut(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct drm_color_lut *lut;
 	drmModeCrtc *drm_crtc;
 	int i, lut_size;
@@ -713,20 +711,15 @@ static void set_lut(data_t *data, enum pipe pipe)
 	free(lut);
 }
 
-static void clear_lut(data_t *data, enum pipe pipe)
+static void clear_lut(data_t *data, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
-
 	igt_crtc_set_prop_value(crtc, IGT_CRTC_GAMMA_LUT, 0);
 }
 
 static void test_flip_to_scaled(data_t *data, uint32_t index,
-				enum pipe pipe, igt_output_t *output,
+				igt_crtc_t *crtc, igt_output_t *output,
 				drmModeModeInfoPtr modetoset, int flags)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
 	struct drm_event_vblank ev;
@@ -778,7 +771,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n",
 		      igt_crtc_name(crtc));
 
-	set_lut(data, crtc->pipe);
+	set_lut(data, crtc);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	if (data->pipe_crc) {
@@ -833,7 +826,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 
-	clear_lut(data, crtc->pipe);
+	clear_lut(data, crtc);
 
 	modetoset = NULL;
 	igt_output_set_crtc(output, NULL);
@@ -860,10 +853,11 @@ static drmModeModeInfoPtr find_mode(data_t *data, igt_output_t *output)
 	return modetoset;
 }
 
-static void run_tests(data_t *data, uint32_t index, enum pipe pipe,
+static void run_tests(data_t *data, uint32_t index, igt_crtc_t *crtc,
 		      igt_output_t * output, drmModeModeInfoPtr modetoset)
 {
-	test_flip_to_scaled(data, index, pipe, output, modetoset, 0);
+	test_flip_to_scaled(data, index, crtc,
+			    output, modetoset, 0);
 
 	/*
 	 * test Nearest Neighbor filter. For scaler indexes see
@@ -871,7 +865,9 @@ static void run_tests(data_t *data, uint32_t index, enum pipe pipe,
 	 * Platform scaling filter property is supported only gen >= 11.
 	 */
 	if (data->gen >= 11)
-		test_flip_to_scaled(data, index, pipe, output, modetoset, 1);
+		test_flip_to_scaled(data, index,
+				    crtc, output,
+				    modetoset, 1);
 }
 
 int igt_main()
@@ -932,8 +928,9 @@ int igt_main()
 						found = true;
 						igt_dynamic_f("pipe-%s-valid-mode",
 							      igt_crtc_name(crtc))
-							run_tests(&data, index,
-								  crtc->pipe,
+							run_tests(&data,
+								  index,
+								  crtc,
 								  output,
 								  modetoset);
 						break;
@@ -953,8 +950,9 @@ int igt_main()
 						modetoset = NULL;
 						igt_dynamic_f("pipe-%s-default-mode",
 							      igt_crtc_name(crtc))
-							run_tests(&data, index,
-								  crtc->pipe,
+							run_tests(&data,
+								  index,
+								  crtc,
 								  output,
 								  modetoset);
 					}
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 5b3cc4a94c99..5e6d1123874e 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -438,10 +438,9 @@ plane_primary_overlay_mutable_zpos(data_t *data, igt_output_t *output, igt_plane
 }
 
 static void
-plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_planes)
+plane_immutable_zpos(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
+		     int n_planes)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	cairo_t *cr;
 	struct igt_fb fb_ref;
 	drmModeModeInfo *mode;
@@ -671,10 +670,9 @@ static void plane_primary(data_t *data)
  * Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches the
  * free-standing state objects and nothing else.
  */
-static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t format)
+static void test_only(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
+		      uint32_t format)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct igt_fb fb;
 	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -1382,10 +1380,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_remove_fb(data->drm_fd, &fb_2);
 }
 
-static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
+static void atomic_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_display_reset(&data->display);
 	igt_output_set_crtc(output, crtc);
@@ -1406,11 +1402,11 @@ static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 		    ATOMIC_RELAX_NONE);
 }
 
-static void atomic_clear(data_t *data, enum pipe pipe, igt_output_t *output)
+static void atomic_clear(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_plane_t *plane;
 
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		igt_plane_set_fb(plane, NULL);
 		igt_plane_set_position(plane, 0, 0);
 	}
@@ -1428,14 +1424,14 @@ static bool has_mutable_zpos(igt_plane_t *plane)
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display,
-			enum pipe pipe, igt_output_t *output)
+pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+			igt_output_t *output)
 {
 	bool ret = true;
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -1482,15 +1478,19 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 							DRM_PLANE_TYPE_OVERLAY);
 			uint32_t format = plane_get_igt_format(overlay);
 
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			if (!overlay || !format)
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				plane_overlay(&data, output, overlay, format);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1501,13 +1501,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		     "the legacy and atomic interfaces.");
 	igt_subtest_with_dynamic("plane-primary-legacy") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				plane_primary(&data);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1522,10 +1526,12 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_OVERLAY);
 
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
-			atomic_setup(&data, crtc->pipe, output);
+			atomic_setup(&data,
+				     crtc,
+				     output);
 			if (!overlay)
 				continue;
 			if (!has_mutable_zpos(data.primary) || !has_mutable_zpos(overlay))
@@ -1537,7 +1543,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				      igt_output_name(output)) {
 				plane_primary_overlay_mutable_zpos(&data, output, overlay,
 								   DRM_FORMAT_ARGB8888, DRM_FORMAT_ARGB1555);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1550,16 +1558,21 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			int n_planes = crtc->n_planes;
 
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			if (n_planes < 2)
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				plane_immutable_zpos(&data, output,
-						     crtc->pipe, n_planes);
-				atomic_clear(&data, crtc->pipe, output);
+						     crtc,
+						     n_planes);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1572,18 +1585,24 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			uint32_t format;
 
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
-			atomic_setup(&data, crtc->pipe, output);
+			atomic_setup(&data,
+				     crtc,
+				     output);
 			format = plane_get_igt_format(data.primary);
 
 			if (!format)
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_clear(&data, crtc->pipe, output);
-				test_only(&data, output, crtc->pipe, format);
+				atomic_clear(&data,
+					     crtc,
+					     output);
+				test_only(&data, output,
+					  crtc,
+					  format);
 			}
 			if (!all_pipes)
 				break;
@@ -1598,15 +1617,19 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_CURSOR);
 
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			if (!cursor)
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				plane_cursor(&data, output, cursor);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1616,13 +1639,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid plane parameters are passed");
 	igt_subtest_with_dynamic("plane-invalid-params") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				plane_invalid_params(&data, output);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1632,13 +1659,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid plane fence parameters are passed");
 	igt_subtest_with_dynamic("plane-invalid-params-fence") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				plane_invalid_params_fence(&data, output);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1648,13 +1679,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid crtc parameters are passed");
 	igt_subtest_with_dynamic("crtc-invalid-params") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				crtc_invalid_params(&data, output);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1664,13 +1699,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid crtc fence parameters are passed");
 	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				crtc_invalid_params_fence(&data, output);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1682,13 +1721,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		     "allow us to create.");
 	igt_subtest_with_dynamic("atomic-invalid-params") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				atomic_setup(&data, crtc->pipe, output);
+				atomic_setup(&data,
+					     crtc,
+					     output);
 				atomic_invalid_params(&data, output);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
@@ -1698,17 +1741,21 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
 	igt_subtest_with_dynamic("atomic-plane-damage") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
-			atomic_setup(&data, crtc->pipe, output);
+			atomic_setup(&data,
+				     crtc,
+				     output);
 
 			if (!igt_plane_has_prop(data.primary, IGT_PLANE_FB_DAMAGE_CLIPS))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
 				atomic_plane_damage(&data);
-				atomic_clear(&data, crtc->pipe, output);
+				atomic_clear(&data,
+					     crtc,
+					     output);
 			}
 			if (!all_pipes)
 				break;
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 4b29a196d807..b9d36ba54527 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -111,7 +111,8 @@ static drmEventContext drm_events = {
 	.page_flip_handler = ev_page_flip
 };
 
-static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t *output,
+static void run_plane_test(igt_display_t *display, igt_crtc_t *crtc,
+			   igt_output_t *output,
 			   enum plane_test_type test_type, unsigned plane_type)
 {
 	drmModeModeInfo *mode;
@@ -120,7 +121,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	int block;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	/*
 	 * Make sure we start with everything disabled to force a real modeset.
@@ -130,7 +131,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_display_reset(display);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	plane = igt_output_get_plane_type(output, plane_type);
@@ -297,7 +298,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 
 	/* The mode is unset by the forked helper, force a refresh here */
 	if (test_type == test_legacy_modeset || test_type == test_atomic_modeset)
-		igt_crtc_refresh(igt_crtc_for_pipe(display, pipe), true);
+		igt_crtc_refresh(crtc, true);
 
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_fb(primary, NULL);
@@ -306,14 +307,14 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
-static bool pipe_output_combo_valid(igt_display_t *display,
-				    enum pipe pipe, igt_output_t *output)
+static bool pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+				    igt_output_t *output)
 {
 	bool ret = true;
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -342,12 +343,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties of legacy modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_legacy_modeset,
 					       DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -357,12 +360,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties of atomic modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_atomic_modeset,
 					       DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -372,12 +377,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for DPMS");
 	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_legacy_dpms,
 					       DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -387,12 +394,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for pageflip");
 	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_pageflip,
 					       DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -402,12 +411,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for cursor");
 	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_setcursor,
 					       DRM_PLANE_TYPE_CURSOR);
 			break;
@@ -417,12 +428,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for primary plane");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_setplane,
 					       DRM_PLANE_TYPE_PRIMARY);
 			break;
@@ -432,12 +445,14 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for cursor plane");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				run_plane_test(&display, crtc->pipe, output,
+				run_plane_test(&display,
+					       crtc,
+					       output,
 					       test_setplane,
 					       DRM_PLANE_TYPE_CURSOR);
 			break;
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index d308d49abd09..347580e60f4e 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -72,11 +72,8 @@ typedef struct {
 } dither_status_t;
 
 /* Prepare test data. */
-static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
+static void prepare_test(data_t *data, igt_output_t *output, igt_crtc_t *crtc)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
-
 	igt_assert(crtc);
 
 	data->primary =
@@ -86,7 +83,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 }
 
 /* Returns the current state of dithering from the crtc debugfs. */
-static dither_status_t get_dither_state(data_t *data, enum pipe pipe)
+static dither_status_t get_dither_state(data_t *data, igt_crtc_t *crtc)
 {
 	char buf[512], tmp[5];
 	char *start_loc;
@@ -106,25 +103,24 @@ static dither_status_t get_dither_state(data_t *data, enum pipe pipe)
 	igt_assert_eq(sscanf(start_loc, ", dither=%s", tmp), 1);
 	status.dither = !strcmp(tmp, "yes,");
 
-	status.bpc = igt_get_pipe_current_bpc(data->drm_fd, pipe);
+	status.bpc = igt_get_pipe_current_bpc(data->drm_fd, crtc->pipe);
 
 	return status;
 }
 
-static void test_dithering(data_t *data, enum pipe pipe,
+static void test_dithering(data_t *data, igt_crtc_t *crtc,
 			   igt_output_t *output,
 			   int fb_bpc, int fb_format,
 			   int output_bpc)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	dither_status_t status;
 	int bpc, ret;
 	bool constraint;
 
 	igt_info("Dithering test execution on %s PIPE_%s\n",
 			output->name, igt_crtc_name(crtc));
-	prepare_test(data, output, crtc->pipe);
+	prepare_test(data, output, crtc);
 
 	igt_assert(igt_create_fb(data->drm_fd, 512, 512, fb_format,
 				 DRM_FORMAT_MOD_LINEAR, &data->fb));
@@ -156,7 +152,8 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	 * If fb_bpc is greater than output_bpc, Dithering should be enabled
 	 * Else disabled
 	 */
-	status = get_dither_state(data, crtc->pipe);
+	status = get_dither_state(data,
+				  crtc);
 
 	igt_info("FB BPC:%d, Panel BPC:%d, Pipe BPC:%d, Expected Dither:%s, Actual result:%s\n",
 		  fb_bpc, output_bpc, status.bpc,
@@ -232,9 +229,11 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      output->name)
-				test_dithering(data, crtc->pipe, output,
-							   fb_bpc,
-							   fb_format, output_bpc);
+				test_dithering(data,
+					       crtc,
+					       output,
+					       fb_bpc,
+					       fb_format, output_bpc);
 
 			/* One pipe is enough */
 			break;
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 723336c7ba35..bc78d9a6f41d 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -68,11 +68,11 @@ static void cleanup_crtc(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb2);
 }
 
-static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
-			igt_plane_t *plane, drmModeModeInfo *mode, enum igt_commit_style s)
+static void prepare_crtc(data_t *data, igt_output_t *output, igt_crtc_t *crtc,
+			 igt_plane_t *plane, drmModeModeInfo *mode,
+			 enum igt_commit_style s)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	igt_output_override_mode(output, mode);
 	igt_output_set_crtc(output, crtc);
@@ -104,13 +104,13 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 }
 
 static void
-test_panel_fitting_legacy(data_t *d, igt_display_t *display,
-			  enum pipe pipe, igt_output_t *output)
+test_panel_fitting_legacy(data_t *d, igt_display_t *display, igt_crtc_t *crtc,
+			  igt_output_t *output)
 {
 	drmModeModeInfo *mode, native_mode;
 	bool is_plane_scaling_active = true;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	native_mode = *mode;
@@ -129,18 +129,22 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display,
 		mode->vdisplay = 480;
 	}
 	d->plane1 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
+	prepare_crtc(d, output, crtc, d->plane1,
+		     mode, COMMIT_LEGACY);
 
 	/* disable panel fitting */
-	prepare_crtc(d, output, pipe, d->plane1, &native_mode, COMMIT_LEGACY);
+	prepare_crtc(d, output, crtc, d->plane1,
+		     &native_mode, COMMIT_LEGACY);
 
 	/* enable panel fitting */
 	mode->hdisplay = 800;
 	mode->vdisplay = 600;
-	prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
+	prepare_crtc(d, output, crtc, d->plane1,
+		     mode, COMMIT_LEGACY);
 
 	/* disable panel fitting */
-	prepare_crtc(d, output, pipe, d->plane1, &native_mode, COMMIT_LEGACY);
+	prepare_crtc(d, output, crtc, d->plane1,
+		     &native_mode, COMMIT_LEGACY);
 
 	/* set up fb2->plane2 mapping. */
 	d->plane2 = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
@@ -166,7 +170,7 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display,
 		 */
 		if (IS_GEN8(devid) ||
 			(IS_GEN7(devid) && !IS_IVYBRIDGE(devid)) ||
-			(IS_GEN9(devid) && pipe == PIPE_C)) {
+			(IS_GEN9(devid) && crtc->pipe == PIPE_C)) {
 			is_plane_scaling_active = false;
 		}
 	}
@@ -191,11 +195,13 @@ test_panel_fitting_legacy(data_t *d, igt_display_t *display,
 	/* enable panel fitting along with sprite scaling */
 	mode->hdisplay = 1024;
 	mode->vdisplay = 768;
-	prepare_crtc(d, output, pipe, d->plane1, mode, COMMIT_LEGACY);
+	prepare_crtc(d, output, crtc, d->plane1,
+		     mode, COMMIT_LEGACY);
 }
 
 static void
-test_panel_fitting_fastset(igt_display_t *display, enum pipe pipe, igt_output_t *output)
+test_panel_fitting_fastset(igt_display_t *display, igt_crtc_t *crtc,
+			   igt_output_t *output)
 {
 	igt_plane_t *primary, *sprite;
 	drmModeModeInfo mode;
@@ -203,7 +209,7 @@ test_panel_fitting_fastset(igt_display_t *display, enum pipe pipe, igt_output_t
 
 	mode = *igt_output_get_mode(output);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
@@ -276,10 +282,12 @@ static void test_panel_fitting(data_t *data, enum test_type type)
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), output->name) {
 			if (type == TEST_ATOMIC)
 				test_panel_fitting_fastset(display,
-							   crtc->pipe, output);
+							   crtc,
+							   output);
 			if (type == TEST_LEGACY)
 				test_panel_fitting_legacy(data, display,
-							  crtc->pipe, output);
+							  crtc,
+							  output);
 		}
 	}
 }
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 8c928754b469..f7b6ec2937c2 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -96,11 +96,11 @@ static struct {
 	{ .r = 0.0, .g = 1.0, .b = 1.0 },
 };
 
-static bool simulation_constraint(enum pipe pipe)
+static bool simulation_constraint(igt_crtc_t *crtc)
 {
 	if (igt_run_in_simulation() && !extended &&
-	    pipe != active_pipes[0] &&
-	    pipe != active_pipes[last_pipe])
+	    crtc->pipe != active_pipes[0] &&
+	    crtc->pipe != active_pipes[last_pipe])
 		return true;
 
 	return false;
@@ -127,11 +127,10 @@ enum {
 	TEST_HANG = 1 << 3,
 };
 
-static void test_read_crc(data_t *data, enum pipe pipe,
+static void test_read_crc(data_t *data, igt_crtc_t *crtc,
 			  igt_output_t *output, unsigned flags)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t *crcs = NULL;
@@ -235,11 +234,11 @@ static void test_read_crc(data_t *data, enum pipe pipe,
  *
  *   No CRC mismatch should happen
  */
-static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
+static void test_compare_crc(data_t *data, igt_crtc_t *crtc,
+			     igt_output_t *output,
 			     uint32_t plane_format)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t ref_crc, crc;
@@ -291,11 +290,10 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_remove_fb(data->drm_fd, &fb1);
 }
 
-static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
+static void test_disable_crc_after_crtc(data_t *data, igt_crtc_t *crtc,
 					igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	igt_crc_t crc[2];
@@ -338,14 +336,14 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
-static bool pipe_output_combo_valid(igt_display_t *display,
-				    enum pipe pipe, igt_output_t *output)
+static bool pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+				    igt_output_t *output)
 {
 	bool ret = true;
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -424,10 +422,10 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		igt_subtest_with_dynamic(tests[i].name) {
 			for_each_crtc_with_single_output(&data.display, crtc,
 							 output) {
-				if (simulation_constraint(crtc->pipe))
+				if (simulation_constraint(crtc))
 					continue;
 
-				if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+				if(!pipe_output_combo_valid(&data.display, crtc, output))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
@@ -437,7 +435,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 						enum igt_suspend_test test = SUSPEND_TEST_NONE;
 
 						test_read_crc(&data,
-							      crtc->pipe,
+							      crtc,
 							      output, 0);
 
 						/* rtcwake cmd is not supported on MTK devices */
@@ -448,23 +446,23 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 									      test);
 
 						test_read_crc(&data,
-							      crtc->pipe,
+							      crtc,
 							      output, 0);
 					} else if (tests[i].flags & TEST_HANG) {
 						igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
 
 						test_read_crc(&data,
-							      crtc->pipe,
+							      crtc,
 							      output, 0);
 						igt_force_gpu_reset(data.drm_fd);
 						test_read_crc(&data,
-							      crtc->pipe,
+							      crtc,
 							      output, 0);
 
 						igt_disallow_hang(data.drm_fd, hang);
 					} else {
 						test_read_crc(&data,
-							      crtc->pipe,
+							      crtc,
 							      output,
 							      tests[i].flags);
 					}
@@ -477,15 +475,16 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		     "does not cause issues.");
 	igt_subtest_with_dynamic("disable-crc-after-crtc") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (simulation_constraint(crtc->pipe))
+			if (simulation_constraint(crtc))
 				continue;
 
-			if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if(!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      output->name)
-				test_disable_crc_after_crtc(&data, crtc->pipe,
+				test_disable_crc_after_crtc(&data,
+							    crtc,
 							    output);
 		}
 	}
@@ -493,15 +492,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Basic sanity check for CRC mismatches with XR24 format");
 	igt_subtest_with_dynamic("compare-crc-sanitycheck-xr24") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (simulation_constraint(crtc->pipe))
+			if (simulation_constraint(crtc))
 				continue;
 
-			if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if(!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      output->name)
-				test_compare_crc(&data, crtc->pipe, output,
+				test_compare_crc(&data,
+						 crtc,
+						 output,
 						 DRM_FORMAT_XRGB8888);
 		}
 	}
@@ -509,15 +510,17 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Basic sanity check for CRC mismatches with NV12 format");
 	igt_subtest_with_dynamic("compare-crc-sanitycheck-nv12") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (simulation_constraint(crtc->pipe))
+			if (simulation_constraint(crtc))
 				continue;
 
-			if(!pipe_output_combo_valid(&data.display, crtc->pipe, output))
+			if(!pipe_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      output->name)
-				test_compare_crc(&data, crtc->pipe, output,
+				test_compare_crc(&data,
+						 crtc,
+						 output,
 						 DRM_FORMAT_NV12);
 		}
 	}
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index d57b4cc818b7..3055dd3b0fe8 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -74,11 +74,11 @@ struct rmfb_data {
  * so test this and make sure it works.
  */
 static void
-test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reopen)
+test_rmfb(struct rmfb_data *data, igt_output_t *output, igt_crtc_t *crtc,
+	  bool reopen)
 {
 	struct igt_fb fb, argb_fb;
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *plane;
 	drmModeCrtc *drm_crtc;
@@ -189,7 +189,9 @@ run_rmfb_test(struct rmfb_data *data, bool reopen)
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output))
-			test_rmfb(data, output, crtc->pipe, reopen);
+			test_rmfb(data, output,
+				  crtc,
+				  reopen);
 	}
 }
 
diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
index 5b0d6485ebb3..b6a04d33338a 100644
--- a/tests/kms_scaling_modes.c
+++ b/tests/kms_scaling_modes.c
@@ -54,7 +54,8 @@ typedef struct data {
 	int drm_fd;
 } data_t;
 
-static void test_scaling_mode_on_output(igt_display_t *display, enum pipe pipe,
+static void test_scaling_mode_on_output(igt_display_t *display,
+					igt_crtc_t *crtc,
 					igt_output_t *output, uint32_t flags)
 {
 	igt_plane_t *primary, *sprite;
@@ -62,7 +63,7 @@ static void test_scaling_mode_on_output(igt_display_t *display, enum pipe pipe,
 	struct igt_fb red, blue;
 	int ret;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = *igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -128,7 +129,8 @@ static void test_scaling_mode(data_t *data, uint32_t flags)
 
 		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 			      igt_output_name(output))
-			test_scaling_mode_on_output(display, crtc->pipe,
+			test_scaling_mode_on_output(display,
+						    crtc,
 						    output, flags);
 	}
 }
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 7844658d8337..67b61e1d2ea0 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -91,11 +91,10 @@ typedef struct {
 } gen9_test_t;
 
 static void
-functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pipe)
+functional_test_init(functional_test_t *test, igt_output_t *output,
+		     igt_crtc_t *crtc)
 {
 	data_t *data = test->data;
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
 	test->pipe_crc = igt_crtc_crc_new(crtc,
@@ -158,16 +157,16 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
  *   - Enable CRTC, grab CRC:6 (should be same as CRC:2)
  */
 static void
-functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+functional_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	functional_test_t test = { .data = data };
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary, *sprite;
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
-	functional_test_init(&test, output, crtc->pipe);
+	functional_test_init(&test, output,
+			     crtc);
 
 	/*
 	 * Make sure we have no more than one primary or cursor plane per crtc.
@@ -347,11 +346,9 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static void
-sanity_test_init(sanity_test_t *test, igt_output_t *output, enum pipe pipe)
+sanity_test_init(sanity_test_t *test, igt_output_t *output, igt_crtc_t *crtc)
 {
 	data_t *data = test->data;
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
 	igt_output_set_crtc(output, crtc);
@@ -399,10 +396,8 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
  *   - Primary plane tries to scale up
  */
 static void
-sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+sanity_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	sanity_test_t test = { .data = data };
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
@@ -412,7 +407,8 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
-	sanity_test_init(&test, output, crtc->pipe);
+	sanity_test_init(&test, output,
+			 crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -494,11 +490,10 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static void
-pageflip_test_init(pageflip_test_t *test, igt_output_t *output, enum pipe pipe)
+pageflip_test_init(pageflip_test_t *test, igt_output_t *output,
+		   igt_crtc_t *crtc)
 {
 	data_t *data = test->data;
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
 	igt_output_set_crtc(output, crtc);
@@ -527,10 +522,8 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 }
 
 static void
-pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+pageflip_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	pageflip_test_t test = { .data = data };
 	igt_plane_t *primary;
 	struct timeval timeout = { .tv_sec = 0, .tv_usec = 500 };
@@ -541,7 +534,8 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_output_set_crtc(output, crtc);
 
-	pageflip_test_init(&test, output, crtc->pipe);
+	pageflip_test_init(&test, output,
+			   crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -639,10 +633,9 @@ intel_gem_fb_count(data_t *data)
 }
 
 static void
-cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+cursor_leak_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary, *cursor;
 	drmModeModeInfo *mode;
 	struct igt_fb background_fb;
@@ -734,11 +727,9 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static void
-gen9_test_init(gen9_test_t *test, igt_output_t *output, enum pipe pipe)
+gen9_test_init(gen9_test_t *test, igt_output_t *output, igt_crtc_t *crtc)
 {
 	data_t *data = test->data;
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
 	igt_output_set_crtc(output, crtc);
@@ -785,10 +776,8 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
  * windowing)
  */
 static void
-pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
+pageflip_win_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	gen9_test_t test = { .data = data };
 	igt_plane_t *primary;
 
@@ -796,7 +785,7 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_output_set_crtc(output, crtc);
 
-	gen9_test_init(&test, output, crtc->pipe);
+	gen9_test_init(&test, output, crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -830,14 +819,14 @@ pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display,
-			enum pipe pipe, igt_output_t *output)
+pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+			igt_output_t *output)
 {
 	bool ret = true;
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	if (!intel_pipe_output_combo_valid(display))
 		ret = false;
 	igt_output_set_crtc(output, NULL);
@@ -854,24 +843,28 @@ run_tests(data_t *data)
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_with_dynamic("universal-plane-functional") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				functional_test_pipe(data, crtc->pipe, output);
+				functional_test_pipe(data,
+						     crtc,
+						     output);
 		}
 	}
 
 	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
 	igt_subtest_with_dynamic("universal-plane-sanity") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				sanity_test_pipe(data, crtc->pipe, output);
+				sanity_test_pipe(data,
+						 crtc,
+						 output);
 		}
 	}
 
@@ -879,24 +872,27 @@ run_tests(data_t *data)
 		     " and pageflip execution");
 	igt_subtest_with_dynamic("disable-primary-vs-flip") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				pageflip_test_pipe(data, crtc->pipe, output);
+				pageflip_test_pipe(data,
+						   crtc,
+						   output);
 		}
 	}
 
 	igt_describe("Check for cursor leaks after performing cursor operations");
 	igt_subtest_with_dynamic("cursor-fb-leak") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				cursor_leak_test_pipe(data, crtc->pipe,
+				cursor_leak_test_pipe(data,
+						      crtc,
 						      output);
 		}
 	}
@@ -905,12 +901,13 @@ run_tests(data_t *data)
 	igt_subtest_with_dynamic("universal-plane-pageflip-windowed") {
 		igt_require(is_intel_device(data->drm_fd) && data->display_ver >= 9);
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc->pipe, output))
+			if (!pipe_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				pageflip_win_test_pipe(data, crtc->pipe,
+				pageflip_win_test_pipe(data,
+						       crtc,
 						       output);
 		}
 	}
-- 
2.52.0

