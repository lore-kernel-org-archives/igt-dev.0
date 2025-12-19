Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA121E66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:33:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7C910F0AA;
	Fri, 19 Dec 2025 20:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RuecVBYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C54310F0AA
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176427; x=1797712427;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0YZ87jliDcoR4WRXk71QXZywhYnkV5KZ6tY8CKokz0c=;
 b=RuecVBYmG521ACadAgJJMDAmfjlwT0FvRsELWltXBcEhBI9AtiRatr3u
 Y9ou2YEk5eIY1pITVIN4XQfJejcgZqnjejnIXd8h+qrzbK1lE3+cDJOpg
 ooIyWDziJY6QB5XmRP3geKO8w8mE0vcJPB4C68ogV1V0Noa5F/cUsUXiw
 xxomUmNPPc4JUk43b21rjN5g+ANH5qYNuD6Stfd9T9IVf56wGwiGI6hyA
 jPLYz5fuE4w+5umyY7dOG2qprYLz9bb9X2Skw063MUmYIlyBd/8zMRmjO
 WLi99cZ4l6sQ9xmcrWkr6mVRE8BfS7CFINdWmi6syurpnukAG5e5g/ejR Q==;
X-CSE-ConnectionGUID: cOxoqIRTTC+OoHOtJ4zGsQ==
X-CSE-MsgGUID: 2CeLq/l1QdGSMeOqG5iPUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="93613473"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="93613473"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:47 -0800
X-CSE-ConnectionGUID: Kq8bsHD5S7qhT9Nersz26A==
X-CSE-MsgGUID: c02oucRkSzaEoVU0dW15hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199434318"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 04/11] lib/kms: Get rid of the 'p' plane index
 variable
Date: Fri, 19 Dec 2025 22:33:20 +0200
Message-ID: <20251219203327.16573-5-ville.syrjala@linux.intel.com>
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

The 'p' thing used to track the next free plane slot is annoying.
Get rid of it by just initializing the plane indexes to -1 to
indicate a free slot at the start, and then do a straightforward
search for the next free slot. And for good measure make sure all
the -1's have disappeared at the end.

v2: Remove spurious whitespace (Jani)
    Fix the post init plane->index assert (Jani/CI)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 72c91fb5da76..803a1e926b10 100644
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
@@ -3085,10 +3085,14 @@ static void igt_crtc_init(igt_display_t *display,
 	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
 		     pipe->n_planes);
 
+	for (j = 0; j < pipe->n_planes; j++)
+		pipe->planes[j].index = -1;
+
 	/* add the planes that can be used with that pipe */
 	for (j = 0; j < display->n_planes; j++) {
 		igt_plane_t *global_plane = &display->planes[j];
 		drmModePlane *drm_plane = global_plane->drm_plane;
+		int index;
 
 		if (!(drm_plane->possible_crtcs & crtc_mask))
 			continue;
@@ -3096,29 +3100,36 @@ static void igt_crtc_init(igt_display_t *display,
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
+			for (index = 1; index < pipe->n_planes; index++) {
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
@@ -3143,11 +3154,8 @@ static void igt_crtc_init(igt_display_t *display,
 	 */
 	igt_assert_eq(pipe->plane_primary, 0);
 
-	/* Check that we filled every slot exactly once */
-	if (display->has_cursor_plane)
-		igt_assert_eq(p, pipe->n_planes - 1);
-	else
-		igt_assert_eq(p, pipe->n_planes);
+	for (j = 0; j < pipe->n_planes; j++)
+		igt_assert_lte(0, pipe->planes[j].index);
 }
 
 /**
-- 
2.51.2

