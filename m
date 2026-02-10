Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9ACEA3F22
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E44E10E5D1;
	Tue, 10 Feb 2026 16:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m8Mjx9cE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70EAC10E5D4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770739830; x=1802275830;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=J5iYF8wG8+tTlY/9LPcsur87nCqvZZL35rw6S6Tzpus=;
 b=m8Mjx9cEGxoK2N22ICbfZzlH7BxqGNCiF7znXTy/3jgi6vi+Qm/A4JhU
 XF6vNn94ZfPn5lisXQdNPxfXOWQHWpeXCOEQo+xjHJYgIrPbOYWSXEJcH
 kkOsDkEx85j4e1XaBkZliLtAay8fZgWWcur+IClh3TPlx060y06gGrgtt
 rvItRLgDsEx88Nf/1EyrgyQuEEoS5DecwCKfHFVYvhfaMmUvEUBwYJGgi
 eiy2BJYL661aznpzIN6JUJ4GPVhB3jYHro05l18bnMegrNTOZVF+8wup5
 wtuoI8WQEkfNK0A1mmgSu14fnj07YIqvMr5mNrbJcocqUnFU6EpTaJRN/ Q==;
X-CSE-ConnectionGUID: nEUHLGp5QOaUUweD8rrSFg==
X-CSE-MsgGUID: ENe+DxQSSYCPRAsPrOClPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71770677"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71770677"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:30 -0800
X-CSE-ConnectionGUID: W6wUtneiSFW8nN80iQJAXA==
X-CSE-MsgGUID: yIBewWBQSiSMdaOgzHIzOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="211061300"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.136])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 08:10:27 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/5] tests/kms: Introduce more local 'display' variables
Date: Tue, 10 Feb 2026 18:10:13 +0200
Message-ID: <20260210161016.29459-3-ville.syrjala@linux.intel.com>
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

Add some more local 'display' variables for the purpose
of passing them to igt_crtc_for_pipe().

Having a bit more common structure in the code will help
subsequent cocci cleanups around igt_crtc_for_pipe() usage.

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

@@
typedef igt_display_t;
identifier FUNC, DISPLAY;
expression DISPLAY2;
@@
FUNC(..., igt_display_t* DISPLAY, ...)
{
<+...
igt_crtc_for_pipe(
- DISPLAY2
+ DISPLAY
  ,...)
...+>
}

@@
identifier DATA, FUNC, DISPLAY;
expression E;
type T;
@@
FUNC(...)
{
...
T *DATA = E;
+ igt_display_t* display = &DATA->DISPLAY;
<+...
igt_crtc_for_pipe(
- &DATA->DISPLAY
+ display
  ,...)
...+>
}

@@
identifier FUNC, DISPLAY;
expression DATA;
@@
FUNC(...)
{
+ igt_display_t* display = &DATA->DISPLAY;
<+...
igt_crtc_for_pipe(
- &DATA->DISPLAY
+ display
  ,...)
...+>
}

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/amdgpu/amd_abm.c                        |  3 +-
 tests/amdgpu/amd_assr.c                       |  3 +-
 tests/amdgpu/amd_cursor_overlay.c             | 10 ++++--
 tests/amdgpu/amd_freesync_video_mode.c        |  3 +-
 tests/amdgpu/amd_ilr.c                        |  3 +-
 tests/amdgpu/amd_link_settings.c              |  3 +-
 tests/amdgpu/amd_mode_switch.c                |  3 +-
 tests/amdgpu/amd_psr.c                        | 16 +++++----
 tests/chamelium/kms_chamelium_color.c         | 12 ++++---
 .../kms_chamelium_sharpness_filter.c          | 18 ++++++----
 tests/intel/kms_big_fb.c                      | 18 ++++++----
 tests/intel/kms_ccs.c                         |  5 +--
 tests/intel/kms_dirtyfb.c                     |  5 +--
 tests/intel/kms_dp_linktrain_fallback.c       |  3 +-
 tests/intel/kms_fbc_dirty_rect.c              |  5 +--
 tests/intel/kms_flip_scaled_crc.c             | 11 +++---
 tests/intel/kms_flip_tiling.c                 |  3 +-
 tests/intel/kms_joiner.c                      | 20 +++++++----
 tests/intel/kms_pipe_b_c_ivb.c                |  6 ++--
 tests/intel/kms_pipe_stress.c                 | 14 +++++---
 tests/intel/kms_pm_lpsp.c                     |  3 +-
 tests/intel/kms_psr2_sf.c                     |  7 ++--
 tests/intel/kms_sharpness_filter.c            |  6 ++--
 tests/kms_async_flips.c                       |  8 +++--
 tests/kms_atomic.c                            | 15 ++++----
 tests/kms_atomic_transition.c                 | 27 +++++++++------
 tests/kms_color.c                             | 15 ++++----
 tests/kms_color_pipeline.c                    |  3 +-
 tests/kms_concurrent.c                        | 17 ++++++----
 tests/kms_cursor_crc.c                        |  6 ++--
 tests/kms_dither.c                            |  3 +-
 tests/kms_invalid_mode.c                      |  3 +-
 tests/kms_plane.c                             | 34 ++++++++++++-------
 tests/kms_plane_cursor.c                      |  9 +++--
 tests/kms_plane_lowres.c                      |  5 +--
 tests/kms_plane_multiple.c                    | 20 +++++++----
 tests/kms_plane_scaling.c                     |  6 ++--
 tests/kms_tiled_display.c                     |  6 ++--
 tests/kms_universal_plane.c                   | 27 +++++++++------
 tests/kms_vrr.c                               |  9 +++--
 tests/nouveau_crc.c                           | 15 +++++---
 41 files changed, 262 insertions(+), 146 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index f01b4f632e5f..110dd89e3ac2 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -252,6 +252,7 @@ static int backlight_write_brightness(int value)
 
 static void set_abm_level(data_t *data, igt_output_t *output, int level)
 {
+	igt_display_t *display = &data->display;
 	char buf[PATH_MAX];
 	int fd;
 
@@ -268,7 +269,7 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 	igt_assert_eq(close(fd), 0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 	igt_plane_set_fb(data->primary, &data->ref_fb);
 	igt_display_commit_atomic(&data->display, 0, 0);
 }
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index fa87d0806b83..f6b39412d6ba 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -159,6 +159,7 @@ static bool get_internal_display_flag(data_t *data, igt_output_t *output)
 
 static void present_visual_pattern(data_t *data, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
@@ -167,7 +168,7 @@ static void present_visual_pattern(data_t *data, igt_output_t *output)
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
-	crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
+	crtc = igt_crtc_for_pipe(display, PIPE_A);
 	primary =
 		igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(output,
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 3562fe00f16e..75aa0113921a 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -134,6 +134,7 @@ static bool can_support_all_overlay_planes(int available_overlay_planes, int fam
 static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		      unsigned int flags, int available_overlay_planes)
 {
+	igt_display_t *display = &data->display;
 	int i;
 
 	data->pipe_id = pipe_id;
@@ -161,7 +162,7 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
 
 	igt_require_pipe_crc(data->drm_fd);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe_id),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe_id),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 }
 
@@ -200,6 +201,7 @@ static void test_cleanup(data_t *data)
 
 static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 {
+	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, test_crc;
 	cairo_t *cr;
 	igt_fb_t *rgb_fb = &data->rgb_fb;
@@ -295,7 +297,8 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	 * synchronized to the same frame on AMD hw.
 	 */
 	if(is_amdgpu_device(data->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe_id), 1);
+		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe_id),
+					  1);
 
 	/* Record the new CRC. */
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
@@ -342,6 +345,7 @@ static void test_cursor_spots(data_t *data, int size, unsigned int flags)
 
 static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int scaling_factor)
 {
+	igt_display_t *display = &data->display;
 	int sw, sh;
 
 	igt_skip_on(size > data->max_curw || size > data->max_curh);
@@ -390,7 +394,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags, unsigned int
 	}
 
 	igt_output_set_crtc(data->output,
-		igt_crtc_for_pipe(&data->display, data->pipe_id));
+		igt_crtc_for_pipe(display, data->pipe_id));
 
 	/* Run the test for different cursor spots. */
 	test_cursor_spots(data, size, flags);
diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
index 4d29cdb13a21..d385a8ac685f 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -548,7 +548,8 @@ static bool has_vrr(igt_output_t *output)
 /* Toggles variable refresh rate on the pipe. */
 static void set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)
 {
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
+	igt_display_t *display = &data->display;
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
 				    IGT_CRTC_VRR_ENABLED,
 				    enabled);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 746742ad1746..761ae20121a2 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -81,6 +81,7 @@ static void set_all_output_pipe_to_none(data_t *data)
 
 static void test_init(data_t *data, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
 	igt_require(output->config.connector->count_modes >= 1);
@@ -98,7 +99,7 @@ static void test_init(data_t *data, igt_output_t *output)
 
 	igt_require(data->pipe_id != PIPE_NONE);
 
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 86fb8761f571..48cb5643baa0 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -83,6 +83,7 @@ static void set_all_output_pipe_to_none(data_t *data)
 
 static void test_init(data_t *data, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
 	igt_require(output->config.connector->count_modes >= 1);
@@ -100,7 +101,7 @@ static void test_init(data_t *data, igt_output_t *output)
 
 	igt_require(data->pipe_id != PIPE_NONE);
 
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 
 	igt_output_set_crtc(output,
 			    data->crtc);
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index 0843cde573cb..98e1fc06ce08 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -77,6 +77,7 @@ static void force_output_mode(data_t *d, igt_output_t *output,
 
 static void run_mode_switch_first_last(data_t *data, int num_pipes)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	struct igt_fb *buffer1[MAX_PIPES] = { NULL };
 	struct igt_fb *buffer2[MAX_PIPES] = { NULL };
@@ -113,7 +114,7 @@ static void run_mode_switch_first_last(data_t *data, int num_pipes)
 					    0.f, buffer1[j]);
 		}
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(&data->display, j));
+				    igt_crtc_for_pipe(display, j));
 		force_output_mode(data, output, kmode);
 		igt_plane_set_fb(data->primary[j], buffer1[j]);
 		drmModeFreeConnector(conn);
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index e4b1a9ed5780..8a9d773fff01 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -341,6 +341,7 @@ static void run_check_psr(data_t *data, bool test_null_crtc) {
 
 static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio)
 {
+	igt_display_t *display = &data->display;
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
 	igt_fb_t ref_fb;	/* reference fb */
 	igt_fb_t *flip_fb;
@@ -373,7 +374,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 			    .5, .5, .5, &ref_fb);
 	igt_plane_set_fb(data->primary, &ref_fb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
@@ -413,7 +414,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 	draw_color_alpha(&data->ov_fb[1], 0, 0, pm_w_scale, pm_h_scale, .5, .5, .5, .0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	/* multiplane overlay to emulate video playback use case */
@@ -432,7 +433,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 			igt_plane_set_size(data->primary, pm_w_scale, pm_h_scale);
 		}
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(&data->display, data->pipe_id));
+				    igt_crtc_for_pipe(display, data->pipe_id));
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
@@ -469,6 +470,7 @@ static void run_check_psr_su_mpo(data_t *data, bool scaling, float scaling_ratio
 
 static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rect_h, int curr_x, int curr_y)
 {
+	igt_display_t *display = &data->display;
 	int ret;
 
 	/* set new position for primary plane */
@@ -491,7 +493,7 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
 		igt_plane_set_fb(data->primary, rect_fb);
 		igt_plane_set_size(data->primary, rect_w, rect_h);
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(&data->display, data->pipe_id));
+				    igt_crtc_for_pipe(display, data->pipe_id));
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL);
 		igt_require(ret == 0);
