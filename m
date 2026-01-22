Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08FAD46952
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 13:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8B010E9A1;
	Thu, 22 Jan 2026 13:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFANASWz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB7C510E9AD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 13:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769086812; x=1800622812;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Mlwf81n8mX2wsfVbK5KNGCPOL4Xc0iuDprgj/05gBvY=;
 b=KFANASWzvJftYau9WTk2EWozPq5+IaLWcsnEo04DvnB8vfPtgMZ35kQS
 VN76+DZuK9kv1Dwp3KeeZXu5G4uLlHvRmB3flCc1UkjeEiiz60RVFjybO
 UGktrfJv8pmqDB1OnHShGmFkVx1L4D33/p/rk2DDewj9PkuW0TEezd7ZT
 gy66im0d/AuRs84ocpO7tLZH/S2XnWfNyn9ErouvIvKP2I4D+mmOm98vW
 rOObmmt5TSY4N6IKnZh0EWbDKenSMMp63HHHHzni+PZgmYEjl5pk49VPg
 jXE7e8B48nNnllCDcuEbKvnYgK4PfmrvH1oiuj5sDZEeI5lUVCTLGUKcq w==;
X-CSE-ConnectionGUID: wCiRfijsQDyJVqQw2NJRsw==
X-CSE-MsgGUID: xkook+QkR/ePxcGrLeBk3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81045372"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81045372"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:00:12 -0800
X-CSE-ConnectionGUID: sAm5TwjKR6miBEjM88Z2Xg==
X-CSE-MsgGUID: gz5C5ZrcSZe6p8WPkSNxuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237987457"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.38])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 05:00:09 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/10] lib/kms: Rename 'pipe' variables to 'crtc'
Date: Thu, 22 Jan 2026 14:59:34 +0200
Message-ID: <20260122125937.10807-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
References: <20260122125937.10807-1-ville.syrjala@linux.intel.com>
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

Rename a lot of the igt_crtc_t* variables to
'crtc' from the misleading 'pipe'/etc names they
are using currently.

Done with cocci (with manual fixup for docs):
 #include "scripts/iterators.cocci"

@@
typedef igt_crtc_t;
identifier CRTC !~ "crtc";
expression E;
@@
{...
(
 igt_crtc_t *
-       CRTC
+       crtc
        ;
|
 igt_crtc_t *
-       CRTC
+       crtc
        = E;
)
<...
- CRTC
+ crtc
...>
}

@@
identifier FUNC, CRTC !~ "crtc";
@@
FUNC(..., igt_crtc_t *
-       CRTC
+       crtc
        ,...)
{
<...
- CRTC
+ crtc
...>
}

@find_struct@
typedef igt_crtc_t;
type T;
identifier CRTC !~ "crtc";
@@
T {
       ...
       igt_crtc_t *
-               CRTC
+               crtc
                ;
        ...
};

@depends on find_struct@
identifier find_struct.CRTC;
find_struct.T S;
find_struct.T *P;
@@
(
- S.CRTC
+ S.crtc
|
- P->CRTC
+ P->crtc
)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

fixup docs
---
 lib/igt_kms.c                                 | 562 +++++++++---------
 lib/igt_kms.h                                 |  65 +-
 tests/amdgpu/amd_abm.c                        |   8 +-
 tests/amdgpu/amd_assr.c                       |   8 +-
 tests/amdgpu/amd_bypass.c                     |  16 +-
 tests/amdgpu/amd_color.c                      |  30 +-
 tests/amdgpu/amd_cursor_overlay.c             |  20 +-
 tests/amdgpu/amd_ilr.c                        |  10 +-
 tests/amdgpu/amd_link_settings.c              |   6 +-
 tests/amdgpu/amd_mall.c                       |  10 +-
 tests/amdgpu/amd_max_bpc.c                    |  10 +-
 tests/amdgpu/amd_mem_leak.c                   |   8 +-
 tests/amdgpu/amd_multidisplay_modeset.c       |  10 +-
 tests/amdgpu/amd_odm.c                        |   9 +-
 tests/amdgpu/amd_psr.c                        |  14 +-
 tests/amdgpu/amd_replay.c                     |   8 +-
 tests/chamelium/kms_chamelium_color.c         |   8 +-
 .../kms_chamelium_sharpness_filter.c          |   8 +-
 tests/intel/gem_pxp.c                         |  18 +-
 tests/intel/kms_big_fb.c                      |   8 +-
 tests/intel/kms_cdclk.c                       |   6 +-
 tests/intel/kms_flip_scaled_crc.c             |  10 +-
 tests/intel/kms_sharpness_filter.c            |  15 +-
 tests/intel/xe_pxp.c                          |  28 +-
 tests/kms_atomic.c                            | 233 +++++---
 tests/kms_atomic_transition.c                 |  33 +-
 tests/kms_color.c                             |   8 +-
 tests/kms_color_helper.c                      |  78 +--
 tests/kms_color_pipeline.c                    |  12 +-
 tests/kms_concurrent.c                        |  19 +-
 tests/kms_cursor_legacy.c                     |  16 +-
 tests/kms_dither.c                            |   8 +-
 tests/kms_hdr.c                               |  12 +-
 tests/kms_multipipe_modeset.c                 |  16 +-
 tests/kms_plane.c                             |  12 +-
 tests/kms_plane_cursor.c                      |  15 +-
 tests/kms_plane_multiple.c                    |  30 +-
 tests/kms_plane_scaling.c                     |  13 +-
 tools/amd_hdmi_compliance.c                   |   8 +-
 39 files changed, 755 insertions(+), 653 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 46acda0dfe8e..46751d19706b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -965,16 +965,17 @@ igt_atomic_fill_connector_props(igt_display_t *display, igt_output_t *output,
 }
 
 static void
