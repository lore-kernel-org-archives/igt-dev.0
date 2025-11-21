Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A73ECFC29A
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 19:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C2110E2C2;
	Fri, 21 Nov 2025 19:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H8aye6J0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D26D910E2C2
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763752003; x=1795288003;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Vlmn/66h1965UnYfRN0ZXOsuobxA6ZGnFIPOckm4pS8=;
 b=H8aye6J0HFDutLzy1jOWp8zyy4Kc5ghBSc8zk7PGMarlvumIBgGFXcqC
 jx7zM43IupfCJjF2/FBCtdWesSoJ56vbG4hKq8Z7DgzfyBfMWg2dBrNjw
 BYgNnQO4x5e03qoiH1E2RmYTY7TgKI1MYr3qL9D8v5EsFdAJ+GhwMlpgr
 VfeLEqRzhaFmfA863FVyJ5TpBcwip+CQ57RUKLcFEomzsjIiyA/DwdP+r
 LEdkmxrsqmkrIoIQ+m71HhuGCUwkg9dseLq55/SMCLl22tJ5NHaR++ksw
 ULLBp25/bJ5VtR6WAe3tk6/VwSJyYxXKBI4EQNuzL+sJgrXIvWe1UZ3My w==;
X-CSE-ConnectionGUID: biNOfLizS02UWbL2lRP2pA==
X-CSE-MsgGUID: 8YXA4q/TSGK/JTCW0ZVOiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="68454375"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="68454375"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:43 -0800
X-CSE-ConnectionGUID: BqsqQSipQzir7wYxJpfJdw==
X-CSE-MsgGUID: W60QgRhFQwu8QM6ISRxSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="192537552"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.31])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 11:06:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/8] igt: Name drmModeCrtc variables 'drm_crtc'
Date: Fri, 21 Nov 2025 21:06:26 +0200
Message-ID: <20251121190633.24522-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
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

The current situation with pipes vs. crtcs is a giant mess.
In order to untangle things properly I think we need to
move away from the pipe stuff into a more pure crtc world.

I suspect the best way to get there is by renaming igt_pipe_t
into igt_crtc_t and making everyone use it instead of the raw
index/pipe numbers. And presumable we'll want to call the
igt_crtc_t variables 'crtc', so let's clear out the namespace
for that by using 'drm_crtc' as the variable name for the
lower level drmModeCrtc stuff.

Done with cocci:
\#include "scripts/iterators.cocci"

@@
identifier X;
typedef drmModeCrtcPtr;
@@
- drmModeCrtcPtr X;
+ drmModeCrtcPtr drm_crtc;
<+...
- X
+ drm_crtc
...+>

@@
identifier X;
typedef drmModeCrtc;
@@
- drmModeCrtc *X;
+ drmModeCrtc *drm_crtc;
<+...
- X
+ drm_crtc
...+>

@@
identifier X;
expression E;
typedef drmModeCrtcPtr;
@@
- drmModeCrtcPtr X = E;
+ drmModeCrtcPtr drm_crtc = E;
<+...
- X
+ drm_crtc
...+>

