Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44FDC531CC
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jul 2026 20:01:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4634A10E5E3;
	Thu, 23 Jul 2026 20:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMuzUkCv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EC010E5E3
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 20:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784836863; x=1816372863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s/7xmCq1b/EfElMUQA3+FLW3JOJwst5+m4R7tkFGvY4=;
 b=JMuzUkCvYckJQAaGCGDrFXkUWoCOAhcNTem9ki6/UdVodAIQ2c5HXBgw
 syfe4fn5mole5JucyrfSivdbuY7fQkQjTCWG0R7SvVrf2yWToj5kOXqAD
 lwUmMxb68WUkUvzFmTrKv7tHneJ9OHg1jlBjavw/QsQ6+etFPURsU5Zih
 DcTzZ2ziSyswl2rSrAUfezSdFEJzPf2xZUlgsZUdWC5MzPP/3xpLXU72A
 P+vBPpVJ8GEs+es70uALbQCum8MeVo6jtky3aJhzeB+J/KGSQmwjeeWDP
 4J7bmY0aheWvWGDI0F+MaHV2Se2zlX6QX8/Lz3ECGboa53+cxaY6ieYrY A==;
X-CSE-ConnectionGUID: pzeG9+tfTjCmXJgL6Wjg4g==
X-CSE-MsgGUID: OZccSJH1SmiwNvXUtgRcPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96094489"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="96094489"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 13:00:52 -0700
X-CSE-ConnectionGUID: m8EL1xApSRySrNH0He0a4w==
X-CSE-MsgGUID: KkZQiN4ZS8mmQf+97PteNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="256723762"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 13:00:51 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 jeevan.b@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Allow low refresh modes with
 identical clocks
Date: Fri, 24 Jul 2026 01:31:01 +0530
Message-ID: <20260723200101.3944213-1-ramanaidu.naladala@intel.com>
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

Some panels expose multiple modes with the same resolution
and pixel clock, varying only in vertical blanking timings
to achieve different refresh rates.

The existing selection logic requires a strictly lower pixel
clock, which incorrectly excludes valid low-refresh-rate modes
when the clock remains unchanged.

For example:
"2880x1800": 60  678528 2880 2928 2960 3040 1800 3711 3717 3720 0x48 0xa
"2880x1800": 120 678528 2880 2928 2960 3040 1800 1851 1857 1860 0x40 0xa

Both modes share the same pixel clock (678528) and resolution,
differing only in vertical timings. Under the old logic, the
60 Hz mode is skipped because its clock is not lower than the
current mode.

Relax the constraint so that modes with identical clocks remain
eligible and select the lowest refresh rate among same-resolution
modes.

Fixes: 771fcec0819 ("tests/kms_vrr: Add new subtest to switch RR without modeset")
Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 82eb8554a..27f18e8d0 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -231,7 +231,6 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	for (i = 0; i < connector->count_modes; i++)
 		if (connector->modes[i].hdisplay == mode.hdisplay &&
 		    connector->modes[i].vdisplay == mode.vdisplay &&
-		    connector->modes[i].clock < mode.clock &&
 		    connector->modes[i].vrefresh < mode.vrefresh &&
 		    connector->modes[i].vrefresh >= vrr_min)
 			mode = connector->modes[i];
-- 
2.43.0