-igt_fill_crtc_props(igt_crtc_t *pipe,
+igt_fill_crtc_props(igt_crtc_t *crtc,
 		    int num_crtc_props, const char * const crtc_prop_names[])
 {
-	igt_display_t *display = pipe->display;
+	igt_display_t *display = crtc->display;
 	drmModeObjectPropertiesPtr props;
 	int i, j, fd;
 
 	fd = display->drm_fd;
 
-	props = drmModeObjectGetProperties(fd, pipe->crtc_id, DRM_MODE_OBJECT_CRTC);
+	props = drmModeObjectGetProperties(fd, crtc->crtc_id,
+					   DRM_MODE_OBJECT_CRTC);
 	igt_assert(props);
 
 	for (i = 0; i < props->count_props; i++) {
@@ -985,7 +986,7 @@ igt_fill_crtc_props(igt_crtc_t *pipe,
 			if (strcmp(prop->name, crtc_prop_names[j]) != 0)
 				continue;
 
-			pipe->props[j] = props->props[i];
+			crtc->props[j] = props->props[i];
 			break;
 		}
 
@@ -995,7 +996,8 @@ igt_fill_crtc_props(igt_crtc_t *pipe,
 	drmModeFreeObjectProperties(props);
 }
 
-static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_crtc_t *pipe)
+static igt_plane_t *igt_get_assigned_primary(igt_output_t *output,
+					     igt_crtc_t *crtc)
 {
 	int drm_fd = output->display->drm_fd;
 	drmModeModeInfo *mode;
@@ -1011,7 +1013,7 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_crtc_t *p
 						DRM_FORMAT_MOD_LINEAR,
 						1.0, 1.0, 1.0, &fb);
 
-	crtc_id = pipe->crtc_id;
+	crtc_id = crtc->crtc_id;
 
 	/*
 	 * Do a legacy SETCRTC to start things off, so that we know that
@@ -1023,14 +1025,14 @@ static igt_plane_t *igt_get_assigned_primary(igt_output_t *output, igt_crtc_t *p
 	igt_assert(drmModeSetCrtc(output->display->drm_fd, crtc_id, fb.fb_id,
 							  0, 0, &output->id, 1, mode) == 0);
 
-	for(i = 0; i < pipe->n_planes; i++) {
-		if (pipe->planes[i].type != DRM_PLANE_TYPE_PRIMARY)
+	for(i = 0; i < crtc->n_planes; i++) {
+		if (crtc->planes[i].type != DRM_PLANE_TYPE_PRIMARY)
 			continue;
 
-		if (igt_plane_get_prop(&pipe->planes[i], IGT_PLANE_CRTC_ID) != crtc_id)
+		if (igt_plane_get_prop(&crtc->planes[i], IGT_PLANE_CRTC_ID) != crtc_id)
 			continue;
 
-		plane = &pipe->planes[i];
+		plane = &crtc->planes[i];
 		break;
 	}
 
@@ -2649,8 +2651,8 @@ void igt_output_refresh(igt_output_t *output)
 static int
 igt_plane_set_property(igt_plane_t *plane, uint32_t prop_id, uint64_t value)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
 	return drmModeObjectSetProperty(display->drm_fd, plane->drm_plane->plane_id,
 				 DRM_MODE_OBJECT_PLANE, prop_id, value);
@@ -2733,31 +2735,32 @@ static void igt_plane_reset(igt_plane_t *plane)
 	plane->gem_handle = 0;
 }
 
-static void igt_crtc_reset(igt_crtc_t *pipe)
+static void igt_crtc_reset(igt_crtc_t *crtc)
 {
-	igt_crtc_set_prop_value(pipe, IGT_CRTC_MODE_ID, 0);
-	igt_crtc_set_prop_value(pipe, IGT_CRTC_ACTIVE, 0);
-	igt_crtc_clear_prop_changed(pipe, IGT_CRTC_OUT_FENCE_PTR);
+	igt_crtc_set_prop_value(crtc, IGT_CRTC_MODE_ID, 0);
+	igt_crtc_set_prop_value(crtc, IGT_CRTC_ACTIVE, 0);
+	igt_crtc_clear_prop_changed(crtc, IGT_CRTC_OUT_FENCE_PTR);
 
-	if (igt_crtc_has_prop(pipe, IGT_CRTC_CTM))
-		igt_crtc_set_prop_value(pipe, IGT_CRTC_CTM, 0);
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_CTM))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_CTM, 0);
 
-	if (igt_crtc_has_prop(pipe, IGT_CRTC_GAMMA_LUT))
-		igt_crtc_set_prop_value(pipe, IGT_CRTC_GAMMA_LUT, 0);
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_GAMMA_LUT))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_GAMMA_LUT, 0);
 
-	if (igt_crtc_has_prop(pipe, IGT_CRTC_DEGAMMA_LUT))
-		igt_crtc_set_prop_value(pipe, IGT_CRTC_DEGAMMA_LUT, 0);
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_DEGAMMA_LUT))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_DEGAMMA_LUT, 0);
 
-	if (igt_crtc_has_prop(pipe, IGT_CRTC_SCALING_FILTER))
-		igt_crtc_set_prop_enum(pipe, IGT_CRTC_SCALING_FILTER, "Default");
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_SCALING_FILTER))
+		igt_crtc_set_prop_enum(crtc, IGT_CRTC_SCALING_FILTER,
+				       "Default");
 
-	if (igt_crtc_has_prop(pipe, IGT_CRTC_VRR_ENABLED))
-		igt_crtc_set_prop_value(pipe, IGT_CRTC_VRR_ENABLED, 0);
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_VRR_ENABLED))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_VRR_ENABLED, 0);
 
-	if (igt_crtc_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH))
-		igt_crtc_set_prop_value(pipe, IGT_CRTC_SHARPNESS_STRENGTH, 0);
+	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_SHARPNESS_STRENGTH, 0);
 
-	pipe->out_fence_fd = -1;
+	crtc->out_fence_fd = -1;
 }
 
 static void igt_output_reset(igt_output_t *output)
@@ -2831,13 +2834,13 @@ void igt_display_reset(igt_display_t *display)
 	display->first_commit = true;
 
 	for_each_pipe(display, pipe) {
-		igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 		igt_plane_t *plane;
 
 		for_each_plane_on_pipe(display, pipe, plane)
 			igt_plane_reset(plane);
 
-		igt_crtc_reset(pipe_obj);
+		igt_crtc_reset(crtc);
 	}
 
 	for (i = 0; i < display->n_outputs; i++) {
@@ -2869,13 +2872,13 @@ void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 
 /* Get crtc mask for a pipe using crtc id */
 static int
-__get_crtc_mask_for_pipe(drmModeRes *resources, igt_crtc_t *pipe)
+__get_crtc_mask_for_pipe(drmModeRes *resources, igt_crtc_t *crtc)
 {
 	int offset;
 
 	for (offset = 0; offset < resources->count_crtcs; offset++)
 	{
-		if(pipe->crtc_id == resources->crtcs[offset])
+		if(crtc->crtc_id == resources->crtcs[offset])
 			break;
 	}
 
@@ -3005,7 +3008,7 @@ void igt_display_reset_outputs(igt_display_t *display)
 	igt_display_reset(display);
 
 	for_each_pipe(display, i) {
-		igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
 		igt_output_t *output;
 
 		if (!igt_pipe_has_valid_output(display, i))
@@ -3013,10 +3016,10 @@ void igt_display_reset_outputs(igt_display_t *display)
 
 		output = igt_get_single_output_for_pipe(display, i);
 
-		if (pipe->num_primary_planes > 1) {
-			igt_plane_t *old_primary = &pipe->planes[0];
+		if (crtc->num_primary_planes > 1) {
+			igt_plane_t *old_primary = &crtc->planes[0];
 			igt_plane_t *new_primary =
-				igt_get_assigned_primary(output, pipe);
+				igt_get_assigned_primary(output, crtc);
 
 			/*
 			 * If the driver-assigned primary plane isn't at
@@ -3060,7 +3063,7 @@ static int plane_type_index(igt_crtc_t *crtc, int type)
 }
 
 static void igt_crtc_plane_init(igt_display_t *display,
-				igt_crtc_t *pipe,
+				igt_crtc_t *crtc,
 				drmModeRes *resources,
 				igt_plane_t *global_plane)
 {
@@ -3071,7 +3074,7 @@ static void igt_crtc_plane_init(igt_display_t *display,
 
 	switch (type) {
 	case DRM_PLANE_TYPE_PRIMARY:
-		pipe->num_primary_planes++;
+		crtc->num_primary_planes++;
 		break;
 	case DRM_PLANE_TYPE_CURSOR:
 		display->has_cursor_plane = true;
@@ -3080,24 +3083,24 @@ static void igt_crtc_plane_init(igt_display_t *display,
 		break;
 	}
 
-	index = plane_type_index(pipe, type);
+	index = plane_type_index(crtc, type);
 
-	if (index < 0 || pipe->planes[index].index >= 0) {
-		for (index = 1; index < pipe->n_planes; index++) {
-			if (pipe->planes[index].index < 0)
+	if (index < 0 || crtc->planes[index].index >= 0) {
+		for (index = 1; index < crtc->n_planes; index++) {
+			if (crtc->planes[index].index < 0)
 				break;
 		}
 	}
 
-	igt_assert_lt(index, pipe->n_planes);
+	igt_assert_lt(index, crtc->n_planes);
 
-	plane = &pipe->planes[index];
+	plane = &crtc->planes[index];
 
 	igt_assert_lt(plane->index, 0);
 
 	plane->index = index;
 	plane->type = type;
-	plane->crtc = pipe;
+	plane->crtc = crtc;
 	plane->drm_plane = drm_plane;
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->ref = global_plane;
@@ -3107,7 +3110,7 @@ static void igt_crtc_plane_init(igt_display_t *display,
 	 * it can go on.
 	 */
 	if (!global_plane->ref)
-		igt_plane_set_crtc(plane, pipe);
+		igt_plane_set_crtc(plane, crtc);
 
 	igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_prop_names);
 
@@ -3117,18 +3120,18 @@ static void igt_crtc_plane_init(igt_display_t *display,
 static void igt_crtc_init(igt_display_t *display,
 			  drmModeRes *resources, int i)
 {
-	igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
 	int crtc_mask = 0;
 	int j;
 
-	pipe->display = display;
-	pipe->planes = NULL;
-	pipe->num_primary_planes = 0;
+	crtc->display = display;
+	crtc->planes = NULL;
+	crtc->num_primary_planes = 0;
 
-	igt_fill_crtc_props(pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
+	igt_fill_crtc_props(crtc, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
 
 	/* Get valid crtc index from crtcs for a pipe */
-	crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
+	crtc_mask = __get_crtc_mask_for_pipe(resources, crtc);
 
 	/* count number of valid planes */
 	for (j = 0; j < display->n_planes; j++) {
@@ -3136,16 +3139,17 @@ static void igt_crtc_init(igt_display_t *display,
 		igt_assert(drm_plane);
 
 		if (drm_plane->possible_crtcs & crtc_mask)
-			pipe->n_planes++;
+			crtc->n_planes++;
 	}
 
-	igt_assert_lt(0, pipe->n_planes);
-	pipe->planes = calloc(pipe->n_planes, sizeof(igt_plane_t));
-	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
-		     pipe->n_planes);
+	igt_assert_lt(0, crtc->n_planes);
+	crtc->planes = calloc(crtc->n_planes, sizeof(igt_plane_t));
+	igt_assert_f(crtc->planes,
+		     "Failed to allocate memory for %d planes\n",
+		     crtc->n_planes);
 
-	for (j = 0; j < pipe->n_planes; j++)
-		pipe->planes[j].index = -1;
+	for (j = 0; j < crtc->n_planes; j++)
+		crtc->planes[j].index = -1;
 
 	/* add the planes that can be used with that pipe */
 	for (j = 0; j < display->n_planes; j++) {
@@ -3155,11 +3159,11 @@ static void igt_crtc_init(igt_display_t *display,
 		if (!(drm_plane->possible_crtcs & crtc_mask))
 			continue;
 
-		igt_crtc_plane_init(display, pipe, resources, global_plane);
+		igt_crtc_plane_init(display, crtc, resources, global_plane);
 	}
 
-	for (j = 0; j < pipe->n_planes; j++)
-		igt_assert_lte(0, pipe->planes[j].index);
+	for (j = 0; j < crtc->n_planes; j++)
+		igt_assert_lte(0, crtc->planes[j].index);
 }
 
 /**
@@ -3226,18 +3230,18 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     igt_display_n_crtcs(display));
 
 	for (i = 0; i < resources->count_crtcs; i++) {
-		igt_crtc_t *pipe;
+		igt_crtc_t *crtc;
 		int pipe_enum = (is_intel_dev)?
 			__intel_get_pipe_from_crtc_id(drm_fd,
 						      resources->crtcs[i], i) : i;
 
-		pipe = igt_crtc_for_pipe(display, pipe_enum);
-		pipe->pipe = pipe_enum;
+		crtc = igt_crtc_for_pipe(display, pipe_enum);
+		crtc->pipe = pipe_enum;
 
-		pipe->valid = true;
-		pipe->crtc_id = resources->crtcs[i];
+		crtc->valid = true;
+		crtc->crtc_id = resources->crtcs[i];
 		/* offset of a pipe in crtcs list */
-		pipe->crtc_offset = i;
+		crtc->crtc_offset = i;
 	}
 
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
@@ -3437,13 +3441,13 @@ void igt_modeset_disable_all_outputs(igt_display_t *display)
 
 }
 
-static void igt_crtc_fini(igt_crtc_t *pipe)
+static void igt_crtc_fini(igt_crtc_t *crtc)
 {
-	free(pipe->planes);
-	pipe->planes = NULL;
+	free(crtc->planes);
+	crtc->planes = NULL;
 
-	if (pipe->out_fence_fd != -1)
-		close(pipe->out_fence_fd);
+	if (crtc->out_fence_fd != -1)
+		close(crtc->out_fence_fd);
 }
 
 static void igt_output_fini(igt_output_t *output)
@@ -3553,58 +3557,58 @@ igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output)
 	return igt_crtc_for_pipe(display, pipe);
 }
 
-static igt_plane_t *igt_crtc_get_plane(igt_crtc_t *pipe, int plane_idx)
+static igt_plane_t *igt_crtc_get_plane(igt_crtc_t *crtc, int plane_idx)
 {
-	igt_require_f(plane_idx >= 0 && plane_idx < pipe->n_planes,
+	igt_require_f(plane_idx >= 0 && plane_idx < crtc->n_planes,
 		      "Valid pipe->planes plane_idx not found, plane_idx=%d n_planes=%d",
-		      plane_idx, pipe->n_planes);
+		      plane_idx, crtc->n_planes);
 
-	return &pipe->planes[plane_idx];
+	return &crtc->planes[plane_idx];
 }
 
 /**
  * igt_crtc_get_plane_type:
- * @pipe: Target pipe
+ * @crtc: Target CRTC
  * @plane_type: Cursor, primary or an overlay plane
  *
- * Finds a valid plane type for the given @pipe otherwise
- * it skips the test if the right combination of @pipe/@plane_type is not found
+ * Finds a valid plane type for the given @crtc otherwise
+ * it skips the test if the right combination of @crtc/@plane_type is not found
  *
  * Returns: A #igt_plane_t structure that matches the requested plane type
  */
-igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *pipe, int plane_type)
+igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crtc, int plane_type)
 {
-	int plane_idx = plane_type_index(pipe, plane_type);
+	int plane_idx = plane_type_index(crtc, plane_type);
 
 	if (plane_idx < 0) {
-		for (plane_idx = 0; plane_idx < pipe->n_planes; plane_idx++) {
-			if (pipe->planes[plane_idx].type == plane_type)
+		for (plane_idx = 0; plane_idx < crtc->n_planes; plane_idx++) {
+			if (crtc->planes[plane_idx].type == plane_type)
 				break;
 		}
 	}
 
-	igt_require_f(plane_idx >= 0 && plane_idx < pipe->n_planes,
+	igt_require_f(plane_idx >= 0 && plane_idx < crtc->n_planes,
 		      "Valid pipe->planes idx not found. plane_idx=%d plane_type=%d n_planes=%d\n",
-		      plane_idx, plane_type, pipe->n_planes);
+		      plane_idx, plane_type, crtc->n_planes);
 
-	return &pipe->planes[plane_idx];
+	return &crtc->planes[plane_idx];
 }
 
 /**
  * igt_crtc_count_plane_type:
- * @pipe: Target pipe
+ * @crtc: Target CRTC
  * @plane_type: Cursor, primary or an overlay plane
  *
- * Counts the number of planes of type @plane_type for the provided @pipe.
+ * Counts the number of planes of type @plane_type for the provided @crtc.
  *
  * Returns: The number of planes that match the requested plane type
  */
-int igt_crtc_count_plane_type(igt_crtc_t *pipe, int plane_type)
+int igt_crtc_count_plane_type(igt_crtc_t *crtc, int plane_type)
 {
 	int i, count = 0;
 
-	for(i = 0; i < pipe->n_planes; i++)
-		if (pipe->planes[i].type == plane_type)
+	for(i = 0; i < crtc->n_planes; i++)
+		if (crtc->planes[i].type == plane_type)
 			count++;
 
 	return count;
@@ -3612,25 +3616,25 @@ int igt_crtc_count_plane_type(igt_crtc_t *pipe, int plane_type)
 
 /**
  * igt_crtc_get_plane_type_index:
- * @pipe: Target pipe
+ * @crtc: Target CRTC
  * @plane_type: Cursor, primary or an overlay plane
  * @index: the index of the plane among planes of the same type
  *
- * Get the @index th plane of type @plane_type for the provided @pipe.
+ * Get the @index th plane of type @plane_type for the provided @crtc.
  *
  * Returns: The @index th plane that matches the requested plane type
  */
-igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
+igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *crtc, int plane_type,
 					   int index)
 {
 	int i, type_index = 0;
 
-	for(i = 0; i < pipe->n_planes; i++) {
-		if (pipe->planes[i].type != plane_type)
+	for(i = 0; i < crtc->n_planes; i++) {
+		if (crtc->planes[i].type != plane_type)
 			continue;
 
 		if (type_index == index)
-			return &pipe->planes[i];
+			return &crtc->planes[i];
 
 		type_index++;
 	}
@@ -3667,8 +3671,8 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
 
 	for (i = 0; i < igt_display_n_crtcs(display); i++) {
-		igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
-		if (pipe->valid)
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
+		if (crtc->valid)
 			full_pipe_mask |= (1 << i);
 	}
 
@@ -3744,15 +3748,15 @@ igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe p
 	return chosen_outputs[pipe];
 }
 
-static igt_output_t *igt_crtc_get_output(igt_crtc_t *pipe)
+static igt_output_t *igt_crtc_get_output(igt_crtc_t *crtc)
 {
-	igt_display_t *display = pipe->display;
+	igt_display_t *display = crtc->display;
 	int i;
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
 
-		if (output->pending_pipe == pipe->pipe)
+		if (output->pending_pipe == crtc->pipe)
 			return output;
 	}
 
@@ -3771,9 +3775,9 @@ static uint32_t igt_plane_get_fb_id(igt_plane_t *plane)
 }
 
 static bool
-igt_atomic_ignore_plane_prop(igt_crtc_t *pipe, uint32_t prop)
+igt_atomic_ignore_plane_prop(igt_crtc_t *crtc, uint32_t prop)
 {
-	igt_display_t *display = pipe->display;
+	igt_display_t *display = crtc->display;
 
 	switch (prop) {
 	case IGT_PLANE_COLOR_ENCODING:
@@ -3790,24 +3794,25 @@ igt_atomic_ignore_plane_prop(igt_crtc_t *pipe, uint32_t prop)
  * Add position and fb changes of a plane to the atomic property set
  */
 static void
-igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *pipe,
-	drmModeAtomicReq *req)
+igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *crtc,
+				drmModeAtomicReq *req)
 {
-	igt_display_t *display = pipe->display;
+	igt_display_t *display = crtc->display;
 	int i;
 
 	igt_assert(plane->drm_plane);
 
 	LOG(display,
 	    "populating plane data: %s.%d, fb %u\n",
-	    kmstest_pipe_name(pipe->pipe),
+	    kmstest_pipe_name(crtc->pipe),
 	    plane->index,
 	    igt_plane_get_fb_id(plane));
 
 	for (i = 0; i < IGT_NUM_PLANE_PROPS; i++) {
-		if (igt_atomic_ignore_plane_prop(pipe, i)) {
+		if (igt_atomic_ignore_plane_prop(crtc, i)) {
 			igt_debug("plane %s.%d: Ignoring property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-				   kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
+				   kmstest_pipe_name(crtc->pipe),
+				   plane->index, igt_plane_prop_names[i],
 				   plane->values[i], plane->values[i]);
 			continue;
 		}
@@ -3819,7 +3824,8 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *pipe,
 		igt_assert(plane->props[i]);
 
 		igt_debug("plane %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-			kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
+			kmstest_pipe_name(crtc->pipe), plane->index,
+			igt_plane_prop_names[i],
 			plane->values[i], plane->values[i]);
 
 		igt_assert_lt(0, drmModeAtomicAddProperty(req, plane->drm_plane->plane_id,
@@ -3832,16 +3838,16 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *pipe,
  * Add colorop properties
  */
 static void
-igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *pipe,
-	drmModeAtomicReq *req)
+igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
+				  drmModeAtomicReq *req)
 {
-	igt_display_t *display = pipe->display;
+	igt_display_t *display = crtc->display;
 	int i, next_val;
 
 	while (colorop) {
 		LOG(display,
 		    "populating colorop data: %s.%d\n",
-		    kmstest_pipe_name(pipe->pipe),
+		    kmstest_pipe_name(crtc->pipe),
 		    colorop->id);
 
 		for (i = 0; i < IGT_NUM_COLOROP_PROPS; i++) {
@@ -3852,7 +3858,8 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *pipe,
 			igt_assert(colorop->props[i]);
 
 			igt_debug("colorop %s.%d: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-				kmstest_pipe_name(pipe->pipe), colorop->id, igt_colorop_prop_names[i],
+				kmstest_pipe_name(crtc->pipe), colorop->id,
+				igt_colorop_prop_names[i],
 				colorop->values[i], colorop->values[i]);
 
 			igt_assert_lt(0, drmModeAtomicAddProperty(req, colorop->id,
@@ -3891,10 +3898,10 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *pipe,
  * tests that expect a specific error code).
  */
 static int igt_drm_plane_commit(igt_plane_t *plane,
-				igt_crtc_t *pipe,
+				igt_crtc_t *crtc,
 				bool fail_on_error)
 {
-	igt_display_t *display = pipe->display;
+	igt_display_t *display = crtc->display;
 	uint32_t fb_id, crtc_id;
 	int ret, i;
 	uint32_t src_x;
@@ -3913,12 +3920,12 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
 	igt_assert(plane->drm_plane);
 
 	fb_id = igt_plane_get_fb_id(plane);
-	crtc_id = pipe->crtc_id;
+	crtc_id = crtc->crtc_id;
 
 	if (setplane && fb_id == 0) {
 		LOG(display,
 		    "SetPlane pipe %s, plane %d, disabling\n",
-		    kmstest_pipe_name(pipe->pipe),
+		    kmstest_pipe_name(crtc->pipe),
 		    plane->index);
 
 		ret = drmModeSetPlane(display->drm_fd,
@@ -3947,7 +3954,7 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
 		LOG(display,
 		    "SetPlane %s.%d, fb %u, src = (%d, %d) "
 			"%ux%u dst = (%u, %u) %ux%u\n",
-		    kmstest_pipe_name(pipe->pipe),
+		    kmstest_pipe_name(crtc->pipe),
 		    plane->index,
 		    fb_id,
 		    src_x >> 16, src_y >> 16, src_w >> 16, src_h >> 16,
@@ -3973,7 +3980,8 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
 			continue;
 
 		LOG(display, "SetProp plane %s.%d \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-			kmstest_pipe_name(pipe->pipe), plane->index, igt_plane_prop_names[i],
+			kmstest_pipe_name(crtc->pipe), plane->index,
+			igt_plane_prop_names[i],
 			plane->values[i], plane->values[i]);
 
 		igt_assert(plane->props[i]);
@@ -3995,11 +4003,11 @@ static int igt_drm_plane_commit(igt_plane_t *plane,
  * code).
  */
 static int igt_cursor_commit_legacy(igt_plane_t *cursor,
-				    igt_crtc_t *pipe,
+				    igt_crtc_t *crtc,
 				    bool fail_on_error)
 {
-	igt_display_t *display = pipe->display;
-	uint32_t crtc_id = pipe->crtc_id;
+	igt_display_t *display = crtc->display;
+	uint32_t crtc_id = crtc->crtc_id;
 	int ret;
 
 	if (igt_plane_is_prop_changed(cursor, IGT_PLANE_FB_ID) ||
@@ -4008,14 +4016,14 @@ static int igt_cursor_commit_legacy(igt_plane_t *cursor,
 		if (cursor->gem_handle)
 			LOG(display,
 			    "SetCursor pipe %s, fb %u %dx%d\n",
-			    kmstest_pipe_name(pipe->pipe),
+			    kmstest_pipe_name(crtc->pipe),
 			    cursor->gem_handle,
 			    (unsigned)cursor->values[IGT_PLANE_CRTC_W],
 			    (unsigned)cursor->values[IGT_PLANE_CRTC_H]);
 		else
 			LOG(display,
 			    "SetCursor pipe %s, disabling\n",
-			    kmstest_pipe_name(pipe->pipe));
+			    kmstest_pipe_name(crtc->pipe));
 
 		ret = drmModeSetCursor(display->drm_fd, crtc_id,
 				       cursor->gem_handle,
@@ -4031,7 +4039,7 @@ static int igt_cursor_commit_legacy(igt_plane_t *cursor,
 
 		LOG(display,
 		    "MoveCursor pipe %s, (%d, %d)\n",
-		    kmstest_pipe_name(pipe->pipe),
+		    kmstest_pipe_name(crtc->pipe),
 		    x, y);
 
 		ret = drmModeMoveCursor(display->drm_fd, crtc_id, x, y);
@@ -4046,11 +4054,11 @@ static int igt_cursor_commit_legacy(igt_plane_t *cursor,
  * (setmode).
  */
 static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
-					   igt_crtc_t *pipe,
+					   igt_crtc_t *crtc,
 					   bool fail_on_error)
 {
 	struct igt_display *display = primary->crtc->display;
-	igt_output_t *output = igt_crtc_get_output(pipe);
+	igt_output_t *output = igt_crtc_get_output(crtc);
 	drmModeModeInfo *mode;
 	uint32_t fb_id, crtc_id;
 	int ret;
@@ -4059,7 +4067,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 	igt_assert((primary->values[IGT_PLANE_CRTC_X] == 0 && primary->values[IGT_PLANE_CRTC_Y] == 0));
 
 	/* nor rotated */
-	if (!pipe->display->first_commit)
+	if (!crtc->display->first_commit)
 		igt_assert(!igt_plane_is_prop_changed(primary, IGT_PLANE_ROTATION));
 
 	if (!igt_plane_is_prop_changed(primary, IGT_PLANE_FB_ID) &&
@@ -4067,7 +4075,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 	    !igt_crtc_is_prop_changed(primary->crtc, IGT_CRTC_MODE_ID))
 		return 0;
 
-	crtc_id = pipe->crtc_id;
+	crtc_id = crtc->crtc_id;
 	fb_id = output ? igt_plane_get_fb_id(primary) : 0;
 	if (fb_id)
 		mode = igt_output_get_mode(output);
@@ -4082,7 +4090,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 		    "%s: SetCrtc pipe %s, fb %u, src (%d, %d), "
 		    "mode %dx%d\n",
 		    igt_output_name(output),
-		    kmstest_pipe_name(pipe->pipe),
+		    kmstest_pipe_name(crtc->pipe),
 		    fb_id,
 		    src_x, src_y,
 		    mode->hdisplay, mode->vdisplay);
@@ -4097,7 +4105,7 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 	} else {
 		LOG(display,
 		    "SetCrtc pipe %s, disabling\n",
-		    kmstest_pipe_name(pipe->pipe));
+		    kmstest_pipe_name(crtc->pipe));
 
 		ret = drmModeSetCrtc(display->drm_fd,
 				     crtc_id,
@@ -4114,15 +4122,15 @@ static int igt_primary_plane_commit_legacy(igt_plane_t *primary,
 }
 
 static int igt_plane_fixup_rotation(igt_plane_t *plane,
-				    igt_crtc_t *pipe)
+				    igt_crtc_t *crtc)
 {
 	int ret;
 
 	if (!igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
 		return 0;
 
-	LOG(pipe->display, "Fixing up initial rotation pipe %s, plane %d\n",
-	    kmstest_pipe_name(pipe->pipe), plane->index);
+	LOG(crtc->display, "Fixing up initial rotation pipe %s, plane %d\n",
+	    kmstest_pipe_name(crtc->pipe), plane->index);
 
 	/* First try the easy case, can we change rotation without problems? */
 	ret = igt_plane_set_property(plane, plane->props[IGT_PLANE_ROTATION],
@@ -4131,9 +4139,9 @@ static int igt_plane_fixup_rotation(igt_plane_t *plane,
 		return 0;
 
 	/* Disable the plane, while we tinker with rotation */
-	ret = drmModeSetPlane(pipe->display->drm_fd,
+	ret = drmModeSetPlane(crtc->display->drm_fd,
 			      plane->drm_plane->plane_id,
-			      pipe->crtc_id, 0, /* fb_id */
+			      crtc->crtc_id, 0, /* fb_id */
 			      0, /* flags */
 			      0, 0, 0, 0, /* crtc_x, crtc_y, crtc_w, crtc_h */
 			      IGT_FIXED(0,0), IGT_FIXED(0,0), /* src_x, src_y */
@@ -4144,8 +4152,8 @@ static int igt_plane_fixup_rotation(igt_plane_t *plane,
 
 	/* For primary plane, fall back to disabling the crtc. */
 	if (ret) {
-		ret = drmModeSetCrtc(pipe->display->drm_fd,
-				     pipe->crtc_id, 0, 0, 0, NULL, 0, NULL);
+		ret = drmModeSetCrtc(crtc->display->drm_fd,
+				     crtc->crtc_id, 0, 0, 0, NULL, 0, NULL);
 
 		if (ret)
 			return ret;
@@ -4161,27 +4169,28 @@ static int igt_plane_fixup_rotation(igt_plane_t *plane,
  * which API is used to do the programming.
  */
 static int igt_plane_commit(igt_plane_t *plane,
-			    igt_crtc_t *pipe,
+			    igt_crtc_t *crtc,
 			    enum igt_commit_style s,
 			    bool fail_on_error)
 {
-	igt_plane_t *plane_primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_t *plane_primary = igt_crtc_get_plane_type(crtc,
+							     DRM_PLANE_TYPE_PRIMARY);
 
-	if (pipe->display->first_commit || (s == COMMIT_UNIVERSAL &&
-	     igt_plane_is_prop_changed(plane, IGT_PLANE_ROTATION))) {
+	if (crtc->display->first_commit || (s == COMMIT_UNIVERSAL &&
+					    igt_plane_is_prop_changed(plane, IGT_PLANE_ROTATION))) {
 		int ret;
 
-		ret = igt_plane_fixup_rotation(plane, pipe);
+		ret = igt_plane_fixup_rotation(plane, crtc);
 		CHECK_RETURN(ret, fail_on_error);
 	}
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR && s == COMMIT_LEGACY) {
-		return igt_cursor_commit_legacy(plane, pipe, fail_on_error);
+		return igt_cursor_commit_legacy(plane, crtc, fail_on_error);
 	} else if (plane == plane_primary && s == COMMIT_LEGACY) {
-		return igt_primary_plane_commit_legacy(plane, pipe,
+		return igt_primary_plane_commit_legacy(plane, crtc,
 						       fail_on_error);
 	} else {
-		return igt_drm_plane_commit(plane, pipe, fail_on_error);
+		return igt_drm_plane_commit(plane, crtc, fail_on_error);
 	}
 }
 
@@ -4205,7 +4214,7 @@ static bool is_atomic_prop(enum igt_atomic_crtc_properties prop)
  * further programming will take place, which may result in some changes
  * taking effect and others not taking effect.
  */
-static int igt_crtc_commit(igt_crtc_t *pipe,
+static int igt_crtc_commit(igt_crtc_t *crtc,
 			   enum igt_commit_style s,
 			   bool fail_on_error)
 {
@@ -4213,25 +4222,27 @@ static int igt_crtc_commit(igt_crtc_t *pipe,
 	int ret;
 
 	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++)
-		if (igt_crtc_is_prop_changed(pipe, i) &&
+		if (igt_crtc_is_prop_changed(crtc, i) &&
 		    !is_atomic_prop(i)) {
-			igt_assert(pipe->props[i]);
+			igt_assert(crtc->props[i]);
 
-			ret = drmModeObjectSetProperty(pipe->display->drm_fd,
-				pipe->crtc_id, DRM_MODE_OBJECT_CRTC,
-				pipe->props[i], pipe->values[i]);
+			ret = drmModeObjectSetProperty(crtc->display->drm_fd,
+						       crtc->crtc_id,
+						       DRM_MODE_OBJECT_CRTC,
+						       crtc->props[i],
+						       crtc->values[i]);
 
 			CHECK_RETURN(ret, fail_on_error);
 		}
 
-	for (i = 0; i < pipe->n_planes; i++) {
-		igt_plane_t *plane = &pipe->planes[i];
+	for (i = 0; i < crtc->n_planes; i++) {
+		igt_plane_t *plane = &crtc->planes[i];
 
 		/* skip planes that are handled by another pipe */
-		if (plane->ref->crtc != pipe)
+		if (plane->ref->crtc != crtc)
 			continue;
 
-		ret = igt_plane_commit(plane, pipe, s, fail_on_error);
+		ret = igt_plane_commit(plane, crtc, s, fail_on_error);
 		CHECK_RETURN(ret, fail_on_error);
 	}
 
@@ -4664,68 +4675,69 @@ igt_output_replace_prop_blob(igt_output_t *output, enum igt_atomic_connector_pro
 
 /**
  * igt_crtc_get_prop:
- * @pipe: Target pipe.
+ * @crtc: Target CRTC.
  * @prop: Property to return.
  *
- * Return current value on a pipe for a given property.
+ * Return current value on a CRTC for a given property.
  *
  * Returns: The value the property is set to, if this
  * is a blob, the blob id is returned. This can be passed
  * to drmModeGetPropertyBlob() to get the contents of the blob.
  */
-uint64_t igt_crtc_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
+uint64_t igt_crtc_get_prop(igt_crtc_t *crtc,
+			   enum igt_atomic_crtc_properties prop)
 {
-	igt_assert(igt_crtc_has_prop(pipe, prop));
+	igt_assert(igt_crtc_has_prop(crtc, prop));
 
-	return igt_mode_object_get_prop(pipe->display, DRM_MODE_OBJECT_CRTC,
-					pipe->crtc_id, pipe->props[prop]);
+	return igt_mode_object_get_prop(crtc->display, DRM_MODE_OBJECT_CRTC,
+					crtc->crtc_id, crtc->props[prop]);
 }
 
 /**
  * igt_crtc_try_prop_enum:
- * @pipe_obj: Target pipe object.
+ * @crtc: Target CRTC
  * @prop: Property to check.
  * @val: Value to set.
  *
- * Returns: False if the given @pipe_obj doesn't have the enum @prop or
+ * Returns: False if the given @crtc doesn't have the enum @prop or
  * failed to set the enum property @val else True.
  */
-bool igt_crtc_try_prop_enum(igt_crtc_t *pipe_obj,
+bool igt_crtc_try_prop_enum(igt_crtc_t *crtc,
 				enum igt_atomic_crtc_properties prop,
 				const char *val)
 {
-	igt_display_t *display = pipe_obj->display;
+	igt_display_t *display = crtc->display;
 	uint64_t uval;
 
-	igt_assert(pipe_obj->props[prop]);
+	igt_assert(crtc->props[prop]);
 
 	if (!igt_mode_object_get_prop_enum_value(display->drm_fd,
-						 pipe_obj->props[prop], val, &uval))
+						 crtc->props[prop], val, &uval))
 		return false;
 
-	igt_crtc_set_prop_value(pipe_obj, prop, uval);
+	igt_crtc_set_prop_value(crtc, prop, uval);
 	return true;
 }
 
 /**
  * igt_crtc_set_prop_enum:
- * @pipe_obj: Target pipe object.
+ * @crtc: Target CRTC
  * @prop: Property to check.
  * @val: Value to set.
  *
  * This function tries to set given enum property @prop value @val to
- * the given @pipe_obj, and terminate the execution if its failed.
+ * the given @crtc, and terminate the execution if its failed.
  */
-void igt_crtc_set_prop_enum(igt_crtc_t *pipe_obj,
+void igt_crtc_set_prop_enum(igt_crtc_t *crtc,
 				enum igt_atomic_crtc_properties prop,
 				const char *val)
 {
-	igt_assert(igt_crtc_try_prop_enum(pipe_obj, prop, val));
+	igt_assert(igt_crtc_try_prop_enum(crtc, prop, val));
 }
 
 /**
  * igt_crtc_replace_prop_blob:
- * @pipe: pipe to set property on.
+ * @crtc: CRTC to set property on
  * @prop: property for which the blob will be replaced.
  * @ptr: Pointer to contents for the property.
  * @length: Length of contents.
@@ -4740,10 +4752,12 @@ void igt_crtc_set_prop_enum(igt_crtc_t *pipe_obj,
  * it works better with legacy commit.
  */
 void
-igt_crtc_replace_prop_blob(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop, const void *ptr, size_t length)
+igt_crtc_replace_prop_blob(igt_crtc_t *crtc,
+			   enum igt_atomic_crtc_properties prop,
+			   const void *ptr, size_t length)
 {
-	igt_display_t *display = pipe->display;
-	uint64_t *blob = &pipe->values[prop];
+	igt_display_t *display = crtc->display;
+	uint64_t *blob = &crtc->values[prop];
 	uint32_t blob_id = 0;
 
 	if (*blob != 0)
@@ -4755,30 +4769,32 @@ igt_crtc_replace_prop_blob(igt_crtc_t *pipe, enum igt_atomic_crtc_properties pro
 						     ptr, length, &blob_id) == 0);
 
 	*blob = blob_id;
-	igt_crtc_set_prop_changed(pipe, prop);
+	igt_crtc_set_prop_changed(crtc, prop);
 }
 
 /*
  * Add crtc property changes to the atomic property set
  */
-static void igt_atomic_prepare_crtc_commit(igt_crtc_t *pipe_obj, drmModeAtomicReq *req)
+static void igt_atomic_prepare_crtc_commit(igt_crtc_t *crtc,
+					   drmModeAtomicReq *req)
 {
 	int i;
 
 	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++) {
-		if (!igt_crtc_is_prop_changed(pipe_obj, i))
+		if (!igt_crtc_is_prop_changed(crtc, i))
 			continue;
 
 		igt_debug("Pipe %s: Setting property \"%s\" to 0x%"PRIx64"/%"PRIi64"\n",
-			kmstest_pipe_name(pipe_obj->pipe), igt_crtc_prop_names[i],
-			pipe_obj->values[i], pipe_obj->values[i]);
+			kmstest_pipe_name(crtc->pipe), igt_crtc_prop_names[i],
+			crtc->values[i], crtc->values[i]);
 
-		igt_assert_lt(0, drmModeAtomicAddProperty(req, pipe_obj->crtc_id, pipe_obj->props[i], pipe_obj->values[i]));
+		igt_assert_lt(0,
+			      drmModeAtomicAddProperty(req, crtc->crtc_id, crtc->props[i], crtc->values[i]));
 	}
 
-	if (pipe_obj->out_fence_fd != -1) {
-		close(pipe_obj->out_fence_fd);
-		pipe_obj->out_fence_fd = -1;
+	if (crtc->out_fence_fd != -1) {
+		close(crtc->out_fence_fd);
+		crtc->out_fence_fd = -1;
 	}
 }
 
@@ -4825,26 +4841,27 @@ static int igt_atomic_commit(igt_display_t *display, uint32_t flags, void *user_
 	req = drmModeAtomicAlloc();
 
 	for_each_pipe(display, pipe) {
-		igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 		igt_plane_t *plane;
 
 		/*
 		 * Add CRTC Properties to the property set
 		 */
-		if (pipe_obj->changed)
-			igt_atomic_prepare_crtc_commit(pipe_obj, req);
+		if (crtc->changed)
+			igt_atomic_prepare_crtc_commit(crtc, req);
 
 		for_each_plane_on_pipe(display, pipe, plane) {
 			/* skip planes that are handled by another pipe */
-			if (plane->ref->crtc != pipe_obj)
+			if (plane->ref->crtc != crtc)
 				continue;
 
 			if (plane->changed)
-				igt_atomic_prepare_plane_commit(plane, pipe_obj, req);
+				igt_atomic_prepare_plane_commit(plane, crtc,
+								req);
 
 			if (plane->assigned_color_pipeline)
 				igt_atomic_prepare_colorop_commit(plane->assigned_color_pipeline,
-								  pipe_obj, req);
+								  crtc, req);
 		}
 
 	}
@@ -4876,23 +4893,25 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
 	enum pipe pipe;
 
 	for_each_pipe(display, pipe) {
-		igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+		igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 		igt_plane_t *plane;
 
 		if (s == COMMIT_ATOMIC) {
-			if (igt_crtc_is_prop_changed(pipe_obj, IGT_CRTC_OUT_FENCE_PTR))
-				igt_assert(pipe_obj->out_fence_fd >= 0);
+			if (igt_crtc_is_prop_changed(crtc, IGT_CRTC_OUT_FENCE_PTR))
+				igt_assert(crtc->out_fence_fd >= 0);
 
-			pipe_obj->values[IGT_CRTC_OUT_FENCE_PTR] = 0;
-			pipe_obj->changed = 0;
+			crtc->values[IGT_CRTC_OUT_FENCE_PTR] = 0;
+			crtc->changed = 0;
 		} else {
 			for (i = 0; i < IGT_NUM_CRTC_PROPS; i++)
 				if (!is_atomic_prop(i))
-					igt_crtc_clear_prop_changed(pipe_obj, i);
+					igt_crtc_clear_prop_changed(crtc, i);
 
 			if (s != COMMIT_UNIVERSAL) {
-				igt_crtc_clear_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
-				igt_crtc_clear_prop_changed(pipe_obj, IGT_CRTC_ACTIVE);
+				igt_crtc_clear_prop_changed(crtc,
+							    IGT_CRTC_MODE_ID);
+				igt_crtc_clear_prop_changed(crtc,
+							    IGT_CRTC_ACTIVE);
 			}
 		}
 
@@ -4979,10 +4998,10 @@ static int do_display_commit(igt_display_t *display,
 		ret = igt_atomic_commit(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	} else {
 		for_each_pipe(display, pipe) {
-			igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display,
+			igt_crtc_t *crtc = igt_crtc_for_pipe(display,
 								 pipe);
 
-			ret = igt_crtc_commit(pipe_obj, s, fail_on_error);
+			ret = igt_crtc_commit(crtc, s, fail_on_error);
 			if (ret)
 				break;
 		}
@@ -5269,18 +5288,20 @@ drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
  */
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
 {
-	igt_crtc_t *pipe = igt_output_get_driving_crtc(output);
+	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
 
 	if (mode)
 		output->override_mode = *mode;
 
 	output->use_override_mode = !!mode;
 
-	if (pipe) {
+	if (crtc) {
 		if (output->display->is_atomic)
-			igt_crtc_replace_prop_blob(pipe, IGT_CRTC_MODE_ID, igt_output_get_mode(output), sizeof(*mode));
+			igt_crtc_replace_prop_blob(crtc, IGT_CRTC_MODE_ID,
+						   igt_output_get_mode(output),
+						   sizeof(*mode));
 		else
-			igt_crtc_set_prop_changed(pipe, IGT_CRTC_MODE_ID);
+			igt_crtc_set_prop_changed(crtc, IGT_CRTC_MODE_ID);
 	}
 }
 
@@ -5326,12 +5347,12 @@ static const char *igt_crtc_name(igt_crtc_t *crtc)
 /**
  * igt_output_set_crtc:
  * @output: Target output for which the pipe is being set to
- * @pipe_obj: CRTC to set to
+ * @crtc: CRTC to set to
  *
  * This function sets a @crtc to a specific @output connector by
  * setting the CRTC_ID property of the @crtc.
  */
-void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
+void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *crtc)
 {
 	igt_display_t *display = output->display;
 	igt_crtc_t *old_crtc = NULL;
@@ -5342,8 +5363,8 @@ void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
 		old_crtc = igt_output_get_driving_crtc(output);
 
 	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
-	    igt_crtc_name(pipe_obj));
-	output->pending_pipe = pipe_obj ? pipe_obj->pipe : PIPE_NONE;
+	    igt_crtc_name(crtc));
+	output->pending_pipe = crtc ? crtc->pipe : PIPE_NONE;
 
 	if (old_crtc) {
 		igt_output_t *old_output;
@@ -5363,17 +5384,19 @@ void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj)
 	}
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID,
-				  pipe_obj ? pipe_obj->crtc_id : 0);
+				  crtc ? crtc->crtc_id : 0);
 
 	igt_output_refresh(output);
 
-	if (pipe_obj) {
+	if (crtc) {
 		if (display->is_atomic)
-			igt_crtc_replace_prop_blob(pipe_obj, IGT_CRTC_MODE_ID, igt_output_get_mode(output), sizeof(drmModeModeInfo));
+			igt_crtc_replace_prop_blob(crtc, IGT_CRTC_MODE_ID,
+						   igt_output_get_mode(output),
+						   sizeof(drmModeModeInfo));
 		else
-			igt_crtc_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
+			igt_crtc_set_prop_changed(crtc, IGT_CRTC_MODE_ID);
 
-		igt_crtc_set_prop_value(pipe_obj, IGT_CRTC_ACTIVE, 1);
+		igt_crtc_set_prop_value(crtc, IGT_CRTC_ACTIVE, 1);
 	}
 }
 
@@ -5485,7 +5508,7 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
 
 /**
  * igt_crtc_refresh:
- * @pipe_obj: CRTC to refresh
+ * @crtc: CRTC to refresh
  * @force: Should be set to true if mode_blob is no longer considered
  * to be valid, for example after doing an atomic commit during fork or closing display fd.
  *
@@ -5494,18 +5517,20 @@ bool igt_fit_modes_in_bw(igt_display_t *display)
  * a fork, or we just want to be sure the pipe is included
  * in the next commit.
  */
-void igt_crtc_refresh(igt_crtc_t *pipe_obj, bool force)
+void igt_crtc_refresh(igt_crtc_t *crtc, bool force)
 {
-	igt_display_t *display = pipe_obj->display;
+	igt_display_t *display = crtc->display;
 
 	if (force && display->is_atomic) {
-		igt_output_t *output = igt_crtc_get_output(pipe_obj);
+		igt_output_t *output = igt_crtc_get_output(crtc);
 
-		pipe_obj->values[IGT_CRTC_MODE_ID] = 0;
+		crtc->values[IGT_CRTC_MODE_ID] = 0;
 		if (output)
-			igt_crtc_replace_prop_blob(pipe_obj, IGT_CRTC_MODE_ID, igt_output_get_mode(output), sizeof(drmModeModeInfo));
+			igt_crtc_replace_prop_blob(crtc, IGT_CRTC_MODE_ID,
+						   igt_output_get_mode(output),
+						   sizeof(drmModeModeInfo));
 	} else
-		igt_crtc_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
+		igt_crtc_set_prop_changed(crtc, IGT_CRTC_MODE_ID);
 }
 
 /**
@@ -5521,12 +5546,12 @@ void igt_crtc_refresh(igt_crtc_t *pipe_obj, bool force)
  */
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
 {
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 
-	pipe = igt_output_get_driving_crtc(output);
-	igt_assert(pipe);
+	crtc = igt_output_get_driving_crtc(output);
+	igt_assert(crtc);
 
-	return igt_crtc_get_plane(pipe, plane_idx);
+	return igt_crtc_get_plane(crtc, plane_idx);
 }
 
 /**
@@ -5541,12 +5566,12 @@ igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
  */
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
 {
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 
-	pipe = igt_output_get_driving_crtc(output);
-	igt_assert(pipe);
+	crtc = igt_output_get_driving_crtc(output);
+	igt_assert(crtc);
 
-	return igt_crtc_get_plane_type(pipe, plane_type);
+	return igt_crtc_get_plane_type(crtc, plane_type);
 }
 
 /**
@@ -5560,10 +5585,10 @@ igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type)
  */
 int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 {
-	igt_crtc_t *pipe = igt_output_get_driving_crtc(output);
-	igt_assert(pipe);
+	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
+	igt_assert(crtc);
 
-	return igt_crtc_count_plane_type(pipe, plane_type);
+	return igt_crtc_count_plane_type(crtc, plane_type);
 }
 
 /**
@@ -5579,10 +5604,10 @@ int igt_output_count_plane_type(igt_output_t *output, int plane_type)
 igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
 					     int plane_type, int index)
 {
-	igt_crtc_t *pipe = igt_output_get_driving_crtc(output);
-	igt_assert(pipe);
+	igt_crtc_t *crtc = igt_output_get_driving_crtc(output);
+	igt_assert(crtc);
 
-	return igt_crtc_get_plane_type_index(pipe, plane_type, index);
+	return igt_crtc_get_plane_type_index(crtc, plane_type, index);
 }
 
 /**
@@ -5597,13 +5622,15 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
  */
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
-	LOG(display, "%s.%d: plane_set_fb(%d)\n", kmstest_pipe_name(pipe->pipe),
+	LOG(display, "%s.%d: plane_set_fb(%d)\n",
+	    kmstest_pipe_name(crtc->pipe),
 	    plane->index, fb ? fb->fb_id : 0);
 
-	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID, fb ? pipe->crtc_id : 0);
+	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_ID,
+				 fb ? crtc->crtc_id : 0);
 	igt_plane_set_prop_value(plane, IGT_PLANE_FB_ID, fb ? fb->fb_id : 0);
 
 	if (plane->type == DRM_PLANE_TYPE_CURSOR && fb)
@@ -5631,7 +5658,7 @@ void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb)
 		}
 
 		/* Hack to prioritize the plane on the pipe that last set fb */
-		igt_plane_set_crtc(plane, pipe);
+		igt_plane_set_crtc(plane, crtc);
 	} else {
 		igt_plane_set_size(plane, 0, 0);
 
@@ -5669,9 +5696,9 @@ void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd)
 /**
  * igt_plane_set_crtc:
  * @plane: Target plane pointer
- * @pipe: The pipe to assign the plane to
+ * @crtc: The CRTC to assign the plane to
  */
-void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *pipe)
+void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *crtc)
 {
 	/*
 	 * HACK: Point the global plane back to the local plane.
@@ -5679,7 +5706,7 @@ void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *pipe)
 	 * we're moving away from the single pipe per plane model.
 	 */
 	plane->ref->ref = plane;
-	plane->ref->crtc = pipe;
+	plane->ref->crtc = crtc;
 }
 
 /**
@@ -5693,11 +5720,11 @@ void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *pipe)
  */
 void igt_plane_set_position(igt_plane_t *plane, int x, int y)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_position(%d,%d)\n",
-	    kmstest_pipe_name(pipe->pipe), plane->index, x, y);
+	    kmstest_pipe_name(crtc->pipe), plane->index, x, y);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_X, x);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_Y, y);
@@ -5715,11 +5742,11 @@ void igt_plane_set_position(igt_plane_t *plane, int x, int y)
  */
 void igt_plane_set_size(igt_plane_t *plane, int w, int h)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_size (%dx%d)\n",
-	    kmstest_pipe_name(pipe->pipe), plane->index, w, h);
+	    kmstest_pipe_name(crtc->pipe), plane->index, w, h);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_W, w);
 	igt_plane_set_prop_value(plane, IGT_PLANE_CRTC_H, h);
@@ -5738,11 +5765,11 @@ void igt_plane_set_size(igt_plane_t *plane, int w, int h)
 void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 	uint32_t x, uint32_t y)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: fb_set_position(%d,%d)\n",
-	    kmstest_pipe_name(pipe->pipe), plane->index, x, y);
+	    kmstest_pipe_name(crtc->pipe), plane->index, x, y);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_X, IGT_FIXED(x, 0));
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_Y, IGT_FIXED(y, 0));
@@ -5762,11 +5789,11 @@ void igt_fb_set_position(struct igt_fb *fb, igt_plane_t *plane,
 void igt_fb_set_size(struct igt_fb *fb, igt_plane_t *plane,
 	uint32_t w, uint32_t h)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: fb_set_size(%dx%d)\n",
-	    kmstest_pipe_name(pipe->pipe), plane->index, w, h);
+	    kmstest_pipe_name(crtc->pipe), plane->index, w, h);
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_W, IGT_FIXED(w, 0));
 	igt_plane_set_prop_value(plane, IGT_PLANE_SRC_H, IGT_FIXED(h, 0));
@@ -5805,11 +5832,11 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation)
  */
 void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
 {
-	igt_crtc_t *pipe = plane->crtc;
-	igt_display_t *display = pipe->display;
+	igt_crtc_t *crtc = plane->crtc;
+	igt_display_t *display = crtc->display;
 
 	LOG(display, "%s.%d: plane_set_rotation(%s°)\n",
-	    kmstest_pipe_name(pipe->pipe),
+	    kmstest_pipe_name(crtc->pipe),
 	    plane->index, igt_plane_rotation_name(rotation));
 
 	igt_plane_set_prop_value(plane, IGT_PLANE_ROTATION, rotation);
@@ -5817,14 +5844,15 @@ void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation)
 
 /**
  * igt_crtc_request_out_fence:
- * @pipe: pipe which out fence will be requested for
+ * @crtc: CRTC which out fence will be requested for
  *
  * Marks this pipe for requesting an out fence at the next atomic commit
  * will contain the fd number of the out fence created by KMS.
  */
-void igt_crtc_request_out_fence(igt_crtc_t *pipe)
+void igt_crtc_request_out_fence(igt_crtc_t *crtc)
 {
-	igt_crtc_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)&pipe->out_fence_fd);
+	igt_crtc_set_prop_value(crtc, IGT_CRTC_OUT_FENCE_PTR,
+				(ptrdiff_t)&crtc->out_fence_fd);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index e1368cbc8d46..65ebb5a917ce 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -596,7 +596,7 @@ drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
-void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *pipe_obj);
+void igt_output_set_crtc(igt_output_t *output, igt_crtc_t *crtc);
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);
 int igt_output_count_plane_type(igt_output_t *output, int plane_type);
@@ -609,18 +609,18 @@ drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
 void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
 void igt_modeset_disable_all_outputs(igt_display_t *display);
 
-igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *pipe, int plane_type);
-int igt_crtc_count_plane_type(igt_crtc_t *pipe, int plane_type);
-igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *pipe, int plane_type,
+igt_plane_t *igt_crtc_get_plane_type(igt_crtc_t *crtc, int plane_type);
+int igt_crtc_count_plane_type(igt_crtc_t *crtc, int plane_type);
+igt_plane_t *igt_crtc_get_plane_type_index(igt_crtc_t *crtc, int plane_type,
 					   int index);
 bool output_is_internal_panel(igt_output_t *output);
 igt_output_t *igt_get_single_output_for_pipe(igt_display_t *display, enum pipe pipe);
 
-void igt_crtc_request_out_fence(igt_crtc_t *pipe);
+void igt_crtc_request_out_fence(igt_crtc_t *crtc);
 
 void igt_plane_set_fb(igt_plane_t *plane, struct igt_fb *fb);
 void igt_plane_set_fence_fd(igt_plane_t *plane, int fence_fd);
-void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *pipe);
+void igt_plane_set_crtc(igt_plane_t *plane, igt_crtc_t *crtc);
 void igt_plane_set_position(igt_plane_t *plane, int x, int y);
 void igt_plane_set_size(igt_plane_t *plane, int w, int h);
 void igt_plane_set_rotation(igt_plane_t *plane, igt_rotation_t rotation);
@@ -1044,87 +1044,88 @@ extern void igt_output_replace_prop_blob(igt_output_t *output,
 					 const void *ptr, size_t length);
 /**
  * igt_crtc_has_prop:
- * @pipe: Pipe to check.
+ * @crtc: CRTC to check.
  * @prop: Property to check.
  *
- * Check whether pipe supports a given property.
+ * Check whether CRTC supports a given property.
  *
  * Returns: True if the property is supported, otherwise false.
  */
 static inline bool
-igt_crtc_has_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
+igt_crtc_has_prop(igt_crtc_t *crtc, enum igt_atomic_crtc_properties prop)
 {
-	return pipe->props[prop];
+	return crtc->props[prop];
 }
 
-uint64_t igt_crtc_get_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop);
+uint64_t igt_crtc_get_prop(igt_crtc_t *crtc,
+			   enum igt_atomic_crtc_properties prop);
 
 /**
  * igt_crtc_is_prop_changed:
- * @pipe_obj: Pipe object to check.
+ * @crtc: CRTC to check.
  * @prop: Property to check.
  *
- * Check whether a given @prop changed for the @pipe_obj.
+ * Check whether a given @prop changed for the @crtc.
  */
-static inline bool igt_crtc_is_prop_changed(igt_crtc_t *pipe_obj,
+static inline bool igt_crtc_is_prop_changed(igt_crtc_t *crtc,
 						enum igt_atomic_crtc_properties prop)
 {
-	return pipe_obj->changed & (1 << prop);
+	return crtc->changed & (1 << prop);
 }
 
 /**
  * igt_crtc_set_prop_changed:
- * @pipe_obj: Pipe object to check.
+ * @crtc: CRTC to check.
  * @prop: Property to check.
  *
- * Sets the given @prop for the @pipe_obj.
+ * Sets the given @prop for the @crtc.
  */
-static inline void igt_crtc_set_prop_changed(igt_crtc_t *pipe_obj,
+static inline void igt_crtc_set_prop_changed(igt_crtc_t *crtc,
 						 enum igt_atomic_crtc_properties prop)
 {
-	pipe_obj->changed |= 1 << prop;
+	crtc->changed |= 1 << prop;
 }
 
 /**
  * igt_crtc_clear_prop_changed:
- * @pipe_obj: Pipe object to check.
+ * @crtc: CRRTC to check.
  * @prop: Property to check.
  *
- * Clears the given @prop for the @pipe_obj.
+ * Clears the given @prop for the @crtc.
  */
-static inline void igt_crtc_clear_prop_changed(igt_crtc_t *pipe_obj,
+static inline void igt_crtc_clear_prop_changed(igt_crtc_t *crtc,
 						   enum igt_atomic_crtc_properties prop)
 {
-	pipe_obj->changed &= ~(1 << prop);
+	crtc->changed &= ~(1 << prop);
 }
 
 /**
  * igt_crtc_set_prop_value:
- * @pipe_obj: Pipe object to check.
+ * @crtc: CRTC to check.
  * @prop: Property to check.
  * @value: Value to set.
  *
- * Sets the given @prop with the @value for the @pipe_obj.
+ * Sets the given @prop with the @value for the @crtc.
  */
-static inline void igt_crtc_set_prop_value(igt_crtc_t *pipe_obj,
+static inline void igt_crtc_set_prop_value(igt_crtc_t *crtc,
 					       enum igt_atomic_crtc_properties prop,
 					       uint64_t value)
 {
-	pipe_obj->values[prop] = value;
-	igt_crtc_set_prop_changed(pipe_obj, prop);
+	crtc->values[prop] = value;
+	igt_crtc_set_prop_changed(crtc, prop);
 }
 
-extern bool igt_crtc_try_prop_enum(igt_crtc_t *pipe,
+extern bool igt_crtc_try_prop_enum(igt_crtc_t *crtc,
 				       enum igt_atomic_crtc_properties prop,
 				       const char *val);
 
-extern void igt_crtc_set_prop_enum(igt_crtc_t *pipe,
+extern void igt_crtc_set_prop_enum(igt_crtc_t *crtc,
 				       enum igt_atomic_crtc_properties prop,
 				       const char *val);
-extern void igt_crtc_replace_prop_blob(igt_crtc_t *pipe,
+extern void igt_crtc_replace_prop_blob(igt_crtc_t *crtc,
 					   enum igt_atomic_crtc_properties prop,
 					   const void *ptr, size_t length);
-void igt_crtc_refresh(igt_crtc_t *pipe_obj, bool force);
+void igt_crtc_refresh(igt_crtc_t *crtc, bool force);
 
 void igt_enable_connectors(int drm_fd);
 void igt_reset_connectors(void);
diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index ab52c83e8f9c..c42436a536cb 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -42,7 +42,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	int drm_fd;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
@@ -131,7 +131,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -144,10 +144,10 @@ static void test_init(data_t *data)
 	kmstest_dump_mode(data->mode);
 
 	data->primary =
-		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		 igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
index 3c4ec0a86f17..fa87d0806b83 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -160,18 +160,18 @@ static bool get_internal_display_flag(data_t *data, igt_output_t *output)
 static void present_visual_pattern(data_t *data, igt_output_t *output)
 {
 	igt_plane_t *primary;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
 	igt_fb_t fb;
 
 	mode = igt_output_get_mode(output);
 	igt_assert(mode);
 
-	pipe = igt_crtc_for_pipe(&data->display, PIPE_A);
+	crtc = igt_crtc_for_pipe(&data->display, PIPE_A);
 	primary =
-		igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(output,
-			    pipe);
+			    crtc);
 
 	igt_create_fb(data->fd, mode->hdisplay, mode->vdisplay,
 			DRM_FORMAT_XRGB8888, 0, &fb);
diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
index 3924b84da736..61fc7c7c1a2f 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -35,7 +35,7 @@ typedef struct {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc_fb;
 	igt_crc_t crc_dprx;
@@ -65,7 +65,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -87,13 +87,13 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->width = data->mode->hdisplay;
 	data->height = data->mode->vdisplay;
@@ -359,9 +359,9 @@ static void bypass_8bpc_test(data_t *data)
 	 *   no regamma
 	 *   no CTM
 	 */
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, NULL, 0);
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_CTM, NULL, 0);
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_DEGAMMA_LUT, NULL, 0);
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_GAMMA_LUT, NULL, 0);
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_CTM, NULL, 0);
 
 	igt_plane_set_fb(data->primary, &fb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
index df418bfbe7c1..deec53d698fd 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -42,7 +42,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
@@ -159,7 +159,7 @@ static void set_degamma_lut(data_t *data, lut_t const *lut)
 	size_t size = lut ? sizeof(lut->data[0]) * lut->size : 0;
 	const void *ptr = lut ? lut->data : NULL;
 
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_DEGAMMA_LUT, ptr,
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_DEGAMMA_LUT, ptr,
 				       size);
 }
 
@@ -169,7 +169,7 @@ static void set_regamma_lut(data_t *data, lut_t const *lut)
 	size_t size = lut ? sizeof(lut->data[0]) * lut->size : 0;
 	const void *ptr = lut ? lut->data : NULL;
 
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_GAMMA_LUT, ptr,
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_GAMMA_LUT, ptr,
 				       size);
 }
 
@@ -180,7 +180,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -191,13 +191,13 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
@@ -228,10 +228,10 @@ static void test_crtc_linear_degamma(data_t *data)
 
 	test_init(data);
 
-	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
+	igt_require(igt_crtc_has_prop(data->crtc, IGT_CRTC_DEGAMMA_LUT));
 
 	data->degamma_lut_size =
-		igt_crtc_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
+		igt_crtc_get_prop(data->crtc, IGT_CRTC_DEGAMMA_LUT_SIZE);
 
 	lut_init(&lut_linear, data->degamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
@@ -275,10 +275,10 @@ static void test_crtc_linear_regamma(data_t *data)
 
 	test_init(data);
 
-	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
+	igt_require(igt_crtc_has_prop(data->crtc, IGT_CRTC_GAMMA_LUT));
 
 	data->regamma_lut_size =
-		igt_crtc_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
+		igt_crtc_get_prop(data->crtc, IGT_CRTC_GAMMA_LUT_SIZE);
 
 	lut_init(&lut_linear, data->regamma_lut_size);
 	lut_gen_linear(&lut_linear, 0xffff);
@@ -338,14 +338,14 @@ static void test_crtc_lut_accuracy(data_t *data)
 
 	test_init(data);
 
-	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
-	igt_require(igt_crtc_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
+	igt_require(igt_crtc_has_prop(data->crtc, IGT_CRTC_DEGAMMA_LUT));
+	igt_require(igt_crtc_has_prop(data->crtc, IGT_CRTC_GAMMA_LUT));
 
 	data->degamma_lut_size =
-		igt_crtc_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
+		igt_crtc_get_prop(data->crtc, IGT_CRTC_DEGAMMA_LUT_SIZE);
 
 	data->regamma_lut_size =
-		igt_crtc_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
+		igt_crtc_get_prop(data->crtc, IGT_CRTC_GAMMA_LUT_SIZE);
 
 	lut_init(&lut_degamma, data->degamma_lut_size);
 	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 5c7dcb197b44..76c3003ca432 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -68,7 +68,7 @@ typedef struct data {
 	igt_plane_t *cursor;
 	igt_plane_t *overlays[6];
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	igt_fb_t rgb_fb;
@@ -138,20 +138,24 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 
 	data->pipe_id = pipe_id;
 	data->available_overlay_planes = available_overlay_planes;
-	data->pipe = &data->display.crtcs[data->pipe_id];
+	data->crtc = &data->display.crtcs[data->pipe_id];
 	data->output = output;
 	data->mode = igt_output_get_mode(data->output);
-	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
-	data->cursor = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+	data->primary = igt_crtc_get_plane_type(data->crtc,
+						DRM_PLANE_TYPE_PRIMARY);
+	data->cursor = igt_crtc_get_plane_type(data->crtc,
+					       DRM_PLANE_TYPE_CURSOR);
 
 	if (flags & TEST_MAX_PLANES)
 		for (i = 0; i < available_overlay_planes - 1; i++)
-			data->overlays[i] = igt_crtc_get_plane_type_index(data->pipe,
-						DRM_PLANE_TYPE_OVERLAY, i);
+			data->overlays[i] = igt_crtc_get_plane_type_index(data->crtc,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  i);
 	if (flags & TEST_NO_AVAILABLE_PLANES)
 		for (i = 0; i < available_overlay_planes; i++)
-			data->overlays[i] = igt_crtc_get_plane_type_index(data->pipe,
-						DRM_PLANE_TYPE_OVERLAY, i);
+			data->overlays[i] = igt_crtc_get_plane_type_index(data->crtc,
+									  DRM_PLANE_TYPE_OVERLAY,
+									  i);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 861110bcc7c3..8404bb673205 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -41,7 +41,7 @@ typedef struct {
 	igt_plane_t *primary;
 	igt_output_t *output;
 	igt_fb_t fb;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc_dprx;
 	enum pipe pipe_id;
@@ -98,13 +98,13 @@ static void test_init(data_t *data, igt_output_t *output)
 
 	igt_require(data->pipe_id != PIPE_NONE);
 
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  AMDGPU_PIPE_CRC_SOURCE_DPRX);
 
 	igt_output_set_crtc(output,
-			    data->pipe);
+			    data->crtc);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 }
@@ -181,7 +181,7 @@ static void test_ilr_policy(data_t *data, igt_output_t *output)
 		/* Secondly check trained BW is sufficient.
 		 * If BW is insufficient, crc retrieving will timeout
 		 */
-		igt_wait_for_vblank_count(data->pipe, 10);
+		igt_wait_for_vblank_count(data->crtc, 10);
 
 		igt_pipe_crc_collect_crc(data->pipe_crc, &data->crc_dprx);
 		crc_str = igt_crc_to_string(&data->crc_dprx);
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 83d53ee54250..5975fbc782db 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -30,7 +30,7 @@ typedef struct
         igt_plane_t *primary;
         igt_output_t *output;
         igt_fb_t fb;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
         enum pipe pipe_id;
 	int connector_type;
 	int w, h;
@@ -100,10 +100,10 @@ static void test_init(data_t *data, igt_output_t *output)
 
 	igt_require(data->pipe_id != PIPE_NONE);
 
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_output_set_crtc(output,
-			    data->pipe);
+			    data->crtc);
 
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 }
diff --git a/tests/amdgpu/amd_mall.c b/tests/amdgpu/amd_mall.c
index 2c5345907d24..efc4766cc5a8 100644
--- a/tests/amdgpu/amd_mall.c
+++ b/tests/amdgpu/amd_mall.c
@@ -39,7 +39,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
@@ -62,7 +62,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -83,13 +83,13 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
index 46be469d9e13..f7ba4ee1f67d 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -30,7 +30,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_pipe_crc_t *pipe_crc_dither;
 	drmModeModeInfo *mode;
@@ -56,7 +56,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -80,13 +80,13 @@ static void test_init(data_t *data)
 				    data->output->name, 8);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
index 2897e6d82b12..1ad57c2b7588 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -32,7 +32,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
 	int fd;
@@ -47,7 +47,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -65,10 +65,10 @@ static void test_init(data_t *data)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_multidisplay_modeset.c b/tests/amdgpu/amd_multidisplay_modeset.c
index 0af235e77394..6ece43f95adc 100644
--- a/tests/amdgpu/amd_multidisplay_modeset.c
+++ b/tests/amdgpu/amd_multidisplay_modeset.c
@@ -153,15 +153,15 @@ static void test_init(struct data_t *data)
 
 	for_each_pipe(display, i) {
 		igt_output_t *output;
-		igt_crtc_t *pipes;
+		igt_crtc_t *crtc;
 
 		/* For each valid pipe, get one connected display.
 		 * This will let displays connected to MST hub be
 		 * tested
 		 */
 		output = igt_get_single_output_for_pipe(display, i);
-		pipes = igt_crtc_for_pipe(display, i);
-		data->primary[i] = igt_crtc_get_plane_type(pipes,
+		crtc = igt_crtc_for_pipe(display, i);
+		data->primary[i] = igt_crtc_get_plane_type(crtc,
 							   DRM_PLANE_TYPE_PRIMARY);
 		data->output[i] = output;
 
@@ -174,11 +174,11 @@ static void test_init(struct data_t *data)
 			ret = dpcd_read_byte(data->fd, output->config.connector,
 				DPCD_TEST_SINK_MISC, &dpcd_246h);
 			if (ret && ((dpcd_246h & 0x20) != 0x0))
-				data->pipe_crc_dprx[i] = igt_crtc_crc_new(pipes,
+				data->pipe_crc_dprx[i] = igt_crtc_crc_new(crtc,
 									  AMDGPU_PIPE_CRC_SOURCE_DPRX);
 		}
 
-		data->pipe_crc_otg[i] = igt_crtc_crc_new(pipes,
+		data->pipe_crc_otg[i] = igt_crtc_crc_new(crtc,
 							 IGT_PIPE_CRC_SOURCE_AUTO);
 		/* disable eDP PSR */
 		if (data->output[i]->config.connector->connector_type ==
diff --git a/tests/amdgpu/amd_odm.c b/tests/amdgpu/amd_odm.c
index b6a09b65f14b..0c332d5d4a12 100644
--- a/tests/amdgpu/amd_odm.c
+++ b/tests/amdgpu/amd_odm.c
@@ -23,7 +23,7 @@ struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	drmModeModeInfoPtr mode;
 	enum pipe pipe_id;
 	int fd;
@@ -49,7 +49,7 @@ static void test_init(struct data *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -76,9 +76,10 @@ static void test_init(struct data *data)
 		      data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB,
 		      "ODM Combine isn't supported on HDMI 1.x\n");
 
-	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(data->crtc,
+						DRM_PLANE_TYPE_PRIMARY);
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	igt_display_reset(display);
 }
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
index 9479e8cd3de4..736ce371c46f 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -56,7 +56,7 @@ typedef struct data {
 	igt_plane_t *cursor;
 	igt_plane_t *overlay;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_fb_t ov_fb[2];
 	igt_fb_t pm_fb[2];
@@ -172,7 +172,7 @@ static void test_init(data_t *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -185,19 +185,19 @@ static void test_init(data_t *data)
 	kmstest_dump_mode(data->mode);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
 	data->cursor =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_CURSOR);
 
 	data->overlay =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_OVERLAY);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index cd340fabc3a3..2cbd34248c25 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -21,7 +21,7 @@ struct test_data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb;
 	igt_fb_t ref_fb2;
@@ -62,7 +62,7 @@ static void test_init(struct test_data *data)
 
 	/* It doesn't matter which pipe we choose on amdpgu. */
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -75,10 +75,10 @@ static void test_init(struct test_data *data)
 	kmstest_dump_mode(data->mode);
 
 	data->primary =
-		 igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		 igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	data->w = data->mode->hdisplay;
 	data->h = data->mode->vdisplay;
diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 7de10cf74098..875dd5ff83af 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -450,16 +450,16 @@ prep_pipe(data_t *data, enum pipe p)
 
 static int test_setup(data_t *data, enum pipe p)
 {
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	int i = 0;
 
 	igt_display_reset(&data->display);
 	prep_pipe(data, p);
 
-	pipe = igt_crtc_for_pipe(&data->display, p);
-	igt_require(pipe->n_planes >= 0);
+	crtc = igt_crtc_for_pipe(&data->display, p);
+	igt_require(crtc->n_planes >= 0);
 
-	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 	/*
 	 * Prefer to run this test on HDMI connector if its connected, since on DP we
diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
index 14189687c29c..433a2d5c8dab 100644
--- a/tests/chamelium/kms_chamelium_sharpness_filter.c
+++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
@@ -177,15 +177,15 @@ static void test_t(data_t *data, igt_plane_t *primary,
 
 static int test_setup(data_t *data, enum pipe p)
 {
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	int i = 0;
 
 	igt_display_reset(&data->display);
 
-	pipe = igt_crtc_for_pipe(&data->display, p);
-	igt_require(pipe->n_planes >= 0);
+	crtc = igt_crtc_for_pipe(&data->display, p);
+	igt_require(crtc->n_planes >= 0);
 
-	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 	igt_assert(data->primary);
 
 	/*
diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index a3b4bc4d0b41..c094d18e5b10 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1204,7 +1204,7 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, protected_fb;
 	igt_plane_t *plane;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, new_crc;
 	int width = 0, height = 0, i = 0, ret;
@@ -1226,11 +1226,11 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	/* Do a modeset on all outputs */
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		crtc = igt_crtc_for_pipe(display, i);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
-				    pipe);
+				    crtc);
 
 		igt_plane_set_fb(plane, &ref_fb);
 		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
@@ -1244,12 +1244,12 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_output_get_driving_crtc(output);
-		pipe_crc = igt_crtc_crc_new(pipe,
+		crtc = igt_output_get_driving_crtc(output);
+		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
-		igt_output_set_crtc(output, pipe);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(crtc->pipe, output));
+		igt_output_set_crtc(output, crtc);
 
 		igt_plane_set_fb(plane, &ref_fb);
 		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index f6de287f57f2..415508213e55 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -376,7 +376,7 @@ static void prep_fb(data_t *data)
 
 static void set_c8_lut(data_t *data)
 {
-	igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, data->pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, data->pipe);
 	struct drm_color_lut *lut;
 	int i, lut_size = 256;
 
@@ -389,7 +389,7 @@ static void set_c8_lut(data_t *data)
 		lut[i].blue = ((i & 0x03) >> 0) * 0xffff / 0x3;
 	}
 
-	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut,
+	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_GAMMA_LUT, lut,
 				       lut_size * sizeof(lut[0]));
 
 	free(lut);
@@ -397,9 +397,9 @@ static void set_c8_lut(data_t *data)
 
 static void unset_lut(data_t *data)
 {
-	igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, data->pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, data->pipe);
 
-	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, NULL, 0);
+	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_GAMMA_LUT, NULL, 0);
 }
 
 static bool test_plane(data_t *data)
diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 36ce46a44f64..3ed6e88852e3 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -237,12 +237,12 @@ static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
 		     igt_output_t **valid_outputs, struct igt_fb fb)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *plane;
 
 	for (int i = 0; i < count; i++) {
-		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		crtc = igt_crtc_for_pipe(display, i);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		igt_output_override_mode(valid_outputs[i], &mode[i]);
 
diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index c2b1c0700499..61c88a1ee13e 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -685,12 +685,12 @@ static void free_fbs(data_t *data)
 
 static void set_lut(data_t *data, enum pipe pipe)
 {
-	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
 	struct drm_color_lut *lut;
 	drmModeCrtc *drm_crtc;
 	int i, lut_size;
 
-	drm_crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, crtc->crtc_id);
 	lut_size = drm_crtc->gamma_size;
 	drmModeFreeCrtc(drm_crtc);
 
@@ -709,7 +709,7 @@ static void set_lut(data_t *data, enum pipe pipe)
 		lut[i].blue = v;
 	}
 
-	igt_crtc_replace_prop_blob(pipe_obj, IGT_CRTC_GAMMA_LUT,
+	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_GAMMA_LUT,
 				       lut, sizeof(lut[0]) * lut_size);
 
 	free(lut);
@@ -717,9 +717,9 @@ static void set_lut(data_t *data, enum pipe pipe)
 
 static void clear_lut(data_t *data, enum pipe pipe)
 {
-	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
 
-	igt_crtc_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
+	igt_crtc_set_prop_value(crtc, IGT_CRTC_GAMMA_LUT, 0);
 }
 
 static void test_flip_to_scaled(data_t *data, uint32_t index,
diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 3bee950df95a..56eccf2dece0 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -157,7 +157,7 @@ typedef struct {
 	bool limited;
 	enum pipe pipe_id;
 	struct igt_fb fb[4];
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_display_t display;
 	igt_output_t *output;
 	igt_plane_t *plane[4];
@@ -338,7 +338,8 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	igt_pipe_crc_t *pipe_crc = NULL;
 	int ret;
 
-	data->plane[0] = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->plane[0] = igt_crtc_get_plane_type(data->crtc,
+						 DRM_PLANE_TYPE_PRIMARY);
 	igt_skip_on_f(!igt_plane_has_format_mod(data->plane[0], data->format, data->modifier),
 		      "No requested format/modifier on pipe %s\n", kmstest_pipe_name(data->pipe_id));
 
@@ -417,9 +418,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	cleanup(data);
 }
 
-static bool has_sharpness_filter(igt_crtc_t *pipe)
+static bool has_sharpness_filter(igt_crtc_t *crtc)
 {
-	return igt_crtc_has_prop(pipe, IGT_CRTC_SHARPNESS_STRENGTH);
+	return igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH);
 }
 
 static void
