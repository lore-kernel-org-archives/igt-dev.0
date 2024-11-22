Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA0EE65D1D
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 03:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A246110E1D5;
	Fri, 22 Nov 2024 03:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jIN4XW29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E06E10E1D5
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 03:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732247707; x=1763783707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wIDI+jJ1KD93q37QYWyYSf7lpVFnPy3t/EP6os530Xw=;
 b=jIN4XW29z85LAkjKE7SGX2M//q2M77UHXbe5DVqUwWEXE8Koqo1HTQ19
 4cl8CHx3w8AOflDdeZtstdcG2yeIrnB7dRU9kH1RQGOwlrfPFvk/2ve1W
 2SPMSKs6liiqGDmmLIVRHoRsFraYLfj+qqrMqAL8+Z+riJoqhQp4BRN2K
 E3pWkQNpVHZ81zg/pHQCMlf+fxq2ZWYSUElQzkkI7rcr/krWhVE9JAu2O
 f8FakC6B3zStd/MTvRFHjP5SJD9qoBav/8nQ3LY/z7EHjsLdMPPAySsX3
 Rh4ZjN6Gwwjcr3bkMfnkFzfHrQun7FtuMqk006UsnbeP4MKPt14KNKona w==;
X-CSE-ConnectionGUID: sy8DGw2iSWmTgkNSmz2RFw==
X-CSE-MsgGUID: beYcPsckTSC2qYynqLOPBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32449568"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="32449568"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 19:55:06 -0800
X-CSE-ConnectionGUID: ufDC2IObSC6FBBoCioRvrA==
X-CSE-MsgGUID: nyebZYddR8iLopcMu05FmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="90617026"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 19:55:05 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Fix cursor_fb3 framebuffer
 creation format
Date: Fri, 22 Nov 2024 09:39:58 +0530
Message-Id: <20241122040958.145956-1-jeevan.b@intel.com>
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

Updated cursor_fb3 framebuffer creation in the cursor subtest function
to use linear tiling instead of x-tile. As x-tile is no longer supported
on latest platforms.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..aeeaf69f7 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1199,7 +1199,7 @@ static void cursor_subtest(bool dpms)
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_ARGB8888,
 		      DRM_FORMAT_MOD_LINEAR, &cursor_fb2);
 	igt_create_fb(drm_fd, 64, 64, DRM_FORMAT_XRGB8888,
-		      I915_FORMAT_MOD_X_TILED, &cursor_fb3);
+		      DRM_FORMAT_MOD_LINEAR, &cursor_fb3);
 
 	fill_igt_fb(&cursor_fb1, 0xFF00FFFF);
 	fill_igt_fb(&cursor_fb2, 0xFF00FF00);
-- 
2.25.1

