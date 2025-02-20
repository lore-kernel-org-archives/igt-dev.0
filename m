Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECF3C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 14:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EBF10E967;
	Thu, 20 Feb 2025 14:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NIenipkO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C3210E967
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 14:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740060805; x=1771596805;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tDQIUf5L9j9anPXIBXMDKr1SKccoTeXjBuLw6g8AbBU=;
 b=NIenipkOm3Xx+12O7+LEoF5GnZY/v8jdIki9/IEFdgyTH5MaLtnHMGbs
 fN2yS22z8QjG1e/D/74uuhk619dUoNudybCXOqDmPoxue4RskUggwXBIQ
 BUtixUZ0QFAoMSwLXdYMbdvULmz+ak60TNtpHEKF+3cluEatBgOYl7QEt
 4k8ujgB51jxc+wcR4tzKtCaaO63gYRvyICv1fEEYZCFmx4Ap0rFevyxxf
 GvJC7eyAsMxDUoSTjTytrnTqqsGSYoG2nbdPfhWPRFJOpGcwLQuuhDuPu
 PDq4CFZ+tWekUJ/aDRKspvrpnrxbs56F+h9Ih0i77t1Ot5qFWhRYuB5r2 g==;
X-CSE-ConnectionGUID: 5AVCWU1qTpiBpWlDr/iBmA==
X-CSE-MsgGUID: UybTm3PhR6y8TeAcrA3ikg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40708683"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="40708683"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:13:24 -0800
X-CSE-ConnectionGUID: YeS4avL8RRWSWw9HFlohmw==
X-CSE-MsgGUID: qcNioJRgQT2xJU48y7cQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120276952"
Received: from slindbla-desk.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 06:13:22 -0800
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH i-g-t v1] tests/intel/kms_dirty-fb: update modifier based on
 display version for fbc
Date: Thu, 20 Feb 2025 16:13:10 +0200
Message-ID: <20250220141310.229053-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

FBC on display version 8 below supports only I915_FORMAT_MOD_X_TILED
modifier. So update the FBC specific tests based on this restriction,

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_dirtyfb.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index f2bdd4546..e0fd84ade 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -58,6 +58,7 @@ typedef struct {
 	int debugfs_fd;
 	igt_display_t display;
 	drmModeModeInfo *mode;
+	uint64_t modifier;
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crc;
 	enum pipe pipe;
@@ -238,7 +239,7 @@ static void prepare(data_t *data)
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
 			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+			    data->modifier, 0.0, 1.0, 0.0,
 			    &data->fbs[0]);
 
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[0],
@@ -260,7 +261,7 @@ static void prepare(data_t *data)
 
 	igt_create_color_fb(data->drm_fd,  data->mode->hdisplay,
 			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+			    data->modifier, 0.0, 1.0, 0.0,
 			    &data->fbs[1]);
 	igt_draw_rect_fb(data->drm_fd, data->bops, 0, &data->fbs[1],
 			 data->rendercopy ? IGT_DRAW_RENDER : IGT_DRAW_BLT,
@@ -268,8 +269,8 @@ static void prepare(data_t *data)
 			 data->fbs[1].height, 0xFF);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
-			     data->mode->vdisplay, DRM_FORMAT_XRGB8888,
-			    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
+			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
+			    data->modifier, 0.0, 1.0, 0.0,
 			    &data->fbs[2]);
 
 	igt_plane_set_fb(primary, &data->fbs[2]);
@@ -386,6 +387,13 @@ igt_main
 					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
 						       "FBC isn't supported on BMG\n");
 
+					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
+					if (data.feature == FEATURE_FBC &&
+					    intel_display_ver(intel_get_drm_devid(data.drm_fd) <= 8))
+						data.modifier = I915_FORMAT_MOD_X_TILED;
+					else
+						data.modifier = DRM_FORMAT_MOD_LINEAR;
+
 					if (!check_support(&data))
 						continue;
 
-- 
2.43.0

