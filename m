Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371E8F8A151
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 09:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E087010E878;
	Thu, 16 Apr 2026 09:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VrvAbC+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F8B10E098
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 09:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776331602; x=1807867602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+44jeC3si2GUcH2R8JnkzITUvwNsTvRHtjpNR7ZkSk=;
 b=VrvAbC+YyguLXBSigBAA2jgbX2tEJrCBVNgrGjK3Vu8oGhCBhWMSOpWO
 /myGPY6XiheV5tWALuJdPGJV2CZJPaPrAeUXca58pGDgMfjc+VF3k+3TF
 xlZU2azR3tutE3PxTnY9t3/5lBjmvdh+1BFiZehP8RaVf9hkf/LXa27+f
 +U1T5pIXTyrrvrokqwx+7QGojMwudFc1eyJnYNqmT4ulaplVoSybnHyoI
 o1/C3+fj2MYxJhpcMBOmI5sheOTa9SU7+ODmk8vX9dfTgTmHsF0BOi514
 tltipCg5xt/qGyT9r9rDIDq2NxNBy/Ph3UXTL6gYADa5KCzi/FCl0LOSF A==;
X-CSE-ConnectionGUID: F2joXt1uTYuoHU1yV3L3Jg==
X-CSE-MsgGUID: BtVH97HrQx2nYRI95o74YA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88775929"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88775929"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:42 -0700
X-CSE-ConnectionGUID: bHxCzNiXSLejDl4rXXZ/ZQ==
X-CSE-MsgGUID: I1qkWPXVSEe/vsmeEWpj1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="235063056"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.244.194])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 02:26:40 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com, jani.nikula@intel.com
Subject: [PATCH i-g-t v3 09/11] tests/intel/kms_fbcon_fbt: find and store the
 crtc index
Date: Thu, 16 Apr 2026 12:25:57 +0300
Message-ID: <20260416092559.88735-10-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416092559.88735-1-vinod.govindapillai@intel.com>
References: <20260416092559.88735-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo
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

As we need to find the fbc status from crtc debugfs entry, find
and keep the crtc index from the crtc_id and use it wherever
required.

Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index 5863c9e68..96136f8ff 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -68,7 +68,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 #define MAX_CONNECTORS 32
 
 struct drm_info {
-	int fd, debugfs_fd, crtc_id, devid;
+	int fd, debugfs_fd, crtc_id, crtc_index, devid;
 	struct igt_fb fb;
 	drmModeResPtr res;
 	drmModeConnectorPtr connectors[MAX_CONNECTORS];
@@ -149,10 +149,9 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
 	igt_pipe_crc_t *pipe_crc;
 	igt_crc_t crc[2];
 	bool ret;
-	int i, crtc_index;
+	int i;
 
-	crtc_index = kmstest_get_crtc_index_from_id(drm->fd, drm->crtc_id);
-	pipe_crc = igt_pipe_crc_new(drm->fd, crtc_index, IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc = igt_pipe_crc_new(drm->fd, drm->crtc_index, IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_pipe_crc_start(pipe_crc);
 	igt_pipe_crc_drain(pipe_crc);
@@ -222,6 +221,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
 		      "No connector available\n");
 
 	drm->crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
+	drm->crtc_index = kmstest_get_crtc_index_from_id(drm->fd, drm->crtc_id);
 
 	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
 				  DRM_FORMAT_XRGB8888,
-- 
2.43.0

