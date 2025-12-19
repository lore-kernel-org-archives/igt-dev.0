Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D88E66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:33:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4909510F0A8;
	Fri, 19 Dec 2025 20:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRVdLWCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D12AD10F0A8
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176416; x=1797712416;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CPsZUUscFMTgfD9f+8KOcZsMIKX3MIbExCA8/7vzSrs=;
 b=iRVdLWCpKknjbgogJTfOCLw1uqkJoNfH2X8awQYVNU63aP6VwUym6oba
 eyLzoEI1aaTJNKzBeDeBY7XOFuTHJs2MFPe+VpmbHSZqifqdP5tt7LBlL
 sSXI38N/aaGp2q8BCtXA2cX1q9PNJVyMEy6ghh9O/k3tU5URL5LQJFv1Q
 7S/EEVrd0fHuYzHpRsJNQNzP90k6MJfm+zEyeCDUlvlcml8YuOC3LFxGy
 vnQUGGJQb5KMnDCtMTROm8mqNLRnNcKdmzOdYX8vVzGCMhSyjRq128h19
 +k2uWIEaBGMethoizmrGbEA4SWn//F5laLCqPQUA6N4Rqh7dvZhO8V8Jk w==;
X-CSE-ConnectionGUID: oZGHavyWSGShnzDfrEKNHA==
X-CSE-MsgGUID: icThUbfMQl6psHt2O64Y6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="93613465"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="93613465"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:35 -0800
X-CSE-ConnectionGUID: 6cpP/JXrQk+vgBfP4BRXUg==
X-CSE-MsgGUID: o6V7u7gsTT674dL/ML2N8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199434279"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:34 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 01/11] lib/kms: Extract igt_crtc_init()
Date: Fri, 19 Dec 2025 22:33:17 +0200
Message-ID: <20251219203327.16573-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
References: <20251219203327.16573-1-ville.syrjala@linux.intel.com>
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

Coccinelle tends to hit some kind of pathological performance
problem with igt_display_require(). Carving it up seems to help
a bit, so extract the crtc init loop into a separate function.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 199 ++++++++++++++++++++++++++------------------------
 1 file changed, 102 insertions(+), 97 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e3e9bf9bce07..4993d4db8a8a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3052,6 +3052,106 @@ void igt_display_reset_outputs(igt_display_t *display)
 	drmModeFreeResources(resources);
 }
 
