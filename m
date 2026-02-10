Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22DDEA3F22
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F92910E5D6;
	Tue, 10 Feb 2026 16:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gz+RqeE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D59410E5D6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770739842; x=1802275842;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=aqkEHYiup7gI0OnsvVoZCMdmI0ofU1qy3ASiWo56XcU=;
 b=gz+RqeE2Ow+kIru8S1AtRERXaHUzeNWx2A8ELCTSKDQ1GvVt3c4tXPou
 0lSCRLhkgC4hn7YW4iRX+eUs2QzBgcjcP3Mij/v8MjzXLOi3O+1fLx+8r
 uLPirlm6+ks2ZrqE7b9Ww05Lk594NGsREi61quB9XJDcBHmlJElienLhX
 IsYf2NCDEV1bMF9yh4LY/k+I+HdlFzHjJPdiExyvt9bITZQJFdHAyKD9C
 ViDAK6dXzbOMuYQOou2HhW40ybqlvWD8HVZxIicSXz2VlBA0fvrYGho54
 Vdd7Q0Y++H3Mqidfcrg+O7x+UeVwXBMOiT4j8I//V9x8E86NHz7HiMlFF w==;
X-CSE-ConnectionGUID: pRGQYjloSfeKgLDgwUiSWw==
X-CSE-MsgGUID: NmGXsVPZREe2wzYFJep2+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71770707"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71770707"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:42 -0800
X-CSE-ConnectionGUID: uGXp/brnQ3W2oHMpsCIhQg==
X-CSE-MsgGUID: 74paOIUySseYAwK0R4mQXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211061366"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/5] tests/kms: Introduce local 'crtc' variables
Date: Tue, 10 Feb 2026 18:10:16 +0200
Message-ID: <20260210161016.29459-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
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

Try to collect most 'pipe' usage within each function
to a single igt_crtc_for_pipe() call, and subsequently
use the resulting 'crtc' (and 'crtc->pipe') where
appropriate.

This will help further cocci based cleanups around
igt_crtc_for_pipe() usage.

 #include "scripts/iterators.cocci"

@@
typedef igt_display_t;
identifier DISPLAY;
expression DISPLAY2, E;
@@
igt_display_t* DISPLAY = E;
<+...
igt_crtc_for_pipe(
- DISPLAY2
+ DISPLAY
  ,...)
...+>

@find_1@
identifier FUNC, DISPLAY, PIPE, CRTC;
expression E;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_display_t *DISPLAY = E;
...
igt_crtc_t *CRTC;
<+...
 CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...+>
}

@change_1 depends on find_1@
identifier find_1.FUNC, find_1.DISPLAY, find_1.PIPE, find_1.CRTC;
expression find_1.E;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_display_t *DISPLAY = E;
+ igt_crtc_t *CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...
- igt_crtc_t *CRTC;
<+...
(
- CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
|
- igt_crtc_for_pipe(DISPLAY, PIPE)
+ CRTC
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ crtc->pipe
)
...+>
}

@find_2@
identifier FUNC, DISPLAY, PIPE, CRTC;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_crtc_t *CRTC;
<+...
 CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
...+>
}

@change_2 depends on find_2@
identifier find_2.FUNC, find_2.DISPLAY, find_2.PIPE, find_2.CRTC;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
- igt_crtc_t *CRTC;
+ igt_crtc_t *CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
<+...
(
- CRTC = igt_crtc_for_pipe(DISPLAY, PIPE);
|
- igt_crtc_for_pipe(DISPLAY, PIPE)
+ CRTC
|
- kmstest_pipe_name(PIPE)
+ igt_crtc_name(CRTC)
|
- PIPE
+ crtc->pipe
)
...+>
}

@change_3@
identifier FUNC, DISPLAY, PIPE;
expression E;
@@
FUNC(..., enum pipe PIPE, ...)
{
...
igt_display_t *DISPLAY = E;
+ igt_crtc_t *crtc = igt_crtc_for_pipe(DISPLAY, PIPE);
<+...
(
- igt_crtc_for_pipe(DISPLAY, PIPE)
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

@@
identifier CRTC;
@@
- igt_crtc_t *CRTC = CRTC;

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_cursor_overlay.c             |  3 +-
 tests/amdgpu/amd_freesync_video_mode.c        |  3 +-
 tests/chamelium/kms_chamelium_color.c         | 19 ++--
 .../kms_chamelium_sharpness_filter.c          | 22 +++--
 tests/intel/kms_cdclk.c                       |  6 +-
 tests/intel/kms_fence_pin_leak.c              |  5 +-
 tests/intel/kms_flip_scaled_crc.c             | 14 +--
 tests/intel/kms_joiner.c                      | 10 +-
 tests/intel/kms_pipe_b_c_ivb.c                |  6 +-
 tests/intel/kms_pipe_stress.c                 |  3 +-
 tests/intel/kms_psr2_su.c                     |  3 +-
 tests/kms_atomic.c                            | 15 +--
 tests/kms_atomic_transition.c                 | 94 +++++++++++--------
 tests/kms_color.c                             | 31 +++---
 tests/kms_concurrent.c                        | 22 +++--
 tests/kms_content_protection.c                |  5 +-
 tests/kms_dither.c                            | 10 +-
 tests/kms_hdr.c                               | 26 ++---
 tests/kms_panel_fitting.c                     |  3 +-
 tests/kms_pipe_crc_basic.c                    | 21 +++--
 tests/kms_plane.c                             | 52 +++++-----
 tests/kms_plane_alpha_blend.c                 | 35 ++++---
 tests/kms_plane_cursor.c                      |  3 +-
 tests/kms_plane_scaling.c                     | 41 ++++----
 tests/kms_rmfb.c                              |  9 +-
 tests/kms_rotation_crc.c                      | 27 ++++--
 tests/kms_universal_plane.c                   | 49 ++++++----
 tests/kms_vrr.c                               |  9 +-
 28 files changed, 327 insertions(+), 219 deletions(-)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 75aa0113921a..6245045d160a 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -135,9 +135,10 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		      unsigned int flags, int available_overlay_planes)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
 	int i;
 
-	data->pipe_id = pipe_id;
+	data->pipe_id = crtc->pipe;
 	data->available_overlay_planes = available_overlay_planes;
 	data->crtc = &data->display.crtcs[data->pipe_id];
 	data->output = output;
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index d385a8ac685f..0592d7139ad3 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -549,7 +549,8 @@ static bool has_vrr(igt_output_t *output)
 static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED,
 				    enabled);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 6bcf3226d858..d77b924ac672 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -432,18 +432,19 @@ static void
 prep_pipe(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_require_pipe(&data->display, p);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
+	igt_require_pipe(&data->display, crtc->pipe);
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
+			igt_crtc_get_prop(crtc,
 					      IGT_CRTC_DEGAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->degamma_lut_size);
 	}
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_GAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_GAMMA_LUT_SIZE)) {
 		data->gamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
+			igt_crtc_get_prop(crtc,
 					      IGT_CRTC_GAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->gamma_lut_size);
 	}
@@ -456,7 +457,7 @@ static int test_setup(data_t *data, enum pipe p)
 	int i = 0;
 
 	igt_display_reset(&data->display);
