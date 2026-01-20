Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E39CA5FB7
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 323F110E647;
	Tue, 20 Jan 2026 17:17:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZKq+Tad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F03510E64A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929442; x=1800465442;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dSXnyWeeHj2vvOeKYxbunQjAov+0SvxMyBes/xRtvuw=;
 b=ZZKq+TadNwy52w9ELJAIZzTli4krm4uqbAeGMgfrtn1GocB0VZsXmjtT
 8v2Of2EHa7+wCsd/oe5UaWAgYPxsiJBS/G/zmbWxdLYzElEw0pKYhJepW
 IZ7otXxuscJTOs06haR0fGEFezEidSamdB1R+7xsvI2TGMdG4XXMXZ/AP
 ZMeImEhO+j6Pidj46P3uEIK2pP4v4CkGKC8pl4/tFzKfVslC3K6umqk+C
 9rfr0Q1+nigcDPWQz2neLjnGl88Ib5dvzWrAdL427DFah6DRicTVo+y0u
 2Xilq7hXp9ZTfN9V4O6owaGgIDmA2pPIUTr1y13+RGsetMSa60oC7GRv/ Q==;
X-CSE-ConnectionGUID: d+oiHJYfQlmtzLMPbzFlvA==
X-CSE-MsgGUID: QsC1YU05RyeCLtJ1uMNtww==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72731884"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="72731884"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:22 -0800
X-CSE-ConnectionGUID: Ute5WxcKSU2WHHSCtF1scA==
X-CSE-MsgGUID: ZbLhQpZMQFuN1NNclR04/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206222120"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:21 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/12] lib/kms: Rename a bunch of crtc functions
Date: Tue, 20 Jan 2026 19:16:48 +0200
Message-ID: <20260120171656.15840-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
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

Rename a bunch of the functions that take igt_crtc_t
to also use the 'crtc' terminology in the function
name.

Done with cocci (with manual fixup for docs):
 #include "scripts/iterators.cocci"

@@
@@
(
- igt_pipe_request_out_fence
+ igt_crtc_request_out_fence
|
- igt_pipe_get_plane
+ igt_crtc_get_plane
|
- igt_pipe_get_plane_type
+ igt_crtc_get_plane_type
|
- igt_pipe_count_plane_type
+ igt_crtc_count_plane_type
|
- igt_pipe_get_plane_type_index
+ igt_crtc_get_plane_type_index
|
- igt_pipe_reset
+ igt_crtc_reset
|
- igt_pipe_fini
+ igt_crtc_fini
|
- igt_pipe_get_output
+ igt_crtc_get_output
|
- igt_pipe_commit
+ igt_crtc_commit
|
- igt_pipe_refresh
+ igt_crtc_refresh
|
- igt_fill_pipe_props
+ igt_fill_crtc_props
|
- igt_plane_set_pipe
+ igt_plane_set_crtc
)
 (...) { ... }