@@ -436,17 +437,17 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			data->output = output;
 			data->pipe_id = pipe;
-			data->pipe = igt_crtc_for_pipe(display, data->pipe_id);
+			data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
 			data->mode = igt_output_get_mode(data->output);
 
-			if (!has_sharpness_filter(data->pipe)) {
+			if (!has_sharpness_filter(data->crtc)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
 				kmstest_pipe_name(data->pipe_id));
 				continue;
 			}
 
 			igt_output_set_crtc(data->output,
-					    data->pipe);
+					    data->crtc);
 
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(data->output, NULL);
diff --git a/tests/intel/xe_pxp.c b/tests/intel/xe_pxp.c
index 6e3ef9275eb9..48a045e11c51 100644
--- a/tests/intel/xe_pxp.c
+++ b/tests/intel/xe_pxp.c
@@ -839,18 +839,18 @@ static void compare_crcs(int fd, igt_display_t *display, igt_fb_t *ref_fb, igt_f
 	igt_output_t *output;
 	drmModeModeInfo *mode;
 	igt_plane_t *plane;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t ref_crc, new_crc;
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_output_get_driving_crtc(output);
-		pipe_crc = igt_crtc_crc_new(pipe,
+		crtc = igt_output_get_driving_crtc(output);
+		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-		igt_require(igt_pipe_connector_valid(pipe->pipe, output));
-		igt_output_set_crtc(output, pipe);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		igt_require(igt_pipe_connector_valid(crtc->pipe, output));
+		igt_output_set_crtc(output, crtc);
 
 		commit_fb(display, plane, ref_fb, mode);
 		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
@@ -881,7 +881,7 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, pxp_fb;
 	igt_plane_t *plane;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	int width = 0, height = 0, i = 0;
 	uint32_t q;
 	uint32_t vm;
@@ -902,11 +902,11 @@ static void test_display_pxp_fb(int fd, igt_display_t *display)
 	/* Do a modeset on all outputs */
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		crtc = igt_crtc_for_pipe(display, i);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
-				    pipe);
+				    crtc);
 
 		commit_fb(display, plane, &ref_fb, mode);
 
