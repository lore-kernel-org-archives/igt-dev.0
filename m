Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3191DCD484E
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 06:22:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D371710E16D;
	Tue, 12 May 2026 06:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZXYTYKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0C210E02C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 06:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778566927; x=1810102927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gl36RBlqAU4CYADalOtViI6BJEPM6krmaHgkBA/mwJA=;
 b=UZXYTYKeLAlP37C7bx9bBO0Q+McsA1GqYkVZC2hNzkyy3H03qwKQghZn
 b2LtmHMYeSiuVH0rYEfYmbL+6bKLNqNWa546lxgqnWQX8N8rMKn3/e8nr
 a5v6fph6qnIuGTNc5K3alH8ZtQM9X04e1F3ASPeB1v0HlNDLJUrojmc9H
 mprhBRklTPstIY6lXnqZhkewaq4rmBaVK9iWFOZu2FAWMKRw4NzGoG1ku
 Fl9+z8x1e0JuR3CEndy0RXaKuueRPFMu4hy/7OTwLL0+ox6as7W71Efxi
 QVk0u3DMifM9MqZnguGH4Pik+OZm5b5xuQ9Y8Ii6W1gVm+OEAbVQnfonH A==;
X-CSE-ConnectionGUID: DOpapE9SR527/fVr+vSAvA==
X-CSE-MsgGUID: Y3hqzgvbR+6bp86ZgG+nDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="82033645"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="82033645"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 23:22:07 -0700
X-CSE-ConnectionGUID: tgDPT5UgTuurmdynXovCQw==
X-CSE-MsgGUID: RGENYpHGT4KSnNCbwXwD/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="242032307"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 23:22:05 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@intel.com, ville.syrjala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t v2 2/2] HAX: kms_cursor_legacy: Use
 IGT_FORMAT_MOD_PREFERRED for cursor FBs
Date: Tue, 12 May 2026 11:50:18 +0530
Message-ID: <20260512062020.546220-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512062020.546220-1-jeevan.b@intel.com>
References: <20260512062020.546220-1-jeevan.b@intel.com>
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

Switch all cursor-related framebuffer creations in
kms_cursor_legacy to use IGT_FORMAT_MOD_PREFERRED instead of
DRM_FORMAT_MOD_LINEAR.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_legacy.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..e32d2ac7e 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -373,7 +373,7 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 
 	igt_create_pattern_fb(display->drm_fd,
 		      mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
+		      DRM_FORMAT_XRGB8888, IGT_FORMAT_MOD_PREFERRED, fb_info);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb_info);
@@ -579,7 +579,7 @@ static void prepare_flip_test(igt_display_t *display,
 
 		igt_skip_on(width <= 64 && height <= 64);
 		igt_create_color_fb(display->drm_fd, width, height,
-				    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, 1., 0., .7, cursor_fb2);
+				    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED, 1., 0., .7, cursor_fb2);
 
 		arg[0].flags = arg[1].flags = DRM_MODE_CURSOR_BO;
 		arg[1].handle = cursor_fb2->gem_handle;
@@ -605,7 +605,7 @@ static void prepare_flip_test(igt_display_t *display,
 		            crtc->planes[1].type != DRM_PLANE_TYPE_CURSOR);
 
 		igt_create_color_pattern_fb(display->drm_fd, prim_fb->width, prim_fb->height,
-					    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, argb_fb);
+					    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED, .1, .1, .1, argb_fb);
 	}
 }
 
@@ -652,10 +652,10 @@ static void flip(igt_display_t *display,
 	}
 
 	igt_create_color_fb(display->drm_fd, fb_info.width, fb_info.height,
-			    DRM_FORMAT_ARGB8888, DRM_FORMAT_MOD_LINEAR, .5, .5, .5, &cursor_fb);
+			    DRM_FORMAT_ARGB8888, IGT_FORMAT_MOD_PREFERRED, .5, .5, .5, &cursor_fb);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_crtc(display, cursor_crtc, &cursor_fb);
 	populate_cursor_args(display, cursor_crtc, arg, &cursor_fb);
 
@@ -769,7 +769,7 @@ static void basic_flip_cursor(igt_display_t *display,
 	set_fb_on_crtc(display, crtc, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
@@ -948,7 +948,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
 	set_fb_on_crtc(display, crtc, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
@@ -1089,7 +1089,7 @@ static void nonblocking_modeset_vs_cursor(igt_display_t *display, int loops)
 	set_fb_on_crtc(display, crtc, output, &fb_info);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 	arg[0].flags |= DRM_MODE_CURSOR_BO;
@@ -1216,7 +1216,7 @@ static void two_screens_flip_vs_cursor(igt_display_t *display, int nloops, bool
 	}
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg1, &cursor_fb);
 
@@ -1395,7 +1395,7 @@ static void cursor_vs_flip(igt_display_t *display, enum flip_test mode, int nloo
 	vrefresh = igt_output_get_mode(output)->vrefresh;
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	cursor = set_cursor_on_crtc(display, crtc, &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
@@ -1513,7 +1513,7 @@ static void two_screens_cursor_vs_flip(igt_display_t *display, int nloops, bool
 	}
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 
 	cursors[0] = set_cursor_on_crtc(display, crtc[0], &cursor_fb);
 	populate_cursor_args(display, crtc[0], arg[0], &cursor_fb);
@@ -1628,7 +1628,7 @@ static void flip_vs_cursor_crc(igt_display_t *display, bool atomic)
 	set_fb_on_crtc(display, crtc, output, &fb_info);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -1709,10 +1709,11 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 	set_fb_on_crtc(display, crtc, output, &fb_info[0]);
 	plane_primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_create_color_pattern_fb(display->drm_fd, fb_info[0].width, fb_info[0].height,
-				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, .1, .1, .1, &fb_info[1]);
+				    DRM_FORMAT_XRGB8888, IGT_FORMAT_MOD_PREFERRED, .1, .1, .1,
+				    &fb_info[1]);
 
 	igt_create_color_fb(display->drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 	populate_cursor_args(display, crtc, arg, &cursor_fb);
 
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
@@ -1816,7 +1817,7 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 
 	cursor_width = cursor_height = 64;
 	igt_create_color_fb(display->drm_fd, cursor_width, cursor_height, DRM_FORMAT_ARGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
+			    IGT_FORMAT_MOD_PREFERRED, 1., 1., 1., &cursor_fb);
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-- 
2.43.0