@@
identifier X;
expression E;
typedef drmModeCrtc;
@@
- drmModeCrtc *X = E;
+ drmModeCrtc *drm_crtc = E;
<+...
- X
+ drm_crtc
...+>

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                     | 10 +++++-----
 tests/intel/kms_flip_scaled_crc.c |  8 ++++----
 tests/kms_atomic.c                | 25 +++++++++++++------------
 tests/kms_color.c                 | 16 ++++++++--------
 tests/kms_lease.c                 | 14 +++++++-------
 tests/kms_plane.c                 | 16 ++++++++--------
 tests/kms_rmfb.c                  | 14 +++++++-------
 tools/msm_dp_compliance.c         | 12 ++++++------
 8 files changed, 58 insertions(+), 57 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 8973ffdb22a6..fb72b118605c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1253,17 +1253,17 @@ static int __intel_get_pipe_from_crtc_id(int fd, int crtc_id, int crtc_idx)
 int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id)
 {
 	drmModeRes *res;
-	drmModeCrtc *crtc;
+	drmModeCrtc *drm_crtc;
 	int i, cur_id;
 
 	res = drmModeGetResources(fd);
 	igt_assert(res);
 
 	for (i = 0; i < res->count_crtcs; i++) {
-		crtc = drmModeGetCrtc(fd, res->crtcs[i]);
-		igt_assert(crtc);
-		cur_id = crtc->crtc_id;
-		drmModeFreeCrtc(crtc);
+		drm_crtc = drmModeGetCrtc(fd, res->crtcs[i]);
+		igt_assert(drm_crtc);
+		cur_id = drm_crtc->crtc_id;
+		drmModeFreeCrtc(drm_crtc);
 		if (cur_id == crtc_id)
 			break;
 	}
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index e866c62fc2bb..93e9791c29b9 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -539,12 +539,12 @@ static void set_lut(data_t *data, enum pipe pipe)
 {
 	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
 	struct drm_color_lut *lut;
-	drmModeCrtc *crtc;
+	drmModeCrtc *drm_crtc;
 	int i, lut_size;
 
-	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
-	lut_size = crtc->gamma_size;
-	drmModeFreeCrtc(crtc);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
+	lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
 
 	lut = malloc(sizeof(lut[0]) * lut_size);
 
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 474df3fa4f6b..e072653ddf4c 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -242,7 +242,7 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 				     enum kms_atomic_check_relax relax)
 {
 	uint64_t current_pipe_values[IGT_NUM_CRTC_PROPS];
-	drmModeCrtcPtr legacy;
+	drmModeCrtcPtr drm_crtc;
 	drmModePropertyBlobRes *mode_prop = NULL;
 	struct drm_mode_modeinfo *mode = NULL;
 
@@ -256,22 +256,23 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 		mode = mode_prop->data;
 	}
 
-	legacy = drmModeGetCrtc(pipe->display->drm_fd, pipe->crtc_id);
-	igt_assert(legacy);
+	drm_crtc = drmModeGetCrtc(pipe->display->drm_fd, pipe->crtc_id);
+	igt_assert(drm_crtc);
 
-	igt_assert_eq_u32(legacy->crtc_id, pipe->crtc_id);
-	igt_assert_eq_u32(legacy->x, primary_values[IGT_PLANE_SRC_X] >> 16);
-	igt_assert_eq_u32(legacy->y, primary_values[IGT_PLANE_SRC_Y] >> 16);
+	igt_assert_eq_u32(drm_crtc->crtc_id, pipe->crtc_id);
+	igt_assert_eq_u32(drm_crtc->x, primary_values[IGT_PLANE_SRC_X] >> 16);
+	igt_assert_eq_u32(drm_crtc->y, primary_values[IGT_PLANE_SRC_Y] >> 16);
 
-	igt_assert_eq_u32(legacy->buffer_id, primary_values[IGT_PLANE_FB_ID]);
+	igt_assert_eq_u32(drm_crtc->buffer_id,
+			  primary_values[IGT_PLANE_FB_ID]);
 
-	if (legacy->mode_valid) {
+	if (drm_crtc->mode_valid) {
 		igt_assert(mode_prop);
 
-		do_or_die(memcmp(&legacy->mode, mode, sizeof(*mode)));
+		do_or_die(memcmp(&drm_crtc->mode, mode, sizeof(*mode)));
 
-		igt_assert_eq(legacy->width, legacy->mode.hdisplay);
-		igt_assert_eq(legacy->height, legacy->mode.vdisplay);
+		igt_assert_eq(drm_crtc->width, drm_crtc->mode.hdisplay);
+		igt_assert_eq(drm_crtc->height, drm_crtc->mode.vdisplay);
 
 		igt_assert_neq(pipe_values[IGT_CRTC_MODE_ID], 0);
 	} else {
@@ -302,7 +303,7 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 
 	do_or_die(memcmp(pipe_values, current_pipe_values, sizeof(current_pipe_values)));
 
-	drmModeFreeCrtc(legacy);
+	drmModeFreeCrtc(drm_crtc);
 	drmModeFreePropertyBlob(mode_prop);
 }
 
diff --git a/tests/kms_color.c b/tests/kms_color.c
index c424083b7fd4..16155bc4bcaf 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -269,7 +269,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
 		{ 0.0, 1.0, 0.0 },
 		{ 0.0, 0.0, 1.0 },
 	};
-	drmModeCrtc *kms_crtc;
+	drmModeCrtc *drm_crtc;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
 	drmModeModeInfo *mode = data->mode;
@@ -278,9 +278,9 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	int fb_id, fb_modeset_id;
 	bool ret;
 
-	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
-	legacy_lut_size = kms_crtc->gamma_size;
-	drmModeFreeCrtc(kms_crtc);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
+	legacy_lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
 
 	igt_require(legacy_lut_size > 0);
 
@@ -378,7 +378,7 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 		0.0, 1.0, 0.0,
 		0.0, 0.0, 1.0,
 	};