-	prep_pipe(data, p);
+	prep_pipe(data, crtc->pipe);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
@@ -465,7 +466,8 @@ static int test_setup(data_t *data, enum pipe p)
 	 * Prefer to run this test on HDMI connector if its connected, since on DP we
 	 * sometimes face DP FSM issue
 	 */
-        for_each_valid_output_on_pipe(&data->display, p, data->output) {
+        for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+				      data->output) {
                 for (i = 0; i < data->port_count; i++) {
                         if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 			    data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
@@ -474,7 +476,8 @@ static int test_setup(data_t *data, enum pipe p)
                 }
         }
 
-	for_each_valid_output_on_pipe(&data->display, p, data->output) {
+	for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+				      data->output) {
 		for (i = 0; i < data->port_count; i++) {
 			if (strcmp(data->output->name,
 				   chamelium_port_get_name(data->ports[i])) == 0)
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index de8cf7fc1199..c8dc3ee879e3 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -41,10 +41,11 @@ typedef struct {
 static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	bool ret = true;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(display, pipe));
+			    crtc);
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_crtc(data->output, NULL);
@@ -195,8 +196,9 @@ static int test_setup(data_t *data, enum pipe p)
 	 * Prefer to run this test on HDMI connector if its connected, since on DP we
 	 * sometimes face DP FSM issue
 	 */
-        for_each_valid_output_on_pipe(&data->display, p, data->output) {
-		data->pipe_id = p;
+        for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+				      data->output) {
+		data->pipe_id = crtc->pipe;
 		for (i = 0; i < data->port_count; i++) {
 			if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
 			     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
@@ -205,8 +207,9 @@ static int test_setup(data_t *data, enum pipe p)
 		}
 	}
 
-	for_each_valid_output_on_pipe(&data->display, p, data->output) {
-		data->pipe_id = p;
+	for_each_valid_output_on_pipe(&data->display, crtc->pipe,
+				      data->output) {
+		data->pipe_id = crtc->pipe;
 		for (i = 0; i < data->port_count; i++) {
 			if (strcmp(data->output->name,
 				   chamelium_port_get_name(data->ports[i])) == 0)
@@ -220,15 +223,16 @@ static int test_setup(data_t *data, enum pipe p)
 static void test_sharpness_filter(data_t *data,  enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	int port_idx = test_setup(data, p);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
+	int port_idx = test_setup(data, crtc->pipe);
 
 	igt_require(port_idx >= 0);
-	igt_require(igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_SHARPNESS_STRENGTH));
+	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH));
 
-	if (!pipe_output_combo_valid(data, p))
+	if (!pipe_output_combo_valid(data, crtc->pipe))
 		return;
 
-	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
+	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
 		(test_t(data, data->primary, data->ports[port_idx]));
 }
 
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 94b6a36695c8..eb8b79c447bc 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -131,6 +131,7 @@ static void do_cleanup_display(igt_display_t *dpy)
 static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
@@ -144,7 +145,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, pipe));
+				    crtc);
 		mode = *igt_output_get_highres_mode(output);
 		igt_require_f(is_4k(mode), "Mode >= 4K not found on output %s\n",
 			      igt_output_name(output));
@@ -186,6 +187,7 @@ static void test_plane_scaling(data_t *data, enum pipe pipe, igt_output_t *outpu
 static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int cdclk_ref, cdclk_new;
 	struct igt_fb fb;
 	igt_plane_t *primary;
@@ -194,7 +196,7 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 	mode_lo = *get_lowres_mode(output);
 	mode_hi = *igt_output_get_highres_mode(output);
diff --git a/tests/intel/kms_fence_pin_leak.c b/tests/intel/kms_fence_pin_leak.c
index dc18a3ffa804..3d9ce4fc1563 100644
--- a/tests/intel/kms_fence_pin_leak.c
+++ b/tests/intel/kms_fence_pin_leak.c
@@ -133,15 +133,16 @@ static void free_fence_objs(data_t *data)
 static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	struct igt_fb fb[2];
 	int i;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 84a8a438b7e1..0dc594f45fe9 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -726,6 +726,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 				drmModeModeInfoPtr modetoset, int flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
 	struct drm_event_vblank ev;
@@ -735,7 +736,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	igt_debug("running on output %s pipe %s\n", output->name,
-		  kmstest_pipe_name(pipe));
+		  igt_crtc_name(crtc));
 
 	if (data->big_fb.fb_id == 0) {
 		setup_fb(data, &data->small_fb,
@@ -759,7 +760,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	if (modetoset)
 		igt_output_override_mode(output, modetoset);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -774,16 +775,17 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 
 	igt_skip_on_f(!igt_plane_has_format_mod(primary, data->small_fb.drm_format, data->small_fb.modifier) ||
 		      !igt_plane_has_format_mod(primary, data->big_fb.drm_format,
-		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
+		      data->big_fb.modifier), "No requested format/modifier on pipe %s\n",
+		      igt_crtc_name(crtc));
 
-	set_lut(data, pipe);
+	set_lut(data, crtc->pipe);
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	if (data->pipe_crc) {
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
 	}
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_plane_set_position(primary, 0, 0);
@@ -831,7 +833,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	igt_pipe_crc_free(data->pipe_crc);
 	data->pipe_crc = NULL;
 
-	clear_lut(data, pipe);
+	clear_lut(data, crtc->pipe);
 
 	modetoset = NULL;
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 3eb170c9dd2d..a582f6f93029 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -143,18 +143,20 @@ static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask
 static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t available_pipe_mask)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	enum pipe master_pipe;
 	uint32_t attempt_mask;
 
-	attempt_mask = BIT(pipe);
+	attempt_mask = BIT(crtc->pipe);
 	master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
 
 	if (master_pipe == PIPE_NONE)
 		return PIPE_NONE;
 
-	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
-		 kmstest_pipe_name(pipe + 1), output->name);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_info("Using pipe %s as master and %s slave for %s\n",
+		 igt_crtc_name(crtc),
+		 kmstest_pipe_name(crtc->pipe + 1), output->name);
+	igt_output_set_crtc(output, crtc);
 
 	return master_pipe;
 }
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 85ca60e8ad5c..184d3b38fee7 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -101,9 +101,10 @@ static int
 disable_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	primary = igt_output_get_plane(output, 0);
 	igt_plane_set_fb(primary, NULL);
 	return igt_display_commit(&data->display);
@@ -113,12 +114,13 @@ static int
 set_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
 	int fb_id;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 0cbe71973821..47e7524c6aa4 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -341,10 +341,11 @@ static int commit_mode(struct data *data, igt_output_t *output,
 		       enum pipe pipe, drmModeModeInfo *mode)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int ret;
 
 	igt_output_override_mode(output, mode);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	ret = igt_display_try_commit_atomic(&data->display,
 					    DRM_MODE_ATOMIC_TEST_ONLY |
diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
index e748ea1eeaa4..f7652f165a2d 100644
--- a/tests/intel/kms_psr2_su.c
+++ b/tests/intel/kms_psr2_su.c
@@ -298,10 +298,11 @@ static int check_psr2_support(data_t *data, enum pipe pipe)
 
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	igt_display_reset(display);
 	output = data->output;
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	prepare(data, output);
 	status = psr_wait_entry(data->debugfs_fd, PSR_MODE_2, output);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 34ba6051f71a..5b3cc4a94c99 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -441,6 +441,7 @@ static void
 plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_planes)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	cairo_t *cr;
 	struct igt_fb fb_ref;
 	drmModeModeInfo *mode;
