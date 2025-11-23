Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F56CFD31C
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B79210E18B;
	Sun, 23 Nov 2025 15:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0Dc1p6n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19EC110E152
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910537; x=1795446537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=koY3dWSkIFlIv6W7hlCMphiYSSnl8ID0utVOcmgLfr4=;
 b=Q0Dc1p6nZk+IJJVU8J4DpQAPcr2DqA4JvSYxgqqwk+kKU/Wm/Xq8jEP4
 cvaPstrYARRWc9vmKWxkB4Ximisn2vyndGuQIWq7Pbkq3aJ88rAuHbSGV
 VU8oFSFIlfCPPRZVxo6ei25iHvDJO824whm/ndevJCtzFXZAstBBvc61k
 +FT5xklD6FWkVvAh0tcse82HgGFIrlKTbABVHhEGkbQpPxOpmZVp/SaH7
 l2f9cuGCRT7prTiYf0O6soPYaQ/wK3CQtINx5NAaUY2tgHYOSvCW998fD
 HyxlUh2yf9I4Ps/Q+rQHY2syftfm9zGwyW5LWkHxFuf8NUk1HjBf/oNjp A==;
X-CSE-ConnectionGUID: GvUo+OtjTlemgxZviw1iAQ==
X-CSE-MsgGUID: PkEj1AMrSMm//v30HqRDSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615218"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615218"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:57 -0800
X-CSE-ConnectionGUID: sEmu1lSlRd+rdGxjakAc1w==
X-CSE-MsgGUID: 1iYzTjheR6qXxVF3dPAwAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903839"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:56 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 27/35] tests/kms_big_fb: use display-aware pipe CRC
 helper
Date: Sun, 23 Nov 2025 20:54:04 +0530
Message-Id: <20251123152412.599801-28-kunal1.joshi@intel.com>
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

Switch kms_big_fb CRC call sites to igt_pipe_crc_new_for_display so they derive the CRTC index from the display state instead of assuming the pipe index equals the CRTC index.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_fb.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index 41fdcacab..6f03bee9d 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -564,8 +564,9 @@ static bool test_pipe(data_t *data)
 	igt_display_commit2(&data->display, data->display.is_atomic ?
 			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+											 data->pipe,
+										   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
 		ret = test_plane(data);
@@ -629,8 +630,9 @@ max_hw_stride_async_flip_test(data_t *data)
 		 data->hw_stride);
 	generate_pattern(data, &data->big_fb_flip[1], 640, 480);
 
-	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
-					  IGT_PIPE_CRC_SOURCE_AUTO);
+	data->pipe_crc = igt_pipe_crc_new_for_display(&data->display,
+											data->pipe,
+										  IGT_PIPE_CRC_SOURCE_AUTO);
 	igt_pipe_crc_start(data->pipe_crc);
 
 	igt_plane_set_fb(primary, &data->big_fb);
-- 
2.25.1

