Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BECFD530D
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3344E10EA4E;
	Fri, 27 Feb 2026 08:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qdslkdz/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DD310EA4E
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179661; x=1803715661;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fYhKtfm9M76Lc7eDFFkvuSxU086ivpaseNcI276o/sU=;
 b=Qdslkdz/674NtTVQKgloOM6v6pffBuhAk6gMAExkFI7kdnuN/lwn0ieS
 S8U29rtMm5D69JKgBbnblnMJsZAhG0FUmgj+7SDdCJxIu9ixmfxWcp8Es
 iVEPgeUQKPTbBfB4PDX7ojloyI4/GqOAsy9V7wFQyrEoa/H/6XrMSzjUX
 EsVGXogaXkWUc8GmSrrNh9PjPx4kzuZeMlaCw1/o2s3v9hdWLmKSFpL21
 UJ5+l7FNtzJdsJsMQbkrNf64mJDuduGIVUbY1yKQYUqI7TbzQ2cCi/3Pk
 jeixul8JhMcrsPb7wDEbPcifMoFYIpEqE4W3dIH78U4Z+Vdi7ZFQUDWEo g==;
X-CSE-ConnectionGUID: JjZ2iO7ZQ4yfU4fBeCGqPQ==
X-CSE-MsgGUID: TAc6mBU8RMK4e6r8TFXztw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84345966"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="84345966"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:40 -0800
X-CSE-ConnectionGUID: 6n7D0GtLSsaPlxVLLXKvXQ==
X-CSE-MsgGUID: BqNp9kcFRY+ICVfhak5wdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="213723515"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:38 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 10/17] tests/kms: Prefer "crtc" over "pipe" in function
 names
Date: Fri, 27 Feb 2026 10:06:46 +0200
Message-ID: <20260227080653.30389-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
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

Rename a bunch of functions that operate on igt_crtc_t from
the old "pipe" terminology to the new "crtc" terminology.

 #include "scripts/iterators.cocci"

@func@
typedef igt_crtc_t;
identifier OLD_FUNC =~ "pipe";
identifier CRTC;
@@
OLD_FUNC(..., igt_crtc_t *CRTC, ...) { ... }

@script:python rename@
OLD_FUNC << func.OLD_FUNC;
NEW_FUNC;
@@
coccinelle.NEW_FUNC = OLD_FUNC.replace("pipe", "crtc")

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
@@
- OLD_FUNC
+ NEW_FUNC
  (...) { ... }

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
type T;
@@
T
- OLD_FUNC
+ NEW_FUNC
  (...);

