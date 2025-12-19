Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03480E66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA56C10F0AA;
	Fri, 19 Dec 2025 20:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcXuGB4U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D533510F0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176455; x=1797712455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e/SF84ul+mukwgYeGMUDy8gMBcIWyRjyckMRIS3PZ68=;
 b=UcXuGB4UmdbFLOpHl7v9ctWpprKh66uZdVSKpwuF+FLbUU8qn8xrZ9W0
 gejynzcnemFpZN1hmJe6EXEx6RLuGxI06msxiGTslw1AUrxsYr4g+nhpu
 bXY1snp8oRdXwKW9364jT+GIfiSGB1xH0oxW3kqB4US/dmVForlJdudHN
 l7crB+fzdwfd8hMMlKQ6UMjEIava591oi/3z3GuSZKpcH8PFSbEMgS0J+
 g570Fd61P1sxC/Czl83GXDrewwnqa9T+viM/7XJMygViod9SFo0wWREBz
 6n7Fy+fxTp0PpeoCNaXqs806Fvlng9LMmO+Z8vMHE8mDl+th5f4inXNCN g==;
X-CSE-ConnectionGUID: vM54WhEHR7KamXa9dhnQ8A==
X-CSE-MsgGUID: kJ/d8QBcTOC3Y7iYqPM/Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68034152"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="68034152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:15 -0800
X-CSE-ConnectionGUID: eG2fbMV3S7+KiS1+x9WF7w==
X-CSE-MsgGUID: osq/lpMdT/SNkwuNdwZZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="222367601"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:34:13 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 11/11] lib/kms: Streamline plane index handling
 further
Date: Fri, 19 Dec 2025 22:33:27 +0200
Message-ID: <20251219203327.16573-12-ville.syrjala@linux.intel.com>
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

Eliminate some redundant plane type checks and just rely
on plane_type_index() knowing what it's doing.

We do need to keep one plane type check to determing
what to do with pipe->num_primary_plane and
pipe->has_cursor_plane. But it's a bit more obvious
what's happening there now that index stuff isn't mixed in.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 43 +++++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 216c0efaf5d4..a58f41b48595 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3075,24 +3075,26 @@ static void igt_crtc_plane_init(igt_display_t *display,
 	drmModePlane *drm_plane = global_plane->drm_plane;
 	int type = global_plane->type;
 	igt_plane_t *plane;
-	int index = plane_type_index(pipe, type);
+	int index;
 
-	if (type == DRM_PLANE_TYPE_PRIMARY && pipe->planes[index].index < 0) {
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
 		pipe->num_primary_planes++;
-	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->planes[index].index < 0) {
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
 		display->has_cursor_plane = true;
-	} else {
+		break;
+	default:
+		break;
+	}
+
+	index = plane_type_index(pipe, type);
+
+	if (index < 0 || pipe->planes[index].index >= 0) {
 		for (index = 1; index < pipe->n_planes; index++) {
 			if (pipe->planes[index].index < 0)
 				break;
 		}
-
-		/*
-		 * Increment num_primary_planes for any extra
-		 * primary plane found.
-		 */
-		if (type == DRM_PLANE_TYPE_PRIMARY)
-			pipe->num_primary_planes++;
 	}
 
 	igt_assert_lt(index, pipe->n_planes);
@@ -3577,20 +3579,13 @@ static igt_plane_t *igt_pipe_get_plane(igt_crtc_t *pipe, int plane_idx)
  */
 igt_plane_t *igt_pipe_get_plane_type(igt_crtc_t *pipe, int plane_type)
 {
-	int i, plane_idx = -1;
+	int plane_idx = plane_type_index(pipe, plane_type);
 
-	switch(plane_type) {
-	case DRM_PLANE_TYPE_CURSOR:
-	case DRM_PLANE_TYPE_PRIMARY:
-		plane_idx = plane_type_index(pipe, plane_type);
-		break;
-	case DRM_PLANE_TYPE_OVERLAY:
-		for(i = 0; i < pipe->n_planes; i++)
-			if (pipe->planes[i].type == DRM_PLANE_TYPE_OVERLAY)
-			    plane_idx = i;
-		break;
-	default:
-		break;
+	if (plane_idx < 0) {
+		for (plane_idx = 0; plane_idx < pipe->n_planes; plane_idx++) {
+			if (pipe->planes[plane_idx].type == plane_type)
+				break;
+		}
 	}
 
 	igt_require_f(plane_idx >= 0 && plane_idx < pipe->n_planes,
-- 
2.51.2