+static void igt_crtc_init(igt_display_t *display,
+			  drmModeRes *resources, int i)
+{
+	igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
+	igt_plane_t *plane;
+	int p = 1, crtc_mask = 0;
+	int j, type;
+	uint8_t last_plane = 0, n_planes = 0;
+
+	pipe->display = display;
+	pipe->plane_cursor = -1;
+	pipe->plane_primary = -1;
+	pipe->planes = NULL;
+	pipe->num_primary_planes = 0;
+
+	igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
+
+	/* Get valid crtc index from crtcs for a pipe */
+	crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
+
+	/* count number of valid planes */
+	for (j = 0; j < display->n_planes; j++) {
+		drmModePlane *drm_plane = display->planes[j].drm_plane;
+		igt_assert(drm_plane);
+
+		if (drm_plane->possible_crtcs & crtc_mask)
+			n_planes++;
+	}
+
+	igt_assert_lt(0, n_planes);
+	pipe->planes = calloc(n_planes, sizeof(igt_plane_t));
+	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", n_planes);
+	last_plane = n_planes - 1;
+
+	/* add the planes that can be used with that pipe */
+	for (j = 0; j < display->n_planes; j++) {
+		igt_plane_t *global_plane = &display->planes[j];
+		drmModePlane *drm_plane = global_plane->drm_plane;
+
+		if (!(drm_plane->possible_crtcs & crtc_mask))
+			continue;
+
+		type = global_plane->type;
+
+		if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
+			plane = &pipe->planes[0];
+			plane->index = 0;
+			pipe->plane_primary = 0;
+			pipe->num_primary_planes++;
+		} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
+			plane = &pipe->planes[last_plane];
+			plane->index = last_plane;
+			pipe->plane_cursor = last_plane;
+			display->has_cursor_plane = true;
+		} else {
+			/*
+			 * Increment num_primary_planes for any extra
+			 * primary plane found.
+			 */
+			if (type == DRM_PLANE_TYPE_PRIMARY)
+				pipe->num_primary_planes++;
+
+			plane = &pipe->planes[p];
+			plane->index = p++;
+		}
+
+		igt_assert_f(plane->index < n_planes, "n_planes < plane->index failed\n");
+		plane->type = type;
+		plane->pipe = pipe;
+		plane->drm_plane = drm_plane;
+		plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
+		plane->ref = global_plane;
+
+		/*
+		 * HACK: point the global plane to the first pipe that
+		 * it can go on.
+		 */
+		if (!global_plane->ref)
+			igt_plane_set_pipe(plane, pipe);
+
+		igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_prop_names);
+
+		igt_fill_plane_format_mod(display, plane);
+	}
+
+	/*
+	 * At the bare minimum, we should expect to have a primary
+	 * plane, and it must be in slot 0.
+	 */
+	igt_assert_eq(pipe->plane_primary, 0);
+
+	/* Check that we filled every slot exactly once */
+	if (display->has_cursor_plane)
+		igt_assert_eq(p, last_plane);
+	else
+		igt_assert_eq(p, n_planes);
+
+	pipe->n_planes = n_planes;
+}
+
 /**
  * igt_display_require:
  * @display: a pointer to an #igt_display_t structure
@@ -3155,103 +3255,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	display->colorops = calloc(MAX_NUM_COLOROPS, sizeof(igt_colorop_t));
 	display->n_colorops = 0;
 
-	for_each_pipe(display, i) {
-		igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
-		igt_plane_t *plane;
-		int p = 1, crtc_mask = 0;
-		int j, type;
-		uint8_t last_plane = 0, n_planes = 0;
-
-		pipe->display = display;
-		pipe->plane_cursor = -1;
-		pipe->plane_primary = -1;
-		pipe->planes = NULL;
-		pipe->num_primary_planes = 0;
-
-		igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
-
-		/* Get valid crtc index from crtcs for a pipe */
-		crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
-
-		/* count number of valid planes */
-		for (j = 0; j < display->n_planes; j++) {
-			drmModePlane *drm_plane = display->planes[j].drm_plane;
-			igt_assert(drm_plane);
-
-			if (drm_plane->possible_crtcs & crtc_mask)
-				n_planes++;
-		}
-
-		igt_assert_lt(0, n_planes);
-		pipe->planes = calloc(n_planes, sizeof(igt_plane_t));
-		igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", n_planes);
-		last_plane = n_planes - 1;
-
-		/* add the planes that can be used with that pipe */
-		for (j = 0; j < display->n_planes; j++) {
-			igt_plane_t *global_plane = &display->planes[j];
-			drmModePlane *drm_plane = global_plane->drm_plane;
-
-			if (!(drm_plane->possible_crtcs & crtc_mask))
-				continue;
-
-			type = global_plane->type;
-
-			if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
-				plane = &pipe->planes[0];
-				plane->index = 0;
-				pipe->plane_primary = 0;
-				pipe->num_primary_planes++;
-			} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
-				plane = &pipe->planes[last_plane];
-				plane->index = last_plane;
-				pipe->plane_cursor = last_plane;
-				display->has_cursor_plane = true;
-			} else {
-				/*
-				 * Increment num_primary_planes for any extra
-				 * primary plane found.
-				 */
-				if (type == DRM_PLANE_TYPE_PRIMARY)
-					pipe->num_primary_planes++;
-
-				plane = &pipe->planes[p];
-				plane->index = p++;
-			}
-
-			igt_assert_f(plane->index < n_planes, "n_planes < plane->index failed\n");
-			plane->type = type;
-			plane->pipe = pipe;
-			plane->drm_plane = drm_plane;
-			plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
-			plane->ref = global_plane;
-
-			/*
-			 * HACK: point the global plane to the first pipe that
-			 * it can go on.
-			 */
-			if (!global_plane->ref)
-				igt_plane_set_pipe(plane, pipe);
-
-			igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_prop_names);
-
-			igt_fill_plane_format_mod(display, plane);
-		}
-
-		/*
-		 * At the bare minimum, we should expect to have a primary
-		 * plane, and it must be in slot 0.
-		 */
-		igt_assert_eq(pipe->plane_primary, 0);
-
-		/* Check that we filled every slot exactly once */
-		if (display->has_cursor_plane)
-			igt_assert_eq(p, last_plane);
-		else
-			igt_assert_eq(p, n_planes);
-
-		pipe->n_planes = n_planes;
-	}
+	for_each_pipe(display, i)
+		igt_crtc_init(display, resources, i);
 
 	drmModeFreeResources(resources);
 
-- 
2.51.2