-	drmModeCrtc *kms_crtc;
+	drmModeCrtc *drm_crtc;
 	gamma_lut_t *degamma_linear = NULL, *gamma_zero;
 	uint32_t i, legacy_lut_size;
 	uint16_t *red_lut, *green_lut, *blue_lut;
@@ -446,9 +446,9 @@ static bool test_pipe_legacy_gamma_reset(data_t *data,
 	 * the content of the GAMMA_LUT property is changed
 	 * and that CTM and DEGAMMA_LUT are empty.
 	 */
-	kms_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
-	legacy_lut_size = kms_crtc->gamma_size;
-	drmModeFreeCrtc(kms_crtc);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, primary->pipe->crtc_id);
+	legacy_lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
 
 	red_lut = malloc(sizeof(uint16_t) * legacy_lut_size);
 	igt_assert(red_lut);
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index e217f81d0510..178bddc0579b 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -700,7 +700,7 @@ static void lease_unleased_crtc(data_t *data)
 {
 	enum pipe p;
 	uint32_t bad_crtc_id;
-	drmModeCrtc *crtc;
+	drmModeCrtc *drm_crtc;
 	int ret;
 
 	/* Create a valid lease */
@@ -724,19 +724,19 @@ static void lease_unleased_crtc(data_t *data)
 	/* sanity check */
 	ret = drmModeSetCrtc(data->lease.fd, data->crtc_id, 0, 0, 0, NULL, 0, NULL);
 	igt_assert_eq(ret, 0);
-	crtc = drmModeGetCrtc(data->lease.fd, data->crtc_id);
-	igt_assert(crtc);
-	drmModeFreeCrtc(crtc);
+	drm_crtc = drmModeGetCrtc(data->lease.fd, data->crtc_id);
+	igt_assert(drm_crtc);
+	drmModeFreeCrtc(drm_crtc);
 
 	/* Attempt to use the unleased crtc id. We need raw ioctl to bypass the
 	 * igt_kms helpers.
 	 */
 	ret = drmModeSetCrtc(data->lease.fd, bad_crtc_id, 0, 0, 0, NULL, 0, NULL);
 	igt_assert_eq(ret, -ENOENT);
-	crtc = drmModeGetCrtc(data->lease.fd, bad_crtc_id);
-	igt_assert(!crtc);
+	drm_crtc = drmModeGetCrtc(data->lease.fd, bad_crtc_id);
+	igt_assert(!drm_crtc);
 	igt_assert_eq(errno, ENOENT);
-	drmModeFreeCrtc(crtc);
+	drmModeFreeCrtc(drm_crtc);
 }
 
 static void lease_unleased_connector(data_t *data)
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 02d4da4cb511..80a76d867095 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -523,13 +523,13 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 			   uint16_t mask)
 {
 	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
-	drmModeCrtc *crtc;
+	drmModeCrtc *drm_crtc;
 	uint16_t *lut;
 	int i, lut_size;
 
-	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
-	lut_size = crtc->gamma_size;
-	drmModeFreeCrtc(crtc);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
+	lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
 
 	/* Skip if legacy LUT is not supported: */
 	if (!lut_size)
@@ -550,13 +550,13 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 			      uint16_t mask)
 {
 	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
-	drmModeCrtc *crtc;
+	drmModeCrtc *drm_crtc;
 	uint16_t *r, *g, *b;
 	int i, lut_size;
 
-	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
-	lut_size = crtc->gamma_size;
-	drmModeFreeCrtc(crtc);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
+	lut_size = drm_crtc->gamma_size;
+	drmModeFreeCrtc(drm_crtc);
 
 	if (lut_size != 256)
 		return false;
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index acda4b528cda..9b5110e2dab3 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -80,7 +80,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_plane_t *plane;
-	drmModeCrtc *crtc;
+	drmModeCrtc *drm_crtc;
 	uint64_t cursor_width, cursor_height;
 	int num_active_planes = 0;
 
@@ -134,11 +134,11 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	crtc = drmModeGetCrtc(data->drm_fd, output->config.crtc->crtc_id);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, output->config.crtc->crtc_id);
 