@@ -480,7 +481,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	/* create the pipe_crc object for this pipe */
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc */
@@ -493,7 +494,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 		int zpos;
 		igt_plane_t *temp;
 
-		temp = &igt_crtc_for_pipe(display, pipe)->planes[k];
+		temp = &crtc->planes[k];
 
 		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
 			continue;
@@ -673,6 +674,7 @@ static void plane_primary(data_t *data)
 static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t format)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct igt_fb fb;
 	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -686,7 +688,7 @@ static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32
 			      mode->hdisplay, mode->vdisplay,
 			      format, I915_TILING_NONE, &fb);
 	igt_plane_set_fb(data->primary, &fb);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -1383,13 +1385,14 @@ static void atomic_plane_damage(data_t *data)
 static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_display_reset(&data->display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
-	data->primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe),
+	data->primary = igt_crtc_get_plane_type(crtc,
 						DRM_PLANE_TYPE_PRIMARY);
-	data->crtc = igt_crtc_for_pipe(display, pipe);
+	data->crtc = crtc;
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(data->drm_fd,
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 3711a56fb013..27072c4f1d06 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -134,6 +134,7 @@ static void
 run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	igt_fb_t *fb = &data->fbs[0];
@@ -143,9 +144,9 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_display_reset(&data->display);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	mode = igt_output_get_mode(output);
@@ -163,13 +164,13 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (!(i & 1))
-			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+			igt_wait_for_vblank(crtc);
 
 		igt_plane_set_fb(primary, (i & 1) ? fb : NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (i & 1)
-			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+			igt_wait_for_vblank(crtc);
 
 		igt_plane_set_fb(primary, (i & 1) ? NULL : fb);
 	}
@@ -324,10 +325,11 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			unsigned *iter_max)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint64_t cursor_width, cursor_height;
 	unsigned sprite_width, sprite_height, prev_w, prev_h;
 	bool max_sprite_width, max_sprite_height, alpha = true;
-	uint32_t n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
+	uint32_t n_planes = crtc->n_planes;
 	uint32_t n_overlays = 0, overlays[n_planes];
 	igt_plane_t *plane;
 	uint32_t iter_mask = 3;