@@
identifier func.OLD_FUNC;
identifier rename.NEW_FUNC;
@@
- OLD_FUNC
+ NEW_FUNC
  (...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_freesync_video_mode.c        |  6 +--
 .../kms_chamelium_sharpness_filter.c          |  4 +-
 tests/intel/kms_busy.c                        | 10 ++---
 tests/intel/kms_flip_tiling.c                 |  4 +-
 tests/intel/kms_pipe_b_c_ivb.c                | 40 +++++++++----------
 tests/intel/kms_pipe_stress.c                 |  4 +-
 tests/kms_atomic.c                            | 26 ++++++------
 tests/kms_atomic_interruptible.c              | 16 ++++----
 tests/kms_atomic_transition.c                 |  6 +--
 tests/kms_cursor_legacy.c                     | 26 ++++++------
 tests/kms_pipe_crc_basic.c                    | 10 ++---
 tests/kms_plane_alpha_blend.c                 |  8 ++--
 tests/kms_plane_scaling.c                     | 40 +++++++++----------
 tests/kms_properties.c                        | 20 +++++-----
 tests/kms_universal_plane.c                   | 32 +++++++--------
 tests/kms_vblank.c                            | 10 ++---
 tests/kms_vrr.c                               |  8 ++--
 17 files changed, 135 insertions(+), 135 deletions(-)

diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index fe92dd0329e3..b3be749d195e 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -546,7 +546,7 @@ static bool has_vrr(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, igt_crtc_t *crtc, bool enabled)
+static void set_vrr_on_crtc(data_t *data, igt_crtc_t *crtc, bool enabled)
 {
 	igt_crtc_set_prop_value(crtc,
 				    IGT_CRTC_VRR_ENABLED,
@@ -814,7 +814,7 @@ mode_transition(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	igt_info("stage-1: fps:%d\n", mode_start->vrefresh);
 	prepare_test(data, output, mode_start);
 	interval = nsec_per_frame(mode_start->vrefresh);
-	set_vrr_on_pipe(data, crtc, true);
+	set_vrr_on_crtc(data, crtc, true);
 	result = flip_and_measure(data, output, interval, TEST_DURATION_NS, ANIM_TYPE_SMPTE);
 
 	igt_info("stage-2: simple animation as video playback fps:%d\n", mode_playback->vrefresh);
@@ -824,7 +824,7 @@ mode_transition(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	result = flip_and_measure(data, output, interval, 2 * NSECS_PER_SEC, ANIM_TYPE_CIRCLE_WAVE);
 	result = flip_and_measure(data, output, interval, TEST_DURATION_NS, ANIM_TYPE_CIRCLE_WAVE);
 	igt_assert_f(result > 75, "Target refresh rate not meet 75%% (result=%d%%\n", result);
-	set_vrr_on_pipe(data, crtc, false);
+	set_vrr_on_crtc(data, crtc, false);
 
 	finish_test(data, output);
 }
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index 14cdd2056693..d74dd551dc37 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -38,7 +38,7 @@ typedef struct {
 	int port_count;
 } data_t;
 
-static bool pipe_output_combo_valid(data_t *data, igt_crtc_t *crtc)
+static bool crtc_output_combo_valid(data_t *data, igt_crtc_t *crtc)
 {
 	bool ret = true;
 
@@ -223,7 +223,7 @@ static void test_sharpness_filter(data_t *data, igt_crtc_t *crtc)
 	igt_require(port_idx >= 0);
 	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH));
 
-	if (!pipe_output_combo_valid(data, crtc))
+	if (!crtc_output_combo_valid(data, crtc))
 		return;
 
 	igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name)
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 98fed5e0f056..e82380276666 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -358,7 +358,7 @@ test_pageflip_modeset_hang(igt_display_t *dpy,
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *dpy,
+crtc_output_combo_valid(igt_display_t *dpy,
 			igt_output_t *output, igt_crtc_t *crtc)
 {
 	bool ret = true;
@@ -461,7 +461,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test for basic check of KMS ABI with busy framebuffers.");
 	igt_subtest_with_dynamic("basic") { /* just run on the first pipe */
 		for_each_crtc_with_single_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, output, crtc))
+			if (!crtc_output_combo_valid(&display, output, crtc))
 				continue;
 
 			igt_dynamic("flip")
@@ -481,7 +481,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		errno = 0;
 
 		for_each_crtc_with_single_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, output, crtc))
+			if (!crtc_output_combo_valid(&display, output, crtc))
 				continue;
 
 			if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -506,7 +506,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		errno = 0;
 
 		for_each_crtc_with_single_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, output, crtc))
+			if (!crtc_output_combo_valid(&display, output, crtc))
 				continue;
 
 			if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -541,7 +541,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 			for_each_crtc_with_single_output(&display, crtc,
 							 output) {
-				if (!pipe_output_combo_valid(&display, output, crtc))
+				if (!crtc_output_combo_valid(&display, output, crtc))
 					continue;
 
 				if (!all_pipes && crtc->pipe != active_pipes[0] &&
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index beb963287dba..b732cd55cce7 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -67,7 +67,7 @@ static void pipe_crc_free(data_t *data)
 	data->pipe_crc = NULL;
 }
 
-static void pipe_crc_new(data_t *data, igt_crtc_t *crtc)
+static void crtc_crc_new(data_t *data, igt_crtc_t *crtc)
 {
 	if (data->pipe_crc)
 		return;
@@ -139,7 +139,7 @@ test_flip_tiling(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	igt_require_f(try_commit(&data->display) == 0,
 		      "commit failed with " IGT_MODIFIER_FMT "\n",
 		      IGT_MODIFIER_ARGS(modifier[1]));
-	pipe_crc_new(data, crtc);
+	crtc_crc_new(data, crtc);
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &reference_crc);
 
 	/* Commit the first fb. */
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index d5c1ab3ff758..11c97e23c5e4 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -98,7 +98,7 @@ drmModeModeInfo mode_2_lanes = {
 };
 
 static int
-disable_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+disable_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_plane_t *primary;
 
@@ -109,7 +109,7 @@ disable_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 }
 
 static int
-set_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+set_mode_on_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
@@ -133,18 +133,18 @@ set_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 }
 
 static int
-set_big_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+set_big_mode_on_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_output_override_mode(output, &mode_3_lanes);
-	return set_mode_on_pipe(data, crtc,
+	return set_mode_on_crtc(data, crtc,
 				output);
 }
 
 static int
-set_normal_mode_on_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+set_normal_mode_on_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_output_override_mode(output, &mode_2_lanes);
-	return set_mode_on_pipe(data, crtc,
+	return set_mode_on_crtc(data, crtc,
 				output);
 }
 