@@
@@
(
- igt_pipe_request_out_fence
+ igt_crtc_request_out_fence
|
- igt_pipe_get_plane
+ igt_crtc_get_plane
|
- igt_pipe_get_plane_type
+ igt_crtc_get_plane_type
|
- igt_pipe_count_plane_type
+ igt_crtc_count_plane_type
|
- igt_pipe_get_plane_type_index
+ igt_crtc_get_plane_type_index
|
- igt_pipe_reset
+ igt_crtc_reset
|
- igt_pipe_fini
+ igt_crtc_fini
|
- igt_pipe_get_output
+ igt_crtc_get_output
|
- igt_pipe_commit
+ igt_crtc_commit
|
- igt_pipe_refresh
+ igt_crtc_refresh
|
- igt_fill_pipe_props
+ igt_fill_crtc_props
|
- igt_plane_set_pipe
+ igt_plane_set_crtc
)
 (...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c                                 | 64 +++++++++----------
 lib/igt_kms.h                                 | 12 ++--
 tests/amdgpu/amd_abm.c                        |  2 +-
 tests/amdgpu/amd_assr.c                       |  2 +-
 tests/amdgpu/amd_bypass.c                     |  2 +-
 tests/amdgpu/amd_color.c                      |  2 +-
 tests/amdgpu/amd_cursor_overlay.c             |  8 +--
 tests/amdgpu/amd_dp_dsc.c                     |  2 +-
 tests/amdgpu/amd_hotplug.c                    |  6 +-
 tests/amdgpu/amd_mall.c                       |  2 +-
 tests/amdgpu/amd_max_bpc.c                    |  2 +-
 tests/amdgpu/amd_mem_leak.c                   |  2 +-
 tests/amdgpu/amd_mode_switch.c                |  2 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  2 +-
 tests/amdgpu/amd_odm.c                        |  2 +-
 tests/amdgpu/amd_plane.c                      |  8 +--
 tests/amdgpu/amd_psr.c                        |  6 +-
 tests/amdgpu/amd_replay.c                     |  2 +-
 tests/amdgpu/amd_subvp.c                      |  2 +-
 tests/chamelium/kms_chamelium_color.c         |  2 +-
 .../kms_chamelium_sharpness_filter.c          |  2 +-
 tests/intel/gem_pxp.c                         |  4 +-
 tests/intel/kms_busy.c                        |  2 +-
 tests/intel/kms_cdclk.c                       |  2 +-
 tests/intel/kms_frontbuffer_tracking.c        |  6 +-
 tests/intel/kms_sharpness_filter.c            |  2 +-
 tests/intel/xe_pxp.c                          |  6 +-
 tests/kms_atomic.c                            | 16 ++---
 tests/kms_atomic_interruptible.c              |  2 +-
 tests/kms_atomic_transition.c                 | 14 ++--
 tests/kms_bw.c                                |  2 +-
 tests/kms_color.c                             |  2 +-
 tests/kms_color_pipeline.c                    |  2 +-
 tests/kms_concurrent.c                        |  2 +-
 tests/kms_cursor_legacy.c                     |  8 +--
 tests/kms_display_modes.c                     |  8 +--
 tests/kms_dither.c                            |  2 +-
 tests/kms_hdr.c                               |  2 +-
 tests/kms_lease.c                             | 10 +--
 tests/kms_multipipe_modeset.c                 |  4 +-
 tests/kms_plane_alpha_blend.c                 | 10 +--
 tests/kms_plane_cursor.c                      |  8 +--
 tests/kms_plane_scaling.c                     |  6 +-
 tests/kms_rmfb.c                              |  2 +-
 tools/amd_hdmi_compliance.c                   |  2 +-
 45 files changed, 129 insertions(+), 129 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 33e510acc514..74ad82d77dd3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -964,7 +964,7 @@ igt_atomic_fill_connector_props(igt_display_t *display, igt_output_t *output,
 }
 
 static void
-igt_fill_pipe_props(igt_crtc_t *pipe,
+igt_fill_crtc_props(igt_crtc_t *pipe,
 		    int num_crtc_props, const char * const crtc_prop_names[])
 {
 	igt_display_t *display = pipe->display;
@@ -2732,7 +2732,7 @@ static void igt_plane_reset(igt_plane_t *plane)
 	plane->gem_handle = 0;
 }
 
-static void igt_pipe_reset(igt_crtc_t *pipe)
+static void igt_crtc_reset(igt_crtc_t *pipe)
 {
 	igt_crtc_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
 	igt_crtc_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
@@ -2836,7 +2836,7 @@ void igt_display_reset(igt_display_t *display)
 		for_each_plane_on_pipe(display, pipe, plane)
 			igt_plane_reset(plane);
 
-		igt_pipe_reset(pipe_obj);
+		igt_crtc_reset(pipe_obj);
 	}
 
 	for (i = 0; i < display->n_outputs; i++) {
@@ -3106,7 +3106,7 @@ static void igt_crtc_plane_init(igt_display_t *display,
 	 * it can go on.
 	 */
 	if (!global_plane->ref)
-		igt_plane_set_pipe(plane, pipe);
+		igt_plane_set_crtc(plane, pipe);
 
 	igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_prop_names);
 
@@ -3124,7 +3124,7 @@ static void igt_crtc_init(igt_display_t *display,
 	pipe->planes = NULL;
 	pipe->num_primary_planes = 0;
 
-	igt_fill_pipe_props(pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
+	igt_fill_crtc_props(pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
 
 	/* Get valid crtc index from crtcs for a pipe */
 	crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
@@ -3435,7 +3435,7 @@ void igt_modeset_disable_all_outputs(igt_display_t *display)
 
 }
 
-static void igt_pipe_fini(igt_crtc_t *pipe)
+static void igt_crtc_fini(igt_crtc_t *pipe)
 {
 	free(pipe->planes);
 	pipe->planes = NULL;
@@ -3477,7 +3477,7 @@ void igt_display_fini(igt_display_t *display)
 	}
 
 	for (i = 0; i < igt_display_n_crtcs(display); i++)
-		igt_pipe_fini(igt_crtc_for_pipe(display, i));
+		igt_crtc_fini(igt_crtc_for_pipe(display, i));
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
@@ -3551,7 +3551,7 @@ static igt_crtc_t *igt_output_get_driving_pipe(igt_output_t *output)
 	return igt_crtc_for_pipe(display, pipe);
 }
 
-static igt_plane_t *igt_pipe_get_plane(igt_crtc_t *pipe, int plane_idx)
+static igt_plane_t *igt_crtc_get_plane(igt_crtc_t *pipe, int plane_idx)
 {
 	igt_require_f(plane_idx >= 0 && plane_idx < pipe->n_planes,
 		      "Valid pipe->planes plane_idx not found, plane_idx=%d n_planes=%d",
@@ -3561,7 +3561,7 @@ static igt_plane_t *igt_pipe_get_plane(igt_crtc_t *pipe, int plane_idx)
 }
 
 /**
- * igt_pipe_get_plane_type:
+ * igt_crtc_get_plane_type:
  * @pipe: Target pipe
  * @plane_type: Cursor, primary or an overlay plane
  *
@@ -3570,7 +3570,7 @@ static igt_plane_t *igt_pipe_get_plane(igt_crtc_t *pipe, int plane_idx)
  *
  * Returns: A #igt_plane_t structure that matches the requested plane type
  */
-igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
+igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *pipe, int plane_type)
 {
 	int plane_idx = plane_type_index(pipe, plane_type);
 
@@ -3589,7 +3589,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 }
 
 /**
- * igt_pipe_count_plane_type:
+ * igt_crtc_count_plane_type:
  * @pipe: Target pipe
  * @plane_type: Cursor, primary or an overlay plane
  *
@@ -3597,7 +3597,7 @@ igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
  *
  * Returns: The number of planes that match the requested plane type
  */
-int igt_pipe_count_plane_type(igt_crtc_t *pipe, int plane_type)
+int igt_crtc_count_plane_type(igt_crtc_t *pipe, int plane_type)
 {
 	int i, count = 0;
 
@@ -3609,7 +3609,7 @@ int igt_pipe_count_plane_type(igt_crtc_t *pipe, int plane_type)
 }
 
 /**
- * igt_pipe_get_plane_type_index:
+ * igt_crtc_get_plane_type_index:
  * @pipe: Target pipe
  * @plane_type: Cursor, primary or an overlay plane
  * @index: the index of the plane among planes of the same type
@@ -3618,7 +3618,7 @@ int igt_pipe_count_plane_type(igt_crtc_t *pipe, int plane_type)
  *
  * Returns: The @index th plane that matches the requested plane type
  */
-igt_plane_t *igt_pipe_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
+igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
 					   int index)
 {
 	int i, type_index = 0;
@@ -3742,7 +3742,7 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 	return chosen_outputs[pipe];
 }
 
-static igt_output_t *igt_pipe_get_output(igt_crtc_t *pipe)
+static igt_output_t *igt_crtc_get_output(igt_crtc_t *pipe)
 {
 	igt_display_t *display = pipe->display;
 	int i;
@@ -4048,7 +4048,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 					   bool fail_on_error)
 {
 	struct igt_display *display = primary->pipe->display;
-	igt_output_t *output = igt_pipe_get_output(pipe);
+	igt_output_t *output = igt_crtc_get_output(pipe);
 	drmModeModeInfo *mode;
 	uint32_t fb_id, crtc_id;
 	int ret;
@@ -4163,7 +4163,7 @@ static int igt_plane_commit(igt_plane_t *plane,
 			    enum igt_commit_style s,
 			    bool fail_on_error)
 {
-	igt_plane_t *plane_primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_t *plane_primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	if (pipe->display->first_commit || (s == COMMIT_UNIVERSAL &&
 	     igt_plane_is_prop_changed(plane, IGT_PLANE_ROTATION))) {
@@ -4203,7 +4203,7 @@ static bool is_atomic_prop(enum igt_atomic_crtc_properties prop)
  * further programming will take place, which may result in some changes
  * taking effect and others not taking effect.
  */
-static int igt_pipe_commit(igt_crtc_t *pipe,
+static int igt_crtc_commit(igt_crtc_t *pipe,
 			   enum igt_commit_style s,
 			   bool fail_on_error)
 {
@@ -4979,7 +4979,7 @@ static int do_display_commit(igt_display_t *display,
 			igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display,
 								 pipe);
 
-			ret = igt_pipe_commit(pipe_obj, s, fail_on_error);
+			ret = igt_crtc_commit(pipe_obj, s, fail_on_error);
 			if (ret)
 				break;
 		}
@@ -5332,7 +5332,7 @@ void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
 	if (old_pipe) {
 		igt_output_t *old_output;
 
-		old_output = igt_pipe_get_output(old_pipe);
+		old_output = igt_crtc_get_output(old_pipe);
 		if (!old_output) {
 			if (display->is_atomic)
 				igt_crtc_replace_prop_blob(old_pipe, IGT_CRTC_MODE_ID, NULL, 0);
@@ -5465,7 +5465,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 }
 
 /**
- * igt_pipe_refresh:
+ * igt_crtc_refresh:
  * @pipe_obj: CRTC to refresh
  * @force: Should be set to true if mode_blob is no longer considered
  * to be valid, for example after doing an atomic commit during fork or closing display fd.
@@ -5475,12 +5475,12 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
  * a fork, or we just want to be sure the pipe is included
  * in the next commit.
  */
-void igt_pipe_refresh(igt_crtc_t *pipe_obj, bool force)
+void igt_crtc_refresh(igt_crtc_t *pipe_obj, bool force)
 {
 	igt_display_t *display = pipe_obj->display;
 
 	if (force && display->is_atomic) {
-		igt_output_t *output = igt_pipe_get_output(pipe_obj);
+		igt_output_t *output = igt_crtc_get_output(pipe_obj);
 
 		pipe_obj->values[IGT_CRTC_MODE_ID] = 0;
 		if (output)
@@ -5507,7 +5507,7 @@ igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
 	pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
 
-	return igt_pipe_get_plane(pipe, plane_idx);
+	return igt_crtc_get_plane(pipe, plane_idx);
 }
 
 /**
@@ -5527,7 +5527,7 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
 	pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
 
-	return igt_pipe_get_plane_type(pipe, plane_type);
+	return igt_crtc_get_plane_type(pipe, plane_type);
 }
 
 /**
@@ -5544,7 +5544,7 @@ int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
 
-	return igt_pipe_count_plane_type(pipe, plane_type);
+	return igt_crtc_count_plane_type(pipe, plane_type);
 }
 
 /**
@@ -5563,7 +5563,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 	igt_crtc_t *pipe = igt_output_get_driving_pipe(output);
 	igt_assert(pipe);
 
-	return igt_pipe_get_plane_type_index(pipe, plane_type, index);
+	return igt_crtc_get_plane_type_index(pipe, plane_type, index);
 }
 
 /**
@@ -5612,7 +5612,7 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 		}
 
 		/* Hack to prioritize the plane on the pipe that last set fb */
-		igt_plane_set_pipe(plane, pipe);
+		igt_plane_set_crtc(plane, pipe);
 	} else {
 		igt_plane_set_size(plane, 0, 0);
 
@@ -5648,11 +5648,11 @@ void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd)
 }
 
 /**
- * igt_plane_set_pipe:
+ * igt_plane_set_crtc:
  * @plane: Target plane pointer
  * @pipe: The pipe to assign the plane to
  */
-void igt_plane_set_pipe(igt_plane_t *plane, igt_crtc_t *pipe)
+void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *pipe)
 {
 	/*
 	 * HACK: Point the global plane back to the local plane.
@@ -5797,13 +5797,13 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
 }
 
 /**
- * igt_pipe_request_out_fence:
+ * igt_crtc_request_out_fence:
  * @pipe: pipe which out fence will be requested for
  *
  * Marks this pipe for requesting an out fence at the next atomic commit
  * will contain the fd number of the out fence created by KMS.
  */
-void igt_pipe_request_out_fence(igt_crtc_t *pipe)
+void igt_crtc_request_out_fence(igt_crtc_t *pipe)
 {
 	igt_crtc_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)&pipe->out_fence_fd);
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5e3108f56e11..71a2f2c4d89c 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -604,18 +604,18 @@ drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
 void igt_modeset_disable_all_outputs(igt_display_t *display);
 
-igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type);
-int igt_pipe_count_plane_type(igt_crtc_t *pipe, int plane_type);
-igt_plane_t *igt_pipe_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
+igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *pipe, int plane_type);
+int igt_crtc_count_plane_type(igt_crtc_t *pipe, int plane_type);
+igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
 					   int index);
 bool output_is_internal_panel(igt_output_t *output);
 igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe);
 
-void igt_pipe_request_out_fence(igt_crtc_t *pipe);
+void igt_crtc_request_out_fence(igt_crtc_t *pipe);
 
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
 void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
-void igt_plane_set_pipe(igt_plane_t *plane, igt_crtc_t *pipe);
+void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *pipe);
 void igt_plane_set_position(igt_plane_t *plane, int x, int y);
 void igt_plane_set_size(igt_plane_t *plane, int w, int h);
 void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation);
