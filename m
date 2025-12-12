Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CABD59D65
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AFE10E903;
	Fri, 12 Dec 2025 15:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecSFDbm0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333C310E903
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554434; x=1797090434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xXRrSQc8uZ1hyM2FmxHauR4h4FBVOxIP1r58DrAHXSc=;
 b=ecSFDbm0yvybtqeMWHsNifFCSRiTIICYKWWXgYEZzZaN75vrINetUVCH
 sYZiAEQx6YGl2+ooKjMN80JEKlJkHtAqmNqsaHQsSTdcJkOK9c41PHoDW
 Z92zPjLmA2+3bCaBRA6tz8ksAOQawz6WL4bgdZHFgzyKMtviyA2LfdXd2
 Etg5+w8U5kmWDwl99UJufakj/wn/HYsa9D8GQY/JLN8GNB5d+Mk8HsYBe
 fH3TsPPH/6a8326l5VMiSQdNVKRgFE93AhSUgktq6HK/ndRqyhWv4o8h4
 fUIPjZJXqdTrHxZcFg2HJ2WYZLTvNIYKOX18tvu7TRJViPfHElGVzbR2p w==;
X-CSE-ConnectionGUID: eCxuxGBCTmizmz/nSmjmFA==
X-CSE-MsgGUID: EE8sPhBBTX2gUXWP5RGEow==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71184443"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71184443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:47:13 -0800
X-CSE-ConnectionGUID: bn6xdKh4RISrQEMO/qOo3w==
X-CSE-MsgGUID: DWJ3ja2RQlSTqPTT3x455Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="220491153"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:47:11 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 10/10] lib/kms: Rename igt_pipe_t to igt_crtc_t
Date: Fri, 12 Dec 2025 17:46:26 +0200
Message-ID: <20251212154626.29471-11-ville.syrjala@linux.intel.com>
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

Move towards using 'crtcs' instead of 'pipes' by renaming
igt_pipe_t to igt_crtc_t.

Done with sed:
$ find -type f -name \*.[ch] -exec sed -i -e 's/struct igt_pipe/struct igt_crtc/g' -e 's/igt_pipe_t/igt_crtc_t/g' {} +

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                                 | 108 +++++++++---------
 lib/igt_kms.h                                 |  44 +++----
 tests/amdgpu/amd_abm.c                        |   2 +-
 tests/amdgpu/amd_assr.c                       |   2 +-
 tests/amdgpu/amd_bypass.c                     |   2 +-
 tests/amdgpu/amd_color.c                      |   2 +-
 tests/amdgpu/amd_dp_dsc.c                     |   2 +-
 tests/amdgpu/amd_hotplug.c                    |   2 +-
 tests/amdgpu/amd_ilr.c                        |   2 +-
 tests/amdgpu/amd_link_settings.c              |   2 +-
 tests/amdgpu/amd_mall.c                       |   2 +-
 tests/amdgpu/amd_max_bpc.c                    |   2 +-
 tests/amdgpu/amd_mem_leak.c                   |   2 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |   2 +-
 tests/amdgpu/amd_odm.c                        |   2 +-
 tests/amdgpu/amd_plane.c                      |   2 +-
 tests/amdgpu/amd_psr.c                        |   2 +-
 tests/amdgpu/amd_replay.c                     |   2 +-
 tests/amdgpu/amd_subvp.c                      |   2 +-
 tests/chamelium/kms_chamelium_color.c         |   2 +-
 .../kms_chamelium_sharpness_filter.c          |   2 +-
 tests/intel/gem_pxp.c                         |   2 +-
 tests/intel/kms_big_fb.c                      |   4 +-
 tests/intel/kms_cdclk.c                       |   2 +-
 tests/intel/kms_flip_scaled_crc.c             |   4 +-
 tests/intel/kms_sharpness_filter.c            |   4 +-
 tests/intel/xe_pxp.c                          |   6 +-
 tests/kms_atomic.c                            |  10 +-
 tests/kms_atomic_transition.c                 |   4 +-
 tests/kms_bw.c                                |   2 +-
 tests/kms_color.c                             |   2 +-
 tests/kms_color_helper.c                      |  18 +--
 tests/kms_color_helper.h                      |  14 +--
 tests/kms_concurrent.c                        |   2 +-
 tests/kms_cursor_legacy.c                     |   4 +-
 tests/kms_dither.c                            |   2 +-
 tests/kms_hdr.c                               |   2 +-
 tests/kms_multipipe_modeset.c                 |   2 +-
 tests/kms_plane.c                             |   4 +-
 tests/kms_plane_cursor.c                      |   2 +-
 tests/kms_plane_multiple.c                    |   2 +-
 tests/kms_plane_scaling.c                     |   2 +-
 tools/amd_hdmi_compliance.c                   |   2 +-
 43 files changed, 143 insertions(+), 143 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 082b126f8a49..ba8cc6b8163c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -964,7 +964,7 @@ igt_atomic_fill_connector_props(igt_display_t *display, igt_output_t *output,
 }
 
 static void
