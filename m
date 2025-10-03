Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B1CCA470
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 07:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE22D10E8CC;
	Fri,  3 Oct 2025 07:11:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwrFvLL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712C510E8CC
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 07:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759475465; x=1791011465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zg320McaeJTCSuGDPHN07pfPP2t1Ur0bzaPJGGIOUQU=;
 b=OwrFvLL1ctTCTDfXOMWrS4WTbO3lbRxlnY3Fhabj61CfiARDC5amjCrj
 2msvb1RtBO0/uG6UrO3F/J7cZpTBmWsrtICwMQGwzAiBygZyNNVLK5I2R
 t0imVHBoOK0aUMg77Y2TrHwIo214oMDmZw6Lq7cB34+10EBsOnfBT2nzM
 VCLquw1/IpiJGH3cpGDEZkr/zZrRCYRBMP3tRTxgY2MiZRzsKvbHKGeWu
 ic3ew0cMtLIW4WVvAB2pEzYFL4lRgsr6GI66WnCErHWoCyvAhCljsAcF8
 AmawGbZ4xQGhQyupR0MMTAv1+LYQmtfxrjoOjLyKPPd6voori0B54DR2D Q==;
X-CSE-ConnectionGUID: X7lcHqRNS+uX17cpbTF6bg==
X-CSE-MsgGUID: ROL04fUXRIibWzhuGnn4JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61921030"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="61921030"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 00:11:05 -0700
X-CSE-ConnectionGUID: 3MUSBXQEStq/8M8Gzxbqcw==
X-CSE-MsgGUID: bFUhAcqiTDWWYbW30Cq+vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; d="scan'208";a="178863162"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 00:11:03 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_fbcon_fbt: Skip CRC based FBC cursor
 check on simulation
Date: Fri,  3 Oct 2025 12:37:47 +0530
Message-Id: <20251003070747.566921-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Skip fbc_check_cursor_blinking on simulation as it involves CRC operations
which may cause hangs or false negatives during test execution.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_fbcon_fbt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
index f3843cdb0..7ba31cd86 100644
--- a/tests/intel/kms_fbcon_fbt.c
+++ b/tests/intel/kms_fbcon_fbt.c
@@ -149,6 +149,14 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
 	bool ret;
 	int i, pipe;
 
+	/*
+	 * Skip cursor blinking check when running in simulation mode.
+	 * CRC operations are significantly slower in simulation,
+	 * so CRC checks are avoided to prevent false negatives.
+	 */
+	if (igt_run_in_simulation())
+		return true;
+
 	pipe = kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
 	pipe_crc = igt_pipe_crc_new(drm->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
 
-- 
2.34.1