@@ -1119,7 +1119,7 @@ extern void igt_crtc_set_prop_enum(igt_crtc_t *pipe,
 extern void igt_crtc_replace_prop_blob(igt_crtc_t *pipe,
 					   enum igt_atomic_crtc_properties prop,
 					   const void *ptr, size_t length);
-void igt_pipe_refresh(igt_crtc_t *pipe_obj, bool force);
+void igt_crtc_refresh(igt_crtc_t *pipe_obj, bool force);
 
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 6d6fce320467..0048304baf9c 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -144,7 +144,7 @@ static void test_init(data_t *data)
 	kmstest_dump_mode(data->mode);
 
 	data->primary =
-		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
 			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index a0c8d111d4a3..3c4ec0a86f17 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -169,7 +169,7 @@ static void present_visual_pattern(data_t *data, igt_output_t *output)
 
 	pipe = igt_crtc_for_pipe(&data->display, PIPE_A);
 	primary =
-		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(output,
 			    pipe);
 
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 80aa46890fc1..359387859d08 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -87,7 +87,7 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index ed3e9170f615..d1e164673560 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -191,7 +191,7 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 481219f9f726..dff03cb9aa52 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -141,16 +141,16 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 	data->pipe = &data->display.pipes[data->pipe_id];
 	data->output = output;
 	data->mode = igt_output_get_mode(data->output);
-	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->cursor = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	if (flags & TEST_MAX_PLANES)
 		for (i = 0; i < available_overlay_planes - 1; i++)
-			data->overlays[i] = igt_pipe_get_plane_type_index(data->pipe,
+			data->overlays[i] = igt_crtc_get_plane_type_index(data->pipe,
 						DRM_PLANE_TYPE_OVERLAY, i);
 	if (flags & TEST_NO_AVAILABLE_PLANES)
 		for (i = 0; i < available_overlay_planes; i++)
-			data->overlays[i] = igt_pipe_get_plane_type_index(data->pipe,
+			data->overlays[i] = igt_crtc_get_plane_type_index(data->pipe,
 						DRM_PLANE_TYPE_OVERLAY, i);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index 11d77c6e9f4a..91298ba20cde 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -67,7 +67,7 @@ static void test_init(data_t *data)
 		data->pipe_id[i] = PIPE_A + i;
 		data->pipe[i] = igt_crtc_for_pipe(&data->display,
 						  data->pipe_id[i]);
-		data->primary[i] = igt_pipe_get_plane_type(
+		data->primary[i] = igt_crtc_get_plane_type(
 				data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
 		data->pipe_crc[i] =
 				igt_pipe_crc_new(data->fd, data->pipe_id[i],
diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index e2982f755d46..774630696a61 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -57,11 +57,11 @@ static void test_init(data_t *data)
 		data->pipe_id[i] = PIPE_A + i;
 		data->pipe[i] = igt_crtc_for_pipe(&data->display,
 						  data->pipe_id[i]);
-		data->primary[i] = igt_pipe_get_plane_type(
+		data->primary[i] = igt_crtc_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
-		data->overlay[i] = igt_pipe_get_plane_type_index(
+		data->overlay[i] = igt_crtc_get_plane_type_index(
 			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
-		data->cursor[i] = igt_pipe_get_plane_type(
+		data->cursor[i] = igt_crtc_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
 		data->pipe_crc[i] =
 			igt_pipe_crc_new(data->fd, data->pipe_id[i],
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index 5364cf797163..1673bfd8531f 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -83,7 +83,7 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index 9abf7abd3800..b5e3f7aa40cf 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -80,7 +80,7 @@ static void test_init(data_t *data)
 				    data->output->name, 8);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 68fbe5f4167f..e6321c215d4e 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -65,7 +65,7 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
 			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
index d142873e9372..fa6d5a323a27 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -41,7 +41,7 @@ static void test_init(data_t *data)
 	for_each_pipe(display, i) {
 		igt_output_t *output = &display->outputs[i];
 
-		data->primary[i] = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->display, i),
+		data->primary[i] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, i),
 							   DRM_PLANE_TYPE_PRIMARY);
 
 		data->output[i] = output;
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index a35eeb7ab9d4..e2200be2dbb3 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -161,7 +161,7 @@ static void test_init(struct data_t *data)
 		 */
 		output = igt_get_single_output_for_pipe(display, i);
 		pipes = igt_crtc_for_pipe(display, i);
-		data->primary[i] = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->display, i),
+		data->primary[i] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, i),
 							   DRM_PLANE_TYPE_PRIMARY);
 		data->output[i] = output;
 
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index 3decc7d805e0..c8c268b982e5 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -76,7 +76,7 @@ static void test_init(struct data *data)
 		      data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB,
 		      "ODM Combine isn't supported on HDMI 1.x\n");
 
-	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(data->output,
 			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
 
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
index 06d2ace58a49..f56723d74485 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -157,13 +157,13 @@ static void test_init(data_t *data)
 	for_each_pipe(display, i) {
 		data->pipe_id[i] = PIPE_A + i;
 		data->pipe[i] = igt_crtc_for_pipe(display, data->pipe_id[i]);
-		data->primary[i] = igt_pipe_get_plane_type(
+		data->primary[i] = igt_crtc_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
-		data->overlay[i] = igt_pipe_get_plane_type_index(
+		data->overlay[i] = igt_crtc_get_plane_type_index(
 			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 0);
-		data->overlay2[i] = igt_pipe_get_plane_type_index(
+		data->overlay2[i] = igt_crtc_get_plane_type_index(
 			data->pipe[i], DRM_PLANE_TYPE_OVERLAY, 1);
-		data->cursor[i] = igt_pipe_get_plane_type(
+		data->cursor[i] = igt_crtc_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_CURSOR);
 		data->pipe_crc[i] =
 			igt_pipe_crc_new(data->fd, data->pipe_id[i],
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index c66dcf1ef39d..b98d43718251 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -185,13 +185,13 @@ static void test_init(data_t *data)
 	kmstest_dump_mode(data->mode);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->cursor =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	data->overlay =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index 3104c436a326..65707a3c384e 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -75,7 +75,7 @@ static void test_init(struct test_data *data)
 	kmstest_dump_mode(data->mode);
 
 	data->primary =
-		 igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
 			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 66114d36a8af..a4ee50a85f78 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -67,7 +67,7 @@ static void test_init(struct data *data)
 		data->pipe_id[i] = PIPE_A + i;
 		data->pipe[i] = igt_crtc_for_pipe(&data->display,
 						  data->pipe_id[i]);
-		data->primary[i] = igt_pipe_get_plane_type(data->pipe[i],
+		data->primary[i] = igt_crtc_get_plane_type(data->pipe[i],
 							   DRM_PLANE_TYPE_PRIMARY);
 		data->pipe_crc[i] = igt_pipe_crc_new(data->fd,
 						     data->pipe_id[i],
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 86d43509244a..e00013a78665 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -459,7 +459,7 @@ static int test_setup(data_t *data, enum pipe p)
 	pipe = igt_crtc_for_pipe(&data->display, p);
 	igt_require(pipe->n_planes >= 0);
 
-	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	/*
 	 * Prefer to run this test on HDMI connector if its connected, since on DP we
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index 21d4b6fe649e..14189687c29c 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -185,7 +185,7 @@ static int test_setup(data_t *data, enum pipe p)
 	pipe = igt_crtc_for_pipe(&data->display, p);
 	igt_require(pipe->n_planes >= 0);
 
-	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(data->primary);
 
 	/*
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 31a872e4b559..9015397c8a91 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1227,7 +1227,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
 				    igt_crtc_for_pipe(output->display, i));
@@ -1247,7 +1247,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 		pipe = igt_crtc_for_pipe(display, output->pending_pipe);
 		pipe_crc = igt_pipe_crc_new(i915, pipe->pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
 		igt_output_set_crtc(output, pipe);
 
diff --git a/tests/intel/kms_busy.c b/tests/intel/kms_busy.c
index 55ad6f19a905..35a52a2994d9 100644
--- a/tests/intel/kms_busy.c
+++ b/tests/intel/kms_busy.c
@@ -161,7 +161,7 @@ static void flip_to_fb(igt_display_t *dpy, int pipe,
 		gem_quiescent_gpu(dpy->drm_fd);
 
 		/* Clear old mode blob. */
-		igt_pipe_refresh(igt_crtc_for_pipe(dpy, pipe), true);
+		igt_crtc_refresh(igt_crtc_for_pipe(dpy, pipe), true);
 
 		igt_output_set_crtc(output,
 				    igt_crtc_for_pipe(output->display, pipe));
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index a9c4dda98f2c..36ce46a44f64 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -242,7 +242,7 @@ static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
 
 	for (int i = 0; i < count; i++) {
 		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_output_override_mode(valid_outputs[i], &mode[i]);
 
diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index dee3e898f7f7..e8c8e342f5dc 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1116,7 +1116,7 @@ static void init_mode_params(struct modeset_params *params,
 	params->output = output;
 	params->mode = *mode;
 
-	params->primary.plane = igt_pipe_get_plane_type(igt_crtc_for_pipe(&drm.display, pipe),
+	params->primary.plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&drm.display, pipe),
 							DRM_PLANE_TYPE_PRIMARY);
 	params->primary.fb = NULL;
 	params->primary.x = 0;
@@ -1124,7 +1124,7 @@ static void init_mode_params(struct modeset_params *params,
 	params->primary.w = mode->hdisplay;
 	params->primary.h = mode->vdisplay;
 
-	params->cursor.plane = igt_pipe_get_plane_type(igt_crtc_for_pipe(&drm.display, pipe),
+	params->cursor.plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&drm.display, pipe),
 						       DRM_PLANE_TYPE_CURSOR);
 	params->cursor.fb = NULL;
 	params->cursor.x = 0;
@@ -1132,7 +1132,7 @@ static void init_mode_params(struct modeset_params *params,
 	params->cursor.w = 64;
 	params->cursor.h = 64;
 
-	params->sprite.plane = igt_pipe_get_plane_type(igt_crtc_for_pipe(&drm.display, pipe),
+	params->sprite.plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&drm.display, pipe),
 						       DRM_PLANE_TYPE_OVERLAY);
 	igt_require(params->sprite.plane);
 	params->sprite.fb = NULL;
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 94c11ed2fecb..2f3044c7a9c7 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -338,7 +338,7 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
 
-	data->plane[0] = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->plane[0] = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
 		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
 
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 967130f26f32..87c2c67394dd 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -848,7 +848,7 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 		pipe = igt_crtc_for_pipe(display, output->pending_pipe);
 		pipe_crc = igt_pipe_crc_new(fd, pipe->pipe,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
 		igt_output_set_crtc(output, pipe);
 
@@ -903,7 +903,7 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
 				    igt_crtc_for_pipe(output->display, i));
@@ -961,7 +961,7 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
 		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
 				    igt_crtc_for_pipe(output->display, i));
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index d20a500f37c7..8966637c450b 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -938,12 +938,12 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* valid out fence ptr and flip event but not allowed prop on crtc */
-	igt_pipe_request_out_fence(data->pipe);
+	igt_crtc_request_out_fence(data->pipe);
 	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* valid flip event but not allowed prop on crtc */
-	igt_pipe_request_out_fence(data->pipe);
+	igt_crtc_request_out_fence(data->pipe);
 	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
@@ -957,7 +957,7 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
 
 	/* valid out fence but invalid prop on crtc */
-	igt_pipe_request_out_fence(data->pipe);
+	igt_crtc_request_out_fence(data->pipe);
 	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
@@ -984,7 +984,7 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	/* out fence ptr but not page flip event */
-	igt_pipe_request_out_fence(data->pipe);
+	igt_crtc_request_out_fence(data->pipe);
 	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	igt_assert(data->pipe->out_fence_fd != -1);
@@ -1333,7 +1333,7 @@ static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_display_reset(&data->display);
 	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
 
-	data->primary = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
+	data->primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
 						DRM_PLANE_TYPE_PRIMARY);
 	data->pipe = igt_crtc_for_pipe(&data->display, pipe);
 	mode = igt_output_get_mode(output);
@@ -1419,7 +1419,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("plane-overlay-legacy") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			igt_plane_t *overlay =
-				igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
 							DRM_PLANE_TYPE_OVERLAY);
 			uint32_t format = plane_get_igt_format(overlay);
 
@@ -1458,7 +1458,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("plane-primary-overlay-mutable-zpos") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			igt_plane_t *overlay =
-				igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
 							DRM_PLANE_TYPE_OVERLAY);
 
 			if (!pipe_output_combo_valid(&data.display, pipe, output))
@@ -1530,7 +1530,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_subtest_with_dynamic("plane-cursor-legacy") {
 		for_each_pipe_with_single_output(&data.display, pipe, output) {
 			igt_plane_t *cursor =
-				igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
 							DRM_PLANE_TYPE_CURSOR);
 
 			if (!pipe_output_combo_valid(&data.display, pipe, output))
diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
index 090c0ead7a24..d51c79efe7f0 100644
--- a/tests/kms_atomic_interruptible.c
+++ b/tests/kms_atomic_interruptible.c
@@ -297,7 +297,7 @@ static void run_plane_test(igt_display_t *display, enum pipe pipe, igt_output_t
 
 	/* The mode is unset by the forked helper, force a refresh here */
 	if (test_type == test_legacy_modeset || test_type == test_atomic_modeset)
-		igt_pipe_refresh(igt_crtc_for_pipe(display, pipe), true);
+		igt_crtc_refresh(igt_crtc_for_pipe(display, pipe), true);
 
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_fb(primary, NULL);
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 4da3289073ce..883a90e04a1a 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -509,7 +509,7 @@ static void unprepare_fencing(data_t *data, enum pipe pipe)
 static void atomic_commit(data_t *data_v, enum pipe pipe, unsigned int flags, void *data, bool fencing)
 {
 	if (fencing)
-		igt_pipe_request_out_fence(igt_crtc_for_pipe(&data_v->display, pipe));
+		igt_crtc_request_out_fence(igt_crtc_for_pipe(&data_v->display, pipe));
 
 	igt_display_commit_atomic(&data_v->display, flags, data);
 }
@@ -610,7 +610,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		wm_setup_plane(data, pipe, iter_max - 1, parms, false);
 
 		if (fencing)
-			igt_pipe_request_out_fence(pipe_obj);
+			igt_crtc_request_out_fence(pipe_obj);
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
@@ -805,7 +805,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 	unset_output_pipe(&data->display);
 
 	for_each_pipe(&data->display, pipe) {
-		igt_plane_t *plane = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
+		igt_plane_t *plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
 							     DRM_PLANE_TYPE_PRIMARY);
 
 		enum pipe old_pipe = plane->ref->pipe->pipe;
@@ -815,7 +815,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 		 * currently is holding the plane
 		 */
 		if (old_pipe != pipe) {
-			igt_plane_t *old_plane = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->display, old_pipe),
+			igt_plane_t *old_plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, old_pipe),
 									 DRM_PLANE_TYPE_PRIMARY);
 
 			igt_plane_set_fb(old_plane, NULL);
@@ -824,7 +824,7 @@ static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
 	}
 
 	for_each_pipe(&data->display, pipe) {
-		igt_plane_t *plane = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
+		igt_plane_t *plane = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
 							     DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
@@ -922,7 +922,7 @@ retry:
 
 	for_each_pipe(&data->display, i) {
 		igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, i);
-		igt_plane_t *plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_plane_t *plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
 		/* count enable pipes to set max iteration */
@@ -957,7 +957,7 @@ retry:
 			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 			if (fencing)
-				igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, i));
+				igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, i));
 		} else {
 			igt_plane_set_fb(plane, NULL);
 		}
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 4e41be942cb1..13c8e3bec2b9 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -127,7 +127,7 @@ static void test_init(data_t *data, bool physical)
 		data->pipe_id[i] = i;
 		data->pipe[i] = igt_crtc_for_pipe(&data->display,
 						  data->pipe_id[i]);
-		data->primary[i] = igt_pipe_get_plane_type(
+		data->primary[i] = igt_crtc_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
 		data->pipe_crc[i] =
 			igt_pipe_crc_new(data->fd, data->pipe_id[i],
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 2fc3aec75907..529fa33ab000 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -739,7 +739,7 @@ static void test_setup(data_t *data, enum pipe p)
 	pipe = igt_crtc_for_pipe(&data->display, p);
 	igt_require(pipe->n_planes >= 0);
 
-	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
 					  data->primary->pipe->pipe,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 3c9a2cdee55f..e1b7c50e6d5f 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -58,7 +58,7 @@ static void test_setup(data_t *data, enum pipe p)
 
 	igt_output_set_crtc(data->output, pipe);
 
-	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	data->mode = igt_output_get_mode(data->output);
 	igt_require(data->mode);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 8198832727cc..4431432e5cbc 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -233,7 +233,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe, int max_planes,
 	bool loop_forever = opt.iterations == LOOP_FOREVER ? true : false;
 	int ret;
 
-	igt_pipe_refresh(igt_crtc_for_pipe(&data->display, pipe), true);
+	igt_crtc_refresh(igt_crtc_for_pipe(&data->display, pipe), true);
 
 	i = 0;
 	while (i < iterations || loop_forever) {
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 7171e565cd51..d5a61e30e6a7 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -472,7 +472,7 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, bool atomic, struct igt_fb *fb, void *data)
 {
 	igt_crtc_t *pipe = igt_crtc_for_pipe(display, pipe_id);
-	igt_plane_t *primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_t *primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 	int ret;
 
 	igt_set_timeout(5, "Scheduling page flip\n");
@@ -536,8 +536,8 @@ static void transition_nonblocking(igt_display_t *display, enum pipe pipe_id,
 				   bool hide_sprite)
 {
 	igt_crtc_t *pipe = igt_crtc_for_pipe(display, pipe_id);
-	igt_plane_t *primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_t *sprite = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_OVERLAY);
+	igt_plane_t *primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_t *sprite = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_OVERLAY);
 
 	if (hide_sprite) {
 		igt_plane_set_fb(primary, prim_fb);
@@ -636,7 +636,7 @@ static void flip(igt_display_t *display,
 
 	if (mode == flip_test_atomic_transitions ||
 		mode == flip_test_atomic_transitions_varying_size) {
-		igt_require(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, flip_pipe),
+		igt_require(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, flip_pipe),
 						    DRM_PLANE_TYPE_OVERLAY));
 	}
 
diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index 818ebf32c2f0..77f5677fe69e 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -105,9 +105,9 @@ static void run_extendedmode_basic(data_t *data,
 	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
 
-	plane[0] = igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe1),
+	plane[0] = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe1),
 					   DRM_PLANE_TYPE_PRIMARY);
-	plane[1] = igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe2),
+	plane[1] = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe2),
 					   DRM_PLANE_TYPE_PRIMARY);
 
 	igt_plane_set_fb(plane[0], &fbs[0]);
@@ -161,10 +161,10 @@ static void run_extendedmode_basic(data_t *data,
 	igt_output_set_crtc(output1, NULL);
 	igt_output_set_crtc(output2, NULL);
 
-	igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe1),
+	igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe1),
 						 DRM_PLANE_TYPE_PRIMARY),
 			 NULL);