@@ -938,7 +938,7 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb, pxp_fb;
 	igt_plane_t *plane;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	int width = 0, height = 0, i = 0;
 	uint32_t q;
 	uint32_t vm;
@@ -960,11 +960,11 @@ static void test_display_black_pxp_fb(int fd, igt_display_t *display)
 	/* Do a modeset on all outputs */
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
-		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		crtc = igt_crtc_for_pipe(display, i);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 		igt_require(igt_pipe_connector_valid(i, output));
 		igt_output_set_crtc(output,
-				    pipe);
+				    crtc);
 
 		igt_plane_set_fb(plane, &ref_fb);
 		igt_fb_set_size(&ref_fb, plane, mode->hdisplay, mode->vdisplay);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index f9e893e1a5b8..56848bde0213 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -113,7 +113,7 @@ static bool all_pipes = false;
 typedef struct {
 	igt_display_t display;
 	igt_plane_t *primary;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	int drm_fd;
 	igt_fb_t fb;
 } data_t;
@@ -224,7 +224,7 @@ static bool crtc_filter(enum igt_atomic_crtc_properties prop)
 	return true;
 }
 
-static void crtc_get_current_state(igt_crtc_t *pipe, uint64_t *values)
+static void crtc_get_current_state(igt_crtc_t *crtc, uint64_t *values)
 {
 	int i;
 
@@ -234,11 +234,11 @@ static void crtc_get_current_state(igt_crtc_t *pipe, uint64_t *values)
 			continue;
 		}
 