-	igt_assert_eq(crtc->buffer_id, fb.fb_id);
+	igt_assert_eq(drm_crtc->buffer_id, fb.fb_id);
 
-	drmModeFreeCrtc(crtc);
+	drmModeFreeCrtc(drm_crtc);
 
 	if (reopen) {
 		drm_close_driver(data->drm_fd);
@@ -153,11 +153,11 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 		igt_remove_fb(data->drm_fd, &argb_fb);
 	}
 
-	crtc = drmModeGetCrtc(data->drm_fd, output->config.crtc->crtc_id);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, output->config.crtc->crtc_id);
 
-	igt_assert_eq(crtc->buffer_id, 0);
+	igt_assert_eq(drm_crtc->buffer_id, 0);
 
-	drmModeFreeCrtc(crtc);
+	drmModeFreeCrtc(drm_crtc);
 
 	for_each_plane_on_pipe(&data->display, pipe, plane) {
 		drmModePlanePtr planeres = drmModeGetPlane(data->drm_fd, plane->drm_plane->plane_id);
diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
index c37b3bc1cac5..84b8f2ae8603 100644
--- a/tools/msm_dp_compliance.c
+++ b/tools/msm_dp_compliance.c
@@ -532,7 +532,7 @@ set_default_mode(struct connector *c, bool set_mode)
 static uint32_t find_crtc_for_connector(drmModeConnector *c)
 {
 	drmModeEncoder *e;
-	drmModeCrtcPtr crtc_ptr;
+	drmModeCrtcPtr drm_crtc;
 	int i;
 
 	active_crtc = 0;
@@ -562,14 +562,14 @@ static uint32_t find_crtc_for_connector(drmModeConnector *c)
 	 * other unused crtc.
 	 */
 	for (i = 0; i < resources->count_crtcs; i++) {
-		crtc_ptr = drmModeGetCrtc(drm_fd, resources->crtcs[i]);
+		drm_crtc = drmModeGetCrtc(drm_fd, resources->crtcs[i]);
 		/* if a crtc which is unused is found , use it */
-		if (!crtc_ptr->mode_valid) {
-			active_crtc = crtc_ptr->crtc_id;
-			drmModeFreeCrtc(crtc_ptr);
+		if (!drm_crtc->mode_valid) {
+			active_crtc = drm_crtc->crtc_id;
+			drmModeFreeCrtc(drm_crtc);
 			break;
 		}
-		drmModeFreeCrtc(crtc_ptr);
+		drmModeFreeCrtc(drm_crtc);
 	}
 
 	return active_crtc;
-- 
2.49.1

