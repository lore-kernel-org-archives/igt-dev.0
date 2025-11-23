Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FBDCFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF4B10E179;
	Sun, 23 Nov 2025 15:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6WtNiOF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF9910E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910507; x=1795446507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y6r6bqRMo0aqobataoynxuUokYRNZzrcf2TUK3q8rYM=;
 b=e6WtNiOFP8+hgAkCgPG6CZLvhqs0FZdHbeczOoZ8CVqYBRzCrHdCMiOc
 UBEZE2a7R8kpp4fNDtCBTtLTxd8zr2YGdKGPvb+fcBji1n2/1A+y1u9iD
 tAQWYDu5L2FEaQwmSZoOcAmNMEqkMcMMFuiPmjOZ8w2/DdJntH3cM7A2h
 oq7HDtcLG96BvOR3FrjVD0KBMQFGBB3wSP271B5PTjqlKYAnB1HssA1y6
 u9g3uhjIMnIyZQeY1uRC6KuBQvjJh85qG8cNWa33cwxDuiDDhLkqih0ro
 LOe6tUB8QkfJFgEW7uDh7Q7KCJReENUo3PJzDQuxAzSX6FLixxR79yHDJ A==;
X-CSE-ConnectionGUID: hYlx8z+XSPSolohOGrOzOA==
X-CSE-MsgGUID: wROcu6ToTDuH5l3He5vjpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615166"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615166"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:27 -0800
X-CSE-ConnectionGUID: KOVWwzQkREy+DHCmoHjZvA==
X-CSE-MsgGUID: +hTc9myXRsuq4yjeSY8ebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903735"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:26 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 06/35] tests/kms_display_modes: use display-aware pipe
 CRC helper
Date: Sun, 23 Nov 2025 20:53:43 +0530
Message-Id: <20251123152412.599801-7-kunal1.joshi@intel.com>
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

kms_display_modes creates per-pipe CRC helpers with igt_pipe_crc_new(fd, pipe,
...), assuming that the logical pipe enums pipe1 and pipe2 match the CRTC
indices used in the debugfs crtc-<index>/crc/ paths. That assumption fails if
CRTC indices and hardware pipes are not 1:1.

Switch the test to use igt_pipe_crc_new_for_display(display, pipeX,
IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipeX].crtc_offset instead of the pipe enum.

This makes kms_display_modes robust to non-trivial CRTC index to hardware pipe
mappings while keeping the rest of the test logic unchanged.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_display_modes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index d6494a85b..0bc428686 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -95,8 +95,10 @@ static void run_extendedmode_basic(data_t *data,
 
 	igt_assert_f(igt_fit_modes_in_bw(display), "Unable to fit modes in bw\n");
 
-	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
-	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[0] = igt_pipe_crc_new_for_display(display, pipe1,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[1] = igt_pipe_crc_new_for_display(display, pipe2,
+					   IGT_PIPE_CRC_SOURCE_AUTO);
 
 	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
-- 
2.25.1

