Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DCBE66884
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7FC10E548;
	Fri, 19 Dec 2025 20:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gB6ZC3ia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D2610E548
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176423; x=1797712423;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IiI+dxp7T8WYRqjxzaBxFvXuVUZQ6EtN4DwmaDZkWA0=;
 b=gB6ZC3iaENioFIYnLC1k1HRO70OJJwrhAnQrXUjZJ22Z075+AdiNQYYO
 BCO4j38ETm7m5cVuzcGUKeL32egbQbEbCan7ChpcgtenDleTT3s60fAj3
 Vq7TtNTSKC9iHLVLwN39FU4AiLM2Tx1wt0vEiGTRvITAPZ9HWrhyuHyyX
 Nnw7bcZBLxyiEbYGmh0MidMmpk0MAwz43Lbqajga9MM7N0amC16uePOm3
 xKzjTbFBZ47dbU06ZnbUZCbEtUuaXh8D7ro/GI8FHnspgEUZ0vDBGErKx
 FrglLYXBXBWWkyXI7kmJ/moCT3UM4DDprLrVtrjiJxOcTaF0rkbBzan9h g==;
X-CSE-ConnectionGUID: tjkwlDaVRy2x/oYxcL9zow==
X-CSE-MsgGUID: UzVZFuGBShOleS4GdFCvhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="93613471"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="93613471"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:43 -0800
X-CSE-ConnectionGUID: uuyZ/iG/QJiJkVkd5g66+A==
X-CSE-MsgGUID: goHorfQNSiqqR9TMlQBJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199434307"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:42 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 03/11] lib/kms: Nuke 'last_plane' from igt_crtc_init()
Date: Fri, 19 Dec 2025 22:33:19 +0200
Message-ID: <20251219203327.16573-4-ville.syrjala@linux.intel.com>
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

'last_plane' is just 'pipe->n_planes - 1'. Remove the redundant
variable.

Having fewer variables around will help with carving up
igt_crtc_init() further.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 082934e4e216..72c91fb5da76 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3059,7 +3059,6 @@ static void igt_crtc_init(igt_display_t *display,
 	igt_plane_t *plane;
 	int p = 1, crtc_mask = 0;
 	int j, type;
-	uint8_t last_plane = 0;
 
 	pipe->display = display;
 	pipe->plane_cursor = -1;
@@ -3085,7 +3084,6 @@ static void igt_crtc_init(igt_display_t *display,
 	pipe->planes = calloc(pipe->n_planes, sizeof(igt_plane_t));
 	igt_assert_f(pipe->planes, "Failed to allocate memory for %d planes\n",
 		     pipe->n_planes);
-	last_plane = pipe->n_planes - 1;
 
 	/* add the planes that can be used with that pipe */
 	for (j = 0; j < display->n_planes; j++) {
@@ -3103,9 +3101,9 @@ static void igt_crtc_init(igt_display_t *display,
 			pipe->plane_primary = 0;
 			pipe->num_primary_planes++;
 		} else if (type == DRM_PLANE_TYPE_CURSOR && pipe->plane_cursor == -1) {
-			plane = &pipe->planes[last_plane];
-			plane->index = last_plane;
-			pipe->plane_cursor = last_plane;
+			plane = &pipe->planes[pipe->n_planes - 1];
+			plane->index = pipe->n_planes - 1;
+			pipe->plane_cursor = pipe->n_planes - 1;
 			display->has_cursor_plane = true;
 		} else {
 			/*
@@ -3147,7 +3145,7 @@ static void igt_crtc_init(igt_display_t *display,
 
 	/* Check that we filled every slot exactly once */
 	if (display->has_cursor_plane)
-		igt_assert_eq(p, last_plane);
+		igt_assert_eq(p, pipe->n_planes - 1);
 	else
 		igt_assert_eq(p, pipe->n_planes);
 }
-- 
2.51.2