-	igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe2),
+	igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe2),
 						 DRM_PLANE_TYPE_PRIMARY),
 			 NULL);
 	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n");
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index f79fbb2cb2f3..6b3efef71818 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -79,7 +79,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 	igt_assert(pipe);
 
 	data->primary =
-		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(output, pipe);
 }
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 1df12aeab254..8f05a4f40e64 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -220,7 +220,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 4111a26b4c8b..6d45d041b5b4 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -909,7 +909,7 @@ static void invalid_create_leases(data_t *data)
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), -EINVAL);
 
 	/* sanity check */
-	object_ids[2] = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
+	object_ids[2] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
 						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_count = 3;
 	igt_assert_eq(create_lease(data->master.fd, &mcl, NULL), 0);
@@ -1076,7 +1076,7 @@ static int _create_simple_lease(int master_fd, data_t *data, int expected_ret)
 
 	object_ids[0] = igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
-	object_ids[2] = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
+	object_ids[2] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
 						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
 	mcl.object_count = 3;
@@ -1164,12 +1164,12 @@ static void implicit_plane_lease(data_t *data)
 	struct drm_mode_create_lease mcl;
 	struct drm_mode_get_lease mgl;
 	int ret;
-	uint32_t cursor_id = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
+	uint32_t cursor_id = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
 						     DRM_PLANE_TYPE_CURSOR)->drm_plane->plane_id;
 
 	object_ids[0] = igt_crtc_for_pipe(&data->master.display, 0)->crtc_id;
 	object_ids[1] = data->master.display.outputs[0].id;
