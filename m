Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592C8CD4F3C
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 08:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091C410E73F;
	Mon, 18 May 2026 08:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QyaiGAYE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797F310E744
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 08:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779094096; x=1810630096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cioRoVfWXotzxejPdkDL1oXuHp0DYKRiuYD7TJI+iBk=;
 b=QyaiGAYE57uf0ueHTwDhdF9mrpZwY2PzPkxS0fKJ/Rm8DLUzDMBT97dv
 81RfmZwq0M3ZKHNbzGgfQGP58SA59zVuv1p9EGqtIaXPxijnN0ivLt214
 fr4saXVQ0vuQo0lUVH5v2QxRIr6+c9oOZf2aE8Eo5vKu5lYAh9I5HeLCJ
 lLqwYiu5yre35xhMs8ftyo7IRtHByE4At/vyLeYVvNFogpRg9Ozx9IoxO
 ppuA0sFjlVKLsRugEprRdO2KvChjQZoalRqOZetUWQ834nCWAh/+ZyrAz
 zNfWOWkvMg6jw9iPR4xc6dSSNc69foGX2tSciRm8TYtatUnGpJUv4VgSt g==;
X-CSE-ConnectionGUID: y6oHjY1MTCa0wbsNif8H+w==
X-CSE-MsgGUID: pTnFjg0DQs6Uj4bYh5QI1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83812214"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="83812214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:48:16 -0700
X-CSE-ConnectionGUID: W7/pWB1mS3u7b50t1Xy5iA==
X-CSE-MsgGUID: zNrgdBh8SoaS8jbwWP9ezw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243364271"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 01:48:14 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, jani.nikula@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_cursor_legacy: Use preferred modifier for
 non-cursor framebuffers
Date: Mon, 18 May 2026 14:16:31 +0530
Message-ID: <20260518084631.1085515-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518084631.1085515-1-jeevan.b@intel.com>
References: <20260518084631.1085515-1-jeevan.b@intel.com>
MIME-Version: 1.0
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

Stop hardcoding DRM_FORMAT_MOD_LINEAR for primary test framebuffers.
Instead, use IGT_FORMAT_MOD_PREFERRED. This allows IGT to select a
tiling mode supported by the platform via capability checks, avoiding
per-platform modifier policies in tests as tiling support evolves.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_legacy.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..d281ffd9c 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -373,7 +373,7 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 
 	igt_create_pattern_fb(display->drm_fd,
 		      mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
+		      DRM_FORMAT_XRGB8888, IGT_FORMAT_MOD_PREFERRED, fb_info);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb_info);
@@ -605,7 +605,8 @@ static void prepare_flip_test(igt_display_t *display,
 		            crtc->planes[1].type != DRM_PLANE_TYPE_CURSOR);
 
 		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width, prim_fb->height,
-					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb);
+					    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED,
+					    .1, .1, .1, argb_fb);
 	}
 }
 
@@ -1709,7 +1710,8 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	set_fb_on_crtc(display, crtc, output, &fb_info[0]);
 	plane_primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
-				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
+				    DRM_FORMAT_XRGB8888, IGT_FORMAT_MOD_PREFERRED,
+				    .1, .1, .1, &fb_info[1]);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
-- 
2.43.0

