Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3354D58B09
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 03:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4810E2AF;
	Mon, 16 Mar 2026 03:39:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cEralxhV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5489E10E2AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 03:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773632382; x=1805168382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=obrghbgsewHVDXctTY4Vc3SB7LvcpIn8jPtudALa83Y=;
 b=cEralxhVuCVZnDal8upO8Rfg+8tJsTkR+JolJdto3M1KjX1i1B75ThWX
 OWveWFqSgXfPRNCrw4ji5c8d+fz4KlyF0xdeAMsd9z4It4/OXaN7Q7Vl/
 xaYVCg7MH5Zdi8CSyCy1r/pAJHRhmh92sgCMzfw9UFt99NTLts7JHEDcu
 2yMj3Gg24krWTg32C6g7HTAc1sQ4OMsV/Bwdn7EmTthu3sbaQYst11VFi
 gsHPPPxsDG6btuSjDoDJr33lfeIhrg7cWySSTNyND2C9KKUKfEtKrzk1f
 tqbZxfiAhlIQy7JJqmijSnCPjpftI9emaj0opqC+LcUez+1KMuIBdgfyS A==;
X-CSE-ConnectionGUID: BrSx7/0nSAiRm9Vlt2UOTg==
X-CSE-MsgGUID: Y8+XLS9VQXW5aV8VTvx9GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="85345292"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="85345292"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:39:41 -0700
X-CSE-ConnectionGUID: eOcXdjMOS9+GVIMUwb6NHg==
X-CSE-MsgGUID: ikwP8jogQuOIJNM1pcBh5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="252297004"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 20:39:38 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
 supported
Date: Mon, 16 Mar 2026 09:08:07 +0530
Message-ID: <20260316033807.24078-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

While creating the framebuffer, prefer tile4 when it is supported
instead of always using linear. Fall back to linear if tile4 is not
available.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_legacy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..4c4e477a1 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 
 	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
+				     I915_FORMAT_MOD_4_TILED))
+		modifier = I915_FORMAT_MOD_4_TILED;
+
 	igt_create_pattern_fb(display->drm_fd,
 		      mode->hdisplay, mode->vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
+		      DRM_FORMAT_XRGB8888, modifier, fb_info);
 
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb_info);
 }
 
-- 
2.43.0