-	object_ids[2] = igt_pipe_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
+	object_ids[2] = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->master.display, 0),
 						DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 	mcl.object_ids = (uint64_t) (uintptr_t) object_ids;
 	mcl.object_count = 3;
@@ -1302,7 +1302,7 @@ int igt_main()
 										 data.pipe)->crtc_id;
 						data.connector_id = output->id;
 						data.plane_id =
-							igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.master.display, data.pipe),
+							igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.master.display, data.pipe),
 										DRM_PLANE_TYPE_PRIMARY)->drm_plane->plane_id;
 						f->func(&data);
 					}
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 663e95db81b3..cfab18cc65c5 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -76,7 +76,7 @@ static void run_test(data_t *data, int valid_outputs)
 	/* Collect reference CRC by Committing individually on all outputs*/
 	for_each_connected_output(display, output) {
 		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
@@ -102,7 +102,7 @@ static void run_test(data_t *data, int valid_outputs)
 	/* Simultaneously commit on all outputs */
 	for_each_connected_output(display, output) {
 		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index cfb67861086a..a7070ac62169 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -214,7 +214,7 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
 	drmModeModeInfo *mode;
 	igt_display_t *display = &data->display;
 	int w, h;
-	igt_plane_t *primary = igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe),
+	igt_plane_t *primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe),
 						       DRM_PLANE_TYPE_PRIMARY);
 
 	/* create the pipe_crc object for this pipe */