-igt_fill_pipe_props(igt_display_t *display, igt_pipe_t *pipe,
+igt_fill_pipe_props(igt_display_t *display, igt_crtc_t *pipe,
 		    int num_crtc_props, const char * const crtc_prop_names[])
 {
 	drmModeObjectPropertiesPtr props;
@@ -993,7 +993,7 @@ igt_fill_pipe_props(igt_display_t *display, igt_pipe_t *pipe,
 	drmModeFreeObjectProperties(props);
 }
 
-static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_pipe_t *pipe)
+static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_crtc_t *pipe)
 {
 	int drm_fd = output->display->drm_fd;
 	drmModeModeInfo *mode;
@@ -2657,7 +2657,7 @@ void igt_output_refresh(igt_output_t *output)
 static int
 igt_plane_set_property(igt_plane_t *plane, uint32_t prop_id, uint64_t value)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	return drmModeObjectSetProperty(display->drm_fd, plane->drm_plane->plane_id,
@@ -2741,7 +2741,7 @@ static void igt_plane_reset(igt_plane_t *plane)
 	plane->gem_handle = 0;
 }
 
-static void igt_pipe_reset(igt_pipe_t *pipe)
+static void igt_pipe_reset(igt_crtc_t *pipe)
 {
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
@@ -2839,7 +2839,7 @@ void igt_display_reset(igt_display_t *display)
 	display->first_commit = true;
 
 	for_each_pipe(display, pipe) {
-		igt_pipe_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+		igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
 		igt_plane_t *plane;
 
 		for_each_plane_on_pipe(display, pipe, plane)
@@ -2877,7 +2877,7 @@ void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 
 /* Get crtc mask for a pipe using crtc id */
 static int
-__get_crtc_mask_for_pipe(drmModeRes *resources, igt_pipe_t *pipe)
+__get_crtc_mask_for_pipe(drmModeRes *resources, igt_crtc_t *pipe)
 {
 	int offset;
 
@@ -3013,7 +3013,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 	igt_display_reset(display);
 
 	for_each_pipe(display, i) {
-		igt_pipe_t *pipe = igt_crtc_for_pipe(display, i);
+		igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
 		igt_output_t *output;
 
 		if (!igt_pipe_has_valid_output(display, i))
@@ -3108,12 +3108,12 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 
 	display->n_pipes = IGT_MAX_PIPES;
 	display->pipes = calloc(igt_display_n_crtcs(display),
-				sizeof(igt_pipe_t));
+				sizeof(igt_crtc_t));
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n",
 		     igt_display_n_crtcs(display));
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-		igt_pipe_t *pipe;
+		igt_crtc_t *pipe;
 		int pipe_enum = (is_intel_dev)?
 			__intel_get_pipe_from_crtc_id(drm_fd,
 						      resources->crtcs[i], i) : i;
@@ -3156,7 +3156,7 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->n_colorops = 0;
 
 	for_each_pipe(display, i) {
-		igt_pipe_t *pipe = igt_crtc_for_pipe(display, i);
+		igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
 		igt_plane_t *plane;
 		int p = 1, crtc_mask = 0;
 		int j, type;
@@ -3419,7 +3419,7 @@ void igt_modeset_disable_all_outputs(igt_display_t *display)
 
 }
 
-static void igt_pipe_fini(igt_pipe_t *pipe)
+static void igt_pipe_fini(igt_crtc_t *pipe)
 {
 	free(pipe->planes);
 	pipe->planes = NULL;
@@ -3512,7 +3512,7 @@ report_dup:
 	}
 }
 
-static igt_pipe_t *igt_output_get_driving_pipe(igt_output_t *output)
+static igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
 {
 	igt_display_t *display = output->display;
 	enum pipe pipe;
@@ -3535,7 +3535,7 @@ static igt_pipe_t *igt_output_get_driving_pipe(igt_output_t *output)
 	return igt_crtc_for_pipe(display, pipe);
 }
 
-static igt_plane_t *igt_pipe_get_plane(igt_pipe_t *pipe, int plane_idx)
+static igt_plane_t *igt_pipe_get_plane(igt_crtc_t *pipe, int plane_idx)
 {
 	igt_require_f(plane_idx >= 0 && plane_idx < pipe->n_planes,
 		      "Valid pipe->planes plane_idx not found, plane_idx=%d n_planes=%d",
@@ -3554,7 +3554,7 @@ static igt_plane_t *igt_pipe_get_plane(igt_pipe_t *pipe, int plane_idx)
  *
  * Returns: A #igt_plane_t structure that matches the requested plane type
  */
-igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type)
+igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 {
 	int i, plane_idx = -1;
 
@@ -3590,7 +3590,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type)
  *
  * Returns: The number of planes that match the requested plane type
  */
-int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type)
+int igt_pipe_count_plane_type(igt_crtc_t *pipe, int plane_type)
 {
 	int i, count = 0;
 
@@ -3611,7 +3611,7 @@ int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type)
  *
  * Returns: The @index th plane that matches the requested plane type
  */
-igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
+igt_plane_t *igt_pipe_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
 					   int index)
 {
 	int i, type_index = 0;
@@ -3658,7 +3658,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
 
 	for (i = 0; i < igt_display_n_crtcs(display); i++) {
-		igt_pipe_t *pipe = igt_crtc_for_pipe(display, i);
+		igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
 		if (pipe->valid)
 			full_pipe_mask |= (1 << i);
 	}
@@ -3735,7 +3735,7 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 	return chosen_outputs[pipe];
 }
 
-static igt_output_t *igt_pipe_get_output(igt_pipe_t *pipe)
+static igt_output_t *igt_pipe_get_output(igt_crtc_t *pipe)
 {
 	igt_display_t *display = pipe->display;
 	int i;
@@ -3762,7 +3762,7 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 }
 
 static bool
-igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
+igt_atomic_ignore_plane_prop(igt_crtc_t *pipe, uint32_t prop)
 {
 	igt_display_t *display = pipe->display;
 
@@ -3781,7 +3781,7 @@ igt_atomic_ignore_plane_prop(igt_pipe_t *pipe, uint32_t prop)
  * Add position and fb changes of a plane to the atomic property set
  */
 static void
-igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
+igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *pipe,
 	drmModeAtomicReq *req)
 {
 	igt_display_t *display = pipe->display;
@@ -3823,7 +3823,7 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_pipe_t *pipe,
  * Add colorop properties
  */
 static void
-igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
+igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *pipe,
 	drmModeAtomicReq *req)
 {
 	igt_display_t *display = pipe->display;
@@ -3882,7 +3882,7 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_pipe_t *pipe,
  * tests that expect a specific error code).
  */
 static int igt_drm_plane_commit(igt_plane_t *plane,
-				igt_pipe_t *pipe,
+				igt_crtc_t *pipe,
 				bool fail_on_error)
 {
 	igt_display_t *display = pipe->display;
@@ -3986,7 +3986,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
  * code).
  */
 static int igt_cursor_commit_legacy(igt_plane_t *cursor,
-				    igt_pipe_t *pipe,
+				    igt_crtc_t *pipe,
 				    bool fail_on_error)
 {
 	igt_display_t *display = pipe->display;
@@ -4037,7 +4037,7 @@ static int igt_cursor_commit_legacy(igt_plane_t *cursor,
  * (setmode).
  */
 static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
-					   igt_pipe_t *pipe,
+					   igt_crtc_t *pipe,
 					   bool fail_on_error)
 {
 	struct igt_display *display = primary->pipe->display;
@@ -4105,7 +4105,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 }
 
 static int igt_plane_fixup_rotation(igt_plane_t *plane,
-				    igt_pipe_t *pipe)
+				    igt_crtc_t *pipe)
 {
 	int ret;
 
@@ -4152,7 +4152,7 @@ static int igt_plane_fixup_rotation(igt_plane_t *plane,
  * which API is used to do the programming.
  */
 static int igt_plane_commit(igt_plane_t *plane,
-			    igt_pipe_t *pipe,
+			    igt_crtc_t *pipe,
 			    enum igt_commit_style s,
 			    bool fail_on_error)
 {
@@ -4196,7 +4196,7 @@ static bool is_atomic_prop(enum igt_atomic_crtc_properties prop)
  * further programming will take place, which may result in some changes
  * taking effect and others not taking effect.
  */
-static int igt_pipe_commit(igt_pipe_t *pipe,
+static int igt_pipe_commit(igt_crtc_t *pipe,
 			   enum igt_commit_style s,
 			   bool fail_on_error)
 {
@@ -4663,7 +4663,7 @@ igt_output_replace_prop_blob(igt_output_t *output, enum igt_atomic_connector_pro
  * is a blob, the blob id is returned. This can be passed
  * to drmModeGetPropertyBlob() to get the contents of the blob.
  */
-uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
+uint64_t igt_pipe_obj_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
 {
 	igt_assert(igt_pipe_obj_has_prop(pipe, prop));
 
@@ -4680,7 +4680,7 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  * Returns: False if the given @pipe_obj doesn't have the enum @prop or
  * failed to set the enum property @val else True.
  */
-bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe_obj,
+bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe_obj,
 				enum igt_atomic_crtc_properties prop,
 				const char *val)
 {
@@ -4706,7 +4706,7 @@ bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe_obj,
  * This function tries to set given enum property @prop value @val to
  * the given @pipe_obj, and terminate the execution if its failed.
  */
-void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe_obj,
+void igt_pipe_obj_set_prop_enum(igt_crtc_t *pipe_obj,
 				enum igt_atomic_crtc_properties prop,
 				const char *val)
 {
@@ -4730,7 +4730,7 @@ void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe_obj,
  * it works better with legacy commit.
  */
 void
-igt_pipe_obj_replace_prop_blob(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop, const void *ptr, size_t length)
+igt_pipe_obj_replace_prop_blob(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop, const void *ptr, size_t length)
 {
 	igt_display_t *display = pipe->display;
 	uint64_t *blob = &pipe->values[prop];
@@ -4751,7 +4751,7 @@ igt_pipe_obj_replace_prop_blob(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
 /*
  * Add crtc property changes to the atomic property set
  */
-static void igt_atomic_prepare_crtc_commit(igt_pipe_t *pipe_obj, drmModeAtomicReq *req)
+static void igt_atomic_prepare_crtc_commit(igt_crtc_t *pipe_obj, drmModeAtomicReq *req)
 {
 	int i;
 
@@ -4815,7 +4815,7 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 	req = drmModeAtomicAlloc();
 
 	for_each_pipe(display, pipe) {
-		igt_pipe_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+		igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
 		igt_plane_t *plane;
 
 		/*
@@ -4866,7 +4866,7 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 	enum pipe pipe;
 
 	for_each_pipe(display, pipe) {
-		igt_pipe_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+		igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
 		igt_plane_t *plane;
 
 		if (s == COMMIT_ATOMIC) {
@@ -4969,7 +4969,7 @@ static int do_display_commit(igt_display_t *display,
 		ret = igt_atomic_commit(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	} else {
 		for_each_pipe(display, pipe) {
-			igt_pipe_t *pipe_obj = igt_crtc_for_pipe(display,
+			igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display,
 								 pipe);
 
 			ret = igt_pipe_commit(pipe_obj, s, fail_on_error);
@@ -5244,7 +5244,7 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
  */
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
 {
-	igt_pipe_t *pipe = igt_output_get_driving_pipe(output);
+	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
 
 	if (mode)
 		output->override_mode = *mode;
@@ -5277,7 +5277,7 @@ int igt_output_preferred_vrefresh(igt_output_t *output)
 		return 60;
 }
 
-static const char *igt_crtc_name(igt_pipe_t *crtc)
+static const char *igt_crtc_name(igt_crtc_t *crtc)
 {
 	if (crtc == NULL)
 		return "None";
@@ -5293,10 +5293,10 @@ static const char *igt_crtc_name(igt_pipe_t *crtc)
  * This function sets a @crtc to a specific @output connector by
  * setting the CRTC_ID property of the @crtc.
  */
-void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj)
+void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
 {
 	igt_display_t *display = output->display;
-	igt_pipe_t *old_pipe = NULL;
+	igt_crtc_t *old_pipe = NULL;
 
 	igt_assert(output->name);
 
@@ -5456,7 +5456,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
  */
 void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force)
 {
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
 
 	if (force && display->is_atomic) {
 		igt_output_t *output = igt_pipe_get_output(pipe_obj);
@@ -5481,7 +5481,7 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force)
  */
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
 {
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 
 	pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
@@ -5501,7 +5501,7 @@ igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
  */
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
 {
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 
 	pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
@@ -5520,7 +5520,7 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
  */
 int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 {
-	igt_pipe_t *pipe = igt_output_get_driving_pipe(output);
+	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
 
 	return igt_pipe_count_plane_type(pipe, plane_type);
@@ -5539,7 +5539,7 @@ int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index)
 {
-	igt_pipe_t *pipe = igt_output_get_driving_pipe(output);
+	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
 
 	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
@@ -5557,7 +5557,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
  */
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	LOG(display, "%s.%d: plane_set_fb(%d)\n", kmstest_pipe_name(pipe->pipe),
@@ -5631,7 +5631,7 @@ void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd)
  * @plane: Target plane pointer
  * @pipe: The pipe to assign the plane to
  */
-void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe)
+void igt_plane_set_pipe(igt_plane_t *plane, igt_crtc_t *pipe)
 {
 	/*
 	 * HACK: Point the global plane back to the local plane.
@@ -5653,7 +5653,7 @@ void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe)
  */
 void igt_plane_set_position(igt_plane_t *plane, int x, int y)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	LOG(display, "%s.%d: plane_set_position(%d,%d)\n",
@@ -5675,7 +5675,7 @@ void igt_plane_set_position(igt_plane_t *plane, int x, int y)
  */
 void igt_plane_set_size(igt_plane_t *plane, int w, int h)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	LOG(display, "%s.%d: plane_set_size (%dx%d)\n",
@@ -5698,7 +5698,7 @@ void igt_plane_set_size(igt_plane_t *plane, int w, int h)
 void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 	uint32_t x, uint32_t y)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	LOG(display, "%s.%d: fb_set_position(%d,%d)\n",
@@ -5722,7 +5722,7 @@ void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
 	uint32_t w, uint32_t h)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	LOG(display, "%s.%d: fb_set_size(%dx%d)\n",
@@ -5765,7 +5765,7 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation)
  */
 void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
 {
-	igt_pipe_t *pipe = plane->pipe;
+	igt_crtc_t *pipe = plane->pipe;
 	igt_display_t *display = pipe->display;
 
 	LOG(display, "%s.%d: plane_set_rotation(%s°)\n",
@@ -5782,7 +5782,7 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
  * Marks this pipe for requesting an out fence at the next atomic commit
  * will contain the fd number of the out fence created by KMS.
  */
-void igt_pipe_request_out_fence(igt_pipe_t *pipe)
+void igt_pipe_request_out_fence(igt_crtc_t *pipe)
 {
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)&pipe->out_fence_fd);
 }
@@ -5832,7 +5832,7 @@ static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
  *
  * Waits for a given number of vertical blank intervals
  */
-void igt_wait_for_vblank_count(igt_pipe_t *crtc, int count)
+void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count)
 {
 	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_offset, count) == 0);
 }
@@ -5846,7 +5846,7 @@ void igt_wait_for_vblank_count(igt_pipe_t *crtc, int count)
  *
  * Waits for 1 vertical blank intervals
  */
-void igt_wait_for_vblank(igt_pipe_t *crtc)
+void igt_wait_for_vblank(igt_crtc_t *crtc)
 {
 	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_offset, 1) == 0);
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e778215c0b88..b00884640e16 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -379,7 +379,7 @@ extern const char * const igt_plane_prop_names[];
 extern const char * const igt_colorop_prop_names[];
 
 typedef struct igt_display igt_display_t;
-typedef struct igt_pipe igt_pipe_t;
+typedef struct igt_crtc igt_crtc_t;
 typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
 
 #define IGT_NUM_PLANE_COLOR_PIPELINES 4
@@ -425,7 +425,7 @@ typedef struct igt_colorop {
 
 typedef struct igt_plane {
 	/*< private >*/
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	struct igt_plane *ref;
 	int index;
 	/* capabilities */
@@ -473,7 +473,7 @@ typedef struct igt_plane {
  * DRM_IOCTL_WAIT_VBLANK notion of pipe is confusing and we are using
  * crtc_offset instead (refer people to #igt_wait_for_vblank_count)
  */
-struct igt_pipe {
+struct igt_crtc {
 	igt_display_t *display;
 	/* ID of a hardware pipe */
 	enum pipe pipe;
@@ -535,7 +535,7 @@ struct igt_display {
 	igt_output_t *outputs;
 	igt_plane_t *planes;
 	igt_colorop_t *colorops;
-	igt_pipe_t *pipes;
+	igt_crtc_t *pipes;
 	bool has_cursor_plane;
 	bool is_atomic;
 	bool has_virt_cursor_plane;
@@ -578,7 +578,7 @@ void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 int igt_display_n_crtcs(igt_display_t *display);
 
-static inline igt_pipe_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
+static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
 {
 	if (pipe == PIPE_NONE)
 		return NULL;
@@ -592,7 +592,7 @@ drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
-void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj);
+void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj);
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);
 int igt_output_count_plane_type(igt_output_t *output, int plane_type);
@@ -605,18 +605,18 @@ drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
 void igt_modeset_disable_all_outputs(igt_display_t *display);
 
-igt_plane_t *igt_pipe_get_plane_type(igt_pipe_t *pipe, int plane_type);
-int igt_pipe_count_plane_type(igt_pipe_t *pipe, int plane_type);
-igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
+igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type);
+int igt_pipe_count_plane_type(igt_crtc_t *pipe, int plane_type);
+igt_plane_t *igt_pipe_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
 					   int index);
 bool output_is_internal_panel(igt_output_t *output);
 igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe);
 
-void igt_pipe_request_out_fence(igt_pipe_t *pipe);
+void igt_pipe_request_out_fence(igt_crtc_t *pipe);
 
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
 void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
-void igt_plane_set_pipe(igt_plane_t *plane, igt_pipe_t *pipe);
+void igt_plane_set_pipe(igt_plane_t *plane, igt_crtc_t *pipe);
 void igt_plane_set_position(igt_plane_t *plane, int x, int y);
 void igt_plane_set_size(igt_plane_t *plane, int w, int h);
 void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation);
@@ -640,8 +640,8 @@ static inline bool igt_plane_has_rotation(igt_plane_t *plane, igt_rotation_t rot
 }
 const char *igt_plane_rotation_name(igt_rotation_t rotation);
 
-void igt_wait_for_vblank(igt_pipe_t *crtc);
-void igt_wait_for_vblank_count(igt_pipe_t *crtc, int count);
+void igt_wait_for_vblank(igt_crtc_t *crtc);
+void igt_wait_for_vblank_count(igt_crtc_t *crtc, int count);
 
 /**
  * igt_output_is_connected:
@@ -1046,12 +1046,12 @@ extern void igt_output_replace_prop_blob(igt_output_t *output,
  * Returns: True if the property is supported, otherwise false.
  */
 static inline bool
-igt_pipe_obj_has_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
+igt_pipe_obj_has_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
 {
 	return pipe->props[prop];
 }
 
-uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
+uint64_t igt_pipe_obj_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop);
 
 /**
  * igt_pipe_obj_is_prop_changed:
@@ -1060,7 +1060,7 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
  *
  * Check whether a given @prop changed for the @pipe_obj.
  */
-static inline bool igt_pipe_obj_is_prop_changed(igt_pipe_t *pipe_obj,
+static inline bool igt_pipe_obj_is_prop_changed(igt_crtc_t *pipe_obj,
 						enum igt_atomic_crtc_properties prop)
 {
 	return pipe_obj->changed & (1 << prop);
@@ -1088,7 +1088,7 @@ static inline bool igt_pipe_is_prop_changed(igt_display_t *display,
  *
  * Sets the given @prop for the @pipe_obj.
  */
-static inline void igt_pipe_obj_set_prop_changed(igt_pipe_t *pipe_obj,
+static inline void igt_pipe_obj_set_prop_changed(igt_crtc_t *pipe_obj,
 						 enum igt_atomic_crtc_properties prop)
 {
 	pipe_obj->changed |= 1 << prop;
@@ -1101,7 +1101,7 @@ static inline void igt_pipe_obj_set_prop_changed(igt_pipe_t *pipe_obj,
  *
  * Clears the given @prop for the @pipe_obj.
  */
-static inline void igt_pipe_obj_clear_prop_changed(igt_pipe_t *pipe_obj,
+static inline void igt_pipe_obj_clear_prop_changed(igt_crtc_t *pipe_obj,
 						   enum igt_atomic_crtc_properties prop)
 {
 	pipe_obj->changed &= ~(1 << prop);
@@ -1115,7 +1115,7 @@ static inline void igt_pipe_obj_clear_prop_changed(igt_pipe_t *pipe_obj,
  *
  * Sets the given @prop with the @value for the @pipe_obj.
  */
-static inline void igt_pipe_obj_set_prop_value(igt_pipe_t *pipe_obj,
+static inline void igt_pipe_obj_set_prop_value(igt_crtc_t *pipe_obj,
 					       enum igt_atomic_crtc_properties prop,
 					       uint64_t value)
 {
@@ -1140,14 +1140,14 @@ static inline void igt_pipe_set_prop_value(igt_display_t *display,
 				    value);
 }
 
-extern bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe,
+extern bool igt_pipe_obj_try_prop_enum(igt_crtc_t *pipe,
 				       enum igt_atomic_crtc_properties prop,
 				       const char *val);
 
-extern void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe,
+extern void igt_pipe_obj_set_prop_enum(igt_crtc_t *pipe,
 				       enum igt_atomic_crtc_properties prop,
 				       const char *val);
-extern void igt_pipe_obj_replace_prop_blob(igt_pipe_t *pipe,
+extern void igt_pipe_obj_replace_prop_blob(igt_crtc_t *pipe,
 					   enum igt_atomic_crtc_properties prop,
 					   const void *ptr, size_t length);
 void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force);
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 00560ce3ac00..6d6fce320467 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -42,7 +42,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	int drm_fd;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 976582ade9eb..8ab409164283 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -160,7 +160,7 @@ static bool get_internal_display_flag(data_t *data, igt_output_t *output)
 static void present_visual_pattern(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	drmModeModeInfo *mode;
 	igt_fb_t fb;
 	cairo_t *cr;
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 460e69dfa7c1..7f768ea4e209 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -35,7 +35,7 @@ typedef struct {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc_fb;
 	igt_crc_t crc_dprx;
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index 422b111768c0..9631fc34d9f4 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -42,7 +42,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index b1809b65aa0e..11d77c6e9f4a 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -36,7 +36,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary[MAX_PIPES];
 	igt_output_t *output[MAX_PIPES];
-	igt_pipe_t *pipe[MAX_PIPES];
+	igt_crtc_t *pipe[MAX_PIPES];
 	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
 	drmModeModeInfo mode[MAX_PIPES];
 	enum pipe pipe_id[MAX_PIPES];
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 71c859799f74..e2982f755d46 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -39,7 +39,7 @@ typedef struct data {
 	igt_plane_t *overlay[MAX_PIPES];
 	igt_plane_t *cursor[MAX_PIPES];
 	igt_output_t *output[MAX_PIPES];
-	igt_pipe_t *pipe[MAX_PIPES];
+	igt_crtc_t *pipe[MAX_PIPES];
 	igt_pipe_crc_t *pipe_crc[MAX_PIPES];
 	drmModeModeInfo mode[MAX_PIPES];
 	enum pipe pipe_id[MAX_PIPES];
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 16ef6ffe40f1..f1db9649c4e8 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -41,7 +41,7 @@ typedef struct {
 	igt_plane_t *primary;
 	igt_output_t *output;
 	igt_fb_t fb;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc_dprx;
 	enum pipe pipe_id;
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 3ea4168f93ed..d042eb58d656 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -30,7 +30,7 @@ typedef struct
         igt_plane_t *primary;
         igt_output_t *output;
         igt_fb_t fb;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
         enum pipe pipe_id;
 	int connector_type;
 	int w, h;
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index a1a04d0ea9c3..5364cf797163 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -39,7 +39,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index bb362926c6b9..9abf7abd3800 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -30,7 +30,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_pipe_crc_t *pipe_crc_dither;
 	drmModeModeInfo *mode;
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index ef2b59be4a1c..68fbe5f4167f 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -32,7 +32,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
 	int fd;
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 94bc99f4143f..a35eeb7ab9d4 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -153,7 +153,7 @@ static void test_init(struct data_t *data)
 
 	for_each_pipe(display, i) {
 		igt_output_t *output;
-		igt_pipe_t *pipes;
+		igt_crtc_t *pipes;
 
 		/* For each valid pipe, get one connected display.
 		 * This will let displays connected to MST hub be
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 0e0a55396b73..3decc7d805e0 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -23,7 +23,7 @@ struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	drmModeModeInfoPtr mode;
 	enum pipe pipe_id;
 	int fd;
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index cb1fcab930e3..53fb6a12f558 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -44,7 +44,7 @@ typedef struct data {
 	igt_plane_t *overlay[MAX_PIPES];
 	igt_plane_t *overlay2[MAX_PIPES];
         igt_output_t *output[MAX_PIPES];
-        igt_pipe_t *pipe[MAX_PIPES];
+        igt_crtc_t *pipe[MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[MAX_PIPES];
         drmModeModeInfo mode[MAX_PIPES];
         enum pipe pipe_id[MAX_PIPES];
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 9071a2e9d780..c66dcf1ef39d 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -56,7 +56,7 @@ typedef struct data {
 	igt_plane_t *cursor;
 	igt_plane_t *overlay;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_fb_t ov_fb[2];
 	igt_fb_t pm_fb[2];
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 38fe80a236f6..3104c436a326 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -21,7 +21,7 @@ struct test_data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb;
 	igt_fb_t ref_fb2;
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 0998a0c960d0..66114d36a8af 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -16,7 +16,7 @@ struct data {
 	igt_display_t display;
 	igt_plane_t *primary[IGT_MAX_PIPES];
 	igt_output_t *output[IGT_MAX_PIPES];
-	igt_pipe_t *pipe[IGT_MAX_PIPES];
+	igt_crtc_t *pipe[IGT_MAX_PIPES];
 	igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
 	drmModeModeInfo mode[IGT_MAX_PIPES];
 	enum pipe pipe_id[IGT_MAX_PIPES];
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 72c02dbbc339..2512f7b7e049 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -450,7 +450,7 @@ prep_pipe(data_t *data, enum pipe p)
 
 static int test_setup(data_t *data, enum pipe p)
 {
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	int i = 0;
 
 	igt_display_reset(&data->display);
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index 0507ad7ac38a..6f161660b043 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -177,7 +177,7 @@ static void test_t(data_t *data, igt_plane_t *primary,
 
 static int test_setup(data_t *data, enum pipe p)
 {
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	int i = 0;
 
 	igt_display_reset(&data->display);
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 9c1d724ac3cc..31a872e4b559 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1204,7 +1204,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, protected_fb;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, new_crc;
 	int width = 0, height = 0, i = 0, ret;
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 1ddda65e4ab6..8a9ed8042d89 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -375,7 +375,7 @@ static void prep_fb(data_t *data)
 
 static void set_c8_lut(data_t *data)
 {
-	igt_pipe_t *pipe = igt_crtc_for_pipe(&data->display, data->pipe);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, data->pipe);
 	struct drm_color_lut *lut;
 	int i, lut_size = 256;
 
@@ -396,7 +396,7 @@ static void set_c8_lut(data_t *data)
 
 static void unset_lut(data_t *data)
 {
-	igt_pipe_t *pipe = igt_crtc_for_pipe(&data->display, data->pipe);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, data->pipe);
 
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
 }
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 441ffa200e64..a9c4dda98f2c 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -237,7 +237,7 @@ static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
 		     igt_output_t **valid_outputs, struct igt_fb fb)
 {
 	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_plane_t *plane;
 
 	for (int i = 0; i < count; i++) {
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index d9452dff0b84..5ffa357e08c8 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -537,7 +537,7 @@ static void free_fbs(data_t *data)
 
 static void set_lut(data_t *data, enum pipe pipe)
 {
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
 	struct drm_color_lut *lut;
 	drmModeCrtc *drm_crtc;
 	int i, lut_size;
@@ -569,7 +569,7 @@ static void set_lut(data_t *data, enum pipe pipe)
 
 static void clear_lut(data_t *data, enum pipe pipe)
 {
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
 
 	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
 }
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index c1242e8d514c..06ceb640a976 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -157,7 +157,7 @@ typedef struct {
 	bool limited;
 	enum pipe pipe_id;
 	struct igt_fb fb[4];
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane[4];
@@ -417,7 +417,7 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	cleanup(data);
 }
 
-static bool has_sharpness_filter(igt_pipe_t *pipe)
+static bool has_sharpness_filter(igt_crtc_t *pipe)
 {
 	return igt_pipe_obj_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
 }
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index b525bff8da0b..967130f26f32 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -839,7 +839,7 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 	igt_output_t *output;
 	drmModeModeInfo *mode;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, new_crc;
 
@@ -881,7 +881,7 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, pxp_fb;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	int width = 0, height = 0, i = 0;
 	uint32_t q;
 	uint32_t vm;
@@ -938,7 +938,7 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, pxp_fb;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	int width = 0, height = 0, i = 0;
 	uint32_t q;
 	uint32_t vm;
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 236c1d5445e2..58d57cafecce 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -113,7 +113,7 @@ static bool all_pipes = false;
 typedef struct {
 	igt_display_t display;
 	igt_plane_t *primary;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	int drm_fd;
 	igt_fb_t fb;
 } data_t;
@@ -222,7 +222,7 @@ static bool crtc_filter(enum igt_atomic_crtc_properties prop)
 	return true;
 }
 
-static void crtc_get_current_state(igt_pipe_t *pipe, uint64_t *values)
+static void crtc_get_current_state(igt_crtc_t *pipe, uint64_t *values)
 {
 	int i;
 
@@ -236,7 +236,7 @@ static void crtc_get_current_state(igt_pipe_t *pipe, uint64_t *values)
 	}
 }
 
-static void crtc_check_current_state(igt_pipe_t *pipe,
+static void crtc_check_current_state(igt_crtc_t *pipe,
 				     const uint64_t *pipe_values,
 				     const uint64_t *primary_values,
 				     enum kms_atomic_check_relax relax)
@@ -307,7 +307,7 @@ static void crtc_check_current_state(igt_pipe_t *pipe,
 	drmModeFreePropertyBlob(mode_prop);
 }
 
-static void crtc_commit(igt_pipe_t *pipe, igt_plane_t *plane,
+static void crtc_commit(igt_crtc_t *pipe, igt_plane_t *plane,
 			enum igt_commit_style s,
 			enum kms_atomic_check_relax relax)
 {
@@ -317,7 +317,7 @@ static void crtc_commit(igt_pipe_t *pipe, igt_plane_t *plane,
 	plane_check_current_state(plane, plane->values, relax);
 }
 
-static void crtc_commit_atomic_flags_err(igt_pipe_t *pipe, igt_plane_t *plane,
+static void crtc_commit_atomic_flags_err(igt_crtc_t *pipe, igt_plane_t *plane,
 					 unsigned flags,
 					 enum kms_atomic_check_relax relax,
 					 int err)
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 5b8728631a75..4631d54725db 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -556,7 +556,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 {
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
 	uint32_t iter_max, i;
 	struct plane_parms parms[pipe_obj->n_planes];
 	unsigned flags = 0;
@@ -921,7 +921,7 @@ retry:
 				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &data->fbs[1]);
 
 	for_each_pipe(&data->display, i) {
-		igt_pipe_t *pipe = igt_crtc_for_pipe(&data->display, i);
+		igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, i);
 		igt_plane_t *plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 2622eae89eda..44b3c6ddf04c 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -67,7 +67,7 @@ typedef struct data {
         igt_plane_t *primary[IGT_MAX_PIPES];
         igt_output_t *output[IGT_MAX_PIPES];
 	igt_output_t *connected_output[IGT_MAX_PIPES];
-        igt_pipe_t *pipe[IGT_MAX_PIPES];
+        igt_crtc_t *pipe[IGT_MAX_PIPES];
         igt_pipe_crc_t *pipe_crc[IGT_MAX_PIPES];
         drmModeModeInfo mode[IGT_MAX_PIPES];
         enum pipe pipe_id[IGT_MAX_PIPES];
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 072d0ad09474..9a259d8d3072 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -733,7 +733,7 @@ prep_pipe(data_t *data, enum pipe p)
 
 static void test_setup(data_t *data, enum pipe p)
 {
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 
 	prep_pipe(data, p);
 	igt_require_pipe_crc(data->drm_fd);
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 37639a261cd2..9e68ef334f91 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -220,7 +220,7 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 }
 
 void set_degamma(data_t *data,
-		 igt_pipe_t *pipe,
+		 igt_crtc_t *pipe,
 		 const gamma_lut_t *gamma)
 {
 	size_t size = sizeof(struct drm_color_lut) * gamma->size;
@@ -233,7 +233,7 @@ void set_degamma(data_t *data,
 }
 
 void set_gamma(data_t *data,
-	       igt_pipe_t *pipe, const gamma_lut_t *gamma)
+	       igt_crtc_t *pipe, const gamma_lut_t *gamma)
 {
 	size_t size = sizeof(struct drm_color_lut) * gamma->size;
 	struct drm_color_lut *lut = coeffs_to_lut(data, gamma,
@@ -244,7 +244,7 @@ void set_gamma(data_t *data,
 	free(lut);
 }
 
-void set_ctm(igt_pipe_t *pipe, const double *coefficients)
+void set_ctm(igt_crtc_t *pipe, const double *coefficients)
 {
 	struct drm_color_ctm ctm;
 	int i;
@@ -264,14 +264,14 @@ void set_ctm(igt_pipe_t *pipe, const double *coefficients)
 	igt_pipe_obj_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
 }
 
-void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
+void disable_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
 {
 	if (igt_pipe_obj_has_prop(pipe, prop))
 		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
 }
 
 drmModePropertyBlobPtr
-get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
+get_blob(data_t *data, igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
 {
 	uint64_t prop_value;
 
@@ -284,7 +284,7 @@ get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop)
 }
 
 int
-pipe_set_property_blob_id(igt_pipe_t *pipe,
+pipe_set_property_blob_id(igt_crtc_t *pipe,
 			  enum igt_atomic_crtc_properties prop,
 			  uint32_t blob_id)
 {
@@ -304,7 +304,7 @@ pipe_set_property_blob_id(igt_pipe_t *pipe,
 }
 
 int
-pipe_set_property_blob(igt_pipe_t *pipe,
+pipe_set_property_blob(igt_crtc_t *pipe,
 		       enum igt_atomic_crtc_properties prop,
 		       void *ptr, size_t length)
 {
@@ -320,7 +320,7 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 		  enum igt_atomic_crtc_properties prop, int size)
 {
 	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe = igt_crtc_for_pipe(display, p);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(display, p);
 	struct drm_color_lut *lut;
 	size_t lut_size = size * sizeof(lut[0]);
 
@@ -363,7 +363,7 @@ invalid_degamma_lut_sizes(data_t *data, enum pipe p)
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_pipe_t *pipe = igt_crtc_for_pipe(display, p);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(display, p);
 	void *ptr;
 
 	igt_require(igt_pipe_obj_has_prop(pipe, IGT_CRTC_CTM));
diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
index 23463b944b6f..fb9c3b3aa6b1 100644
--- a/tests/kms_color_helper.h
+++ b/tests/kms_color_helper.h
@@ -90,25 +90,25 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 				    uint32_t color_depth,
 				    int off);
 void set_degamma(data_t *data,
-		 igt_pipe_t *pipe,
+		 igt_crtc_t *pipe,
 		 const gamma_lut_t *gamma);
 void set_gamma(data_t *data,
-	       igt_pipe_t *pipe,
+	       igt_crtc_t *pipe,
 	       const gamma_lut_t *gamma);
-void set_ctm(igt_pipe_t *pipe, const double *coefficients);
-void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop);
+void set_ctm(igt_crtc_t *pipe, const double *coefficients);
+void disable_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop);
 
 #define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
 #define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
 #define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
 
-drmModePropertyBlobPtr get_blob(data_t *data, igt_pipe_t *pipe,
+drmModePropertyBlobPtr get_blob(data_t *data, igt_crtc_t *pipe,
 				enum igt_atomic_crtc_properties prop);
 bool crc_equal(igt_crc_t *a, igt_crc_t *b);
-int pipe_set_property_blob_id(igt_pipe_t *pipe,
+int pipe_set_property_blob_id(igt_crtc_t *pipe,
 			      enum igt_atomic_crtc_properties prop,
 			      uint32_t blob_id);
-int pipe_set_property_blob(igt_pipe_t *pipe,
+int pipe_set_property_blob(igt_crtc_t *pipe,
 			   enum igt_atomic_crtc_properties prop,
 			   void *ptr, size_t length);
 void invalid_gamma_lut_sizes(data_t *data, enum pipe p);
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 0c05453496e7..4ef8e0f56339 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -158,7 +158,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	       igt_output_t *output)
 {
 	drmModeModeInfo *mode;
-	igt_pipe_t *p;
+	igt_crtc_t *p;
 	igt_plane_t *primary;
 	int *x;
 	int *y;
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 509cff1cf335..7171e565cd51 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -471,7 +471,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 
 static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, bool atomic, struct igt_fb *fb, void *data)
 {
-	igt_pipe_t *pipe = igt_crtc_for_pipe(display, pipe_id);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(display, pipe_id);
 	igt_plane_t *primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	int ret;
 
@@ -535,7 +535,7 @@ static void transition_nonblocking(igt_display_t *display, enum pipe pipe_id,
 				   struct igt_fb *prim_fb, struct igt_fb *argb_fb,
 				   bool hide_sprite)
 {
-	igt_pipe_t *pipe = igt_crtc_for_pipe(display, pipe_id);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(display, pipe_id);
 	igt_plane_t *primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_t *sprite = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_OVERLAY);
 
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 3731b7d4b4ea..f79fbb2cb2f3 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -74,7 +74,7 @@ typedef struct {
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 {
-	igt_pipe_t *pipe = igt_crtc_for_pipe(&data->display, p);
+	igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, p);
 
 	igt_assert(pipe);
 
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e6092dbfce99..39f2e860d7cb 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -111,7 +111,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 7ce142f44fd4..663e95db81b3 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -55,7 +55,7 @@ static void run_test(data_t *data, int valid_outputs)
 	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
 	igt_display_t *display = &data->display;
 	uint16_t width = 0, height = 0;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_plane_t *plane;
 	drmModeModeInfo *mode;
 	int i = 0;
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 535ce84d3074..2c083f4b7da9 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -522,7 +522,7 @@ static const color_t colors_reduced[] = {
 static void set_legacy_lut(data_t *data, enum pipe pipe,
 			   uint16_t mask)
 {
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *lut;
 	int i, lut_size;
@@ -549,7 +549,7 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 			      uint16_t mask)
 {
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *r, *g, *b;
 	int i, lut_size;
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 03fdb847d8c9..8b172794bc88 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -75,7 +75,7 @@ typedef struct data {
 	igt_plane_t *overlay;
 	igt_plane_t *cursor;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb;
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 79af0d93a370..342eb7b293da 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -204,7 +204,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
 	drmModeModeInfo *mode;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	igt_plane_t *primary;
 	int *x;
 	int *y;
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 25adadb87bf8..3ba709dd2cd0 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1016,7 +1016,7 @@ static void
 test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
-	igt_pipe_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
 	int width, height;
 	igt_plane_t *plane[3];
 	drmModeModeInfo *mode;
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index a94370178847..6becc646d20a 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -33,7 +33,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_pipe_t *pipe;
+	igt_crtc_t *pipe;
 	enum pipe pipe_id;
 	bool use_virtual_connector;
 	int timeout_seconds;
-- 
2.51.2