@@ -340,7 +342,7 @@ static void setup_parms(data_t *data, enum pipe pipe,
 	if (cursor_height >= mode->vdisplay)
 		cursor_height = mode->vdisplay;
 
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		int i = plane->index;
 
 		if (plane->type == DRM_PLANE_TYPE_PRIMARY) {
@@ -406,10 +408,11 @@ static void setup_parms(data_t *data, enum pipe pipe,
 	while (!max_sprite_width && !max_sprite_height) {
 		int ret;
 
-		set_sprite_wh(data, pipe, parms, sprite_fb,
+		set_sprite_wh(data, crtc->pipe, parms, sprite_fb,
 			      alpha, sprite_width, sprite_height);
 
-		wm_setup_plane(data, pipe, (1 << n_planes) - 1, parms, false);
+		wm_setup_plane(data, crtc->pipe, (1 << n_planes) - 1, parms,
+			       false);
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
 
@@ -438,8 +441,7 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			igt_assert_f(n_planes >= 3, "No planes left to proceed with!");
 			if (n_overlays > 0) {
 				uint32_t plane_to_remove = hars_petruska_f54_1_random_unsafe_max(n_overlays);
-				removed_plane = &igt_crtc_for_pipe(display,
-								   pipe)->planes[overlays[plane_to_remove]];
+				removed_plane = &crtc->planes[overlays[plane_to_remove]];
 				igt_plane_set_fb(removed_plane, NULL);
 				while (plane_to_remove < (n_overlays - 1)) {
 					overlays[plane_to_remove] = overlays[plane_to_remove + 1];
@@ -465,23 +467,24 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			max_sprite_height = true;
 	}
 
-	set_sprite_wh(data, pipe, parms, sprite_fb,
+	set_sprite_wh(data, crtc->pipe, parms, sprite_fb,
 			alpha, sprite_width, sprite_height);
 
 	igt_info("Running test on pipe %s with resolution %dx%d and sprite size %dx%d alpha %i\n",
-		 kmstest_pipe_name(pipe), mode->hdisplay, mode->vdisplay,
+		 igt_crtc_name(crtc), mode->hdisplay, mode->vdisplay,
 		 sprite_width, sprite_height, alpha);
 }
 
 static void prepare_fencing(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *plane;
 	int n_planes;
 
 	igt_require_sw_sync();
 
-	n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
+	n_planes = crtc->n_planes;
 	timeline = calloc(n_planes, sizeof(*timeline));
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
 	thread = calloc(n_planes, sizeof(*thread));
@@ -489,7 +492,7 @@ static void prepare_fencing(data_t *data, enum pipe pipe)
 	seqno = calloc(n_planes, sizeof(*seqno));
 	igt_assert_f(seqno != NULL, "Failed to allocate memory for seqno\n");
 
-	for_each_plane_on_pipe(&data->display, pipe, plane)
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane)
 		timeline[plane->index] = sw_sync_timeline_create();
 }
 
@@ -512,8 +515,9 @@ static void unprepare_fencing(data_t *data, enum pipe pipe)
 static void atomic_commit(data_t *data_v, enum pipe pipe, unsigned int flags, void *data, bool fencing)
 {
 	igt_display_t *display = &data_v->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	if (fencing)
-		igt_crtc_request_out_fence(igt_crtc_for_pipe(display, pipe));
+		igt_crtc_request_out_fence(crtc);
 
 	igt_display_commit_atomic(&data_v->display, flags, data);
 }
@@ -531,8 +535,9 @@ static int fd_completed(int fd)
 static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking, bool fencing)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	if (fencing) {
-		int fence_fd = igt_crtc_for_pipe(display, pipe)->out_fence_fd;
+		int fence_fd = crtc->out_fence_fd;
 
 		if (!nonblocking)
 			igt_assert(fd_completed(fence_fd));
@@ -560,19 +565,19 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		enum transition_type type, bool nonblocking, bool fencing)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint32_t iter_max, i;
 	struct plane_parms parms[crtc->n_planes];
 	unsigned flags = 0;
 	int ret;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
 	if (fencing)
-		prepare_fencing(data, pipe);
+		prepare_fencing(data, crtc->pipe);
 	else
 		flags |= DRM_MODE_PAGE_FLIP_EVENT;
 
@@ -592,7 +597,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 
 	igt_output_set_crtc(output, crtc);
 
-	wm_setup_plane(data, pipe, 0, NULL, false);
+	wm_setup_plane(data, crtc->pipe, 0, NULL, false);
 
 	if (flags & DRM_MODE_ATOMIC_ALLOW_MODESET) {
 		igt_output_set_crtc(output, NULL);
@@ -603,7 +608,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 				    crtc);
 	}
 
-	setup_parms(data, pipe, mode, &data->fbs[0], &data->argb_fb, &data->sprite_fb, parms, &iter_max);
+	setup_parms(data, crtc->pipe, mode, &data->fbs[0], &data->argb_fb,
+		    &data->sprite_fb, parms, &iter_max);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
@@ -613,7 +619,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	 * planes to fix this
 	 */
 	while (1) {
-		wm_setup_plane(data, pipe, iter_max - 1, parms, false);
+		wm_setup_plane(data, crtc->pipe, iter_max - 1, parms, false);
 
 		if (fencing)
 			igt_crtc_request_out_fence(crtc);
@@ -625,7 +631,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 			break;
 
 		ret = 0;
-		for_each_plane_on_pipe(&data->display, pipe, plane) {
+		for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 			i = plane->index;
 
 			if (plane->type == DRM_PLANE_TYPE_PRIMARY ||
@@ -647,16 +653,17 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	if (type == TRANSITION_AFTER_FREE) {
 		int fence_fd = -1;
 
-		wm_setup_plane(data, pipe, 0, parms, fencing);
+		wm_setup_plane(data, crtc->pipe, 0, parms, fencing);
 
-		atomic_commit(data, pipe, flags, (void *)(unsigned long)0, fencing);
+		atomic_commit(data, crtc->pipe, flags,
+			      (void *)(unsigned long)0, fencing);
 		if (fencing) {
 			fence_fd = crtc->out_fence_fd;
 			crtc->out_fence_fd = -1;
 		}
 
 		/* force planes to be part of commit */
-		for_each_plane_on_pipe(&data->display, pipe, plane) {
+		for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 			if (parms[plane->index].mask)
 				igt_plane_set_position(plane, 0, 0);
 		}
@@ -668,7 +675,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 			close(fence_fd);
 		} else {
 			igt_assert(fd_completed(data->drm_fd));
-			wait_for_transition(data, pipe, false, fencing);
+			wait_for_transition(data, crtc->pipe, false, fencing);
 		}
 		return;
 	}
@@ -684,20 +691,23 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		igt_output_set_crtc(output,
 				    crtc);
 
-		if (!wm_setup_plane(data, pipe, i, parms, fencing))
+		if (!wm_setup_plane(data, crtc->pipe, i, parms, fencing))
 			continue;
 
-		atomic_commit(data, pipe, flags, (void *)(unsigned long)i, fencing);
-		wait_for_transition(data, pipe, nonblocking, fencing);
+		atomic_commit(data, crtc->pipe, flags,
+			      (void *)(unsigned long)i, fencing);
+		wait_for_transition(data, crtc->pipe, nonblocking, fencing);
 
 		if (type == TRANSITION_MODESET_DISABLE) {
 			igt_output_set_crtc(output, NULL);
 
-			if (!wm_setup_plane(data, pipe, 0, parms, fencing))
+			if (!wm_setup_plane(data, crtc->pipe, 0, parms, fencing))
 				continue;
 
-			atomic_commit(data, pipe, flags, (void *) 0UL, fencing);
-			wait_for_transition(data, pipe, nonblocking, fencing);
+			atomic_commit(data, crtc->pipe, flags, (void *) 0UL,
+				      fencing);
+			wait_for_transition(data, crtc->pipe, nonblocking,
+					    fencing);
 		} else {
 			uint32_t j;
 
@@ -710,23 +720,29 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 				    n_enable_planes < crtc->n_planes)
 					continue;
 
-				if (!wm_setup_plane(data, pipe, j, parms, fencing))
+				if (!wm_setup_plane(data, crtc->pipe, j, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, &override_mode);
 
-				atomic_commit(data, pipe, flags, (void *)(unsigned long) j, fencing);
-				wait_for_transition(data, pipe, nonblocking, fencing);
+				atomic_commit(data, crtc->pipe, flags,
+					      (void *)(unsigned long) j,
+					      fencing);
+				wait_for_transition(data, crtc->pipe,
+						    nonblocking, fencing);
 
-				if (!wm_setup_plane(data, pipe, i, parms, fencing))
+				if (!wm_setup_plane(data, crtc->pipe, i, parms, fencing))
 					continue;
 
 				if (type >= TRANSITION_MODESET)
 					igt_output_override_mode(output, NULL);
 
-				atomic_commit(data, pipe, flags, (void *)(unsigned long) i, fencing);
-				wait_for_transition(data, pipe, nonblocking, fencing);
+				atomic_commit(data, crtc->pipe, flags,
+					      (void *)(unsigned long) i,
+					      fencing);
+				wait_for_transition(data, crtc->pipe,
+						    nonblocking, fencing);
 			}
 		}
 	}
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 4f44997124a7..b21bcdb5d497 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -714,18 +714,19 @@ static void
 prep_pipe(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_require_pipe(&data->display, p);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
+	igt_require_pipe(&data->display, crtc->pipe);
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
+			igt_crtc_get_prop(crtc,
 					      IGT_CRTC_DEGAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->degamma_lut_size);
 	}
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_GAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_GAMMA_LUT_SIZE)) {
 		data->gamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
+			igt_crtc_get_prop(crtc,
 					      IGT_CRTC_GAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->gamma_lut_size);
 	}
@@ -736,7 +737,7 @@ static void test_setup(data_t *data, enum pipe p)
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 
-	prep_pipe(data, p);
+	prep_pipe(data, crtc->pipe);
 	igt_require_pipe_crc(data->drm_fd);
 	igt_require(crtc->n_planes >= 0);
 
@@ -841,6 +842,7 @@ static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	igt_output_t *output;
 	static const color_t blue_green_blue[] = {
 		{ 0.0, 0.0, 1.0 },
@@ -862,9 +864,9 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_require_f((intel_display_ver(data->devid) >= 11),
 				"At least GEN 11 is required to validate Deep-color.\n");
 
-	test_setup(data, p);
+	test_setup(data, crtc->pipe);
 
-	for_each_valid_output_on_pipe(&data->display, p, output) {
+	for_each_valid_output_on_pipe(&data->display, crtc->pipe, output) {
 		uint64_t max_bpc = get_max_bpc(output);
 		bool ret;
 
@@ -896,10 +898,10 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_display_reset(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, p));
+				    crtc);
 
 		if (is_intel_device(data->drm_fd) &&
-		    !igt_max_bpc_constraint(&data->display, p, output, 10)) {
+		    !igt_max_bpc_constraint(&data->display, crtc->pipe, output, 10)) {
 			igt_info("Output %s: Doesn't support 10-bpc.\n",
 				 igt_output_name(output));
 			continue;
@@ -913,7 +915,8 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_assert(data->mode);
 		memcpy(data->mode, igt_output_get_mode(data->output), sizeof(drmModeModeInfo));
 
-		igt_dynamic_f("pipe-%s-%s-gamma", kmstest_pipe_name(p), output->name) {
+		igt_dynamic_f("pipe-%s-%s-gamma", igt_crtc_name(crtc),
+			      output->name) {
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
@@ -923,7 +926,8 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_assert(ret);
 		}
 
-		igt_dynamic_f("pipe-%s-%s-degamma", kmstest_pipe_name(p), output->name) {
+		igt_dynamic_f("pipe-%s-%s-degamma", igt_crtc_name(crtc),
+			      output->name) {
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
@@ -933,7 +937,8 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 			igt_assert(ret);
 		}
 
-		igt_dynamic_f("pipe-%s-%s-ctm", kmstest_pipe_name(p), output->name) {
+		igt_dynamic_f("pipe-%s-%s-ctm", igt_crtc_name(crtc),
+			      output->name) {
 			igt_display_reset(&data->display);
 			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 81f3944c29f6..f93581da54dc 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -232,16 +232,17 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 				igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int i;
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int ret;
 
-	igt_crtc_refresh(igt_crtc_for_pipe(display, pipe), true);
+	igt_crtc_refresh(crtc, true);
 
 	i = 0;
 	while (i < iterations || loop_forever) {
-		prepare_planes(data, pipe, max_planes, output);
+		prepare_planes(data, crtc->pipe, max_planes, output);
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 		for (int c = 0; c < max_planes; c++)
@@ -279,6 +280,7 @@ static void
 test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int i;
@@ -289,7 +291,7 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		drmModeModeInfo *mode_lo;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, pipe));
+				    crtc);
 
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
@@ -313,28 +315,30 @@ static void
 run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	int n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	int n_planes = crtc->n_planes;
 	igt_display_reset(&data->display);
 
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
 
 	igt_info("Testing resolution with connector %s using pipe %s with seed %d\n",
-		 igt_output_name(output), kmstest_pipe_name(pipe), opt.seed);
+		 igt_output_name(output), igt_crtc_name(crtc), opt.seed);
 
 	srand(opt.seed);
 
-	test_init(data, pipe, n_planes, output);
+	test_init(data, crtc->pipe, n_planes, output);
 
 	igt_fork(child, 1) {
-		test_plane_position_with_output(data, pipe, n_planes, output);
+		test_plane_position_with_output(data, crtc->pipe, n_planes,
+						output);
 	}
 
-	test_resolution_with_output(data, pipe, n_planes, output);
+	test_resolution_with_output(data, crtc->pipe, n_planes, output);
 
 	igt_waitchildren();
 
-	test_fini(data, pipe, n_planes, output);
+	test_fini(data, crtc->pipe, n_planes, output);
 }
 
 static void
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index dc1dd493b6f7..3a0476bfca71 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -449,6 +449,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 					      int content_type)
 {
 	igt_display_t *display = &data.display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	bool ret;
 
 	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
@@ -485,11 +486,11 @@ static void test_content_protection_on_output(igt_output_t *output,
 		test_cp_lic(output);
 
 	if (data.cp_tests & CP_DPMS) {
-		igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
+		igt_crtc_set_prop_value(crtc,
 					    IGT_CRTC_ACTIVE, 0);
 		igt_display_commit2(display, commit_style);
 
-		igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
+		igt_crtc_set_prop_value(crtc,
 					    IGT_CRTC_ACTIVE, 1);
 		igt_display_commit2(display, commit_style);
 
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 87e2448f86d6..d308d49abd09 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -117,13 +117,14 @@ static void test_dithering(data_t *data, enum pipe pipe,
 			   int output_bpc)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	dither_status_t status;
 	int bpc, ret;
 	bool constraint;
 
 	igt_info("Dithering test execution on %s PIPE_%s\n",
-			output->name, kmstest_pipe_name(pipe));
-	prepare_test(data, output, pipe);
+			output->name, igt_crtc_name(crtc));
+	prepare_test(data, output, crtc->pipe);
 
 	igt_assert(igt_create_fb(data->drm_fd, 512, 512, fb_format,
 				 DRM_FORMAT_MOD_LINEAR, &data->fb));
@@ -143,7 +144,8 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	if (ret)
 		goto cleanup;
 
-	constraint = igt_max_bpc_constraint(display, pipe, output, output_bpc);
+	constraint = igt_max_bpc_constraint(display, crtc->pipe, output,
+					    output_bpc);
 	if (!constraint)
 		goto cleanup;
 
@@ -154,7 +156,7 @@ static void test_dithering(data_t *data, enum pipe pipe,
 	 * If fb_bpc is greater than output_bpc, Dithering should be enabled
 	 * Else disabled
 	 */
-	status = get_dither_state(data, pipe);
+	status = get_dither_state(data, crtc->pipe);
 
 	igt_info("FB BPC:%d, Panel BPC:%d, Pipe BPC:%d, Expected Dither:%s, Actual result:%s\n",
 		  fb_bpc, output_bpc, status.bpc,
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 275fcf52cfbc..f97861798085 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -206,8 +206,9 @@ static void set_hdr_output_metadata(data_t *data,
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
-	data->pipe_id = pipe;
+	data->pipe_id = crtc->pipe;
 	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 	igt_assert(data->crtc);
 
@@ -238,6 +239,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 				      uint32_t flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
 	int afb_id, ret;
@@ -253,7 +255,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	 * smaller plane size in following tests.
 	 */
 	igt_plane_set_fb(data->primary, &afb);
-	if (get_num_scalers(display, pipe) >= 1)
+	if (get_num_scalers(display, crtc->pipe) >= 1)
 		igt_plane_set_size(data->primary, data->w, data->h);
 	else
 		igt_plane_set_size(data->primary, 512, 512);
@@ -267,7 +269,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	/* Start in 8bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
 
 	/*
 	 * amdgpu requires a primary plane when the CRTC is enabled.
@@ -281,7 +283,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	/* Switch to 10bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -291,7 +293,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	/* Drop back to 8bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
 
 	/* CRC capture is clamped to 8bpc, so capture should match. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
@@ -475,6 +477,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 			       uint32_t flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct hdr_output_metadata hdr;
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
@@ -501,7 +504,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
 		igt_force_dsc_disable(data->fd, output->name);
@@ -522,7 +525,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 		adjust_brightness(data, flags);
 	}
 
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 10);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -539,7 +542,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
@@ -586,6 +589,7 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
 static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, new_crc;
 	igt_fb_t afb;
 	int afb_id;
@@ -609,7 +613,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	}
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
 
 	if (flags & TEST_NEEDS_DSC) {
 		igt_force_dsc_disable(data->fd, output->name);
@@ -621,7 +625,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 10);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
@@ -658,7 +662,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output,
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
+	igt_assert_output_bpc_equal(data->fd, crtc->pipe, output->name, 8);
 
 	/* Verify that the CRC didn't change while cycling metadata. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index ac1ebcf2a63f..296f09405e4e 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -72,9 +72,10 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 			igt_plane_t *plane, drmModeModeInfo *mode, enum igt_commit_style s)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	igt_output_override_mode(output, mode);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	/* before allocating, free if any older fb */
 	igt_remove_fb(data->drm_fd, &data->fb1);
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 630738bb24f3..8c928754b469 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -131,6 +131,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 			  igt_output_t *output, unsigned flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t *crcs = NULL;
@@ -138,7 +139,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 
 	igt_display_reset(display);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -167,12 +168,12 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		if (flags & TEST_NONBLOCK) {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_crtc_crc_new_nonblock(igt_crtc_for_pipe(display, pipe),
+			pipe_crc = igt_crtc_crc_new_nonblock(crtc,
 							     IGT_PIPE_CRC_SOURCE_AUTO);
-			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
+			igt_wait_for_vblank(crtc);
 			igt_pipe_crc_start(pipe_crc);
 
-			igt_wait_for_vblank_count(igt_crtc_for_pipe(display, pipe),
+			igt_wait_for_vblank_count(crtc,
 						  N_CRCS);
 			n_crcs = igt_pipe_crc_get_crcs(pipe_crc, N_CRCS+1, &crcs);
 			igt_pipe_crc_stop(pipe_crc);
@@ -183,7 +184,7 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		} else {
 			igt_pipe_crc_t *pipe_crc;
 
-			pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+			pipe_crc = igt_crtc_crc_new(crtc,
 						    IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_pipe_crc_start(pipe_crc);
 
@@ -238,6 +239,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 			     uint32_t plane_format)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	igt_crc_t ref_crc, crc;
@@ -245,7 +247,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	struct igt_fb fb0, fb1;
 
 	igt_display_reset(display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -268,7 +270,7 @@ static void test_compare_crc(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_plane_set_fb(primary, &fb0);
 	igt_display_commit(display);
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 
@@ -293,16 +295,17 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 					igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	igt_crc_t crc[2];
 	igt_plane_t *primary;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_display_reset(display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd,
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 1dbda9dcb3c3..f77bc8b39fbf 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -148,10 +148,11 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
 static void test_init(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
-	igt_require(igt_crtc_for_pipe(display, pipe)->n_planes > 0);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	igt_require(crtc->n_planes > 0);
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
 }
@@ -234,13 +235,14 @@ test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	      color_t *fb_color, unsigned int flags, igt_crc_t *crc /* out */)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct igt_fb fb;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	char *crc_str;
 	int ret;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	primary = igt_output_get_plane(output, 0);
 
@@ -309,6 +311,7 @@ test_plane_position_with_output(data_t *data,
 				unsigned int flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	rectangle_t rect = { .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }};
 	igt_plane_t *primary, *sprite;
 	struct igt_fb primary_fb, sprite_fb;
@@ -316,9 +319,9 @@ test_plane_position_with_output(data_t *data,
 	igt_crc_t crc, crc2;
 
 	igt_debug("Testing connector %s using pipe %s plane %d\n", igt_output_name(output),
-		  kmstest_pipe_name(pipe), plane);
+		  igt_crtc_name(crtc), plane);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -385,19 +388,22 @@ static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
-	int n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	int n_planes = crtc->n_planes;
 	igt_output_t *output = data->output;
 	igt_crc_t reference_crc;
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	test_init(data, pipe);
-	test_grab_crc(data, output, pipe, &green, data->flags, &reference_crc);
+	test_init(data, crtc->pipe);
+	test_grab_crc(data, output, crtc->pipe, &green, data->flags,
+		      &reference_crc);
 
 	for (int plane = 1; plane < n_planes; plane++) {
-		igt_dynamic_f("pipe-%s-plane-%d", kmstest_pipe_name(pipe), plane)
-			test_plane_position_with_output(data, pipe, plane, output,
+		igt_dynamic_f("pipe-%s-plane-%d", igt_crtc_name(crtc), plane)
+			test_plane_position_with_output(data, crtc->pipe,
+							plane, output,
 							&reference_crc, data->flags);
 	}
 
@@ -451,18 +457,19 @@ test_plane_panning_with_output(data_t *data,
 			       unsigned int flags)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary;
 	struct igt_fb primary_fb;
 	drmModeModeInfo *mode;
 	igt_crc_t crc;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
 
 	igt_debug("Testing connector %s using pipe %s, mode %s\n", igt_output_name(output),
-		  kmstest_pipe_name(pipe), mode->name);
+		  igt_crtc_name(crtc), mode->name);
 
 	create_fb_for_mode_panning(data, mode, &primary_fb);
 	igt_plane_set_fb(primary, &primary_fb);
@@ -1261,6 +1268,7 @@ static void
 test_pixel_formats(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct igt_fb primary_fb;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
@@ -1276,33 +1284,35 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	}
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
-		 kmstest_pipe_name(pipe), igt_output_name(output));
+		 igt_crtc_name(crtc), igt_output_name(output));
 
-	test_init(data, pipe);
+	test_init(data, crtc->pipe);
 
 	mode = igt_output_get_mode(output);
 
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &primary_fb);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	set_legacy_lut(data, pipe, LUT_MASK);
+	set_legacy_lut(data, crtc->pipe, LUT_MASK);
 
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		if (skip_plane(data, plane))
 			continue;
-		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), plane->index)
-			test_format_plane(data, pipe, output, plane, &primary_fb);
+		igt_dynamic_f("pipe-%s-plane-%u", igt_crtc_name(crtc),
+			      plane->index)
+			test_format_plane(data, crtc->pipe, output, plane,
+					  &primary_fb);
 	}
 
 	test_fini(data);
 
-	set_legacy_lut(data, pipe, 0xffff);
+	set_legacy_lut(data, crtc->pipe, 0xffff);
 
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_crtc(output, NULL);
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 8de93c334f66..1f093a49c9b6 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -213,13 +213,14 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 {
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int w, h;
-	igt_plane_t *primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe),
+	igt_plane_t *primary = igt_crtc_get_plane_type(crtc,
 						       DRM_PLANE_TYPE_PRIMARY);
 
 	/* create the pipe_crc object for this pipe */
 	igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	mode = igt_output_get_mode(output);
@@ -385,10 +386,11 @@ static void constant_alpha_min(data_t *data, enum pipe pipe, igt_plane_t *plane)
 static void constant_alpha_mid(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, crc;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
@@ -411,10 +413,11 @@ static void constant_alpha_mid(data_t *data, enum pipe pipe, igt_plane_t *plane)
 static void constant_alpha_max(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc, crc;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_plane_set_fb(plane, &data->argb_fb_100);
@@ -442,10 +445,11 @@ static void constant_alpha_max(data_t *data, enum pipe pipe, igt_plane_t *plane)
 static void alpha_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc = {}, crc = {};
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
@@ -496,11 +500,12 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t ref_crc = {}, crc = {};
 
 	/* Set a background color on the primary fb for testing */
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
@@ -530,11 +535,12 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 				    void(*test)(data_t *, enum pipe, igt_plane_t *))
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *plane;
 	int first_plane = -1;
 	int last_plane = -1;
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 
@@ -542,7 +548,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 			continue;
 
 		/* reset plane alpha properties between each plane */
-		reset_alpha(display, pipe);
+		reset_alpha(display, crtc->pipe);
 
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
@@ -554,7 +560,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 		last_plane = j__;
 	}
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 
@@ -562,7 +568,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 			continue;
 
 		/* Reset plane alpha properties between each plane. */
-		reset_alpha(display, pipe);
+		reset_alpha(display, crtc->pipe);
 
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
@@ -571,7 +577,7 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, igt_output_t *
 			continue;
 
 		igt_info("Testing plane %u\n", plane->index);
-		test(data, pipe, plane);
+		test(data, crtc->pipe, plane);
 		igt_plane_set_fb(plane, NULL);
 
 		if (in_simulation)
@@ -651,11 +657,12 @@ static bool pipe_check(data_t *data, enum pipe pipe,
 		       bool blend, bool must_multiply)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *plane;
 	bool plane_alpha = false, plane_blend = false, multiply = false;
 
-	igt_display_require_output_on_pipe(display, pipe);
-	for_each_plane_on_pipe(display, pipe, plane) {
+	igt_display_require_output_on_pipe(display, crtc->pipe);
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
 			continue;
 		plane_alpha = true;
@@ -665,7 +672,7 @@ static bool pipe_check(data_t *data, enum pipe pipe,
 		plane_blend = true;
 
 		/* reset plane alpha properties between each plane */
-		reset_alpha(display, pipe);
+		reset_alpha(display, crtc->pipe);
 
 		if (must_multiply && !has_multiplied_alpha(data, plane))
 			continue;
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index dda9bc8d7e23..d54b01af0e42 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -94,7 +94,8 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		      unsigned int flags)
 {
 	igt_display_t *display = &data->display;
-	data->pipe_id = pipe_id;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
+	data->pipe_id = crtc->pipe;
 	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 	data->output = output;
 
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 52c97366f051..74d12cc91265 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -720,15 +720,16 @@ test_scaler_with_modifier_pipe(data_t *d,
 			       igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	unsigned format = DRM_FORMAT_XRGB8888;
 	igt_plane_t *plane;
 	uint32_t ret;
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -741,7 +742,8 @@ test_scaler_with_modifier_pipe(data_t *d,
 								   sf_plane,
 								   is_clip_clamp,
 								   is_upscale,
-								   pipe, output,
+								   crtc->pipe,
+								   output,
 								   IGT_ROTATION_0);
 			if (ret != 0)
 				return ret;
@@ -759,6 +761,7 @@ test_scaler_with_rotation_pipe(data_t *d,
 			       igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	unsigned format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
@@ -766,9 +769,9 @@ test_scaler_with_rotation_pipe(data_t *d,
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
 			continue;
 
@@ -781,7 +784,8 @@ test_scaler_with_rotation_pipe(data_t *d,
 								   sf_plane,
 								   is_clip_clamp,
 								   is_upscale,
-								   pipe, output,
+								   crtc->pipe,
+								   output,
 								   rot);
 			if (ret != 0)
 				return ret;
@@ -798,15 +802,16 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 				   igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
 	uint32_t ret;
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
-	for_each_plane_on_pipe(display, pipe, plane) {
+	for_each_plane_on_pipe(display, crtc->pipe, plane) {
 		struct igt_vec tested_formats;
 
 		if (plane->type == DRM_PLANE_TYPE_CURSOR)
@@ -817,7 +822,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
 			uint32_t format = plane->drm_plane->formats[j];
 
-			if (!test_pipe_iteration(d, pipe, j))
+			if (!test_pipe_iteration(d, crtc->pipe, j))
 				continue;
 
 			if (test_format(d, &tested_formats, format) &&
@@ -828,7 +833,8 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 								   sf_plane,
 								   is_clip_clamp,
 								   is_upscale,
-								   pipe, output,
+								   crtc->pipe,
+								   output,
 								   IGT_ROTATION_0);
 			if (ret != 0) {
 				igt_vec_fini(&tested_formats);
@@ -945,6 +951,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 			  enum scaler_combo_test_type test_type)
 {
 	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	int n_planes;
 	int w1, h1, w2, h2;
@@ -952,7 +959,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
 		igt_output_override_mode(output, mode);
@@ -963,7 +970,7 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 		w2 = get_width(mode, sf_plane2);
 		h2 = get_height(mode, sf_plane2);
 
-		n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
+		n_planes = crtc->n_planes;
 		igt_require(n_planes >= 2);
 
 		switch (test_type) {
@@ -990,15 +997,16 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 		for (int k = 0; k < n_planes - 1; k += 2) {
 			igt_plane_t *p1, *p2;
 
-			p1 = &igt_crtc_for_pipe(display, pipe)->planes[k];
+			p1 = &crtc->planes[k];
 			igt_require(p1);
-			p2 = &igt_crtc_for_pipe(display, pipe)->planes[k+1];
+			p2 = &crtc->planes[k+1];
 			igt_require(p2);
 
 			if (p1->type == DRM_PLANE_TYPE_CURSOR || p2->type == DRM_PLANE_TYPE_CURSOR)
 				continue;
 			ret = __test_planes_scaling_combo(d, w1, h1, w2, h2,
-							  pipe, output, p1, p2,
+							  crtc->pipe, output,
+							  p1, p2,
 							  &d->fb[1], &d->fb[2],
 							  test_type);
 			if (ret != 0)
@@ -1282,6 +1290,7 @@ static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *
 				       const struct invalid_paramtests *param)
 {
 	igt_display_t *display = &d->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_fb_t fb;
 	igt_plane_t *plane;
 	int rval;
@@ -1289,7 +1298,7 @@ static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	/*
 	 * Need to get the mode again, because it may have changed
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index aa619ed505b7..d57b4cc818b7 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -78,6 +78,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 {
 	struct igt_fb fb, argb_fb;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 	igt_plane_t *plane;
 	drmModeCrtc *drm_crtc;
@@ -85,7 +86,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	int num_active_planes = 0;
 
 	igt_display_reset(display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 
@@ -103,7 +104,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	 * because most of the modeset operations must be fast
 	 * later on.
 	 */
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		if (plane->type == DRM_PLANE_TYPE_CURSOR) {
 			igt_plane_set_fb(plane, &argb_fb);
 			igt_fb_set_size(&argb_fb, plane, cursor_width, cursor_height);
@@ -147,7 +148,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
 
-		igt_crtc_refresh(igt_crtc_for_pipe(display, pipe),
+		igt_crtc_refresh(crtc,
 				 true);
 	} else {
 		igt_remove_fb(data->drm_fd, &fb);
@@ -160,7 +161,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 
 	drmModeFreeCrtc(drm_crtc);
 
-	for_each_plane_on_pipe(&data->display, pipe, plane) {
+	for_each_plane_on_pipe(&data->display, crtc->pipe, plane) {
 		drmModePlanePtr planeres = drmModeGetPlane(data->drm_fd, plane->drm_plane->plane_id);
 
 		igt_assert_eq(planeres->fb_id, 0);
diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8ba842b9675d..8721a8311b8c 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -296,10 +296,11 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 			 igt_plane_t *plane, bool start_crc)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	cleanup_crtc(data);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	igt_require(intel_pipe_output_combo_valid(display));
 
 	igt_plane_set_rotation(plane, IGT_ROTATION_0);
@@ -312,7 +313,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe,
 	 */
 	if (!is_amdgpu_device(data->gfx_fd))
 		igt_display_commit2(display, COMMIT_ATOMIC);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(crtc,
 				          IGT_PIPE_CRC_SOURCE_AUTO);
 
 	if (!is_amdgpu_device(data->gfx_fd) && start_crc)
@@ -467,10 +468,12 @@ static void test_single_case(data_t *data, enum pipe pipe,
 			     uint32_t format, bool test_bad_format)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_crc_t crc_output;
 	int ret;
 
-	igt_debug("Testing case %i on pipe %s, format %s\n", rect, kmstest_pipe_name(pipe), igt_format_str(format));
+	igt_debug("Testing case %i on pipe %s, format %s\n", rect,
+		  igt_crtc_name(crtc), igt_format_str(format));
 	prepare_fbs(data, output, plane, rect, format);
 
 	igt_plane_set_rotation(plane, data->rotation);
@@ -904,6 +907,7 @@ static bool reusecrcfromlastround(planeinfos p[2], int lastroundp1format,
 static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_output_t *output;
 	igt_crc_t retcrc_sw, retcrc_hw;
 	planeinfos p[2];
@@ -935,13 +939,13 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 
 	igt_display_require_output(display);
 
-	for_each_valid_output_on_pipe(display, pipe, output) {
+	for_each_valid_output_on_pipe(display, crtc->pipe, output) {
 		int i, j, k, l, flipsw, fliphw;
 
 		igt_display_reset(display);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(display, pipe));
+				    crtc);
 		if (!intel_pipe_output_combo_valid(display))
 			continue;
 
@@ -953,7 +957,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		p[0].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 		p[1].plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
 
-		data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+		data->pipe_crc = igt_crtc_crc_new(crtc,
 						  IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_start(data->pipe_crc);
 
@@ -1013,7 +1017,9 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 								continue;
 
 							igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-							flipsw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
+							flipsw = kmstest_get_vblank(data->gfx_fd,
+										    crtc->pipe,
+										    0) + 1;
 							have_crc = false;
 						}
 
@@ -1026,7 +1032,9 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 							continue;
 
 						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-						fliphw = kmstest_get_vblank(data->gfx_fd, pipe, 0) + 1;
+						fliphw = kmstest_get_vblank(data->gfx_fd,
+									    crtc->pipe,
+									    0) + 1;
 
 						if (!have_crc) {
 							igt_pipe_crc_get_for_frame(data->gfx_fd,
@@ -1100,6 +1108,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 					       igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint64_t modifier = I915_FORMAT_MOD_Y_TILED;
 	uint32_t format = DRM_FORMAT_XRGB8888;
 	int fd = data->gfx_fd;
@@ -1114,7 +1123,7 @@ static void test_plane_rotation_exhaust_fences(data_t *data,
 	igt_require(igt_plane_has_rotation(plane, IGT_ROTATION_0 | IGT_ROTATION_90));
 	igt_require(gem_available_fences(display->drm_fd) > 0);
 
-	prepare_crtc(data, output, pipe, plane, false);
+	prepare_crtc(data, output, crtc->pipe, plane, false);
 
 	mode = igt_output_get_mode(output);
 	w = mode->hdisplay;
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index f05cbbdedc63..7844658d8337 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -95,12 +95,13 @@ functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pi
 {
 	data_t *data = test->data;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
-	test->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
+	test->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -161,11 +162,12 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	functional_test_t test = { .data = data };
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary, *sprite;
 	int num_primary = 0, num_cursor = 0;
 	int i;
 
-	functional_test_init(&test, output, pipe);
+	functional_test_init(&test, output, crtc->pipe);
 
 	/*
 	 * Make sure we have no more than one primary or cursor plane per crtc.
@@ -173,10 +175,10 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * drm_universal_plane_init(), the type enum can get interpreted as a
 	 * boolean and show up in userspace as the wrong type.
 	 */
-	for (i = 0; i < igt_crtc_for_pipe(display, pipe)->n_planes; i++)
-		if (igt_crtc_for_pipe(display, pipe)->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
+	for (i = 0; i < crtc->n_planes; i++)
+		if (crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
 			num_primary++;
-		else if (igt_crtc_for_pipe(display, pipe)->planes[i].type == DRM_PLANE_TYPE_CURSOR)
+		else if (crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
 			num_cursor++;
 
 	igt_warn_on(num_primary != 1);
@@ -262,7 +264,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	/* Step 12: Legacy modeset to yellow FB (CRC 8) */
 	igt_plane_set_fb(primary, &test.yellow_fb);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	igt_display_commit2(display, COMMIT_LEGACY);
 	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_8);
 
@@ -349,9 +351,10 @@ sanity_test_init(sanity_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -399,16 +402,17 @@ static void
 sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	sanity_test_t test = { .data = data };
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	int i, ret;
 	int expect = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
-	sanity_test_init(&test, output, pipe);
+	sanity_test_init(&test, output, crtc->pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -494,9 +498,10 @@ pageflip_test_init(pageflip_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -525,6 +530,7 @@ static void
 pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	pageflip_test_t test = { .data = data };
 	igt_plane_t *primary;
 	struct timeval timeout = { .tv_sec = 0, .tv_usec = 500 };
@@ -533,9 +539,9 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
-	pageflip_test_init(&test, output, pipe);
+	pageflip_test_init(&test, output, crtc->pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -555,7 +561,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
 	 * historical reasons...
 	 */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, 0, NULL) == -EBUSY);
 
@@ -570,7 +576,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * completes, which we don't have a good way to specifically test for,
 	 * but at least we can make sure that nothing blows up.
 	 */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
@@ -636,6 +642,7 @@ static void
 cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	igt_plane_t *primary, *cursor;
 	drmModeModeInfo *mode;
 	struct igt_fb background_fb;
@@ -647,7 +654,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_require(display->has_cursor_plane);
 	igt_require_intel(data->drm_fd);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
 	/* Count GEM framebuffers before creating our cursor FB's */
@@ -717,7 +724,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * framebuffers can be removed before counting the framebuffer.
 	 */
 	if (is_intel_device(display->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, pipe),
+		igt_wait_for_vblank_count(crtc,
 					  2);
 
 	/* We should be back to the same framebuffer count as when we started */
@@ -731,9 +738,10 @@ gen9_test_init(gen9_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
 	mode = igt_output_get_mode(output);
 	test->w = mode->hdisplay / 2;
@@ -780,14 +788,15 @@ static void
 pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	gen9_test_t test = { .data = data };
 	igt_plane_t *primary;
 
 	int ret = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
+	igt_output_set_crtc(output, crtc);
 
-	gen9_test_init(&test, output, pipe);
+	gen9_test_init(&test, output, crtc->pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 784e5292e5da..811596ec2324 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -310,7 +310,8 @@ static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
 			    bool need_modeset, bool enabled)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED,
 				    enabled);
 
@@ -341,6 +342,7 @@ static void paint_bar(cairo_t *cr, unsigned int x, unsigned int y,
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
 	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	unsigned int num_bars = 256;
 	drmModeModeInfo mode;
 	cairo_t *cr;
@@ -408,7 +410,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	/* Clear vrr_enabled state before enabling it, because
 	 * it might be left enabled if the previous test fails.
 	 */
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
+	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED, 0);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -973,7 +975,8 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED, false);
 
 	if (data->primary)
-- 
2.52.0