@@ -388,7 +388,7 @@ static void constant_alpha_mid(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_crc_t ref_crc, crc;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
@@ -414,7 +414,7 @@ static void constant_alpha_max(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_crc_t ref_crc, crc;
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_plane_set_fb(plane, &data->argb_fb_100);
@@ -445,7 +445,7 @@ static void alpha_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_crc_t ref_crc = {}, crc = {};
 
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
@@ -500,7 +500,7 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 
 	/* Set a background color on the primary fb for testing */
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
+		igt_plane_set_fb(igt_crtc_get_plane_type(igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY),
 				 &data->gray_fb);
 
 	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index fcb7cea06c9e..9e2d59b80765 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -99,10 +99,10 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 
 	data->mode = igt_output_get_mode(data->output);
 
-	data->primary = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 	if (flags & TEST_OVERLAY)
-		data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
-	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+		data->overlay = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+	data->cursor = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
@@ -328,7 +328,7 @@ int igt_main()
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
 			for_each_pipe_with_single_output(&data.display, pipe, output) {
 				if ((tests[i].flags & TEST_OVERLAY) &&
-				    !igt_pipe_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
+				    !igt_crtc_get_plane_type(igt_crtc_for_pipe(&data.display, pipe),
 							     DRM_PLANE_TYPE_OVERLAY))
 					continue;
 
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 3ba709dd2cd0..32bb120cdfdd 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1029,11 +1029,11 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 	width = height = 20;
 	mode = igt_output_get_mode(output);
 
-	plane[0] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
+	plane[0] = igt_crtc_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
 	igt_require(plane[0]);
-	plane[1] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
+	plane[1] = igt_crtc_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
 	igt_require(plane[1]);
-	plane[2] = igt_pipe_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
+	plane[2] = igt_crtc_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
 	igt_require(plane[2]);
 
 	igt_create_fb(display->drm_fd,
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 774d011a0531..d4e0b519bbc4 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -147,7 +147,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_ATOMIC, 1);
 
-		igt_pipe_refresh(igt_crtc_for_pipe(&data->display, pipe),
+		igt_crtc_refresh(igt_crtc_for_pipe(&data->display, pipe),
 				 true);
 	} else {
 		igt_remove_fb(data->drm_fd, &fb);
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 6becc646d20a..e8eeaf95c64c 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -407,7 +407,7 @@ static void test_init(data_t *data, int conn_id)
 	igt_require_f(data->output, "No valid connectors found\n");
 
 	data->primary =
-		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
 			    igt_crtc_for_pipe(data->output->display, data->pipe_id));
-- 
2.52.0

