Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124BCD6D232
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 15:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B894410EA1A;
	Thu, 18 Dec 2025 15:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwdUS8AP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F5310EA1A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 15:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766072910; x=1797608910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UH8Yhi/liU2/fe4WrCn12MbBeK3mqeqAulIAODtc5sk=;
 b=nwdUS8APzyI5XB/PDouKrpEqB0aKtUIhhSGl8bqqflZR4WUd7zHS2S0B
 dqFcVbAy1Z2TX+7OcnDEy1sv0bx8qomv1KeOzpVoxEnnvr83ZsHqkIftE
 AT4rmXe9xqK4UxgJyYMCH1LRk+Aox7Tjjp8OWItJG0kw1qCXvo/2plNRO
 FiF9yirM0P9zWaZHr57od93i2wdZ/swuaoCmskEtMKS0uJyz5dGT7mck9
 N7LPpqg8fCNucXd/FWMbRdEBjPYFHK39V9+p92XcDIUvGfz8rXRdtA+Rb
 JlvGuUjo1okUbolJzm/dHx84U8drmhaeMb7xbpVF+7yiHcDVvkzkoXOQc w==;
X-CSE-ConnectionGUID: G6jSthXTRaKJBm/oeYhinw==
X-CSE-MsgGUID: pWtflpARQ+yQxYLoarz7hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68099425"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="68099425"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:48:30 -0800
X-CSE-ConnectionGUID: m4POsjjMQNS7qy24ZcM7AQ==
X-CSE-MsgGUID: l/NxQExjRfefsEPR9BTNIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="203034588"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.97])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 07:48:28 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 05/11] lib/kms: Extract igt_crtc_plane_init()
Date: Thu, 18 Dec 2025 17:48:25 +0200
Message-ID: <20251218154825.15108-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217153758.9369-6-ville.syrjala@linux.intel.com>
References: <20251217153758.9369-6-ville.syrjala@linux.intel.com>
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

Coccinelle tends to hit some kind of pathological performance
problem with igt_display_require(). Carving it up seems to help
a bit, so extract the plane init loop into a separate function.

v2: Rebase due to spurious whitespace removal

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 113 +++++++++++++++++++++++++++-----------------------
 1 file changed, 61 insertions(+), 52 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 803a1e926b10..6e9eb53a0c13 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3052,13 +3052,71 @@ void igt_display_reset_outputs(igt_display_t *display)
 	drmModeFreeResources(resources);
 }
 
+static void igt_crtc_plane_init(igt_display_t *display,
+				igt_crtc_t *pipe,
+				drmModeRes *resources,
+				igt_plane_t *global_plane)
+{
+	drmModePlane *drm_plane = global_plane->drm_plane;
+	int type = global_plane->type;
+	igt_plane_t *plane;
+	int index;
+
+	if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
+		index = 0;
+
+		pipe->plane_primary = index;
+		pipe->num_primary_planes++;
+	} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
+		index = pipe->n_planes - 1;
+
+		pipe->plane_cursor = index;
+		display->has_cursor_plane = true;
+	} else {
+		for (index = 1; index < pipe->n_planes; index++) {
+			if (pipe->planes[index].index < 0)
+				break;
+		}
+
+		/*
+		 * Increment num_primary_planes for any extra
+		 * primary plane found.
+		 */
+		if (type == DRM_PLANE_TYPE_PRIMARY)
+			pipe->num_primary_planes++;
+	}
+
+	igt_assert_lt(index, pipe->n_planes);
+
+	plane = &pipe->planes[index];
+
+	igt_assert_lt(plane->index, 0);
+
+	plane->index = index;
+	plane->type = type;
+	plane->pipe = pipe;
+	plane->drm_plane = drm_plane;
+	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
+	plane->ref = global_plane;
+
+	/*
+	 * HACK: point the global plane to the first pipe that
+	 * it can go on.
+	 */
+	if (!global_plane->ref)
+		igt_plane_set_pipe(plane, pipe);
+
+	igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_prop_names);
+
+	igt_fill_plane_format_mod(display, plane);
+}
+
 static void igt_crtc_init(igt_display_t *display,
 			  drmModeRes *resources, int i)
 {
 	igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
-	igt_plane_t *plane;
 	int crtc_mask = 0;
-	int j, type;
+	int j;
 
 	pipe->display = display;
 	pipe->plane_cursor = -1;
@@ -3092,60 +3150,11 @@ static void igt_crtc_init(igt_display_t *display,
 	for (j = 0; j < display->n_planes; j++) {
 		igt_plane_t *global_plane = &display->planes[j];
 		drmModePlane *drm_plane = global_plane->drm_plane;
-		int index;
 
 		if (!(drm_plane->possible_crtcs & crtc_mask))
 			continue;
 
-		type = global_plane->type;
-
-		if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
-			index = 0;
-
-			pipe->plane_primary = index;
-			pipe->num_primary_planes++;
-		} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
-			index = pipe->n_planes - 1;
-
-			pipe->plane_cursor = index;
-			display->has_cursor_plane = true;
-		} else {
-			for (index = 1; index < pipe->n_planes; index++) {
-				if (pipe->planes[index].index < 0)
-					break;
-			}
-
-			/*
-			 * Increment num_primary_planes for any extra
-			 * primary plane found.
-			 */
-			if (type == DRM_PLANE_TYPE_PRIMARY)
-				pipe->num_primary_planes++;
-		}
-
-		igt_assert_lt(index, pipe->n_planes);
-
-		plane = &pipe->planes[index];
-
-		igt_assert_lt(plane->index, 0);
-
-		plane->index = index;
-		plane->type = type;
-		plane->pipe = pipe;
-		plane->drm_plane = drm_plane;
-		plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
-		plane->ref = global_plane;
-
-		/*
-		 * HACK: point the global plane to the first pipe that
-		 * it can go on.
-		 */
-		if (!global_plane->ref)
-			igt_plane_set_pipe(plane, pipe);
-
-		igt_fill_plane_props(display, plane, IGT_NUM_PLANE_PROPS, igt_plane_prop_names);
-
-		igt_fill_plane_format_mod(display, plane);
+		igt_crtc_plane_init(display, pipe, resources, global_plane);
 	}
 
 	/*
-- 
2.51.2

