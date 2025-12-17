Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFB0D65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0908110E8BA;
	Wed, 17 Dec 2025 15:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ms3YHccz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A005410EBD7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985889; x=1797521889;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=bv7P13AsVYw61a7Cc0hpc2Qd/LOqtfmGzz18sGGdv28=;
 b=ms3YHcczb9mwZLqj0cXRjRdeZRx64AR3frvsilNSPOyLKBGj20bLcSh0
 7Djtl5E0H9OLtA8W6q16f+2Gnal2e5uri9sS5NKOealUz5ym+E01ZyTAc
 W61PKuxCRbjRLk9psirsttNUjyKhwIcQS6wDDhe+AUOKCn/EMWLUVNj9e
 Kl3RgAGjA566JxEVDr4vwu95i4WjS7D8Ps6Hf0H6gWGCqT8VH/OhUZD6I
 FIZOehvRHnInOtx7QOaTw4C5iSBb1tmnG2LHUFsWhMc55Ci9+TJB4OFba
 tFppTFFyMVhqlJUaGuOPgJF8lEyFFIF31unKaCtqio1PYzr1kn39UxjWn g==;
X-CSE-ConnectionGUID: H7DzvnQYRiKJILl7ZGgI5Q==
X-CSE-MsgGUID: vGlp/DbhQlOQhOQNKxo0nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71556994"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="71556994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:09 -0800
X-CSE-ConnectionGUID: fypSW6u4Qq+lI3u0j7GL4Q==
X-CSE-MsgGUID: QuoGhTmURPGpDo1fdohIRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221718661"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:07 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 02/11] lib/kms: Nuke 'n_planes' from igt_crtc_init()
Date: Wed, 17 Dec 2025 17:37:48 +0200
Message-ID: <20251217153758.9369-3-ville.syrjala@linux.intel.com>
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

The 'n_planes' varaible is essentially just a duplicate of
'pipe->n_planes'. Get rid of the copy and just populate the
real thing early.

Having less variables around will help with carving up
igt_crtc_init() further.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4993d4db8a8a..082934e4e216 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3059,7 +3059,7 @@ static void igt_crtc_init(igt_display_t *display,
 	igt_plane_t *plane;
 	int p = 1, crtc_mask = 0;
 	int j, type;
-	uint8_t last_plane = 0, n_planes = 0;
+	uint8_t last_plane = 0;
 
 	pipe->display = display;
 	pipe->plane_cursor = -1;
@@ -3078,13 +3078,14 @@ static void igt_crtc_init(igt_display_t *display,
 		igt_assert(drm_plane);
 
 		if (drm_plane->possible_crtcs & crtc_mask)
-			n_planes++;
+			pipe->n_planes++;
 	}
 
-	igt_assert_lt(0, n_planes);
-	pipe->planes = calloc(n_planes, sizeof(igt_plane_t));
-	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n", n_planes);
-	last_plane = n_planes - 1;
+	igt_assert_lt(0, pipe->n_planes);
+	pipe->planes = calloc(pipe->n_planes, sizeof(igt_plane_t));
+	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
+		     pipe->n_planes);
+	last_plane = pipe->n_planes - 1;
 
 	/* add the planes that can be used with that pipe */
 	for (j = 0; j < display->n_planes; j++) {
@@ -3118,7 +3119,8 @@ static void igt_crtc_init(igt_display_t *display,
 			plane->index = p++;
 		}
 
-		igt_assert_f(plane->index < n_planes, "n_planes < plane->index failed\n");
+		igt_assert_f(plane->index < pipe->n_planes,
+			     "n_planes < plane->index failed\n");
 		plane->type = type;
 		plane->pipe = pipe;
 		plane->drm_plane = drm_plane;
@@ -3147,9 +3149,7 @@ static void igt_crtc_init(igt_display_t *display,
 	if (display->has_cursor_plane)
 		igt_assert_eq(p, last_plane);
 	else
-		igt_assert_eq(p, n_planes);
-
-	pipe->n_planes = n_planes;
+		igt_assert_eq(p, pipe->n_planes);
 }
 
 /**
-- 
2.51.2