@@ -186,14 +186,14 @@ test_dpms(data_t *data)
 	igt_info("Pipe %s will use connector %s\n",
 		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data,
+	ret = set_big_mode_on_crtc(data,
 				   crtc_b,
 				   output1);
 	igt_assert_eq(ret, 0);
 
 	kmstest_set_connector_dpms(data->drm_fd, output1->config.connector, DRM_MODE_DPMS_OFF);
 
-	ret = set_big_mode_on_pipe(data,
+	ret = set_big_mode_on_crtc(data,
 				   crtc_c,
 				   output2);
 	igt_assert_neq(ret, 0);
@@ -216,17 +216,17 @@ test_lane_reduction(data_t *data)
 	igt_info("Pipe %s will use connector %s\n",
 		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data,
+	ret = set_big_mode_on_crtc(data,
 				   crtc_b,
 				   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data,
+	ret = set_normal_mode_on_crtc(data,
 				      crtc_b,
 				      output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data,
+	ret = set_normal_mode_on_crtc(data,
 				      crtc_c,
 				      output2);
 	igt_assert_eq(ret, 0);
@@ -248,21 +248,21 @@ test_disable_pipe_B(data_t *data)
 	igt_info("Pipe %s will use connector %s\n",
 		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data,
+	ret = set_big_mode_on_crtc(data,
 				   crtc_b,
 				   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = disable_pipe(data, crtc_b,
+	ret = disable_crtc(data, crtc_b,
 			   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data,
+	ret = set_normal_mode_on_crtc(data,
 				      crtc_c,
 				      output2);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data,
+	ret = set_normal_mode_on_crtc(data,
 				      crtc_b,
 				      output1);
 	igt_assert_eq(ret, 0);
@@ -284,16 +284,16 @@ test_from_C_to_B_with_3_lanes(data_t *data)
 	igt_info("Pipe %s will use connector %s\n",
 		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_normal_mode_on_pipe(data,
+	ret = set_normal_mode_on_crtc(data,
 				      crtc_c,
 				      output2);
 	igt_assert_eq(ret, 0);
 
-	ret = disable_pipe(data, crtc_c,
+	ret = disable_crtc(data, crtc_c,
 			   output2);
 	igt_assert_eq(ret, 0);
 
-	ret = set_big_mode_on_pipe(data,
+	ret = set_big_mode_on_crtc(data,
 				   crtc_b,
 				   output1);
 	igt_assert_eq(ret, 0);
@@ -315,12 +315,12 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 	igt_info("Pipe %s will use connector %s\n",
 		 igt_crtc_name(crtc_c), igt_output_name(output2));
 
-	ret = set_big_mode_on_pipe(data,
+	ret = set_big_mode_on_crtc(data,
 				   crtc_b,
 				   output1);
 	igt_assert_eq(ret, 0);
 
-	ret = set_normal_mode_on_pipe(data,
+	ret = set_normal_mode_on_crtc(data,
 				      crtc_c,
 				      output2);
 	igt_assert_neq(ret, 0);
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index ae8de0de7f80..b35f19f75b9b 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -414,7 +414,7 @@ static void cleanup_plane_fbs(struct data *data, igt_crtc_t *crtc, int start,
 	}
 }
 
-static int pipe_stress(struct data *data, igt_output_t *output,
+static int crtc_stress(struct data *data, igt_output_t *output,
 		       igt_crtc_t *crtc, drmModeModeInfo *mode)
 {
 	igt_plane_t *plane;
@@ -606,7 +606,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 			     "Currently we don't support more than %d planes!",
 			     MAX_PLANES);
 
-		ret = pipe_stress(data, output, crtc,
+		ret = crtc_stress(data, output, crtc,
 				  data->highest_mode[pipe]);
 		if (ret)
 			break;
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 10d8f991d78a..ce5b00cd31a7 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1425,7 +1425,7 @@ static bool has_mutable_zpos(igt_plane_t *plane)
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 			igt_output_t *output)
 {
 	bool ret = true;
@@ -1479,7 +1479,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 							DRM_PLANE_TYPE_OVERLAY);
 			uint32_t format = plane_get_igt_format(overlay);
 
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			if (!overlay || !format)
 				continue;
@@ -1502,7 +1502,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		     "the legacy and atomic interfaces.");
 	igt_subtest_with_dynamic("plane-primary-legacy") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
@@ -1527,7 +1527,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_OVERLAY);
 
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			atomic_setup(&data,
@@ -1559,7 +1559,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			int n_planes = crtc->n_planes;
 
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			if (n_planes < 2)
 				continue;
@@ -1586,7 +1586,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
 			uint32_t format;
 
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			atomic_setup(&data,
@@ -1618,7 +1618,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				igt_crtc_get_plane_type(crtc,
 							DRM_PLANE_TYPE_CURSOR);
 
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			if (!cursor)
 				continue;
@@ -1640,7 +1640,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid plane parameters are passed");
 	igt_subtest_with_dynamic("plane-invalid-params") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
@@ -1660,7 +1660,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid plane fence parameters are passed");
 	igt_subtest_with_dynamic("plane-invalid-params-fence") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
@@ -1680,7 +1680,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid crtc parameters are passed");
 	igt_subtest_with_dynamic("crtc-invalid-params") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
@@ -1700,7 +1700,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Test error handling when invalid crtc fence parameters are passed");
 	igt_subtest_with_dynamic("crtc-invalid-params-fence") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
@@ -1722,7 +1722,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		     "allow us to create.");
 	igt_subtest_with_dynamic("atomic-invalid-params") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output)) {
@@ -1742,7 +1742,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_describe("Simple test cases to use FB_DAMAGE_CLIPS plane property");
 	igt_subtest_with_dynamic("atomic-plane-damage") {
 		for_each_crtc_with_single_output(&data.display, crtc, output) {
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			atomic_setup(&data,
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index b9d36ba54527..a7a8f75bb03c 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -307,7 +307,7 @@ static void run_plane_test(igt_display_t *display, igt_crtc_t *crtc,
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
-static bool pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+static bool crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 				    igt_output_t *output)
 {
 	bool ret = true;
@@ -343,7 +343,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties of legacy modeset");
 	igt_subtest_with_dynamic("legacy-setmode") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -360,7 +360,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties of atomic modeset");
 	igt_subtest_with_dynamic("atomic-setmode") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -377,7 +377,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for DPMS");
 	igt_subtest_with_dynamic("legacy-dpms") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -394,7 +394,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for pageflip");
 	igt_subtest_with_dynamic("legacy-pageflip") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -411,7 +411,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for cursor");
 	igt_subtest_with_dynamic("legacy-cursor") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -428,7 +428,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for primary plane");
 	igt_subtest_with_dynamic("universal-setplane-primary") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -445,7 +445,7 @@ int igt_main()
 	igt_describe("Tests the interrupt properties for cursor plane");
 	igt_subtest_with_dynamic("universal-setplane-cursor") {
 		for_each_crtc_with_valid_output(&display, crtc, output) {
-			if (!pipe_output_combo_valid(&display, crtc, output))
+			if (!crtc_output_combo_valid(&display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index d27924c9ae18..1e0553cb1b2b 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1139,7 +1139,7 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
 		run_modeset_tests(data, requested_outputs, nonblocking, fencing);
 }
 
-static bool pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+static bool crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 				    igt_output_t *output)
 {
 	bool ret = true;
@@ -1257,7 +1257,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 			if (pipe_count == 2 * count && !data.extended)
 				break;
 
-			if (!pipe_output_combo_valid(&data.display, crtc, output))
+			if (!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			pipe_count++;
@@ -1298,7 +1298,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 				if (pipe_count == 2 * count && !data.extended)
 					break;
 
-				if (!pipe_output_combo_valid(&data.display, crtc, output))
+				if (!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 
 				pipe_count++;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index e829c74e833a..3d5b8b851383 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -380,7 +380,7 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 }
 
 static	igt_plane_t
-*set_cursor_on_pipe(igt_display_t *display, igt_crtc_t *crtc, struct igt_fb *fb)
+*set_cursor_on_crtc(igt_display_t *display, igt_crtc_t *crtc, struct igt_fb *fb)
 {
 	igt_plane_t *plane, *cursor = NULL;
 
@@ -656,7 +656,7 @@ static void flip(igt_display_t *display,
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, cursor_crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, cursor_crtc, &cursor_fb);
 	populate_cursor_args(display, cursor_crtc, arg, &cursor_fb);
 
 	prepare_flip_test(display, mode, flip_crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
@@ -770,7 +770,7 @@ static void basic_flip_cursor(igt_display_t *display,
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	prepare_flip_test(display, mode, crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
@@ -941,7 +941,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	prepare_flip_test(display, mode, crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
@@ -1072,7 +1072,7 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 	arg[0].flags |= DRM_MODE_CURSOR_BO;
 
@@ -1199,12 +1199,12 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg1, &cursor_fb);
 
 	arg1[1].x = arg1[1].y = 192;
 
-	cursor2 = set_cursor_on_pipe(display, crtc2, &cursor_fb);
+	cursor2 = set_cursor_on_crtc(display, crtc2, &cursor_fb);
 	populate_cursor_args(display, crtc2, arg2, &cursor_fb);
 
 	arg2[1].x = arg2[1].y = 192;
@@ -1373,7 +1373,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	prepare_flip_test(display, mode, crtc, arg, &fb_info, &argb_fb, &cursor_fb2);
@@ -1492,11 +1492,11 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
 
-	cursors[0] = set_cursor_on_pipe(display, crtc[0], &cursor_fb);
+	cursors[0] = set_cursor_on_crtc(display, crtc[0], &cursor_fb);
 	populate_cursor_args(display, crtc[0], arg[0], &cursor_fb);
 	arg[0][1].x = arg[0][1].y = 192;
 
-	cursors[1] = set_cursor_on_pipe(display, crtc[1], &cursor_fb);
+	cursors[1] = set_cursor_on_crtc(display, crtc[1], &cursor_fb);
 	populate_cursor_args(display, crtc[1], arg[1], &cursor_fb);
 	arg[1][1].x =  arg[1][1].y = 192;
 
@@ -1613,7 +1613,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
 
 	/* Collect reference crcs, crcs[0] last. */
@@ -1694,7 +1694,7 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	pipe_crc = igt_crtc_crc_new(crtc,
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	igt_display_commit2(display, COMMIT_UNIVERSAL);
 
 	/* Collect reference crcs, crc[0] last for the loop. */
@@ -1791,7 +1791,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	cursor = set_cursor_on_pipe(display, crtc, &cursor_fb);
+	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 
 	has_hotspot_prop = cursor->props[IGT_PLANE_HOTSPOT_X] ||
 		cursor->props[IGT_PLANE_HOTSPOT_Y];
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index f7b6ec2937c2..207707ff2e2d 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -336,7 +336,7 @@ static void test_disable_crc_after_crtc(data_t *data, igt_crtc_t *crtc,
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
-static bool pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+static bool crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 				    igt_output_t *output)
 {
 	bool ret = true;
@@ -425,7 +425,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				if (simulation_constraint(crtc))
 					continue;
 
-				if(!pipe_output_combo_valid(&data.display, crtc, output))
+				if(!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
@@ -478,7 +478,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (simulation_constraint(crtc))
 				continue;
 
-			if(!pipe_output_combo_valid(&data.display, crtc, output))
+			if(!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -495,7 +495,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (simulation_constraint(crtc))
 				continue;
 
-			if(!pipe_output_combo_valid(&data.display, crtc, output))
+			if(!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -513,7 +513,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (simulation_constraint(crtc))
 				continue;
 
-			if(!pipe_output_combo_valid(&data.display, crtc, output))
+			if(!crtc_output_combo_valid(&data.display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index 8b16a35ea70c..a3a993fd28c5 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -529,7 +529,7 @@ static void coverage_premult_constant(data_t *data, igt_crtc_t *crtc,
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
-static void run_test_on_pipe_planes(data_t *data, igt_crtc_t *crtc,
+static void run_test_on_crtc_planes(data_t *data, igt_crtc_t *crtc,
 				    igt_output_t *output,
 				    bool blend, bool must_multiply,
 				    void(*test)(data_t *, igt_crtc_t *crtc, igt_plane_t *))
@@ -652,7 +652,7 @@ static const struct {
 	},
 };
 
-static bool pipe_check(data_t *data, igt_crtc_t *crtc,
+static bool crtc_check(data_t *data, igt_crtc_t *crtc,
 		       bool blend, bool must_multiply)
 {
 	igt_display_t *display = &data->display;
@@ -718,13 +718,13 @@ static void run_subtests(data_t *data)
 
 				prepare_crtc(data, output,
 					     crtc);
-				if (!pipe_check(data, crtc, subtests[i].blend, subtests[i].must_multiply))
+				if (!crtc_check(data, crtc, subtests[i].blend, subtests[i].must_multiply))
 					continue;
 
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      output->name)
-					run_test_on_pipe_planes(data,
+					run_test_on_crtc_planes(data,
 								crtc,
 								output,
 								subtests[i].blend,
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index af6caa9fbbe5..ab619fb2b532 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -690,7 +690,7 @@ static bool test_format(data_t *data,
 	return true;
 }
 
-static bool test_pipe_iteration(data_t *data, igt_crtc_t *crtc, int iteration)
+static bool test_crtc_iteration(data_t *data, igt_crtc_t *crtc, int iteration)
 {
 	if (!is_intel_device(data->drm_fd) ||
 	    data->extended)
@@ -711,7 +711,7 @@ static const uint64_t modifiers[] = {
 };
 
 static uint32_t
-test_scaler_with_modifier_pipe(data_t *d,
+test_scaler_with_modifier_crtc(data_t *d,
 			       double sf_plane,
 			       bool is_clip_clamp,
 			       bool is_upscale, igt_crtc_t *crtc,
@@ -748,7 +748,7 @@ test_scaler_with_modifier_pipe(data_t *d,
 }
 
 static uint32_t
-test_scaler_with_rotation_pipe(data_t *d,
+test_scaler_with_rotation_crtc(data_t *d,
 			       double sf_plane,
 			       bool is_clip_clamp,
 			       bool is_upscale, igt_crtc_t *crtc,
@@ -786,7 +786,7 @@ test_scaler_with_rotation_pipe(data_t *d,
 }
 
 static uint32_t
-test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
+test_scaler_with_pixel_format_crtc(data_t *d, double sf_plane,
 				   bool is_clip_clamp,
 				   bool is_upscale, igt_crtc_t *crtc,
 				   igt_output_t *output)
@@ -810,7 +810,7 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 		for (int j = 0; j < plane->drm_plane->count_formats; j++) {
 			uint32_t format = plane->drm_plane->formats[j];
 
-			if (!test_pipe_iteration(d, crtc, j))
+			if (!test_crtc_iteration(d, crtc, j))
 				continue;
 
 			if (test_format(d, &tested_formats, format) &&
@@ -1316,7 +1316,7 @@ static void intel_max_source_size_test(data_t *d, igt_crtc_t *crtc,
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 			igt_output_t *output)
 {
 	bool ret = true;
@@ -1379,12 +1379,12 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 									      crtc,
 									      output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, crtc, output))
+							if (!crtc_output_combo_valid(&data.display, crtc, output))
 								continue;
 							if (igt_crtc_num_scalers(crtc) < 1)
 								continue;
 
-							ret = test_scaler_with_pixel_format_pipe(&data,
+							ret = test_scaler_with_pixel_format_crtc(&data,
 									scaler_with_pixel_format_tests[index].sf,
 									false,
 									scaler_with_pixel_format_tests[index].is_upscale,
@@ -1410,12 +1410,12 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 									      crtc,
 									      output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, crtc, output))
+							if (!crtc_output_combo_valid(&data.display, crtc, output))
 								continue;
 							if (igt_crtc_num_scalers(crtc) < 1)
 								continue;
 
-							ret = test_scaler_with_rotation_pipe(&data,
+							ret = test_scaler_with_rotation_crtc(&data,
 									scaler_with_rotation_tests[index].sf,
 									false,
 									scaler_with_rotation_tests[index].is_upscale,
@@ -1441,12 +1441,12 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 									      crtc,
 									      output) {
 							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, crtc, output))
+							if (!crtc_output_combo_valid(&data.display, crtc, output))
 								continue;
 							if (igt_crtc_num_scalers(crtc) < 1)
 								continue;
 
-							ret = test_scaler_with_modifier_pipe(&data,
+							ret = test_scaler_with_modifier_crtc(&data,
 									scaler_with_modifiers_tests[index].sf,
 									false,
 									scaler_with_modifiers_tests[index].is_upscale,
@@ -1471,12 +1471,12 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 								      crtc,
 								      output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
-						if (!pipe_output_combo_valid(&data.display, crtc, output))
+						if (!crtc_output_combo_valid(&data.display, crtc, output))
 							continue;
 						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 
-						ret = test_scaler_with_pixel_format_pipe(&data, 0.0, true,
+						ret = test_scaler_with_pixel_format_crtc(&data, 0.0, true,
 											 false,
 											 crtc,
 											 output);
@@ -1499,12 +1499,12 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 								      crtc,
 								      output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
-						if (!pipe_output_combo_valid(&data.display, crtc, output))
+						if (!crtc_output_combo_valid(&data.display, crtc, output))
 							continue;
 						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 
-						ret = test_scaler_with_rotation_pipe(&data, 0.0, true,
+						ret = test_scaler_with_rotation_crtc(&data, 0.0, true,
 										     false,
 										     crtc,
 										     output);
@@ -1526,12 +1526,12 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 								      crtc,
 								      output) {
 						igt_info("Trying on %s\n", igt_output_name(output));
-						if (!pipe_output_combo_valid(&data.display, crtc, output))
+						if (!crtc_output_combo_valid(&data.display, crtc, output))
 							continue;
 						if (igt_crtc_num_scalers(crtc) < 1)
 							continue;
 
-						ret = test_scaler_with_modifier_pipe(&data, 0.0, true,
+						ret = test_scaler_with_modifier_crtc(&data, 0.0, true,
 										     false,
 										     crtc,
 										     output);
@@ -1555,7 +1555,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 									      output) {
 							igt_info("Trying on %s\n",
 								 igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, crtc, output))
+							if (!crtc_output_combo_valid(&data.display, crtc, output))
 								continue;
 							if (igt_crtc_num_scalers(crtc) < 2)
 								continue;
@@ -1613,7 +1613,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Negative test for number of scalers per pipe.");
 		igt_subtest_with_dynamic("invalid-num-scalers") {
 			for_each_crtc_with_valid_output(&data.display, crtc, output) {
-				if (!pipe_output_combo_valid(&data.display, crtc, output))
+				if (!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 				if (igt_crtc_num_scalers(crtc) < 1)
 						continue;
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 86d05c6d443f..d41003781991 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -73,7 +73,7 @@ struct additional_test {
 			  uint32_t prop_id, uint64_t prop_value, bool atomic);
 };
 
-static void prepare_pipe(igt_display_t *display, igt_crtc_t *crtc,
+static void prepare_crtc(igt_display_t *display, igt_crtc_t *crtc,
 			 igt_output_t *output, struct igt_fb *fb)
 {
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -88,7 +88,7 @@ static void prepare_pipe(igt_display_t *display, igt_crtc_t *crtc,
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
-static void cleanup_pipe(igt_display_t *display, igt_crtc_t *crtc,
+static void cleanup_crtc(igt_display_t *display, igt_crtc_t *crtc,
 			 igt_output_t *output, struct igt_fb *fb)
 {
 	igt_plane_t *plane;
@@ -243,7 +243,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 	int i;
 	int colorop_id = 0;
 
-	prepare_pipe(display, crtc, output,
+	prepare_crtc(display, crtc, output,
 		     &fb);
 
 	for_each_plane_on_crtc(crtc, plane) {
@@ -270,7 +270,7 @@ static void run_colorop_property_tests(igt_display_t *display,
 		}
 	}
 
-	cleanup_pipe(display, crtc, output,
+	cleanup_crtc(display, crtc, output,
 		     &fb);
 }
 
@@ -280,7 +280,7 @@ static void run_plane_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 	struct igt_fb fb;
 	igt_plane_t *plane;
 
-	prepare_pipe(display, crtc, output,
+	prepare_crtc(display, crtc, output,
 		     &fb);
 
 	for_each_plane_on_crtc(crtc, plane) {
@@ -291,7 +291,7 @@ static void run_plane_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 		test_properties(display->drm_fd, DRM_MODE_OBJECT_PLANE, plane->drm_plane->plane_id, atomic, display->has_plane_color_pipeline);
 	}
 
-	cleanup_pipe(display, crtc, output,
+	cleanup_crtc(display, crtc, output,
 		     &fb);
 }
 
@@ -300,7 +300,7 @@ static void run_crtc_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 {
 	struct igt_fb fb;
 
-	prepare_pipe(display, crtc, output,
+	prepare_crtc(display, crtc, output,
 		     &fb);
 
 	igt_info("Testing crtc properties on %s (output: %s)\n",
@@ -311,7 +311,7 @@ static void run_crtc_property_tests(igt_display_t *display, igt_crtc_t *crtc,
 			atomic,
 			false);
 
-	cleanup_pipe(display, crtc, output,
+	cleanup_crtc(display, crtc, output,
 		     &fb);
 }
 
@@ -322,7 +322,7 @@ static void run_connector_property_tests(igt_display_t *display,
 	struct igt_fb fb;
 
 	if (crtc != NULL)
-		prepare_pipe(display, crtc,
+		prepare_crtc(display, crtc,
 			     output, &fb);
 
 	igt_info("Testing connector properties on output %s (pipe: %s)\n", output->name,
@@ -331,7 +331,7 @@ static void run_connector_property_tests(igt_display_t *display,
 	test_properties(display->drm_fd, DRM_MODE_OBJECT_CONNECTOR, output->id, atomic, false);
 
 	if (crtc != NULL)
-		cleanup_pipe(display, crtc,
+		cleanup_crtc(display, crtc,
 			     output, &fb);
 }
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 67b61e1d2ea0..ec2d070acddc 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -157,7 +157,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
  *   - Enable CRTC, grab CRC:6 (should be same as CRC:2)
  */
 static void
-functional_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+functional_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	functional_test_t test = { .data = data };
 	igt_display_t *display = &data->display;
@@ -396,7 +396,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
  *   - Primary plane tries to scale up
  */
 static void
-sanity_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+sanity_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	sanity_test_t test = { .data = data };
 	igt_plane_t *primary;
@@ -522,7 +522,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 }
 
 static void
-pageflip_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+pageflip_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	pageflip_test_t test = { .data = data };
 	igt_plane_t *primary;
@@ -633,7 +633,7 @@ intel_gem_fb_count(data_t *data)
 }
 
 static void
-cursor_leak_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+cursor_leak_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary, *cursor;
@@ -776,7 +776,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
  * windowing)
  */
 static void
-pageflip_win_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
+pageflip_win_test_crtc(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
 	gen9_test_t test = { .data = data };
 	igt_plane_t *primary;
@@ -819,7 +819,7 @@ pageflip_win_test_pipe(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 			igt_output_t *output)
 {
 	bool ret = true;
@@ -843,12 +843,12 @@ run_tests(data_t *data)
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_with_dynamic("universal-plane-functional") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc, output))
+			if (!crtc_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				functional_test_pipe(data,
+				functional_test_crtc(data,
 						     crtc,
 						     output);
 		}
@@ -857,12 +857,12 @@ run_tests(data_t *data)
 	igt_describe("Test for scale-up or scale-down using universal plane API without covering CRTC");
 	igt_subtest_with_dynamic("universal-plane-sanity") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc, output))
+			if (!crtc_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				sanity_test_pipe(data,
+				sanity_test_crtc(data,
 						 crtc,
 						 output);
 		}
@@ -872,12 +872,12 @@ run_tests(data_t *data)
 		     " and pageflip execution");
 	igt_subtest_with_dynamic("disable-primary-vs-flip") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc, output))
+			if (!crtc_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				pageflip_test_pipe(data,
+				pageflip_test_crtc(data,
 						   crtc,
 						   output);
 		}
@@ -886,12 +886,12 @@ run_tests(data_t *data)
 	igt_describe("Check for cursor leaks after performing cursor operations");
 	igt_subtest_with_dynamic("cursor-fb-leak") {
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc, output))
+			if (!crtc_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				cursor_leak_test_pipe(data,
+				cursor_leak_test_crtc(data,
 						      crtc,
 						      output);
 		}
@@ -901,12 +901,12 @@ run_tests(data_t *data)
 	igt_subtest_with_dynamic("universal-plane-pageflip-windowed") {
 		igt_require(is_intel_device(data->drm_fd) && data->display_ver >= 9);
 		for_each_crtc_with_single_output(&data->display, crtc, output) {
-			if (!pipe_output_combo_valid(&data->display, crtc, output))
+			if (!crtc_output_combo_valid(&data->display, crtc, output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 				      igt_output_name(output))
-				pageflip_win_test_pipe(data,
+				pageflip_win_test_crtc(data,
 						       crtc,
 						       output);
 		}
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 970eb4d9a6a7..f381a1a331ab 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -225,7 +225,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 }
 
 static bool
-pipe_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
+crtc_output_combo_valid(igt_display_t *display, igt_crtc_t *crtc,
 			igt_output_t *output)
 {
 	bool ret = true;
@@ -519,7 +519,7 @@ static void run_subtests(data_t *data)
 								crtc,
 								data->output) {
 					data->crtc = crtc;
-					if (!pipe_output_combo_valid(&data->display, crtc, data->output))
+					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
 						continue;
 
 					if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -551,7 +551,7 @@ static void run_subtests(data_t *data)
 								crtc,
 								data->output) {
 					data->crtc = crtc;
-					if (!pipe_output_combo_valid(&data->display, crtc, data->output))
+					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
 						continue;
 
 					if (!all_pipes && crtc->pipe != active_pipes[0] &&
@@ -660,7 +660,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
 			data.crtc = crtc;
-			if (!pipe_output_combo_valid(&data.display, crtc, data.output))
+			if (!crtc_output_combo_valid(&data.display, crtc, data.output))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
@@ -676,7 +676,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		for_each_crtc_with_valid_output(&data.display, crtc,
 						data.output) {
 			data.crtc = crtc;
-			if (!pipe_output_combo_valid(&data.display, crtc, data.output))
+			if (!crtc_output_combo_valid(&data.display, crtc, data.output))
 				continue;
 
 			if (!all_pipes && crtc->pipe != active_pipes[0] &&
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 569000fee9ed..c15ab0abab4c 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -306,7 +306,7 @@ static bool vrr_capable(igt_output_t *output)
 }
 
 /* Toggles variable refresh rate on the pipe. */
-static void set_vrr_on_pipe(data_t *data, igt_crtc_t *crtc,
+static void set_vrr_on_crtc(data_t *data, igt_crtc_t *crtc,
 			    bool need_modeset, bool enabled)
 {
 	igt_crtc_set_prop_value(crtc,
@@ -671,7 +671,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	igt_info("Override Mode: ");
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
-	set_vrr_on_pipe(data, crtc,
+	set_vrr_on_crtc(data, crtc,
 			!(flags & TEST_FASTSET), true);
 
 	/*
@@ -754,7 +754,7 @@ test_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	 * modeset. And the expected behavior is the same as disabling VRR on
 	 * a VRR capable panel.
 	 */
-	set_vrr_on_pipe(data, crtc,
+	set_vrr_on_crtc(data, crtc,
 			!(flags & TEST_FASTSET),
 			(flags & TEST_NEGATIVE) ? true : false);
 	rate[0] = vtest_ns.rate_ns;
@@ -780,7 +780,7 @@ test_seamless_rr_basic(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
 	vtest_ns = data->vtest_ns;
 
 	if (vrr)
-		set_vrr_on_pipe(data, crtc,
+		set_vrr_on_crtc(data, crtc,
 				false, true);
 	else {
 		/*
-- 
2.52.0

