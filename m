Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC124ECD6C5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 16:34:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810B510E628;
	Wed, 11 Feb 2026 16:34:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljproP4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C3E10E62C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770827657; x=1802363657;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Fb8nO/z4CXU3eDV0Qr4S+Aum/ZdEYX/ThtIJ1lJopuU=;
 b=ljproP4zRf3GPjfK3gmBYyIz6UWq4kcZZjHntq713BnHipxS41P1rvkE
 YdJU/cxQC7abeZ98glh20s6DUmuwkKAxQyfk9UMK4xdWf6HkhGgJn1v7i
 idA0t4bIpalZgmo29gegxxYBdl2meRd5fvbtStet0UCAWdGbswdJq3BXT
 Hf4NWP7iDbRDT5glLvQIiuiZLwo9FYm/XvDbUr9e+GaCMWABdggzyWHae
 vz3gpypB8lPVfpSBK0d1YJZZiJ/lXT/G19XcbFQDgtJjK4fHgYskgJQZI
 jh6baHCEV2+pOE9HY0wmx74gnxb1ORkqZGIypXEHD19l2VHKsn9GINyw5 w==;
X-CSE-ConnectionGUID: ATgkdD1PTc+PNJ9w8MGL4A==
X-CSE-MsgGUID: 73suCfx0T66UxfbluWlQSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83082154"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="83082154"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:17 -0800
X-CSE-ConnectionGUID: l8GHEJfbSDO33XLl/nrwqw==
X-CSE-MsgGUID: RYA4/pGrTHygCnch1dNkOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211405350"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 08:34:16 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/17] tests/kms: Remove unused 'pipe' function
 parameters
Date: Wed, 11 Feb 2026 18:33:49 +0200
Message-ID: <20260211163404.2018-3-ville.syrjala@linux.intel.com>
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

Various functions take a 'pipe' parameter but never
use it. Get rid of it.

 #include "scripts/iterators.cocci"

@func@
identifier FUNC, PIPE;
parameter list[N] P;
@@
FUNC(P
-	,enum pipe PIPE
	,...)
{
... when != PIPE
}