@@ -501,6 +503,7 @@ static void panning_rect_fb(data_t *data, igt_fb_t *rect_fb, int rect_w, int rec
 
 static void run_check_psr_su_ffu(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
 	igt_fb_t ref_fb;	/* reference fb */
 
@@ -518,7 +521,7 @@ static void run_check_psr_su_ffu(data_t *data)
 			    .5, .5, .5, &ref_fb);
 	igt_plane_set_fb(data->primary, &ref_fb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
@@ -616,6 +619,7 @@ static void test_cursor_movement(data_t *data, int iters, int cs_size, enum curs
 
 static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 {
+	igt_display_t *display = &data->display;
 	int edp_idx = check_conn_type(data, DRM_MODE_CONNECTOR_eDP);
 	const int cs_size = 128;
 	const int delay_sec = 5; /* seconds */
@@ -656,7 +660,7 @@ static void run_check_psr_su_cursor(data_t *data, bool test_mpo)
 	igt_plane_set_position(data->cursor, 0, 0);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/*
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 04822312c362..8f4e2ac29229 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -431,18 +431,19 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_require_pipe(&data->display, p);
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
+			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
 					      IGT_CRTC_DEGAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->degamma_lut_size);
 	}
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_GAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_GAMMA_LUT_SIZE)) {
 		data->gamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
+			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
 					      IGT_CRTC_GAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->gamma_lut_size);
 	}
@@ -450,13 +451,14 @@ prep_pipe(data_t *data, enum pipe p)
 
 static int test_setup(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 	int i = 0;
 
 	igt_display_reset(&data->display);
 	prep_pipe(data, p);
 
-	crtc = igt_crtc_for_pipe(&data->display, p);
+	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index f27b99e4bc30..d405e6311380 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -40,10 +40,11 @@ typedef struct {
 
 static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 {
+	igt_display_t *display = &data->display;
 	bool ret = true;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, pipe));
+			    igt_crtc_for_pipe(display, pipe));
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_crtc(data->output, NULL);
@@ -53,14 +54,16 @@ static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
 
 static void set_filter_strength_on_pipe(data_t *data)
 {
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, data->pipe_id),
+	igt_display_t *display = &data->display;
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, data->pipe_id),
 				    IGT_CRTC_SHARPNESS_STRENGTH,
 				    data->filter_strength);
 }
 
 static void reset_filter_strength_on_pipe(data_t *data)
 {
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, data->pipe_id),
+	igt_display_t *display = &data->display;
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, data->pipe_id),
 				    IGT_CRTC_SHARPNESS_STRENGTH, 0);
 }
 
@@ -111,13 +114,14 @@ static void cleanup(data_t *data)
 static void test_t(data_t *data, igt_plane_t *primary,
 		   struct chamelium_port *port)
 {
+	igt_display_t *display = &data->display;
 	struct chamelium_frame_dump *frame[4];
 	drmModeModeInfo *mode;
 	int height, width;
 	bool match[4], match_ok = false;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 
 	mode = igt_output_get_mode(data->output);
 	height = mode->hdisplay;
@@ -177,12 +181,13 @@ static void test_t(data_t *data, igt_plane_t *primary,
 
 static int test_setup(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 	int i = 0;
 
 	igt_display_reset(&data->display);
 
-	crtc = igt_crtc_for_pipe(&data->display, p);
+	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
@@ -216,10 +221,11 @@ static int test_setup(data_t *data, enum pipe p)
 
 static void test_sharpness_filter(data_t *data,  enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	int port_idx = test_setup(data, p);
 
 	igt_require(port_idx >= 0);
-	igt_require(igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_SHARPNESS_STRENGTH));
+	igt_require(igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_SHARPNESS_STRENGTH));
 
 	if (!pipe_output_combo_valid(data, p))
 		return;
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 20d3a7d200f6..d6aa8d6ec608 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -376,7 +376,8 @@ static void prep_fb(data_t *data)
 
 static void set_c8_lut(data_t *data)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, data->pipe);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, data->pipe);
 	struct drm_color_lut *lut;
 	int i, lut_size = 256;
 
@@ -397,7 +398,8 @@ static void set_c8_lut(data_t *data)
 
 static void unset_lut(data_t *data)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, data->pipe);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, data->pipe);
 
 	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_GAMMA_LUT, NULL, 0);
 }
@@ -508,6 +510,7 @@ static bool test_plane(data_t *data)
 
 static bool test_pipe(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	uint16_t width, height;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
@@ -518,7 +521,7 @@ static bool test_pipe(data_t *data)
 		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
 
 	if (data->format == DRM_FORMAT_C8 &&
-	    !igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, data->pipe),
+	    !igt_crtc_has_prop(igt_crtc_for_pipe(display, data->pipe),
 				   IGT_CRTC_GAMMA_LUT))
 		return false;
 
@@ -538,7 +541,7 @@ static bool test_pipe(data_t *data)
 		      data->format, data->modifier, &data->small_fb);
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -566,7 +569,7 @@ static bool test_pipe(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
@@ -586,6 +589,7 @@ static bool test_pipe(data_t *data)
 static bool
 max_hw_stride_async_flip_test(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	uint32_t ret;
 	const uint32_t w = data->output->config.default_mode.hdisplay,
 		       h = data->output->config.default_mode.vdisplay;
@@ -598,7 +602,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		 kmstest_pipe_name(data->pipe), igt_output_name(data->output));
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -632,7 +636,7 @@ max_hw_stride_async_flip_test(data_t *data)
 		 data->hw_stride);
 	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
 
diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 85d1e16cafe3..37d21718bab4 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1039,7 +1039,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 }
 
 static int test_ccs(data_t *data)
-{	int valid_tests = 0;
+{
+	igt_display_t *display = &data->display;	int valid_tests = 0;
 	igt_crc_t crc, ref_crc;
 	enum test_fb_flags fb_flags = 0;
 
@@ -1052,7 +1053,7 @@ static int test_ccs(data_t *data)
 		 IGT_FORMAT_ARGS(data->format), IGT_MODIFIER_ARGS(data->ccs_modifier));
 
 	if (data->flags & TEST_CRC) {
-		data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+		data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 						  IGT_PIPE_CRC_SOURCE_AUTO);
 
 		if (try_config(data, fb_flags | FB_COMPRESSED, &ref_crc) &&
diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 863f9c5f8b18..03b6ea264678 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -227,12 +227,13 @@ static void disable_features(data_t *data)
 
 static void prepare(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 80f1db97ea3c..ad34b1fabc23 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -459,6 +459,7 @@ static bool run_lt_fallback_test(data_t *data)
 
 static void test_dsc_sst_fallback(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	bool non_dsc_mode_found = false;
 	bool dsc_fallback_successful = false;
 	int ret;
@@ -483,7 +484,7 @@ static void test_dsc_sst_fallback(data_t *data)
 				    &data->fb);
 		igt_output_override_mode(data->output, data->mode);
 		igt_output_set_crtc(data->output,
-				    igt_crtc_for_pipe(&data->display, data->pipe));
+				    igt_crtc_for_pipe(display, data->pipe));
 		data->primary = igt_output_get_plane_type(data->output,
 						DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(data->primary, &data->fb);
diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty_rect.c
index d3a5273734ad..393b787ae4e8 100644
--- a/tests/intel/kms_fbc_dirty_rect.c
+++ b/tests/intel/kms_fbc_dirty_rect.c
@@ -404,12 +404,13 @@ static void cleanup(data_t *data)
 
 static bool prepare_test(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_display_reset(&data->display);
 
 	data->mode = igt_output_get_mode(data->output);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe));
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+			    igt_crtc_for_pipe(display, data->pipe));
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_require_f(intel_fbc_supported_on_chipset(data->drm_fd, data->pipe),
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 19ae590df929..84a8a438b7e1 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -682,7 +682,8 @@ static void free_fbs(data_t *data)
 
 static void set_lut(data_t *data, enum pipe pipe)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	struct drm_color_lut *lut;
 	drmModeCrtc *drm_crtc;
 	int i, lut_size;
@@ -714,7 +715,8 @@ static void set_lut(data_t *data, enum pipe pipe)
 
 static void clear_lut(data_t *data, enum pipe pipe)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 
 	igt_crtc_set_prop_value(crtc, IGT_CRTC_GAMMA_LUT, 0);
 }
@@ -723,6 +725,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 				enum pipe pipe, igt_output_t *output,
 				drmModeModeInfoPtr modetoset, int flags)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_crc_t small_crc, big_crc;
 	struct drm_event_vblank ev;
@@ -756,7 +759,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 	if (modetoset)
 		igt_output_override_mode(output, modetoset);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -780,7 +783,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index,
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
 	}
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_plane_set_position(primary, 0, 0);
diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index c063a60c8423..7482d0a80efa 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -69,10 +69,11 @@ static void pipe_crc_free(data_t *data)
 
 static void pipe_crc_new(data_t *data, int pipe)
 {
+	igt_display_t *display = &data->display;
 	if (data->pipe_crc)
 		return;
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_assert(data->pipe_crc);
 	igt_pipe_crc_start(data->pipe_crc);
diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 9c5b3d0c366e..3eb170c9dd2d 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -142,6 +142,7 @@ static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask
 
 static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t available_pipe_mask)
 {
+	igt_display_t *display = &data->display;
 	enum pipe master_pipe;
 	uint32_t attempt_mask;
 
@@ -153,13 +154,14 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 
 	igt_info("Using pipe %s as master and %s slave for %s\n", kmstest_pipe_name(pipe),
 		 kmstest_pipe_name(pipe + 1), output->name);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	return master_pipe;
 }
 
 static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_fb_t fb;
 
@@ -167,7 +169,7 @@ static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo
 		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(&data->display, PIPE_A));
+			    igt_crtc_for_pipe(display, PIPE_A));
 	igt_output_override_mode(output, mode);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
@@ -345,6 +347,7 @@ static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
 static void test_invalid_modeset_two_joiner(data_t *data,
 					    bool mixed, bool force_joiner)
 {
+	igt_display_t *display = &data->display;
 	int i, j, ret;
 	uint32_t available_pipe_mask;
 	uint32_t attempt_mask;
@@ -381,7 +384,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			igt_assert(kmstest_mode_is_valid(&mode));
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(&data->display, data->pipe_seq[i + j]));
+					    igt_crtc_for_pipe(display, data->pipe_seq[i + j]));
 			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
 				 kmstest_pipe_name(data->pipe_seq[i + j]),
 				 igt_output_name(output), mode.hdisplay,
@@ -405,6 +408,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 
 static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 {
+	igt_display_t *display = &data->display;
 	int i, len, ret;
 	igt_output_t **outputs;
 	igt_output_t *output;
@@ -429,7 +433,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 		}
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(&data->display, data->pipe_seq[data->n_pipes - 1]));
+				    igt_crtc_for_pipe(display, data->pipe_seq[data->n_pipes - 1]));
 		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
 				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
 				 igt_output_name(output), mode.hdisplay,
@@ -448,6 +452,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 
 static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display, bool force_joiner)
 {
+	igt_display_t *display = &data->display;
 	int i, j, k, ret, count;
 	igt_output_t *output, *non_ultra_joiner_output;
 	igt_plane_t *primary;
@@ -486,7 +491,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 				continue;
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(&data->display, data->pipe_seq[j]));
+					    igt_crtc_for_pipe(display, data->pipe_seq[j]));
 
 			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
@@ -508,7 +513,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 							mode1 = igt_output_get_mode(non_ultra_joiner_output);
 
 							igt_output_set_crtc(non_ultra_joiner_output,
-									    igt_crtc_for_pipe(&data->display, data->pipe_seq[k]));
+									    igt_crtc_for_pipe(display, data->pipe_seq[k]));
 							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 							igt_plane_set_fb(plane, &fb);
@@ -538,6 +543,7 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 
 static void test_basic_max_non_joiner(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	int count;
 	enum pipe pipe;
 	igt_output_t **outputs, *output;
@@ -555,7 +561,7 @@ static void test_basic_max_non_joiner(data_t *data)
 		for (pipe = 0; pipe < data->n_pipes; pipe++) {
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
 				igt_output_set_crtc(output,
-						    igt_crtc_for_pipe(&data->display, pipe));
+						    igt_crtc_for_pipe(display, pipe));
 				igt_require(max_non_joiner_mode_found(data->drm_fd,
 								      output->config.connector,
 								      max_dotclock, &mode));
diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 004676592790..85ca60e8ad5c 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -100,9 +100,10 @@ drmModeModeInfo mode_2_lanes = {
 static int
 disable_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	primary = igt_output_get_plane(output, 0);
 	igt_plane_set_fb(primary, NULL);
 	return igt_display_commit(&data->display);
@@ -111,12 +112,13 @@ disable_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 static int
 set_mode_on_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	struct igt_fb fb;
 	int fb_id;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 
diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 4f8d49f87a7b..0cbe71973821 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -340,10 +340,11 @@ static unsigned get_vblank(int fd, enum pipe pipe, unsigned flags)
 static int commit_mode(struct data *data, igt_output_t *output,
 		       enum pipe pipe, drmModeModeInfo *mode)
 {
+	igt_display_t *display = &data->display;
 	int ret;
 
 	igt_output_override_mode(output, mode);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	ret = igt_display_try_commit_atomic(&data->display,
 					    DRM_MODE_ATOMIC_TEST_ONLY |
@@ -578,6 +579,7 @@ static void release_connectors(drmModeConnectorPtr *connectors)
 static void stress_pipes(struct data *data, struct timespec *start,
 			 struct timespec *end)
 {
+	igt_display_t *display = &data->display;
 	int pipe = 0;
 	int ret = 0;
 	igt_output_t *output;
@@ -588,7 +590,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
 		if (!data->highest_mode[pipe])
 			continue;
 
-		igt_assert_f(igt_crtc_for_pipe(&data->display, pipe)->n_planes < MAX_PLANES,
+		igt_assert_f(igt_crtc_for_pipe(display, pipe)->n_planes < MAX_PLANES,
 			     "Currently we don't support more than %d planes!",
 			     MAX_PLANES);
 
@@ -739,6 +741,7 @@ static void create_framebuffers(struct data *data)
 
 static void destroy_framebuffers(struct data *data)
 {
+	igt_display_t *display = &data->display;
 	int i, j;
 
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
@@ -748,7 +751,7 @@ static void destroy_framebuffers(struct data *data)
 
 		for (j = 0; j < MAX_PLANES; j++) {
 			if (data->fb[i * MAX_PLANES + j].fb_id) {
-				igt_plane_set_fb(&igt_crtc_for_pipe(&data->display, i)->planes[j],
+				igt_plane_set_fb(&igt_crtc_for_pipe(display, i)->planes[j],
 						 NULL);
 				igt_remove_fb(data->display.drm_fd, &data->fb[i * MAX_PLANES + j]);
 				data->fb[i * MAX_PLANES + j].fb_id = 0;
@@ -763,6 +766,7 @@ static void destroy_framebuffers(struct data *data)
 
 static void prepare_test(struct data *data)
 {
+	igt_display_t *display = &data->display;
 	int i, j;
 	int num_connectors;
 	int num_cpus = (int) sysconf(_SC_NPROCESSORS_ONLN);
@@ -807,13 +811,13 @@ static void prepare_test(struct data *data)
 		if (data->highest_mode[i]) {
 			igt_info("Using mode: \n");
 			kmstest_dump_mode(data->highest_mode[i]);
-			data->pipe_crc[i] = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, i),
+			data->pipe_crc[i] = igt_crtc_crc_new(igt_crtc_for_pipe(display, i),
 							     IGT_PIPE_CRC_SOURCE_AUTO);
 		} else
 			data->pipe_crc[i] = NULL;
 
 		if (data->num_planes[i] == -1)
-			data->num_planes[i] = igt_crtc_for_pipe(&data->display,
+			data->num_planes[i] = igt_crtc_for_pipe(display,
 								i)->n_planes;
 
 		igt_info("Max number of planes is %d for pipe %d\n",
diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index 34039b388c64..43d58a8421e7 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -153,11 +153,12 @@ static void test_cleanup(data_t *data)
 
 static bool test_constraint(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
 	igt_display_reset(&data->display);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe));
+			    igt_crtc_for_pipe(display, data->pipe));
 
 	mode = igt_output_get_mode(data->output);
 
diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index 4d754b41ce05..31db6760c73e 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -396,6 +396,7 @@ static void plane_move_setup_square(data_t *data, igt_fb_t *fb, uint32_t h,
 
 static void prepare(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
@@ -413,7 +414,7 @@ static void prepare(data_t *data)
 	}
 
 	igt_output_set_crtc(output,
-		            igt_crtc_for_pipe(&data->display, data->pipe));
+		            igt_crtc_for_pipe(display, data->pipe));
 
 	if (data->big_fb_test) {
 		fb_w = data->big_fb_width;
@@ -1053,6 +1054,7 @@ static bool sel_fetch_pipe_combo_valid(data_t *data)
 static bool
 pipe_output_combo_valid(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	bool ret = psr_sink_support(data->drm_fd, data->debugfs_fd,
 				    data->psr_mode, data->output);
 	if (!ret)
@@ -1064,7 +1066,8 @@ pipe_output_combo_valid(data_t *data)
 
 	igt_display_reset(&data->display);
 
-	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
+	igt_output_set_crtc(data->output,
+			    igt_crtc_for_pipe(display, data->pipe));
 	if (!intel_pipe_output_combo_valid(&data->display))
 		ret = false;
 	igt_output_set_crtc(data->output, NULL);
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 4a34b4a0ec70..eddfad6b99c4 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -173,7 +173,8 @@ typedef struct {
 
 static void set_filter_strength_on_pipe(data_t *data)
 {
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, data->pipe_id),
+	igt_display_t *display = &data->display;
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, data->pipe_id),
 				    IGT_CRTC_SHARPNESS_STRENGTH,
 				    data->filter_strength);
 }
@@ -330,6 +331,7 @@ static int test_filter_toggle(data_t *data)
 
 static void test_sharpness_filter(data_t *data,  enum test_type type)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
 	int height = mode->hdisplay;
@@ -370,7 +372,7 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
-		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe_id),
+		pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe_id),
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
 	}
diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index b19f5908856d..1a4941ef76b8 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -292,6 +292,7 @@ static void require_overlay_flip_support(data_t *data)
 
 static void test_init(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
 	igt_display_reset(&data->display);
@@ -299,11 +300,11 @@ static void test_init(data_t *data)
 
 	mode = igt_output_get_mode(data->output);
 
-	data->crtc_id = igt_crtc_for_pipe(&data->display, data->pipe)->crtc_id;
+	data->crtc_id = igt_crtc_for_pipe(display, data->pipe)->crtc_id;
 	data->refresh_rate = mode->vrefresh;
 
 	igt_output_set_crtc(data->output,
-		            igt_crtc_for_pipe(&data->display, data->pipe));
+		            igt_crtc_for_pipe(display, data->pipe));
 
 	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
 	if (data->overlay_path)
@@ -827,6 +828,7 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
 
 static void test_crc(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	unsigned int frame = 0;
 	unsigned int start;
 	int ret, width, height;
@@ -850,7 +852,7 @@ static void test_crc(data_t *data)
 			     &data->output->config.connector->connector_id, 1, mode);
 	igt_assert_eq(ret, 0);
 
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id)),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, kmstest_get_crtc_index_from_id(data->drm_fd, data->crtc_id)),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(data->pipe_crc);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 9940f0eda5c8..34ba6051f71a 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -440,6 +440,7 @@ plane_primary_overlay_mutable_zpos(data_t *data, igt_output_t *output, igt_plane
 static void
 plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_planes)
 {
+	igt_display_t *display = &data->display;
 	cairo_t *cr;
 	struct igt_fb fb_ref;
 	drmModeModeInfo *mode;
@@ -479,7 +480,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	/* create the pipe_crc object for this pipe */
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* get reference crc */
@@ -492,7 +493,7 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 		int zpos;
 		igt_plane_t *temp;
 
-		temp = &igt_crtc_for_pipe(&data->display, pipe)->planes[k];
+		temp = &igt_crtc_for_pipe(display, pipe)->planes[k];
 
 		if (!igt_plane_has_prop(temp, IGT_PLANE_ZPOS))
 			continue;
@@ -671,6 +672,7 @@ static void plane_primary(data_t *data)
  */
 static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32_t format)
 {
+	igt_display_t *display = &data->display;
 	struct igt_fb fb;
 	uint64_t old_plane_values[IGT_NUM_PLANE_PROPS], old_crtc_values[IGT_NUM_CRTC_PROPS];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
@@ -684,7 +686,7 @@ static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32
 			      mode->hdisplay, mode->vdisplay,
 			      format, I915_TILING_NONE, &fb);
 	igt_plane_set_fb(data->primary, &fb);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
@@ -1380,13 +1382,14 @@ static void atomic_plane_damage(data_t *data)
 
 static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_display_reset(&data->display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
-	data->primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
+	data->primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe),
 						DRM_PLANE_TYPE_PRIMARY);
-	data->crtc = igt_crtc_for_pipe(&data->display, pipe);
+	data->crtc = igt_crtc_for_pipe(display, pipe);
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(data->drm_fd,
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 380ba7e96e49..3711a56fb013 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -133,6 +133,7 @@ int *seqno;
 static void
 run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	igt_fb_t *fb = &data->fbs[0];
@@ -144,7 +145,7 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(pipe), igt_output_name(output));
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	mode = igt_output_get_mode(output);
@@ -162,13 +163,13 @@ run_primary_test(data_t *data, enum pipe pipe, igt_output_t *output)
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (!(i & 1))
-			igt_wait_for_vblank(igt_crtc_for_pipe(&data->display, pipe));
+			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
 
 		igt_plane_set_fb(primary, (i & 1) ? fb : NULL);
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		if (i & 1)
-			igt_wait_for_vblank(igt_crtc_for_pipe(&data->display, pipe));
+			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
 
 		igt_plane_set_fb(primary, (i & 1) ? NULL : fb);
 	}
@@ -322,10 +323,11 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			struct plane_parms *parms,
 			unsigned *iter_max)
 {
+	igt_display_t *display = &data->display;
 	uint64_t cursor_width, cursor_height;
 	unsigned sprite_width, sprite_height, prev_w, prev_h;
 	bool max_sprite_width, max_sprite_height, alpha = true;
-	uint32_t n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
+	uint32_t n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
 	uint32_t n_overlays = 0, overlays[n_planes];
 	igt_plane_t *plane;
 	uint32_t iter_mask = 3;
@@ -436,7 +438,7 @@ static void setup_parms(data_t *data, enum pipe pipe,
 			igt_assert_f(n_planes >= 3, "No planes left to proceed with!");
 			if (n_overlays > 0) {
 				uint32_t plane_to_remove = hars_petruska_f54_1_random_unsafe_max(n_overlays);
-				removed_plane = &igt_crtc_for_pipe(&data->display,
+				removed_plane = &igt_crtc_for_pipe(display,
 								   pipe)->planes[overlays[plane_to_remove]];
 				igt_plane_set_fb(removed_plane, NULL);
 				while (plane_to_remove < (n_overlays - 1)) {
@@ -473,12 +475,13 @@ static void setup_parms(data_t *data, enum pipe pipe,
 
 static void prepare_fencing(data_t *data, enum pipe pipe)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *plane;
 	int n_planes;
 
 	igt_require_sw_sync();
 
-	n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
+	n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
 	timeline = calloc(n_planes, sizeof(*timeline));
 	igt_assert_f(timeline != NULL, "Failed to allocate memory for timelines\n");
 	thread = calloc(n_planes, sizeof(*thread));
@@ -508,8 +511,9 @@ static void unprepare_fencing(data_t *data, enum pipe pipe)
 
 static void atomic_commit(data_t *data_v, enum pipe pipe, unsigned int flags, void *data, bool fencing)
 {
+	igt_display_t *display = &data_v->display;
 	if (fencing)
-		igt_crtc_request_out_fence(igt_crtc_for_pipe(&data_v->display, pipe));
+		igt_crtc_request_out_fence(igt_crtc_for_pipe(display, pipe));
 
 	igt_display_commit_atomic(&data_v->display, flags, data);
 }
@@ -526,8 +530,9 @@ static int fd_completed(int fd)
 
 static void wait_for_transition(data_t *data, enum pipe pipe, bool nonblocking, bool fencing)
 {
+	igt_display_t *display = &data->display;
 	if (fencing) {
-		int fence_fd = igt_crtc_for_pipe(&data->display, pipe)->out_fence_fd;
+		int fence_fd = igt_crtc_for_pipe(display, pipe)->out_fence_fd;
 
 		if (!nonblocking)
 			igt_assert(fd_completed(fence_fd));
@@ -554,9 +559,10 @@ static void
 run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		enum transition_type type, bool nonblocking, bool fencing)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	uint32_t iter_max, i;
 	struct plane_parms parms[crtc->n_planes];
 	unsigned flags = 0;
@@ -798,6 +804,7 @@ static void unset_output_pipe(igt_display_t *display)
 
 static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	unsigned event_mask = 0;
@@ -815,7 +822,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		 * currently is holding the plane
 		 */
 		if (old_pipe != crtc->pipe) {
-			igt_plane_t *old_plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, old_pipe),
+			igt_plane_t *old_plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, old_pipe),
 									 DRM_PLANE_TYPE_PRIMARY);
 
 			igt_plane_set_fb(old_plane, NULL);
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 4a9e12e440e7..aa65a70ab790 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -713,18 +713,19 @@ static void test_pipe_limited_range_ctm(data_t *data,
 static void
 prep_pipe(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_require_pipe(&data->display, p);
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_DEGAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_DEGAMMA_LUT_SIZE)) {
 		data->degamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
+			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
 					      IGT_CRTC_DEGAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->degamma_lut_size);
 	}
 
-	if (igt_crtc_has_prop(igt_crtc_for_pipe(&data->display, p), IGT_CRTC_GAMMA_LUT_SIZE)) {
+	if (igt_crtc_has_prop(igt_crtc_for_pipe(display, p), IGT_CRTC_GAMMA_LUT_SIZE)) {
 		data->gamma_lut_size =
-			igt_crtc_get_prop(igt_crtc_for_pipe(&data->display, p),
+			igt_crtc_get_prop(igt_crtc_for_pipe(display, p),
 					      IGT_CRTC_GAMMA_LUT_SIZE);
 		igt_assert_lt(0, data->gamma_lut_size);
 	}
@@ -732,12 +733,13 @@ prep_pipe(data_t *data, enum pipe p)
 
 static void test_setup(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
 	prep_pipe(data, p);
 	igt_require_pipe_crc(data->drm_fd);
 
-	crtc = igt_crtc_for_pipe(&data->display, p);
+	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc->n_planes >= 0);
 
 	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
@@ -840,6 +842,7 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
 static void
 run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	static const color_t blue_green_blue[] = {
 		{ 0.0, 0.0, 1.0 },
@@ -895,7 +898,7 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		igt_display_reset(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(&data->display, p));
+				    igt_crtc_for_pipe(display, p));
 
 		if (is_intel_device(data->drm_fd) &&
 		    !igt_max_bpc_constraint(&data->display, p, output, 10)) {
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 1e272671f63d..f0bf500af8bf 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -48,11 +48,12 @@ static void test_cleanup(data_t *data)
 
 static void test_setup(data_t *data, enum pipe p)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
 	igt_require_pipe_crc(data->drm_fd);
 
-	crtc = igt_crtc_for_pipe(&data->display, p);
+	crtc = igt_crtc_for_pipe(display, p);
 	igt_require(crtc);
 	igt_require(crtc->n_planes > 0);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 1ffec7374e62..572d61d831d3 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -157,6 +157,7 @@ static void
 prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	       igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_crtc_t *crtc;
 	igt_plane_t *primary;
@@ -166,7 +167,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	int i;
 	int format, modifier;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	crtc = primary->crtc;
@@ -231,12 +232,13 @@ static void
 test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 				igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	int i;
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int ret;
 
-	igt_crtc_refresh(igt_crtc_for_pipe(&data->display, pipe), true);
+	igt_crtc_refresh(igt_crtc_for_pipe(display, pipe), true);
 
 	i = 0;
 	while (i < iterations || loop_forever) {
@@ -277,6 +279,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
 static void
 test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	int iterations = opt.iterations < 1 ? max_planes : opt.iterations;
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int i;
@@ -287,7 +290,7 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 		drmModeModeInfo *mode_lo;
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(&data->display, pipe));
+				    igt_crtc_for_pipe(display, pipe));
 
 		mode_hi = igt_output_get_mode(output);
 		mode_lo = get_lowres_mode(data, mode_hi, output);
@@ -310,7 +313,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
 static void
 run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	int n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
+	igt_display_t *display = &data->display;
+	int n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
 	igt_display_reset(&data->display);
 
 	if (!opt.user_seed)
@@ -337,6 +341,7 @@ run_test(data_t *data, enum pipe pipe, igt_output_t *output)
 static void
 run_tests_for_pipe(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	enum pipe pipe;
 
@@ -347,11 +352,11 @@ run_tests_for_pipe(data_t *data)
 			igt_display_reset(&data->display);
 
 			igt_output_set_crtc(output,
-					    igt_crtc_for_pipe(&data->display, pipe));
+					    igt_crtc_for_pipe(display, pipe));
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
-			igt_require(igt_crtc_for_pipe(&data->display, pipe)->n_planes > 0);
+			igt_require(igt_crtc_for_pipe(display, pipe)->n_planes > 0);
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
 				run_test(data, pipe, output);
 		}
diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
index c336a32c2c0e..61a7de8eb00b 100644
--- a/tests/kms_cursor_crc.c
+++ b/tests/kms_cursor_crc.c
@@ -209,12 +209,13 @@ static void cursor_enable(data_t *data)
 
 static void cursor_disable(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_set_fb(data->cursor, NULL);
 	igt_plane_set_position(data->cursor, 0, 0);
 	igt_display_commit(&data->display);
 
 	/* do this wait here so it will not need to be added everywhere */
-	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe),
+	igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
 				  data->vblank_wait_count);
 }
 
@@ -719,6 +720,7 @@ static void do_timed_cursor_fb_pos_change(data_t *data, enum cursor_change chang
 
 static void timed_cursor_changes(data_t *data, void (changefunc)(data_t *, enum cursor_change))
 {
+	igt_display_t *display = &data->display;
 	igt_crc_t crc1, crc2;
 
 	/* Legacy cursor API does not guarantee that the cursor update happens at vBlank.
@@ -733,7 +735,7 @@ static void timed_cursor_changes(data_t *data, void (changefunc)(data_t *, enum
 	igt_display_commit(&data->display);
 
 	/* Extra vblank wait is because nonblocking cursor ioctl */
-	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe),
+	igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
 				  data->vblank_wait_count);
 
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc1);
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 38b2c8b74527..87e2448f86d6 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -74,7 +74,8 @@ typedef struct {
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, p);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 
 	igt_assert(crtc);
 
diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 163bdb96bc3a..9f6b2df9ed7c 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -255,6 +255,7 @@ adjust_mode_overflow_vrefresh(data_t *data, drmModeModeInfoPtr mode)
 static void
 test_output(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output = data->output;
 	drmModeModeInfo mode;
 	struct igt_fb fb;
@@ -277,7 +278,7 @@ test_output(data_t *data)
 
 	kmstest_unset_all_crtcs(data->drm_fd, data->res);
 
-	crtc_id = igt_crtc_for_pipe(&data->display, data->pipe)->crtc_id;
+	crtc_id = igt_crtc_for_pipe(display, data->pipe)->crtc_id;
 
 	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
 			     fb.fb_id, 0, 0,
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 6bc92c21f832..1dbda9dcb3c3 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -147,10 +147,11 @@ static color_t blue  = { 0.0f, 0.0f, 1.0f };
  */
 static void test_init(data_t *data, enum pipe pipe)
 {
-	igt_require(igt_crtc_for_pipe(&data->display, pipe)->n_planes > 0);
+	igt_display_t *display = &data->display;
+	igt_require(igt_crtc_for_pipe(display, pipe)->n_planes > 0);
 	if (data->pipe_crc)
 		igt_pipe_crc_free(data->pipe_crc);
-	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_display_reset(&data->display);
 }
@@ -232,13 +233,14 @@ static void
 test_grab_crc(data_t *data, igt_output_t *output, enum pipe pipe,
 	      color_t *fb_color, unsigned int flags, igt_crc_t *crc /* out */)
 {
+	igt_display_t *display = &data->display;
 	struct igt_fb fb;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	char *crc_str;
 	int ret;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	primary = igt_output_get_plane(output, 0);
 
@@ -306,6 +308,7 @@ test_plane_position_with_output(data_t *data,
 				igt_crc_t *reference_crc,
 				unsigned int flags)
 {
+	igt_display_t *display = &data->display;
 	rectangle_t rect = { .x = 100, .y = 100, .color = { 0.0, 0.0, 0.0 }};
 	igt_plane_t *primary, *sprite;
 	struct igt_fb primary_fb, sprite_fb;
@@ -315,7 +318,7 @@ test_plane_position_with_output(data_t *data,
 	igt_debug("Testing connector %s using pipe %s plane %d\n", igt_output_name(output),
 		  kmstest_pipe_name(pipe), plane);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
@@ -381,7 +384,8 @@ test_plane_position_with_output(data_t *data,
 static void
 test_plane_position(data_t *data, enum pipe pipe)
 {
-	int n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
+	igt_display_t *display = &data->display;
+	int n_planes = igt_crtc_for_pipe(display, pipe)->n_planes;
 	igt_output_t *output = data->output;
 	igt_crc_t reference_crc;
 
@@ -446,12 +450,13 @@ test_plane_panning_with_output(data_t *data,
 			       igt_crc_t *ref_crc,
 			       unsigned int flags)
 {
+	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	struct igt_fb primary_fb;
 	drmModeModeInfo *mode;
 	igt_crc_t crc;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	primary = igt_output_get_plane(output, 0);
@@ -566,7 +571,8 @@ static const color_t colors_reduced[] = {
 static void set_legacy_lut(data_t *data, enum pipe pipe,
 			   uint16_t mask)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *lut;
 	int i, lut_size;
@@ -593,7 +599,8 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 			      uint16_t mask)
 {
-	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *r, *g, *b;
 	int i, lut_size;
@@ -1253,6 +1260,7 @@ static bool skip_plane(data_t *data, igt_plane_t *plane)
 static void
 test_pixel_formats(data_t *data, enum pipe pipe)
 {
+	igt_display_t *display = &data->display;
 	struct igt_fb primary_fb;
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
@@ -1277,7 +1285,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, &primary_fb);
 
@@ -1305,6 +1313,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 
 static void test_planar_settings(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	enum pipe pipe = PIPE_A;
 	igt_output_t *output;
 	igt_fb_t fb, fb_ref;
@@ -1330,7 +1339,7 @@ static void test_planar_settings(data_t *data)
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_display_commit_atomic(&data->display,
@@ -1425,8 +1434,9 @@ static void test_planar_settings(data_t *data)
 						     NULL);
 		if (rval == 0) {
 			set_legacy_lut(data, pipe, LUT_MASK);
-			igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
-			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+			igt_wait_for_vblank_count(igt_crtc_for_pipe(display, pipe),
+						  1);
+			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 							  IGT_PIPE_CRC_SOURCE_AUTO);
 			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
 
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 770aae770f88..dda9bc8d7e23 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -93,8 +93,9 @@ typedef struct data {
 static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		      unsigned int flags)
 {
+	igt_display_t *display = &data->display;
 	data->pipe_id = pipe_id;
-	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 	data->output = output;
 
 	data->mode = igt_output_get_mode(data->output);
@@ -144,6 +145,7 @@ static void test_fini(data_t *data)
  */
 static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 {
+	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, test_crc;
 	cairo_t *cr;
 	igt_fb_t *ref_fb = &data->ref_fb;
@@ -191,7 +193,7 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
 	/* Wait for one more vblank since cursor updates are not
 	 * synchronized to the same frame on AMD hw */
 	if(is_amdgpu_device(data->drm_fd))
-		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe_id),
+		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe_id),
 					  1);
 
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
@@ -251,6 +253,7 @@ static void test_cleanup(data_t *data)
 
 static void test_cursor(data_t *data, int size, unsigned int flags)
 {
+	igt_display_t *display = &data->display;
 	int sw, sh;
 	int pad = 128;
 
@@ -280,7 +283,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
 
 	igt_plane_set_fb(data->primary, &data->pfb);
 	igt_output_set_crtc(data->output,
-			    igt_crtc_for_pipe(&data->display, data->pipe_id));
+			    igt_crtc_for_pipe(display, data->pipe_id));
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 	test_cursor_spots(data, size, flags);
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index bdf0b6d64049..fb3980fade53 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -289,6 +289,7 @@ static void test_cleanup(data_t *data)
 
 static void run_test(data_t *data, uint64_t modifier)
 {
+	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 	igt_output_t *output;
 
@@ -303,12 +304,12 @@ static void run_test(data_t *data, uint64_t modifier)
 
 			igt_display_reset(&data->display);
 			igt_output_set_crtc(data->output,
-					    igt_crtc_for_pipe(&data->display, data->pipe));
+					    igt_crtc_for_pipe(display, data->pipe));
 
 			if (!intel_pipe_output_combo_valid(&data->display))
 				continue;
 
-			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+			data->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 							  IGT_PIPE_CRC_SOURCE_AUTO);
 
 			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 0f43264c9197..624c1d42efb9 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -107,7 +107,8 @@ struct {
  */
 static void test_init(data_t *data, enum pipe pipe, int n_planes)
 {
-	data->pipe_crc1 = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	igt_display_t *display = &data->display;
+	data->pipe_crc1 = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
@@ -138,12 +139,13 @@ static void
 get_reference_crc(data_t *data, igt_output_t *output, enum pipe pipe, igt_pipe_crc_t *pipe_crc,
 	      color_t *color, igt_plane_t **plane, uint64_t modifier, igt_crc_t *ref_crc)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int ret;
 
 	igt_display_reset(&data->display);
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	plane[primary->index] = primary;
@@ -203,6 +205,7 @@ static void
 prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **plane,
 	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_crtc_t *crtc;
 	igt_plane_t *primary;
@@ -213,7 +216,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	int* suffle;
 
 	igt_output_set_crtc(output,
-			    igt_crtc_for_pipe(&data->display, pipe_id));
+			    igt_crtc_for_pipe(display, pipe_id));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	crtc = primary->crtc;
 
@@ -407,8 +410,9 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
 static void
 test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier)
 {
+	igt_display_t *display = &data->display;
 	int n_planes = opt.all_planes ?
-			igt_crtc_for_pipe(&data->display, pipe)->n_planes : DEFAULT_N_PLANES;
+			igt_crtc_for_pipe(display, pipe)->n_planes : DEFAULT_N_PLANES;
 
 	if (!opt.user_seed)
 		opt.seed = time(NULL);
@@ -421,9 +425,10 @@ test_plane_position(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t
 
 static void test_init_2_display(data_t *data, enum pipe pipe1, enum pipe pipe2, int n_planes)
 {
-	data->pipe_crc1 = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe1),
+	igt_display_t *display = &data->display;
+	data->pipe_crc1 = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe1),
 					   IGT_PIPE_CRC_SOURCE_AUTO);
-	data->pipe_crc2 = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe2),
+	data->pipe_crc2 = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe2),
 					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	data->plane1 = calloc(n_planes, sizeof(*data->plane1));
@@ -466,10 +471,11 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
 					  igt_output_t *output1, igt_output_t *output2,
 					  uint64_t modifier)
 {
+	igt_display_t *display = &data->display;
 	color_t blue  = { 0.0f, 0.0f, 1.0f };
 	igt_crc_t crc1, crc2;
 	int n_planes = opt.all_planes ?
-		       igt_crtc_for_pipe(&data->display, 0)->n_planes : DEFAULT_N_PLANES;
+		       igt_crtc_for_pipe(display, 0)->n_planes : DEFAULT_N_PLANES;
 
 	/*
 	 * Note: We could use the dynamic way of calculating the maximum planes here
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 0ca1aaa0e979..52c97366f051 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1166,6 +1166,7 @@ static void test_scaler_with_multi_pipe_plane(data_t *d)
 
 static void invalid_parameter_tests(data_t *d)
 {
+	igt_display_t *display = &d->display;
 	enum pipe pipe = PIPE_A;
 	igt_output_t *output;
 	igt_fb_t fb;
@@ -1190,7 +1191,7 @@ static void invalid_parameter_tests(data_t *d)
 		igt_require(output);
 
 		igt_output_set_crtc(output,
-				    igt_crtc_for_pipe(&d->display, pipe));
+				    igt_crtc_for_pipe(display, pipe));
 		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_require(get_num_scalers(&d->display, pipe) >= 1);
@@ -1280,6 +1281,7 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const stru
 static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *output,
 				       const struct invalid_paramtests *param)
 {
+	igt_display_t *display = &d->display;
 	igt_fb_t fb;
 	igt_plane_t *plane;
 	int rval;
@@ -1287,7 +1289,7 @@ static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&d->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	/*
 	 * Need to get the mode again, because it may have changed
diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
index e767c14dfa0f..f587704eebe1 100644
--- a/tests/kms_tiled_display.c
+++ b/tests/kms_tiled_display.c
@@ -213,6 +213,7 @@ static int mode_linetime_us(const drmModeModeInfo *mode)
 
 static void setup_mode(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	int count = 0, prev = 0, i = 0;
 	bool pipe_in_use = false, found = false;
 	igt_crtc_t *crtc;
@@ -251,7 +252,7 @@ static void setup_mode(data_t *data)
 				conns[count].output = output;
 
 				igt_output_set_crtc(conns[count].output,
-						    igt_crtc_for_pipe(&data->display, conns[count].pipe));
+						    igt_crtc_for_pipe(display, conns[count].pipe));
 				break;
 			}
 		}
@@ -325,10 +326,11 @@ static void setup_framebuffer(data_t *data)
 
 static data_connector_t *conn_for_crtc(data_t *data, unsigned int crtc_id)
 {
+	igt_display_t *display = &data->display;
 	for (int i = 0; i < data->num_h_tiles; i++) {
 		data_connector_t *conn = &data->conns[i];
 
-		if (igt_crtc_for_pipe(&data->display, conn->pipe)->crtc_id == crtc_id)
+		if (igt_crtc_for_pipe(display, conn->pipe)->crtc_id == crtc_id)
 			return conn;
 	}
 
diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index c28a71029f9c..f05cbbdedc63 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -94,12 +94,13 @@ static void
 functional_test_init(functional_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
-	test->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, pipe),
+	test->pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, pipe),
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -347,9 +348,10 @@ static void
 sanity_test_init(sanity_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -396,13 +398,14 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
 static void
 sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	sanity_test_t test = { .data = data };
 	igt_plane_t *primary;
 	drmModeModeInfo *mode;
 	int i, ret;
 	int expect = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	mode = igt_output_get_mode(output);
 
 	sanity_test_init(&test, output, pipe);
@@ -490,9 +493,10 @@ static void
 pageflip_test_init(pageflip_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
@@ -520,6 +524,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
 static void
 pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	pageflip_test_t test = { .data = data };
 	igt_plane_t *primary;
 	struct timeval timeout = { .tv_sec = 0, .tv_usec = 500 };
@@ -528,7 +533,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	fd_set fds;
 	int ret = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	pageflip_test_init(&test, output, pipe);
 
@@ -550,7 +555,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * Note that crtc->primary->fb = NULL causes flip to return EBUSY for
 	 * historical reasons...
 	 */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, 0, NULL) == -EBUSY);
 
@@ -565,7 +570,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 	 * completes, which we don't have a good way to specifically test for,
 	 * but at least we can make sure that nothing blows up.
 	 */
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 	igt_assert(drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,
 				   test.red_fb.fb_id, DRM_MODE_PAGE_FLIP_EVENT,
@@ -725,9 +730,10 @@ static void
 gen9_test_init(gen9_test_t *test, igt_output_t *output, enum pipe pipe)
 {
 	data_t *data = test->data;
+	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	mode = igt_output_get_mode(output);
 	test->w = mode->hdisplay / 2;
@@ -773,12 +779,13 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
 static void
 pageflip_win_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
+	igt_display_t *display = &data->display;
 	gen9_test_t test = { .data = data };
 	igt_plane_t *primary;
 
 	int ret = 0;
 
-	igt_output_set_crtc(output, igt_crtc_for_pipe(&data->display, pipe));
+	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
 
 	gen9_test_init(&test, output, pipe);
 
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 99078707d543..784e5292e5da 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -309,7 +309,8 @@ static bool vrr_capable(igt_output_t *output)
 static void set_vrr_on_pipe(data_t *data, enum pipe pipe,
 			    bool need_modeset, bool enabled)
 {
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
+	igt_display_t *display = &data->display;
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
 				    IGT_CRTC_VRR_ENABLED,
 				    enabled);
 
@@ -339,6 +340,7 @@ static void paint_bar(cairo_t *cr, unsigned int x, unsigned int y,
 /* Prepare the display for testing on the given pipe. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 {
+	igt_display_t *display = &data->display;
 	unsigned int num_bars = 256;
 	drmModeModeInfo mode;
 	cairo_t *cr;
@@ -406,7 +408,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	/* Clear vrr_enabled state before enabling it, because
 	 * it might be left enabled if the previous test fails.
 	 */
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
 				    IGT_CRTC_VRR_ENABLED, 0);
 
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
@@ -970,7 +972,8 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
-	igt_crtc_set_prop_value(igt_crtc_for_pipe(&data->display, pipe),
+	igt_display_t *display = &data->display;
+	igt_crtc_set_prop_value(igt_crtc_for_pipe(display, pipe),
 				    IGT_CRTC_VRR_ENABLED, false);
 
 	if (data->primary)
diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
index b30dbb1be592..9013b7e53df8 100644
--- a/tests/nouveau_crc.c
+++ b/tests/nouveau_crc.c
@@ -105,6 +105,7 @@ static void destroy_crc_colors(data_t *data, struct color_fb *colors, size_t len
  */
 static void test_ctx_flip_detection(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	struct color_fb colors[] = {
 		HEX_COLOR(0xFF, 0x00, 0x18),
 		HEX_COLOR(0xFF, 0xA5, 0x2C),
@@ -122,7 +123,7 @@ static void test_ctx_flip_detection(data_t *data)
 	int start = -1, frame, start_color = -1, i;
 	bool found_skip = false;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	create_crc_colors(data, colors, n_colors, pipe_crc);
@@ -221,6 +222,7 @@ static void test_ctx_flip_detection(data_t *data)
  */
 static void test_ctx_flip_skip_current_frame(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	struct color_fb colors[] = {
 		{ .r = 1.0, .g = 0.0, .b = 0.0 },
 		{ .r = 0.0, .g = 1.0, .b = 0.0 },
@@ -233,7 +235,7 @@ static void test_ctx_flip_skip_current_frame(data_t *data)
 	const int n_colors = ARRAY_SIZE(colors);
 	const int n_crcs = 30;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 	create_crc_colors(data, colors, n_colors, pipe_crc);
 
@@ -263,10 +265,11 @@ static void test_ctx_flip_skip_current_frame(data_t *data)
 
 static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	igt_pipe_crc_t *pipe_crc;
 	uint32_t value = 0;
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 				    IGT_PIPE_CRC_SOURCE_AUTO);
 
 	set_crc_flip_threshold(data, 5);
@@ -282,7 +285,8 @@ static void test_ctx_flip_threshold_reset_after_capture(data_t *data)
 
 static void test_source(data_t *data, const char *source)
 {
-	igt_pipe_crc_t *pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	igt_display_t *display = &data->display;
+	igt_pipe_crc_t *pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 						    source);
 	igt_crc_t *crcs;
 
@@ -299,6 +303,7 @@ static void test_source(data_t *data, const char *source)
 
 static void test_source_outp_inactive(data_t *data)
 {
+	igt_display_t *display = &data->display;
 	struct color_fb colors[] = {
 		{ .r = 1.0, .g = 0.0, .b = 0.0 },
 		{ .r = 0.0, .g = 1.0, .b = 0.0 },
@@ -306,7 +311,7 @@ static void test_source_outp_inactive(data_t *data)
 	igt_pipe_crc_t *pipe_crc;
 	const int n_colors = ARRAY_SIZE(colors);
 
-	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(&data->display, data->pipe),
+	pipe_crc = igt_crtc_crc_new(igt_crtc_for_pipe(display, data->pipe),
 				    "outp-inactive");
 	create_crc_colors(data, colors, n_colors, pipe_crc);
 
-- 
2.52.0

