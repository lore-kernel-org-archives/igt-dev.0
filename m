Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7468BCFC518
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2658110E056;
	Sun, 23 Nov 2025 15:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQpbsvIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E06B310E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910516; x=1795446516;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5kRxZU4NfLThtp+FTzIEN3pLHf9Tq9RfJGlApe5Jmws=;
 b=HQpbsvIAXQ5+oyGPGU2mB7yOXjQuFqIZXdmYYnDHEBDIKR/aHt3/IsTR
 hpUYc60J1Ejn2CaGuc6NM4Hwot+tGXL4HsBDzBAj4oVkCteBR87Z8sX83
 lqukMiluBQq49FtJshOHLMrMf5gy7v+XeP+Iy46HTaZWF53X9IZvTXAFD
 dbMAprO4I1KyBRW+SqbV2tG9e/KmNW77wx6Dv0S8sR/Tuh/BKouVv3BjE
 NoKoBd5265zeT5pw+KS3twVIukyxSiZaNMrkjQ0gH19zfxEPKspUfub+i
 j3Grfgmm0W8XtjEDmLjzo/BebYbF6/JJqQhO4cSC/4zr4Dr0pGtLog8Ww Q==;
X-CSE-ConnectionGUID: jgW7muVJQDqoB4lGHvvmmw==
X-CSE-MsgGUID: E3oaNrikQ1uyxUgZN3haMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615179"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615179"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:35 -0800
X-CSE-ConnectionGUID: AZT8Ui2xSi+u9xZBiIIBmw==
X-CSE-MsgGUID: uiteRdpESKSkBtFOdYHu2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903764"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:35 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 12/35] tests/kms_atomic_transition: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:49 +0530
Message-Id: <20251123152412.599801-13-kunal1.joshi@intel.com>
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

kms_atomic_transition created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...),
keying them directly off the logical pipe index. That assumed the pipe enum
matched the CRTC index used in the crtc-<index>/crc/ debugfs paths, which can
break on platforms where CRTCs and hardware pipes are not in a simple 1:1
mapping.

Switch the CRC users in this test to use igt_pipe_crc_new_for_display(&data->display,
pipe, IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are derived from
display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_atomic_transition robust to non-trivial CRTC index to hardware
pipe mappings while preserving the rest of the test logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_atomic_transition.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 419afe4dd..c21bb1713 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -926,8 +926,9 @@ retry:
 		j += 1;
 
 		if (is_intel_device(data->drm_fd))
-			data->pipe_crcs[i] = igt_pipe_crc_new(data->drm_fd, i,
-							      IGT_PIPE_CRC_SOURCE_AUTO);
+			data->pipe_crcs[i] = igt_pipe_crc_new_for_display(&data->display,
+								      i,
+								      IGT_PIPE_CRC_SOURCE_AUTO);
 
 		for_each_valid_output_on_pipe(&data->display, i, output) {
 			if (output->pending_pipe != PIPE_NONE)
-- 
2.25.1

