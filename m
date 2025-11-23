Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC13CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46F610E182;
	Sun, 23 Nov 2025 15:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AoC3Mczg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7ABE10E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910535; x=1795446535;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2UK6IBQcTEvl5QX38jG90v/X0OhbebFmpROY/4BVTHI=;
 b=AoC3MczgSRvHJonomRzcc4lnrxQEMdLOkMftUpLgbvSanhxGoyc70o07
 PekXEL/DrnrKcBu3U8nukpuqQaePPDXq1DY/s+niofe9LO0Kpj2QsrNK1
 BEUIrDiptPTBd0w4P/gMC0qo3lI/dtsa0rz5ZWEErEz33xCLMMFMuxkzr
 LlcFw6sSA/aMX2lL2eOxxTIB8txxKhQRc0VqfYG/H6K2SYPEnRgi8O12S
 OYcwM/viwIMgdZoT0tGAYQt6+Uu1tRFx7LmWHZOrOcA6Y+Xecj6YSuLSE
 xpjrf3GPIOZ1Cq+K/CO9BP6UKOfELLPbE+BE71t8OkcwXzZyYPVxTyssa A==;
X-CSE-ConnectionGUID: 7uaH3bYxT62bRl7hn+Y6Tw==
X-CSE-MsgGUID: /aF5qUyaRbSxeVlk9Z6TTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615217"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615217"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:55 -0800
X-CSE-ConnectionGUID: Y0DCMp9iSga6HUHtQaTBuQ==
X-CSE-MsgGUID: v7+LFiY/S++DOsoxC/DioQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903834"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:55 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 26/35] tests/kms_dirtyfb: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:54:03 +0530
Message-Id: <20251123152412.599801-27-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

Switch kms_dirtyfb to igt_pipe_crc_new_for_display so CRC sampling uses the display mapping instead of assuming the pipe index matches the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index c0649c0c6..c28dc00fe 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -231,8 +231,9 @@ static void prepare(data_t *data)
 
 	igt_output_set_pipe(data->output, data->pipe);
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					 IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+					   data->pipe,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, data->mode->hdisplay,
 			    data->mode->vdisplay, DRM_FORMAT_XRGB8888,
-- 
2.25.1

