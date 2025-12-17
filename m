Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3985D65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867FC10E8CA;
	Wed, 17 Dec 2025 15:38:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lC6HIt4z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 402E010E8CA
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985922; x=1797521922;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=/wvHR0C2rgigmVqg7KziXpJSc2NeqY6/yJI57/TViYw=;
 b=lC6HIt4zdJq+noY4CqcQEyieYi+MADX72ZvZI/kNb6Qpw4Px1khi/S+M
 hSIqTeKs8SmBAYoCZ7Gt5eSGbHEkb60xEZP7xzCZK78/4DJB/xijjyDy5
 /VlRHdJ1W98uY5wZDkDWHDb0+BfA5QnmPVhIKM6QOyZqRx77zmOf/e5JZ
 z5VNY+nu9YmoDdCgLL3YIIOHfKk4kcbH9Kcg6c/7HVhCit6csXeRf/L+7
 QR5WYfRjOt346vF8+ppEUJritxM4tzpTik9pcW8U6POzjRnp+l1kPRuMz
 JfUkUAYKlPokBxXGMbmn/ok6SCtqIej6HIgGnqbw6LroNn2kf5fr6iuxa A==;
X-CSE-ConnectionGUID: ZMmulw0OQMOXhAq50tInzw==
X-CSE-MsgGUID: 6PJ3XwJJR6ul3ZjDLoUvyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78235693"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="78235693"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:41 -0800
X-CSE-ConnectionGUID: XreytruyRneIwedbe1+3Jg==
X-CSE-MsgGUID: B45HKd5RTwOcNSFHwHTP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="229013557"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:40 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/11] lib/kms: Streamline plane index handling further
Date: Wed, 17 Dec 2025 17:37:57 +0200
Message-ID: <20251217153758.9369-12-ville.syrjala@linux.intel.com>
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

Eliminate some redundant plane type checks and just rely
on plane_type_index() knowing what it's doing.

We do need to keep one plane type check to determing
what to do with pipe->num_primary_plane and
pipe->has_cursor_plane. But it's a bit more obvious
what's happening there now that index stuff isn't mixed in.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 43 +++++++++++++++++++------------------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4f30732bf1bb..04a86f235471 100644
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
@@ -3576,20 +3578,13 @@ static igt_plane_t *igt_pipe_get_plane(igt_crtc_t *pipe, int plane_idx)
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

