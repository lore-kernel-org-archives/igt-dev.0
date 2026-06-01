Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4EE9CD5BD1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4115310E983;
	Mon,  1 Jun 2026 20:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5ZX3Zoq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8409010E978
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780346683; x=1811882683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p+44jeC3si2GUcH2R8JnkzITUvwNsTvRHtjpNR7ZkSk=;
 b=X5ZX3ZoqBUZPJiI+R9sqn7P62cJqlVjDATddKP+imx3zfWunnSYB/EL+
 dJaCuyGhTpLiRNdY+pdMluW+Wkk91hKAoPpVMvqH0cRmHLVDSVKp8ba0u
 COKkt4S42D35z8RAA/RxALZ366q1k4FduBT59kzhiUOczmQbPqBu3M6a4
 RDytWZlo5y9kI2EgObKcRfxoVTvIrVawKTgN8THP4uAT6DWzzqFuzAUwN
 he1/70Z9BHXHbQRMxte2JDzrhfLS9DnUVqTJIscP7pGwmxJAdm8BP4F3I
 SBm3wJ+IgjU2F3U+fnqeurn4mmDYLChF9RLKYgaNrFhRrQmuMbn3oczJj Q==;
X-CSE-ConnectionGUID: Uua56OvxRY+RugpunGOP5w==
X-CSE-MsgGUID: e6zJ2GfCS9me8rmskdoPTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68652874"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="68652874"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:42 -0700
X-CSE-ConnectionGUID: YWlziiC8TemP26Jin67o0Q==
X-CSE-MsgGUID: 4TP42RcGSDStR0YGqppjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="267331524"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO
 vgovind2-mobl4.intel.com) ([10.245.245.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 13:44:41 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, santhosh.reddy.guddati@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH i-g-t v4 09/12] tests/intel/kms_fbcon_fbt: find and store the
 crtc index
Date: Mon,  1 Jun 2026 23:44:04 +0300
Message-ID: <20260601204407.39934-10-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260601204407.39934-1-vinod.govindapillai@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
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

