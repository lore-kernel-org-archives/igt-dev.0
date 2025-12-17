Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5584ED65C70
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 15:38:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB3410ED10;
	Wed, 17 Dec 2025 15:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BFEte0Fe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB810EBD7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765985892; x=1797521892;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mrEUZi4abCmg1zctozMvfWrC8Hd7xFjXXK1L7IlyPuM=;
 b=BFEte0Fec4zKn6stekxoxItqGyx5bJyA6DhZqeka1oPd57cCPDzvfvT3
 dO7UDnqiFaQnIXwFcZWg77kNGgilW83BN77VwNH1ekWWm7Po8iJXvrf7m
 bLa0H//Co9N+up9+tRd38Ms93piXPO2/k00vV8S2lbFLkkkgEBBaND2qu
 kM0pEu0b3o5Jbi41WmM5C9Uw4Ap3OSkqed/6BzWbu1qG/xOgTC2FqbchO
 C9Vpw/Szus+zmT0+w9/We3QsFDDKKHAatiQiKfD2RglR5xCabEz1w/n+I
 ulRMg669Gg88Ku9Qg3B6FUEmFkf+xapPMdWWJRZ0nFKGSwDzcT+5BB1QA A==;
X-CSE-ConnectionGUID: D9Lc2DUDSaKeufKoQZAGWw==
X-CSE-MsgGUID: fFqE6H0kRpKXw73FsmslDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71556999"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="71556999"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:12 -0800
X-CSE-ConnectionGUID: 1HVmBj94RsW+jFuHyPv+HA==
X-CSE-MsgGUID: E2Arjj7fQQOB9olsPr+1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="221718674"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 07:38:11 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/11] lib/kms: Nuke 'last_plane' from igt_crtc_init()
Date: Wed, 17 Dec 2025 17:37:49 +0200
Message-ID: <20251217153758.9369-4-ville.syrjala@linux.intel.com>
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

'last_plane' is just 'pipe->n_planes - 1'. Remvoe the redundant
variable.

Having less variables around will help with carving up
igt_crtc_init() further.

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

