Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A29BD65C72
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADAD10ED12;
	Wed, 17 Dec 2025 15:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNcrsfba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6205A10ED19
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985896; x=1797521896;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6uWHJosQKJp0ZOpFz+sUC0LiGVdS+/updgZJeBQJ55g=;
 b=HNcrsfbaNig5Flhr3BTAtTMIxnuaXB9fHH394bcvEJEF1lSglVQu5tMr
 AFDJGdRgTH2Tl6uUmJtoTDACbDjlQU9zZpa6Ui6Lzv+09JWQ82Vs/q3fW
 ppOSl6bzqkPiYI7RhAu6SBaAy+LEkwTxu0bqPP7Rgu19DIJSAKwQR01kY
 dmQGTAx57eKi7j6ggA378MIdZYlAElNIxd22W/cxMFDAHe6u9q0BJTJX6
 3QzLVhklKtQ/IwTNNOVqLOSXLhYZqk6+FQpY6ePqJXN395qe5QnycwryM
 xvqAo0UTwv5fnVIU5juS6+a92GQ2PeWouR/Bl2Q4g10BM7WOrKVL5D6Xm w==;
X-CSE-ConnectionGUID: ZDL3cX1uQ1qqmNMzTN58BA==
X-CSE-MsgGUID: Qi/LGRp0Qo6qIBCgvfpkUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71557003"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="71557003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:16 -0800
X-CSE-ConnectionGUID: L8ptpC3+TeqdgukjMEUVsg==
X-CSE-MsgGUID: i52YKyNwTSuOGyhcwVQpEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221718694"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:14 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/11] lib/kms: Get rid of the 'p' plane index variable
Date: Wed, 17 Dec 2025 17:37:50 +0200
Message-ID: <20251217153758.9369-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
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

The 'p' thing used to track the next free plane slot is annoying.
Get rid of it by just initializing the plane indexes to -1 to
indicate a free slot at the start, and then do a straightforward
search for the next free slot. And for good measure make sure all
the -1's have disappeared at the end.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 45 ++++++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 19 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 72c91fb5da76..5679643e167a 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3057,7 +3057,7 @@ static void igt_crtc_init(igt_display_t *display,
 {
 	igt_crtc_t *pipe = igt_crtc_for_pipe(display, i);
 	igt_plane_t *plane;
-	int p = 1, crtc_mask = 0;
+	int crtc_mask = 0;
 	int j, type;
 
 	pipe->display = display;
@@ -3082,13 +3082,16 @@ static void igt_crtc_init(igt_display_t *display,
 
 	igt_assert_lt(0, pipe->n_planes);
 	pipe->planes = calloc(pipe->n_planes, sizeof(igt_plane_t));
-	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
-		     pipe->n_planes);
+	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", pipe->n_planes);
+
+	for (j = 0 ; j < pipe->n_planes; j++)
+		pipe->planes[j].index = -1;
 
 	/* add the planes that can be used with that pipe */
 	for (j = 0; j < display->n_planes; j++) {
 		igt_plane_t *global_plane = &display->planes[j];
 		drmModePlane *drm_plane = global_plane->drm_plane;
+		int index;
 
 		if (!(drm_plane->possible_crtcs & crtc_mask))
 			continue;
@@ -3096,29 +3099,36 @@ static void igt_crtc_init(igt_display_t *display,
 		type = global_plane->type;
 
 		if (type == DRM_PLANE_TYPE_PRIMARY && pipe->plane_primary == -1) {
-			plane = &pipe->planes[0];
-			plane->index = 0;
-			pipe->plane_primary = 0;
+			index = 0;
+
+			pipe->plane_primary = index;
 			pipe->num_primary_planes++;
 		} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
-			plane = &pipe->planes[pipe->n_planes - 1];
-			plane->index = pipe->n_planes - 1;
-			pipe->plane_cursor = pipe->n_planes - 1;
+			index = pipe->n_planes - 1;
+
+			pipe->plane_cursor = index;
 			display->has_cursor_plane = true;
 		} else {
+			for (index = 1 ; index < pipe->n_planes; index++) {
+				if (pipe->planes[index].index < 0)
+					break;
+			}
+
 			/*
 			 * Increment num_primary_planes for any extra
 			 * primary plane found.
 			 */
 			if (type == DRM_PLANE_TYPE_PRIMARY)
 				pipe->num_primary_planes++;
-
-			plane = &pipe->planes[p];
-			plane->index = p++;
 		}
 
-		igt_assert_f(plane->index < pipe->n_planes,
-			     "n_planes < plane->index failed\n");
+		igt_assert_lt(index, pipe->n_planes);
+
+		plane = &pipe->planes[index];
+
+		igt_assert_lt(plane->index, 0);
+
+		plane->index = index;
 		plane->type = type;
 		plane->pipe = pipe;
 		plane->drm_plane = drm_plane;
@@ -3143,11 +3153,8 @@ static void igt_crtc_init(igt_display_t *display,
 	 */
 	igt_assert_eq(pipe->plane_primary, 0);
 
-	/* Check that we filled every slot exactly once */
-	if (display->has_cursor_plane)
-		igt_assert_eq(p, pipe->n_planes - 1);
-	else
-		igt_assert_eq(p, pipe->n_planes);
+	for (j = 0; j < pipe->n_planes; j++)
+		igt_assert_lt(0, pipe->planes[j].index);
 }
 
 /**
-- 
2.51.2