-		values[i] = igt_crtc_get_prop(pipe, i);
+		values[i] = igt_crtc_get_prop(crtc, i);
 	}
 }
 
-static void crtc_check_current_state(igt_crtc_t *pipe,
+static void crtc_check_current_state(igt_crtc_t *crtc,
 				     const uint64_t *pipe_values,
 				     const uint64_t *primary_values,
 				     enum kms_atomic_check_relax relax)
@@ -249,7 +249,7 @@ static void crtc_check_current_state(igt_crtc_t *pipe,
 	struct drm_mode_modeinfo *mode = NULL;
 
 	if (pipe_values[IGT_CRTC_MODE_ID]) {
-		mode_prop = drmModeGetPropertyBlob(pipe->display->drm_fd,
+		mode_prop = drmModeGetPropertyBlob(crtc->display->drm_fd,
 						   pipe_values[IGT_CRTC_MODE_ID]);
 		igt_assert(mode_prop);
 
@@ -258,10 +258,10 @@ static void crtc_check_current_state(igt_crtc_t *pipe,
 		mode = mode_prop->data;
 	}
 
-	drm_crtc = drmModeGetCrtc(pipe->display->drm_fd, pipe->crtc_id);
+	drm_crtc = drmModeGetCrtc(crtc->display->drm_fd, crtc->crtc_id);
 	igt_assert(drm_crtc);
 
-	igt_assert_eq_u32(drm_crtc->crtc_id, pipe->crtc_id);
+	igt_assert_eq_u32(drm_crtc->crtc_id, crtc->crtc_id);
 	igt_assert_eq_u32(drm_crtc->x, primary_values[IGT_PLANE_SRC_X] >> 16);
 	igt_assert_eq_u32(drm_crtc->y, primary_values[IGT_PLANE_SRC_Y] >> 16);
 
@@ -281,7 +281,7 @@ static void crtc_check_current_state(igt_crtc_t *pipe,
 		igt_assert(!mode_prop);
 	}
 
-	crtc_get_current_state(pipe, current_pipe_values);
+	crtc_get_current_state(crtc, current_pipe_values);
 
 	/*
 	 * Optionally relax the check for MODE_ID: using the legacy SetCrtc
@@ -291,7 +291,7 @@ static void crtc_check_current_state(igt_crtc_t *pipe,
 	if (relax & CRTC_RELAX_MODE && mode && current_pipe_values[IGT_CRTC_MODE_ID] &&
 	    current_pipe_values[IGT_CRTC_MODE_ID] != pipe_values[IGT_CRTC_MODE_ID]) {
 		drmModePropertyBlobRes *cur_prop =
-			drmModeGetPropertyBlob(pipe->display->drm_fd,
+			drmModeGetPropertyBlob(crtc->display->drm_fd,
 					       current_pipe_values[IGT_CRTC_MODE_ID]);
 
 		igt_assert(cur_prop);
@@ -309,17 +309,17 @@ static void crtc_check_current_state(igt_crtc_t *pipe,
 	drmModeFreePropertyBlob(mode_prop);
 }
 
-static void crtc_commit(igt_crtc_t *pipe, igt_plane_t *plane,
+static void crtc_commit(igt_crtc_t *crtc, igt_plane_t *plane,
 			enum igt_commit_style s,
 			enum kms_atomic_check_relax relax)
 {
-	igt_display_commit2(pipe->display, s);
+	igt_display_commit2(crtc->display, s);
 
-	crtc_check_current_state(pipe, pipe->values, plane->values, relax);
+	crtc_check_current_state(crtc, crtc->values, plane->values, relax);
 	plane_check_current_state(plane, plane->values, relax);
 }
 
-static void crtc_commit_atomic_flags_err(igt_crtc_t *pipe, igt_plane_t *plane,
+static void crtc_commit_atomic_flags_err(igt_crtc_t *crtc, igt_plane_t *plane,
 					 unsigned flags,
 					 enum kms_atomic_check_relax relax,
 					 int err)
@@ -327,12 +327,14 @@ static void crtc_commit_atomic_flags_err(igt_crtc_t *pipe, igt_plane_t *plane,
 	uint64_t current_pipe_values[IGT_NUM_CRTC_PROPS];
 	uint64_t current_plane_values[IGT_NUM_PLANE_PROPS];
 
-	crtc_get_current_state(pipe, current_pipe_values);
+	crtc_get_current_state(crtc, current_pipe_values);
 	plane_get_current_state(plane, current_plane_values);
 
-	igt_assert_eq(-err, igt_display_try_commit_atomic(pipe->display, flags, NULL));
+	igt_assert_eq(-err,
+		      igt_display_try_commit_atomic(crtc->display, flags, NULL));
 
-	crtc_check_current_state(pipe, current_pipe_values, current_plane_values, relax);
+	crtc_check_current_state(crtc, current_pipe_values,
+				 current_plane_values, relax);
 	plane_check_current_state(plane, current_plane_values, relax);
 }
 
@@ -632,25 +634,28 @@ static void plane_primary(data_t *data)
 	 * state is what we think it should be.
 	 */
 	igt_plane_set_fb(data->primary, &fb2);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/* Restore the primary plane and check the state matches the old. */
 	igt_plane_set_fb(data->primary, &data->fb);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Set the plane through the legacy CRTC/primary-plane API, and
 	 * verify through atomic.
 	 */
 	igt_plane_set_fb(data->primary, &data->fb);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Restore the plane to its original settings through the legacy CRTC
 	 * API, and verify through atomic.
 	 */
 	igt_plane_set_fb(data->primary, &data->fb);
-	crtc_commit(data->pipe, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
+	crtc_commit(data->crtc, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
 	/*
 	 * Set the plane through the universal setplane API, and
@@ -671,7 +676,7 @@ static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	plane_get_current_state(data->primary, old_plane_values);
-	crtc_get_current_state(data->pipe, old_crtc_values);
+	crtc_get_current_state(data->crtc, old_crtc_values);
 
 	igt_assert(!old_crtc_values[IGT_CRTC_MODE_ID]);
 
@@ -684,18 +689,19 @@ static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	/* check the state, should still be old state */
-	crtc_check_current_state(data->pipe, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
+	crtc_check_current_state(data->crtc, old_crtc_values,
+				 old_plane_values, ATOMIC_RELAX_NONE);
 	plane_check_current_state(data->primary, old_plane_values, ATOMIC_RELAX_NONE);
 
 	/*
 	 * Enable the plane through the legacy CRTC/primary-plane API, and
 	 * verify through atomic.
 	 */
-	crtc_commit(data->pipe, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
+	crtc_commit(data->crtc, data->primary, COMMIT_LEGACY, CRTC_RELAX_MODE);
 
 	/* Same for disable.. */
 	plane_get_current_state(data->primary, old_plane_values);
-	crtc_get_current_state(data->pipe, old_crtc_values);
+	crtc_get_current_state(data->crtc, old_crtc_values);
 
 	igt_plane_set_fb(data->primary, NULL);
 	igt_output_set_crtc(output, NULL);
@@ -707,11 +713,13 @@ static void test_only(data_t *data, igt_output_t *output, enum pipe pipe, uint32
 	kmstest_set_connector_dpms(output->display->drm_fd, output->config.connector, DRM_MODE_DPMS_ON);
 
 	/* check the state, should still be old state */
-	crtc_check_current_state(data->pipe, old_crtc_values, old_plane_values, ATOMIC_RELAX_NONE);
+	crtc_check_current_state(data->crtc, old_crtc_values,
+				 old_plane_values, ATOMIC_RELAX_NONE);
 	plane_check_current_state(data->primary, old_plane_values, ATOMIC_RELAX_NONE);
 
 	/* And disable the pipe and remove fb, test complete */
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 	igt_remove_fb(data->drm_fd, &fb);
 }
 
@@ -776,13 +784,15 @@ static void plane_invalid_params(data_t *data, igt_output_t *output)
 	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, data->primary->drm_plane->plane_id);
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, data->pipe->crtc_id);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID,
+				 data->crtc->crtc_id);
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, output->id);
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID, data->pipe->values[IGT_CRTC_MODE_ID]);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_FB_ID,
+				 data->crtc->values[IGT_CRTC_MODE_ID]);
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid, but invalid because CRTC_ID is set. */
@@ -802,7 +812,8 @@ static void plane_invalid_params(data_t *data, igt_output_t *output)
 	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, output->id);
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, data->pipe->values[IGT_CRTC_MODE_ID]);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID,
+				 data->crtc->values[IGT_CRTC_MODE_ID]);
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Valid, but invalid because FB_ID is set. */
@@ -845,7 +856,8 @@ static void plane_invalid_params_fence(data_t *data, igt_output_t *output)
 	plane_commit_atomic_err(data->primary, ATOMIC_RELAX_NONE, EINVAL);
 
 	sw_sync_timeline_inc(timeline, 1);
-	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID, data->pipe->crtc_id);
+	igt_plane_set_prop_value(data->primary, IGT_PLANE_CRTC_ID,
+				 data->crtc->crtc_id);
 	plane_commit(data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
 
 	close(fence_fd);
@@ -854,45 +866,60 @@ static void plane_invalid_params_fence(data_t *data, igt_output_t *output)
 
 static void crtc_invalid_params(data_t *data, igt_output_t *output)
 {
-	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
+	uint64_t old_mode_id = data->crtc->values[IGT_CRTC_MODE_ID];
 	drmModeModeInfo *mode = igt_output_get_mode(output);
 
 	/* Pass a series of invalid object IDs for the mode ID. */
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->primary->drm_plane->plane_id);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID,
+				data->primary->drm_plane->plane_id);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EINVAL);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->pipe->crtc_id);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID,
+				data->crtc->crtc_id);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EINVAL);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID, data->fb.fb_id);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EINVAL);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID, old_mode_id);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_ATOMIC_TEST_ONLY,
+				     ATOMIC_RELAX_NONE, 0);
 
 	/* Can we restore mode? */
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY, ATOMIC_RELAX_NONE, 0);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID, old_mode_id);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_ATOMIC_TEST_ONLY,
+				     ATOMIC_RELAX_NONE, 0);
 
 	/*
 	 * TEST_ONLY cannot be combined with DRM_MODE_PAGE_FLIP_EVENT,
 	 * but DRM_MODE_PAGE_FLIP_EVENT will always generate EINVAL
 	 * without valid crtc, so test it here.
 	 */
-	crtc_commit_atomic_flags_err(data->pipe, data->primary,
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
 				     DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* Create a blob which is the wrong size to be a valid mode. */
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) - 1);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_MODE_ID, mode,
+				   sizeof(*mode) - 1);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EINVAL);
 
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode) + 1);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EINVAL);
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_MODE_ID, mode,
+				   sizeof(*mode) + 1);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EINVAL);
 
 	/* Restore the CRTC and check the state matches the old. */
-	igt_crtc_replace_prop_blob(data->pipe, IGT_CRTC_MODE_ID, mode, sizeof(*mode));
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_crtc_replace_prop_blob(data->crtc, IGT_CRTC_MODE_ID, mode,
+				   sizeof(*mode));
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 }
 
 static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
@@ -900,7 +927,7 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	int timeline, fence_fd;
 	void *map;
 	const ptrdiff_t page_size = sysconf(_SC_PAGE_SIZE);
-	uint64_t old_mode_id = data->pipe->values[IGT_CRTC_MODE_ID];
+	uint64_t old_mode_id = data->crtc->values[IGT_CRTC_MODE_ID];
 
 	igt_require_sw_sync();
 