@depends on func@
identifier func.FUNC;
expression list[func.N] EP;
expression PIPE;
@@
 FUNC(EP
-	,PIPE
	,...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_freesync_video_mode.c | 16 ++++++-------
 tests/intel/kms_flip_tiling.c          |  4 ++--
 tests/intel/kms_pm_rpm.c               |  4 ++--
 tests/kms_concurrent.c                 |  8 +++----
 tests/kms_content_protection.c         |  4 ++--
 tests/kms_cursor_legacy.c              |  9 ++++----
 tests/kms_flip_event_leak.c            |  4 ++--
 tests/kms_plane.c                      |  6 ++---
 tests/kms_plane_scaling.c              | 10 ++------
 tests/kms_vrr.c                        | 32 +++++++++++++-------------
 10 files changed, 44 insertions(+), 53 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 0592d7139ad3..31c842ee8917 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -559,7 +559,6 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 static void prepare_test(
 		data_t *data,
 		igt_output_t *output,
-		enum pipe pipe,
 		drmModeModeInfo *mode)
 {
 	/* Prepare resources */
@@ -625,7 +624,6 @@ static uint32_t
 flip_and_measure(
 		data_t *data,
 		igt_output_t *output,
-		enum pipe pipe,
 		uint64_t interval_ns,
 		uint64_t duration_ns,
 		int anim_type)
@@ -750,7 +748,7 @@ static void init_data(data_t *data, igt_output_t *output)
 	data->vrr_range = get_vrr_range(data, output);
 }
 
-static void finish_test(data_t *data, enum pipe pipe, igt_output_t *output)
+static void finish_test(data_t *data, igt_output_t *output)
 {
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_crtc(output, NULL);
@@ -815,21 +813,21 @@ mode_transition(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t sce
 			"Failure on selecting mode with given type and refresh rate.\n");
 
 	igt_info("stage-1: fps:%d\n", mode_start->vrefresh);
-	prepare_test(data, output, pipe, mode_start);
+	prepare_test(data, output, mode_start);
 	interval = nsec_per_frame(mode_start->vrefresh);
 	set_vrr_on_pipe(data, pipe, true);
-	result = flip_and_measure(data, output, pipe, interval, TEST_DURATION_NS, ANIM_TYPE_SMPTE);
+	result = flip_and_measure(data, output, interval, TEST_DURATION_NS, ANIM_TYPE_SMPTE);
 
 	igt_info("stage-2: simple animation as video playback fps:%d\n", mode_playback->vrefresh);
-	prepare_test(data, output, pipe, mode_playback);
+	prepare_test(data, output, mode_playback);
 	interval = nsec_per_frame(mode_playback->vrefresh);
 	/* Do a short run with VRR before measure to make sure we measure in a stable state */
-	result = flip_and_measure(data, output, pipe, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
-	result = flip_and_measure(data, output, pipe, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
+	result = flip_and_measure(data, output, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
+	result = flip_and_measure(data, output, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
 	igt_assert_f(result > 75, "Target refresh rate not meet 75%% (result=%d%%\n", result);
 	set_vrr_on_pipe(data, pipe, false);
 
-	finish_test(data, pipe, output);
+	finish_test(data, output);
 }
 
 /* Runs tests on outputs that are VRR capable. */
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index 7482d0a80efa..453394343857 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -169,7 +169,7 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
 	igt_remove_fb(data->drm_fd, &data->old_fb[1]);
 }
 
-static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test_cleanup(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
 	primary = igt_output_get_plane(output, 0);
@@ -274,7 +274,7 @@ int igt_main()
 						handle_lost_event(&data);
 				}
 			}
-			test_cleanup(&data, crtc->pipe, output);
+			test_cleanup(&data, output);
 		}
 	}
 
diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 93d190e30d9d..5f24fd49b13a 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1592,7 +1592,7 @@ static void pm_test_caching(void)
 	gem_close(drm_fd, handle);
 }
 
