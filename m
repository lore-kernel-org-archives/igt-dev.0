Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63406CD8CA4
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jun 2026 19:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E600110F93D;
	Mon,  8 Jun 2026 19:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ObXYmcto";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0087E10E8C8
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jun 2026 19:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780947731; x=1812483731;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6oBQr5yxwby7RS+gQqbuQ32dMjeUbf54u8i9HMfN7Xg=;
 b=ObXYmctoQxzSFUoGvlo1+3BIWj3OvGf9dZqgYVYaeSGeOS/0CwLzmE5z
 SK0P7fTTkcYB3QJbS0hvMSUntB/wcGMjqFoQsT980oaba6iQ0PCLNGhH3
 JK38yJTGkH/AQkqEkGAO8BQJuRfwYCUGwaYu/ZNygZ86jjX6UsHJm0+Sp
 oQ0udrfjPYqnO2fSuMLRb+rUeZkenFSY8Yrb7FPvx3BZcqM0BlLe4EM0v
 aR/Tb7gtwYI4qbadTC7RyrfcujMwquwOufiD5i2mz/vObaCISFQwREFct
 xT55Rn+SMplMLfDs/I5wFNbtAJklP082dllYFZoLHV7zSH3Lm6aPyjhfr A==;
X-CSE-ConnectionGUID: nl/kpwBLT9K5mZqsiC2brQ==
X-CSE-MsgGUID: nnSj6lkeSfCTPmIKCyHYaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="99114551"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="99114551"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 12:42:11 -0700
X-CSE-ConnectionGUID: QPRla76MSWOWfmyQzuhblw==
X-CSE-MsgGUID: CYvXcnjbRI2scTdW5tiFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="239313583"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2026 12:42:09 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip CDCLK bump validation when
 mode is exactly 4K@30
Date: Tue,  9 Jun 2026 01:21:05 +0530
Message-Id: <20260608195105.2616958-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

The is_4k() helper was requiring >= 60Hz for all resolutions >= 4K.
This caused modes like 7680x4320@30 to be incorrectly skipped, even
though their high pixel clock (e.g., 1030 MHz) guarantees a CDCLK
transition.

Fix by only requiring >= 60Hz refresh at exactly 4K resolution
(3840x2160), since at that resolution 30Hz does not produce enough
pixel clock to trigger a CDCLK bump. Resolutions strictly above 4K
always have a high enough pixel clock regardless of refresh rate.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index e4d12cbfa..1e9c913f4 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -80,6 +80,9 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
 
 static bool is_4k(drmModeModeInfo mode)
 {
+	if (mode.hdisplay > HDISPLAY_4K)
+		return true;
+
 	return (mode.hdisplay >= HDISPLAY_4K && mode.vdisplay >= VDISPLAY_4K &&
 	        mode.vrefresh >= VREFRESH);
 }
-- 
2.25.1