@@ -910,86 +937,101 @@ static void crtc_invalid_params_fence(data_t *data, igt_output_t *output)
 	map = mmap(NULL, page_size, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_OUT_FENCE_PTR,
+				(ptrdiff_t)map);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EFAULT);
 	munmap(map, page_size);
 
 	/* invalid out_fence_ptr */
 	map = mmap(NULL, page_size, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_OUT_FENCE_PTR,
+				(ptrdiff_t)map);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EFAULT);
 	munmap(map, page_size);
 
 	/* invalid out_fence_ptr */
 	map = mmap(NULL, page_size, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
-	crtc_commit_atomic_err(data->pipe, data->primary, ATOMIC_RELAX_NONE, EFAULT);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_OUT_FENCE_PTR,
+				(ptrdiff_t)map);
+	crtc_commit_atomic_err(data->crtc, data->primary, ATOMIC_RELAX_NONE,
+			       EFAULT);
 	munmap(map, page_size);
 
 	/* valid in fence but not allowed prop on crtc */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
 	igt_plane_set_fence_fd(data->primary, fence_fd);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 0);
-	igt_crtc_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_ACTIVE, 0);
+	igt_crtc_clear_prop_changed(data->crtc, IGT_CRTC_OUT_FENCE_PTR);
 
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0, ATOMIC_RELAX_NONE, EINVAL);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary, 0,
+				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* valid out fence ptr and flip event but not allowed prop on crtc */
-	igt_crtc_request_out_fence(data->pipe);
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
+	igt_crtc_request_out_fence(data->crtc);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* valid flip event but not allowed prop on crtc */
-	igt_crtc_request_out_fence(data->pipe);
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
+	igt_crtc_request_out_fence(data->crtc);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_ACTIVE, 1);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_ACTIVE, 1);
 
 	/* Configuration should be valid again */
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY,
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_ATOMIC_TEST_ONLY,
 				     ATOMIC_RELAX_NONE, 0);
 
 	/* Set invalid prop */
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, data->fb.fb_id);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID, data->fb.fb_id);
 
 	/* valid out fence but invalid prop on crtc */
-	igt_crtc_request_out_fence(data->pipe);
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, 0,
+	igt_crtc_request_out_fence(data->crtc);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary, 0,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* valid out fence ptr and flip event but invalid prop on crtc */
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* valid page flip event but invalid prop on crtc */
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_PAGE_FLIP_EVENT,
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_PAGE_FLIP_EVENT,
 				     ATOMIC_RELAX_NONE, EINVAL);
 
 	/* successful TEST_ONLY with fences set */
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_MODE_ID, old_mode_id);
-	crtc_commit_atomic_flags_err(data->pipe, data->primary, DRM_MODE_ATOMIC_TEST_ONLY,
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_MODE_ID, old_mode_id);
+	crtc_commit_atomic_flags_err(data->crtc, data->primary,
+				     DRM_MODE_ATOMIC_TEST_ONLY,
 				     ATOMIC_RELAX_NONE, 0);
-	igt_assert(data->pipe->out_fence_fd == -1);
+	igt_assert(data->crtc->out_fence_fd == -1);
 	close(fence_fd);
 	close(timeline);
 
 	/* reset fences */
 	igt_plane_set_fence_fd(data->primary, -1);
-	igt_crtc_set_prop_value(data->pipe, IGT_CRTC_OUT_FENCE_PTR, 0);
-	igt_crtc_clear_prop_changed(data->pipe, IGT_CRTC_OUT_FENCE_PTR);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_crtc_set_prop_value(data->crtc, IGT_CRTC_OUT_FENCE_PTR, 0);
+	igt_crtc_clear_prop_changed(data->crtc, IGT_CRTC_OUT_FENCE_PTR);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/* out fence ptr but not page flip event */
-	igt_crtc_request_out_fence(data->pipe);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	igt_crtc_request_out_fence(data->crtc);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
-	igt_assert(data->pipe->out_fence_fd != -1);
+	igt_assert(data->crtc->out_fence_fd != -1);
 }
 
 /*
@@ -1051,32 +1093,32 @@ static void atomic_invalid_params(data_t *data, igt_output_t *output)
 
 	/* Invalid object type (not a thing we can set properties on). */
 	ioc.count_objs = 1;
-	obj_raw[0] = data->pipe->values[IGT_CRTC_MODE_ID];
+	obj_raw[0] = data->crtc->values[IGT_CRTC_MODE_ID];
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	obj_raw[0] = data->fb.fb_id;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	/* Filled object but with no properties; no-op. */
 	for (i = 0; i < ARRAY_SIZE(obj_raw); i++)
-		obj_raw[i] = data->pipe->crtc_id;
+		obj_raw[i] = data->crtc->crtc_id;
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
 	/* Pass in all sorts of things other than the property ID. */
 	num_props_raw[0] = 1;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
-	props_raw[0] = data->pipe->crtc_id;
+	props_raw[0] = data->crtc->crtc_id;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	props_raw[0] = data->primary->drm_plane->plane_id;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 	props_raw[0] = output->id;
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
-	props_raw[0] = data->pipe->values[IGT_CRTC_MODE_ID];
+	props_raw[0] = data->crtc->values[IGT_CRTC_MODE_ID];
 	do_ioctl_err(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc, ENOENT);
 
 	/* Valid property, valid value. */
 	for (i = 0; i < ARRAY_SIZE(props_raw); i++) {
-		props_raw[i] = data->pipe->props[IGT_CRTC_MODE_ID];
-		values_raw[i] = data->pipe->values[IGT_CRTC_MODE_ID];
+		props_raw[i] = data->crtc->props[IGT_CRTC_MODE_ID];
+		values_raw[i] = data->crtc->values[IGT_CRTC_MODE_ID];
 	}
 	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ATOMIC, &ioc);
 
@@ -1150,7 +1192,8 @@ static void atomic_plane_damage(data_t *data)
 	 * state.
 	 */
 	igt_plane_set_fb(data->primary, &fb_1);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Change the color of top left clip from center and issue plane update
@@ -1170,7 +1213,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_plane_set_fb(data->primary, &fb_1);
 	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Change the color of top left and bottom right clip from center and
@@ -1197,7 +1241,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_plane_set_fb(data->primary, &fb_2);
 	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue plane update with damage with a clip outside of plane src.
@@ -1230,7 +1275,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
 	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue a plane update with damage with a clip that overlap with plane
@@ -1254,7 +1300,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
 	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage));
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue a plane update with damage with two clips one inside plane src
@@ -1285,7 +1332,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
 	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage) * 2);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/*
 	 * Issue a plane update with overlapping damage clips. White rect in
@@ -1318,7 +1366,8 @@ static void atomic_plane_damage(data_t *data)
 	igt_fb_set_size(&fb_1, data->primary, data->fb.width, data->fb.height);
 	igt_plane_replace_prop_blob(data->primary, IGT_PLANE_FB_DAMAGE_CLIPS, damage,
 				    sizeof(*damage) * 2);
-	crtc_commit(data->pipe, data->primary, COMMIT_ATOMIC, ATOMIC_RELAX_NONE);
+	crtc_commit(data->crtc, data->primary, COMMIT_ATOMIC,
+		    ATOMIC_RELAX_NONE);
 
 	/* Restore the primary plane */
 	igt_plane_set_fb(data->primary, &data->fb);
@@ -1337,7 +1386,7 @@ static void atomic_setup(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	data->primary = igt_crtc_get_plane_type(igt_crtc_for_pipe(&data->display, pipe),
 						DRM_PLANE_TYPE_PRIMARY);
-	data->pipe = igt_crtc_for_pipe(&data->display, pipe);
+	data->crtc = igt_crtc_for_pipe(&data->display, pipe);
 	mode = igt_output_get_mode(output);
 
 	igt_create_pattern_fb(data->drm_fd,
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index a89829987edd..f0598e486111 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -556,9 +556,9 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 {
 	drmModeModeInfo *mode, override_mode;
 	igt_plane_t *plane;
-	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
 	uint32_t iter_max, i;
-	struct plane_parms parms[pipe_obj->n_planes];
+	struct plane_parms parms[crtc->n_planes];
 	unsigned flags = 0;
 	int ret;
 
@@ -584,7 +584,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fbs[0]);
 
-	igt_output_set_crtc(output, pipe_obj);
+	igt_output_set_crtc(output, crtc);
 
 	wm_setup_plane(data, pipe, 0, NULL, false);
 
@@ -594,7 +594,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
 		igt_output_set_crtc(output,
-				    pipe_obj);
+				    crtc);
 	}
 
 	setup_parms(data, pipe, mode, &data->fbs[0], &data->argb_fb, &data->sprite_fb, parms, &iter_max);
@@ -610,12 +610,12 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 		wm_setup_plane(data, pipe, iter_max - 1, parms, false);
 
 		if (fencing)
-			igt_crtc_request_out_fence(pipe_obj);
+			igt_crtc_request_out_fence(crtc);
 
 		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 		igt_assert(!is_atomic_check_failure_errno(ret));
 
-		if (!is_atomic_check_plane_size_errno(ret) || pipe_obj->n_planes < 3)
+		if (!is_atomic_check_plane_size_errno(ret) || crtc->n_planes < 3)
 			break;
 
 		ret = 0;
@@ -645,8 +645,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 
 		atomic_commit(data, pipe, flags, (void *)(unsigned long)0, fencing);
 		if (fencing) {
-			fence_fd = pipe_obj->out_fence_fd;
-			pipe_obj->out_fence_fd = -1;
+			fence_fd = crtc->out_fence_fd;
+			crtc->out_fence_fd = -1;
 		}
 
 		/* force planes to be part of commit */
@@ -672,11 +672,11 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 
 		if (type == TRANSITION_MODESET_FAST &&
 		    n_enable_planes > 1 &&
-		    n_enable_planes < pipe_obj->n_planes)
+		    n_enable_planes < crtc->n_planes)
 			continue;
 
 		igt_output_set_crtc(output,
-				    pipe_obj);
+				    crtc);
 
 		if (!wm_setup_plane(data, pipe, i, parms, fencing))
 			continue;
@@ -701,7 +701,7 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
 
 				if (type == TRANSITION_MODESET_FAST &&
 				    n_enable_planes > 1 &&
-				    n_enable_planes < pipe_obj->n_planes)
+				    n_enable_planes < crtc->n_planes)
 					continue;
 
 				if (!wm_setup_plane(data, pipe, j, parms, fencing))
@@ -921,15 +921,16 @@ retry:
 				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &data->fbs[1]);
 
 	for_each_pipe(&data->display, i) {
-		igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, i);
-		igt_plane_t *plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, i);
+		igt_plane_t *plane = igt_crtc_get_plane_type(crtc,
+							     DRM_PLANE_TYPE_PRIMARY);
 		drmModeModeInfo *mode = NULL;
 
 		/* count enable pipes to set max iteration */
 		j += 1;
 
 		if (is_intel_device(data->drm_fd))
-			data->pipe_crcs[i] = igt_crtc_crc_new(pipe,
+			data->pipe_crcs[i] = igt_crtc_crc_new(crtc,
 							      IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_pipe(&data->display, i, output) {
@@ -937,7 +938,7 @@ retry:
 				continue;
 
 			igt_output_set_crtc(output,
-					    pipe);
+					    crtc);
 			if (intel_pipe_output_combo_valid(&data->display)) {
 				mode = igt_output_get_mode(output);
 
@@ -957,7 +958,7 @@ retry:
 			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 			if (fencing)
-				igt_crtc_request_out_fence(pipe);
+				igt_crtc_request_out_fence(crtc);
 		} else {
 			igt_plane_set_fb(plane, NULL);
 		}
diff --git a/tests/kms_color.c b/tests/kms_color.c
index 62b1c544301e..b2ca6975d6a5 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -732,15 +732,15 @@ prep_pipe(data_t *data, enum pipe p)
 
 static void test_setup(data_t *data, enum pipe p)
 {
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 
 	prep_pipe(data, p);
 	igt_require_pipe_crc(data->drm_fd);
 
-	pipe = igt_crtc_for_pipe(&data->display, p);
-	igt_require(pipe->n_planes >= 0);
+	crtc = igt_crtc_for_pipe(&data->display, p);
+	igt_require(crtc->n_planes >= 0);
 
-	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 	data->pipe_crc = igt_crtc_crc_new(data->primary->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
index 817c5eb110d5..554c1c72cbf6 100644
--- a/tests/kms_color_helper.c
+++ b/tests/kms_color_helper.c
@@ -220,31 +220,31 @@ struct drm_color_lut *coeffs_to_lut(data_t *data,
 }
 
 void set_degamma(data_t *data,
-		 igt_crtc_t *pipe,
+		 igt_crtc_t *crtc,
 		 const gamma_lut_t *gamma)
 {
 	size_t size = sizeof(struct drm_color_lut) * gamma->size;
 	struct drm_color_lut *lut = coeffs_to_lut(data, gamma,
 						  data->color_depth, 0);
 
-	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_DEGAMMA_LUT, lut, size);
+	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_DEGAMMA_LUT, lut, size);
 
 	free(lut);
 }
 
 void set_gamma(data_t *data,
-	       igt_crtc_t *pipe, const gamma_lut_t *gamma)
+	       igt_crtc_t *crtc, const gamma_lut_t *gamma)
 {
 	size_t size = sizeof(struct drm_color_lut) * gamma->size;
 	struct drm_color_lut *lut = coeffs_to_lut(data, gamma,
 						  data->color_depth, 0);
 
-	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_GAMMA_LUT, lut, size);
+	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_GAMMA_LUT, lut, size);
 
 	free(lut);
 }
 
-void set_ctm(igt_crtc_t *pipe, const double *coefficients)
+void set_ctm(igt_crtc_t *crtc, const double *coefficients)
 {
 	struct drm_color_ctm ctm;
 	int i;
@@ -261,21 +261,21 @@ void set_ctm(igt_crtc_t *pipe, const double *coefficients)
 				((int64_t) 1L << 32));
 	}
 
-	igt_crtc_replace_prop_blob(pipe, IGT_CRTC_CTM, &ctm, sizeof(ctm));
+	igt_crtc_replace_prop_blob(crtc, IGT_CRTC_CTM, &ctm, sizeof(ctm));
 }
 
