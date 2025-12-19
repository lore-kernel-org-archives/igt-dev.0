Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4F4E6688C
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 20:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B8F10F0A9;
	Fri, 19 Dec 2025 20:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJ7wfZWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B947A10F0A9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 20:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766176420; x=1797712420;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A2+BLuneQ4pKwVqEUUNcPSI0mdJUJhphSNQPXqQpyk8=;
 b=UJ7wfZWgPYeRsQoC0KmuIKQZoaDHcirhGEKcUFd+tmA6nVyRWwcvctqv
 2njh2zGYcpmaHKpb3+QrVJGkPe4eQkKrHruFDjbHI9bwu/YZTWMN0caFx
 KTAG7oSS33TQSJ2zlr6CxyYHKP+35lekMd6hPnTjoweZEYsFgELYiPeuQ
 CTKYVkBAVowTssiuCXZ0dMjWGkfmM+oZVg/j1VW0xq0NG/Rm0Jo+X9Vw9
 YHxz2mcc+DeYTd3BUYWmsda7hPLF8Y7z5XfnC8cawdy3GxY67EAIjtAnz
 VAgENAnuS+3B07ajD1Nn7MkaG+JMYIO3v9JhduYaZav1z62frYBFCWn2m g==;
X-CSE-ConnectionGUID: fuislW5TSw+S4Y7drL+0/w==
X-CSE-MsgGUID: oAPKf/NoSSmNgqUFUJQUsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="93613468"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="93613468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:39 -0800
X-CSE-ConnectionGUID: PQ+/JD9TT5SadKlaGBo2sw==
X-CSE-MsgGUID: 4xk6j6uETaeSTFJF6OI36A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="199434297"
Received: from jjgreens-desk21.amr.corp.intel.com (HELO localhost)
 ([10.124.220.15])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 12:33:38 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 02/11] lib/kms: Nuke 'n_planes' from igt_crtc_init()
Date: Fri, 19 Dec 2025 22:33:18 +0200
Message-ID: <20251219203327.16573-3-ville.syrjala@linux.intel.com>
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

The 'n_planes' variable is essentially just a duplicate of
'pipe->n_planes'. Get rid of the copy and just populate the
real thing early.

Having fewer variables around will help with carving up
igt_crtc_init() further.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

