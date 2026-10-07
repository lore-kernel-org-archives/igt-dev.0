Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAA7CA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 11:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F8410E42D;
	Wed,  7 Oct 2026 11:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBYt83SP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D2F10E432
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791370876; x=1822906876;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aMq5OXL9bt5uC4kjnhHco/mFPSOSBysmyrHnzi1SJO4=;
 b=JBYt83SPf2XBsfCD2PXLc17lvYsd5ZI7/Pe15vkEvjB3m/OL4sYIawdA
 7/YXreDgWN/CFse+48nHOJARavOXstkAguId4CWhPVHVMS6fHn0flYTTS
 YMjkVBMpjztEBtmOE/1G5pfFcoMUaeEvvORxiYycEOrSlxorPGpwgvLhw
 P/PK8nxS+xBY9k1Vg2uPxNhjinxLK/aTpZsLCYmLqFvkWKQMVfdkbTO2x
 p6LXkDPIXNsqUREEHrNIrChAn//KYDBaR/TNT9nrgVh76vomSGCXpqkQz
 EgAYidSkEcuL/WV/FJi0Fh8oQ+uBiMLXMfZGwdfbGNy6rRtzMksYV2yrf Q==;
X-CSE-ConnectionGUID: tnshA6c9QsiFsBRCVX9ecA==
X-CSE-MsgGUID: ohyKyZQwSrGerBHWSyQv/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="133487"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="133487"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 04:01:16 -0700
X-CSE-ConnectionGUID: pWKpGNOfQfm5HPIphgio0g==
X-CSE-MsgGUID: /HStjnDNTyai2eEBPxnmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="29154"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 04:01:14 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_vrr: Limit LOBF FPS to half the panel
 refresh rate
Date: Wed,  7 Oct 2026 16:31:08 +0530
Message-ID: <20261007110108.1041866-1-ramanaidu.naladala@intel.com>
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

DC3CO transitions require sufficient time between consecutive flips.
Using flip rates close to the panel refresh rate can leave too little
idle time for the display to reliably enter and exit the low-power
state during LOBF testing.

Restrict the selected flip rates to at most half of the mode refresh
rate. This provides enough margin for DC3CO transitions and ensures
that the test exercises LOBF under conditions.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9c71ab9e7..b41c58539 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1068,7 +1068,7 @@ lobf_flip_video_timing_fps(data_t *data, igt_output_t *output,
 	for (int i = igt_vrr_standard_video_timing_fps_count - 1; i >= 0; i--) {
 		uint32_t fps = igt_vrr_standard_video_timing_fps[i];
 
-		if (fps > mode->vrefresh)
+		if (fps > (mode->vrefresh / 2))
 			continue;
 
 		igt_info("Testing LOBF with a %u hz flip rate on %u hz panel refresh rate: ",
-- 
2.43.0