-void disable_prop(igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
+void disable_prop(igt_crtc_t *crtc, enum igt_atomic_crtc_properties prop)
 {
-	if (igt_crtc_has_prop(pipe, prop))
-		igt_crtc_replace_prop_blob(pipe, prop, NULL, 0);
+	if (igt_crtc_has_prop(crtc, prop))
+		igt_crtc_replace_prop_blob(crtc, prop, NULL, 0);
 }
 
 drmModePropertyBlobPtr
-get_blob(data_t *data, igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
+get_blob(data_t *data, igt_crtc_t *crtc, enum igt_atomic_crtc_properties prop)
 {
 	uint64_t prop_value;
 
-	prop_value = igt_crtc_get_prop(pipe, prop);
+	prop_value = igt_crtc_get_prop(crtc, prop);
 
 	if (prop_value == 0)
 		return NULL;
@@ -284,34 +284,34 @@ get_blob(data_t *data, igt_crtc_t *pipe, enum igt_atomic_crtc_properties prop)
 }
 
 int
-pipe_set_property_blob_id(igt_crtc_t *pipe,
+pipe_set_property_blob_id(igt_crtc_t *crtc,
 			  enum igt_atomic_crtc_properties prop,
 			  uint32_t blob_id)
 {
 	int ret;
 
-	igt_crtc_replace_prop_blob(pipe, prop, NULL, 0);
+	igt_crtc_replace_prop_blob(crtc, prop, NULL, 0);
 
-	igt_crtc_set_prop_value(pipe, prop, blob_id);
+	igt_crtc_set_prop_value(crtc, prop, blob_id);
 
-	ret = igt_display_try_commit2(pipe->display,
-				      pipe->display->is_atomic ?
+	ret = igt_display_try_commit2(crtc->display,
+				      crtc->display->is_atomic ?
 				      COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	igt_crtc_set_prop_value(pipe, prop, 0);
+	igt_crtc_set_prop_value(crtc, prop, 0);
 
 	return ret;
 }
 
 int
-pipe_set_property_blob(igt_crtc_t *pipe,
+pipe_set_property_blob(igt_crtc_t *crtc,
 		       enum igt_atomic_crtc_properties prop,
 		       void *ptr, size_t length)
 {
-	igt_crtc_replace_prop_blob(pipe, prop, ptr, length);
+	igt_crtc_replace_prop_blob(crtc, prop, ptr, length);
 
-	return igt_display_try_commit2(pipe->display,
-				       pipe->display->is_atomic ?
+	return igt_display_try_commit2(crtc->display,
+				       crtc->display->is_atomic ?
 				       COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
@@ -320,11 +320,11 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 		  enum igt_atomic_crtc_properties prop, int size)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *pipe = igt_crtc_for_pipe(display, p);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	struct drm_color_lut *lut;
 	size_t lut_size = size * sizeof(lut[0]);
 
-	igt_require(igt_crtc_has_prop(pipe, prop));
+	igt_require(igt_crtc_has_prop(crtc, prop));
 
 	lut = malloc(lut_size * 2);
 
@@ -332,17 +332,17 @@ invalid_lut_sizes(data_t *data, enum pipe p,
 			    display->is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
 					     1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
 					     lut_size + 1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
 					     lut_size - 1), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, prop, lut,
+	igt_assert_eq(pipe_set_property_blob(crtc, prop, lut,
 					     lut_size + sizeof(struct drm_color_lut)), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, prop,
-						pipe->crtc_id), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, prop,
+	igt_assert_eq(pipe_set_property_blob_id(crtc, prop,
+						crtc->crtc_id), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob_id(crtc, prop,
 						4096 * 4096), -EINVAL);
 
 	free(lut);
@@ -363,27 +363,27 @@ invalid_degamma_lut_sizes(data_t *data, enum pipe p)
 void invalid_ctm_matrix_sizes(data_t *data, enum pipe p)
 {
 	igt_display_t *display = &data->display;
-	igt_crtc_t *pipe = igt_crtc_for_pipe(display, p);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, p);
 	void *ptr;
 
-	igt_require(igt_crtc_has_prop(pipe, IGT_CRTC_CTM));
+	igt_require(igt_crtc_has_prop(crtc, IGT_CRTC_CTM));
 
 	ptr = malloc(sizeof(struct drm_color_ctm) * 4);
 
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr, 1),
+	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr, 1),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr,
+	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
 					     sizeof(struct drm_color_ctm) + 1),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr,
+	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
 					     sizeof(struct drm_color_ctm) - 1),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob(pipe, IGT_CRTC_CTM, ptr,
+	igt_assert_eq(pipe_set_property_blob(crtc, IGT_CRTC_CTM, ptr,
 					     sizeof(struct drm_color_ctm) * 2),
 					     -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_CTM,
-						pipe->crtc_id), -EINVAL);
-	igt_assert_eq(pipe_set_property_blob_id(pipe, IGT_CRTC_CTM,
+	igt_assert_eq(pipe_set_property_blob_id(crtc, IGT_CRTC_CTM,
+						crtc->crtc_id), -EINVAL);
+	igt_assert_eq(pipe_set_property_blob_id(crtc, IGT_CRTC_CTM,
 						4096 * 4096), -EINVAL);
 
 	free(ptr);
diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index 9ee7288251fa..bf8c4734b5fd 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -48,17 +48,17 @@ static void test_cleanup(data_t *data)
 
 static void test_setup(data_t *data, enum pipe p)
 {
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 
 	igt_require_pipe_crc(data->drm_fd);
 
-	pipe = igt_crtc_for_pipe(&data->display, p);
-	igt_require(pipe);
-	igt_require(pipe->n_planes > 0);
+	crtc = igt_crtc_for_pipe(&data->display, p);
+	igt_require(crtc);
+	igt_require(crtc->n_planes > 0);
 
-	igt_output_set_crtc(data->output, pipe);
+	igt_output_set_crtc(data->output, crtc);
 
-	data->primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 	data->mode = igt_output_get_mode(data->output);
 	igt_require(data->mode);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 545bb93f9a9d..53768adcc614 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -158,7 +158,7 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	       igt_output_t *output)
 {
 	drmModeModeInfo *mode;
-	igt_crtc_t *p;
+	igt_crtc_t *crtc;
 	igt_plane_t *primary;
 	int *x;
 	int *y;
@@ -169,16 +169,19 @@ prepare_planes(data_t *data, enum pipe pipe, int max_planes,
 	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	p = primary->crtc;
+	crtc = primary->crtc;
 
-	x = malloc(p->n_planes * sizeof(*x));
-	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n", (long int) (p->n_planes * sizeof(*x)));
+	x = malloc(crtc->n_planes * sizeof(*x));
+	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
+		     (long int) (crtc->n_planes * sizeof(*x)));
 
-	y = malloc(p->n_planes * sizeof(*y));
-	igt_assert_f(y, "Failed to allocate %ld bytes for variable y\n", (long int) (p->n_planes * sizeof(*y)));
+	y = malloc(crtc->n_planes * sizeof(*y));
+	igt_assert_f(y, "Failed to allocate %ld bytes for variable y\n",
+		     (long int) (crtc->n_planes * sizeof(*y)));
 
-	size = malloc(p->n_planes * sizeof(*size));
-	igt_assert_f(size, "Failed to allocate %ld bytes for variable size\n", (long int) (p->n_planes * sizeof(*size)));
+	size = malloc(crtc->n_planes * sizeof(*size));
+	igt_assert_f(size, "Failed to allocate %ld bytes for variable size\n",
+		     (long int) (crtc->n_planes * sizeof(*size)));
 
 	mode = igt_output_get_mode(output);
 
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index a3499b246c90..da7225c45e65 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -471,15 +471,17 @@ find_connected_pipe(igt_display_t *display, bool second, igt_output_t **output)
 
 static void flip_nonblocking(igt_display_t *display, enum pipe pipe_id, bool atomic, struct igt_fb *fb, void *data)
 {
-	igt_crtc_t *pipe = igt_crtc_for_pipe(display, pipe_id);
-	igt_plane_t *primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
+	igt_plane_t *primary = igt_crtc_get_plane_type(crtc,
+						       DRM_PLANE_TYPE_PRIMARY);
 	int ret;
 
 	igt_set_timeout(5, "Scheduling page flip\n");
 	if (!atomic) {
 		/* Schedule a nonblocking flip for the next vblank */
 		do {
-			ret = drmModePageFlip(display->drm_fd, pipe->crtc_id, fb->fb_id,
+			ret = drmModePageFlip(display->drm_fd, crtc->crtc_id,
+					      fb->fb_id,
 					      DRM_MODE_PAGE_FLIP_EVENT, data);
 		} while (ret == -EBUSY);
 	} else {
@@ -535,9 +537,11 @@ static void transition_nonblocking(igt_display_t *display, enum pipe pipe_id,
 				   struct igt_fb *prim_fb, struct igt_fb *argb_fb,
 				   bool hide_sprite)
 {
-	igt_crtc_t *pipe = igt_crtc_for_pipe(display, pipe_id);
-	igt_plane_t *primary = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_t *sprite = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_OVERLAY);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe_id);
+	igt_plane_t *primary = igt_crtc_get_plane_type(crtc,
+						       DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_t *sprite = igt_crtc_get_plane_type(crtc,
+						      DRM_PLANE_TYPE_OVERLAY);
 
 	if (hide_sprite) {
 		igt_plane_set_fb(primary, prim_fb);
diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index 6b3efef71818..6baab2436634 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -74,14 +74,14 @@ typedef struct {
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 {
-	igt_crtc_t *pipe = igt_crtc_for_pipe(&data->display, p);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, p);
 
-	igt_assert(pipe);
+	igt_assert(crtc);
 
 	data->primary =
-		igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
-	igt_output_set_crtc(output, pipe);
+	igt_output_set_crtc(output, crtc);
 }
 
 /* Returns the current state of dithering from the crtc debugfs. */
diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index f4c88bc04ab7..2e9751eca172 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -111,7 +111,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	enum pipe pipe_id;
@@ -208,8 +208,8 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_display_t *display = &data->display;
 
 	data->pipe_id = pipe;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
-	igt_assert(data->pipe);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	igt_assert(data->crtc);
 
 	igt_display_reset(display);
 
@@ -220,13 +220,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	igt_assert(data->mode);
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 
 	data->w = data->mode->hdisplay;
diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 8270f6e12ec5..1980a0c61116 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -55,7 +55,7 @@ static void run_test(data_t *data, int valid_outputs)
 	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
 	igt_display_t *display = &data->display;
 	uint16_t width = 0, height = 0;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *plane;
 	drmModeModeInfo *mode;
 	int i = 0;
@@ -75,16 +75,16 @@ static void run_test(data_t *data, int valid_outputs)
 
 	/* Collect reference CRC by Committing individually on all outputs*/
 	for_each_connected_output(display, output) {
-		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		crtc = igt_crtc_for_pipe(display, i);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
-		pipe_crcs[i] = igt_crtc_crc_new(pipe,
+		pipe_crcs[i] = igt_crtc_crc_new(crtc,
 						IGT_PIPE_CRC_SOURCE_AUTO);
 
 		igt_output_set_crtc(output,
-				    pipe);
+				    crtc);
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
@@ -101,13 +101,13 @@ static void run_test(data_t *data, int valid_outputs)
 	i = 0;
 	/* Simultaneously commit on all outputs */
 	for_each_connected_output(display, output) {
-		pipe = igt_crtc_for_pipe(display, i);
-		plane = igt_crtc_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		crtc = igt_crtc_for_pipe(display, i);
+		plane = igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
 		igt_output_set_crtc(output,
-				    pipe);
+				    crtc);
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index d1c7b06fd4ee..ca93302e049f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -522,12 +522,12 @@ static const color_t colors_reduced[] = {
 static void set_legacy_lut(data_t *data, enum pipe pipe,
 			   uint16_t mask)
 {
-	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *lut;
 	int i, lut_size;
 
-	drm_crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, crtc->crtc_id);
 	lut_size = drm_crtc->gamma_size;
 	drmModeFreeCrtc(drm_crtc);
 
@@ -540,7 +540,7 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 	for (i = 0; i < lut_size; i++)
 		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
 
-	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, crtc->crtc_id,
 					  lut_size, lut, lut, lut), 0);
 
 	free(lut);
@@ -549,12 +549,12 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
 static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 			      uint16_t mask)
 {
-	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(&data->display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(&data->display, pipe);
 	drmModeCrtc *drm_crtc;
 	uint16_t *r, *g, *b;
 	int i, lut_size;
 
-	drm_crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
+	drm_crtc = drmModeGetCrtc(data->drm_fd, crtc->crtc_id);
 	lut_size = drm_crtc->gamma_size;
 	drmModeFreeCrtc(drm_crtc);
 
@@ -572,7 +572,7 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 		b[i] = (((i & 0x03) >> 0) * 0xffff / 0x3) & mask;
 	}
 
-	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
+	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, crtc->crtc_id,
 					  lut_size, r, g, b), 0);
 
 	free(r);
diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 23febe05a473..60e757fc701b 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -75,7 +75,7 @@ typedef struct data {
 	igt_plane_t *overlay;
 	igt_plane_t *cursor;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	igt_fb_t ref_fb;
@@ -94,21 +94,24 @@ static void test_init(data_t *data, enum pipe pipe_id, igt_output_t *output,
 		      unsigned int flags)
 {
 	data->pipe_id = pipe_id;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 	data->output = output;
 
 	data->mode = igt_output_get_mode(data->output);
 
-	data->primary = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+	data->primary = igt_crtc_get_plane_type(data->crtc,
+						DRM_PLANE_TYPE_PRIMARY);
 	if (flags & TEST_OVERLAY)
-		data->overlay = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
-	data->cursor = igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
+		data->overlay = igt_crtc_get_plane_type(data->crtc,
+							DRM_PLANE_TYPE_OVERLAY);
+	data->cursor = igt_crtc_get_plane_type(data->crtc,
+					       DRM_PLANE_TYPE_CURSOR);
 
 	igt_info("Using (pipe %s + %s) to run the subtest.\n",
 		 kmstest_pipe_name(data->pipe_id), igt_output_name(data->output));
 
 	igt_require_pipe_crc(data->drm_fd);
-	data->pipe_crc = igt_crtc_crc_new(data->pipe,
+	data->pipe_crc = igt_crtc_crc_new(data->crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
 	/* Overlay rectangle for a rect in the center of the screen */
diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
index 071f457af8da..fd2293a6c742 100644
--- a/tests/kms_plane_multiple.c
+++ b/tests/kms_plane_multiple.c
@@ -204,7 +204,7 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	       uint64_t modifier, int max_planes, igt_output_t *output, igt_fb_t *fb)
 {
 	drmModeModeInfo *mode;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *primary;
 	int *x;
 	int *y;
@@ -215,18 +215,22 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 	igt_output_set_crtc(output,
 			    igt_crtc_for_pipe(output->display, pipe_id));
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	pipe = primary->crtc;
+	crtc = primary->crtc;
 
-	x = malloc(pipe->n_planes * sizeof(*x));
-	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n", (long int) (pipe->n_planes * sizeof(*x)));
-	y = malloc(pipe->n_planes * sizeof(*y));
-	igt_assert_f(y, "Failed to allocate %ld bytes for variable y\n", (long int) (pipe->n_planes * sizeof(*y)));
-	size = malloc(pipe->n_planes * sizeof(*size));
-	igt_assert_f(size, "Failed to allocate %ld bytes for variable size\n", (long int) (pipe->n_planes * sizeof(*size)));
-	suffle = malloc(pipe->n_planes * sizeof(*suffle));
-	igt_assert_f(suffle, "Failed to allocate %ld bytes for variable size\n", (long int) (pipe->n_planes * sizeof(*suffle)));
+	x = malloc(crtc->n_planes * sizeof(*x));
+	igt_assert_f(x, "Failed to allocate %ld bytes for variable x\n",
+		     (long int) (crtc->n_planes * sizeof(*x)));
+	y = malloc(crtc->n_planes * sizeof(*y));
+	igt_assert_f(y, "Failed to allocate %ld bytes for variable y\n",
+		     (long int) (crtc->n_planes * sizeof(*y)));
+	size = malloc(crtc->n_planes * sizeof(*size));
+	igt_assert_f(size, "Failed to allocate %ld bytes for variable size\n",
+		     (long int) (crtc->n_planes * sizeof(*size)));
+	suffle = malloc(crtc->n_planes * sizeof(*suffle));
+	igt_assert_f(suffle, "Failed to allocate %ld bytes for variable size\n",
+		     (long int) (crtc->n_planes * sizeof(*suffle)));
 
-	for (i = 0; i < pipe->n_planes; i++)
+	for (i = 0; i < crtc->n_planes; i++)
 		suffle[i] = i;
 
 	/*
@@ -237,8 +241,8 @@ prepare_planes(data_t *data, enum pipe pipe_id, color_t *color, igt_plane_t **pl
 		int n, m;
 		int a, b;
 
-		n = rand() % (pipe->n_planes-1);
-		m = rand() % (pipe->n_planes-1);
+		n = rand() % (crtc->n_planes-1);
+		m = rand() % (crtc->n_planes-1);
 
 		/*
 		 * keep primary plane at its place for test's sake.
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index bed8ec1581bc..70cf704c05fa 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1016,7 +1016,7 @@ static void
 test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
-	igt_crtc_t *pipe_obj = igt_crtc_for_pipe(display, pipe);
+	igt_crtc_t *crtc = igt_crtc_for_pipe(display, pipe);
 	int width, height;
 	igt_plane_t *plane[3];
 	drmModeModeInfo *mode;
@@ -1024,16 +1024,19 @@ test_invalid_num_scalers(data_t *d, enum pipe pipe, igt_output_t *output)
 
 	cleanup_crtc(d);
 
-	igt_output_set_crtc(output, pipe_obj);
+	igt_output_set_crtc(output, crtc);
 
 	width = height = 20;
 	mode = igt_output_get_mode(output);
 
-	plane[0] = igt_crtc_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 0);
+	plane[0] = igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY,
+						 0);
 	igt_require(plane[0]);
-	plane[1] = igt_crtc_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 1);
+	plane[1] = igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY,
+						 1);
 	igt_require(plane[1]);
-	plane[2] = igt_crtc_get_plane_type_index(pipe_obj, DRM_PLANE_TYPE_OVERLAY, 2);
+	plane[2] = igt_crtc_get_plane_type_index(crtc, DRM_PLANE_TYPE_OVERLAY,
+						 2);
 	igt_require(plane[2]);
 
 	igt_create_fb(display->drm_fd,
diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 6f6f6979ad6b..6bc2968d827b 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -33,7 +33,7 @@ typedef struct data {
 	igt_display_t display;
 	igt_plane_t *primary;
 	igt_output_t *output;
-	igt_crtc_t *pipe;
+	igt_crtc_t *crtc;
 	enum pipe pipe_id;
 	bool use_virtual_connector;
 	int timeout_seconds;
@@ -385,7 +385,7 @@ static void test_init(data_t *data, int conn_id)
 	igt_display_t *display = &data->display;
 
 	data->pipe_id = PIPE_A;
-	data->pipe = igt_crtc_for_pipe(&data->display, data->pipe_id);
+	data->crtc = igt_crtc_for_pipe(&data->display, data->pipe_id);
 
 	igt_display_reset(display);
 
@@ -407,10 +407,10 @@ static void test_init(data_t *data, int conn_id)
 	igt_require_f(data->output, "No valid connectors found\n");
 
 	data->primary =
-		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
 
 	igt_output_set_crtc(data->output,
-			    data->pipe);
+			    data->crtc);
 
 	if (data->timeout_seconds > 0) {
 		struct sigaction sa;
-- 
2.52.0