-static bool is_preferred_mode_present(igt_output_t *output, enum pipe pipe,
+static bool is_preferred_mode_present(igt_output_t *output,
 				      igt_display_t *display)
 {
 	drmModeModeInfo *mode = NULL;
@@ -1635,7 +1635,7 @@ static void set_prefered_mode(void)
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
-		if (is_preferred_mode_present(output, crtc->pipe, display)) {
+		if (is_preferred_mode_present(output, display)) {
 			mode_found = true;
 			break;
 		}
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index f93581da54dc..bbc988aa2000 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -67,7 +67,7 @@ struct {
 /*
  * Common code across all tests, acting on data_t
  */
-static void test_init(data_t *data, enum pipe pipe, int n_planes,
+static void test_init(data_t *data, int n_planes,
 		      igt_output_t *output)
 {
 	data->plane = calloc(n_planes, sizeof(*data->plane));
@@ -77,7 +77,7 @@ static void test_init(data_t *data, enum pipe pipe, int n_planes,
 	igt_assert_f(data->fb != NULL, "Failed to allocate memory for FBs\n");
 }
 
-static void test_fini(data_t *data, enum pipe pipe, int n_planes,
+static void test_fini(data_t *data, int n_planes,
 		      igt_output_t *output)
 {
 	int i;
@@ -327,7 +327,7 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	srand(opt.seed);
 
-	test_init(data, crtc->pipe, n_planes, output);
+	test_init(data, n_planes, output);
 
 	igt_fork(child, 1) {
 		test_plane_position_with_output(data, crtc->pipe, n_planes,
@@ -338,7 +338,7 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	igt_waitchildren();
 
-	test_fini(data, crtc->pipe, n_planes, output);
+	test_fini(data, n_planes, output);
 }
 
 static void
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 3a0476bfca71..8e21fd92cacc 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -257,7 +257,7 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
 	}
 }
 
-static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
+static void modeset_with_fb(igt_output_t *output,
 			    enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
@@ -740,7 +740,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
-			modeset_with_fb(crtc->pipe, output, commit_style);
+			modeset_with_fb(output, commit_style);
 			if (data.is_force_hdcp14)
 				set_i915_force_hdcp14(output);
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 45e9a3949283..459f3c696ac8 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -566,7 +566,6 @@ static void transition_nonblocking(igt_display_t *display, enum pipe pipe_id,
 static void prepare_flip_test(igt_display_t *display,
 			      enum flip_test mode,
 			      enum pipe flip_pipe,
-			      enum pipe cursor_pipe,
 			      struct drm_mode_cursor *arg,
 			      const struct igt_fb *prim_fb,
 			      struct igt_fb *argb_fb,
@@ -663,7 +662,7 @@ static void flip(igt_display_t *display,
 	cursor = set_cursor_on_pipe(display, cursor_pipe, &cursor_fb);
 	populate_cursor_args(display, cursor_pipe, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, flip_pipe, cursor_pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, flip_pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -777,7 +776,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, pipe, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -948,7 +947,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, pipe, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
@@ -1380,7 +1379,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 	cursor = set_cursor_on_pipe(display, pipe, &cursor_fb);
 	populate_cursor_args(display, pipe, arg, &cursor_fb);
 
-	prepare_flip_test(display, mode, pipe, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
+	prepare_flip_test(display, mode, pipe, arg, &fb_info, &argb_fb, &cursor_fb2);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
index 545719638898..fe890561491c 100644
--- a/tests/kms_flip_event_leak.c
+++ b/tests/kms_flip_event_leak.c
@@ -58,7 +58,7 @@ IGT_TEST_DESCRIPTION(
     "itself won't fail even if the kernel leaks the event, but the resulting "
     "dmesg WARN will indicate a failure.");
 
-static void test(data_t *data, enum pipe pipe, igt_output_t *output)
+static void test(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
@@ -128,7 +128,7 @@ int igt_main()
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
-				test(&data, crtc->pipe, output);
+				test(&data, output);
 			}
 		}
 	}
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f77bc8b39fbf..1ce3d98041ec 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -663,7 +663,7 @@ static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 	}
 }
 
-static void prepare_format_color(data_t *data, enum pipe pipe,
+static void prepare_format_color(data_t *data,
 				 igt_plane_t *plane,
 				 uint32_t format, uint64_t modifier,
 				 int width, int height,
@@ -756,7 +756,7 @@ static void capture_format_crcs_single(data_t *data, enum pipe pipe,
 	struct igt_fb old_fb = *fb;
 	const color_t black = { 0.0f, 0.0f, 0.0f };
 
-	prepare_format_color(data, pipe, plane, format, modifier,
+	prepare_format_color(data, plane, format, modifier,
 			     width, height, encoding, range, &black, fb, true);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ?
@@ -785,7 +785,7 @@ restart_round:
 		struct igt_fb old_fb = *fb;
 		int ret;
 
-		prepare_format_color(data, pipe, plane, format, modifier,
+		prepare_format_color(data, plane, format, modifier,
 				     width, height, encoding, range, c, fb,
 				     false);
 
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 74d12cc91265..887914ec8b79 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -576,7 +576,6 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 			     double sf_plane,
 			     bool is_clip_clamp,
 			     bool is_upscale,
-			     enum pipe pipe,
 			     igt_output_t *output,
 			     igt_rotation_t rot)
 {
@@ -742,7 +741,6 @@ test_scaler_with_modifier_pipe(data_t *d,
 								   sf_plane,
 								   is_clip_clamp,
 								   is_upscale,
-								   crtc->pipe,
 								   output,
 								   IGT_ROTATION_0);
 			if (ret != 0)
@@ -784,7 +782,6 @@ test_scaler_with_rotation_pipe(data_t *d,
 								   sf_plane,
 								   is_clip_clamp,
 								   is_upscale,
-								   crtc->pipe,
 								   output,
 								   rot);
 			if (ret != 0)
@@ -833,7 +830,6 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 								   sf_plane,
 								   is_clip_clamp,
 								   is_upscale,
-								   crtc->pipe,
 								   output,
 								   IGT_ROTATION_0);
 			if (ret != 0) {
@@ -888,8 +884,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 }
 
 static int
-__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
-			    enum pipe pipe, igt_output_t *output,
+__test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2, igt_output_t *output,
 			    igt_plane_t *p1, igt_plane_t *p2,
 			    struct igt_fb *fb1, struct igt_fb *fb2,
 			    enum scaler_combo_test_type test_type)
@@ -1004,8 +999,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 
 			if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
-			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2,
-							  crtc->pipe, output,
+			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2, output,
 							  p1, p2,
 							  &d->fb[1], &d->fb[2],
 							  test_type);
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 811596ec2324..55671c71e095 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -499,7 +499,7 @@ calculate_tolerance(uint64_t *threshold_hi, uint64_t *threshold_lo, uint64_t rat
  * to prevent stuttering or to match a source content rate.
  */
 static uint32_t
-flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
+flip_and_measure(data_t *data, igt_output_t *output,
 		 uint64_t *rates_ns, int num_rates, uint64_t duration_ns)
 {
 	uint64_t start_ns, last_event_ns, target_ns, exp_rate_ns;
@@ -605,7 +605,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 }
 
 static uint32_t
-flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe,
+flip_and_measure_cmrr(data_t *data, igt_output_t *output,
 		      uint64_t duration_ns)
 {
 	uint64_t start_ns, last_event_ns, event_ns;
@@ -681,7 +681,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * This is to make sure we were actually in the middle of
 	 * active flipping before doing the DPMS/suspend steps.
 	 */
-	flip_and_measure(data, output, pipe, rate, 1, 250000000ull);
+	flip_and_measure(data, output, rate, 1, 250000000ull);
 
 	if (flags & TEST_DPMS) {
 		kmstest_set_connector_dpms(output->display->drm_fd,
@@ -713,7 +713,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	if (flags & TEST_FLIPLINE) {
 		rate[0] = igt_kms_frame_time_from_vrefresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+		result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     (range.max + 5), rate[0], result);
@@ -721,7 +721,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
 		rate[0] = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+		result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     ((range.max + range.min) / 2), rate[0], result);
@@ -729,7 +729,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & TEST_FLIPLINE) {
 		rate[0] = igt_kms_frame_time_from_vrefresh(range.min - 10);
-		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+		result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
 			     (range.min - 10), rate[0], result);
@@ -744,7 +744,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			igt_kms_frame_time_from_vrefresh(range_min)
 		};
 
-		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
+		result = flip_and_measure(data, output, maxmin_rates, 2, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
@@ -758,7 +758,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate[0] = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+	result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate[0], (flags & TEST_NEGATIVE)? "on" : "off", result);
@@ -790,7 +790,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	}
 
 	rate[0] = vtest_ns.max;
-	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+	result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
 		     data->range.max, rate[0], vrr ? "on" : "off", result);
@@ -802,7 +802,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate[0] = vtest_ns.min;
-	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+	result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
 		     data->range.min, rate[0], vrr ? "on" : "off", result);
@@ -814,7 +814,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate[0] = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
+	result = flip_and_measure(data, output, rate, 1, data->duration_ns);
 	igt_assert_f(vrr ? (result > 75) : (result < 10),
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
 		     ((data->range.max + data->range.min) / 2), rate[0],
@@ -843,7 +843,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
 
-	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
 		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
@@ -876,7 +876,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
-		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
 			     vrefresh, rate[0], result);
@@ -903,7 +903,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
 
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
+	flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
 
 	step_size = (data->range.max - data->range.min) / 5;
 
@@ -913,7 +913,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			 vrefresh, data->switch_modes[HIGH_RR_MODE].vrefresh);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
-		flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
+		flip_and_measure(data, output, rate, 1, NSECS_PER_SEC);
 
 		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
 			lobf_enabled = true;
@@ -964,7 +964,7 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
 		prepare_test(data, output, pipe);
-		result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
+		result = flip_and_measure_cmrr(data, output, TEST_DURATION_NS * 2);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
 			     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh),
-- 
2.52.0

