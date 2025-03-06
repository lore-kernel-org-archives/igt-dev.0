Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CE1C282EC
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 15:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A413C10E20F;
	Thu,  6 Mar 2025 15:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YSbPDwDK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3685D10E20F
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741274761; x=1772810761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+6ewHPb7YtsE9GTSILFXfr8u8JQKkTNDVcdoRgUX76c=;
 b=YSbPDwDKao//gt5lc/JXPPmc4cBs+2LuLlcxKVkZ3oxL+Gzzrm424BdV
 F8DmXEvKSQV3AuTpbMOObJLX4BZAtepF7IgO8CSoQmzwBGyDKzGsUjA5G
 lFiSLCRKOAymlUvY60yHI8O/0pxplrT3RUCfGg/Rznv/aiAUpUv5toW0C
 2ZsaCxbZkVn3RNqM/rRiEvpt/znLXom/tU0g+Ye/50V2wAtDYVj9HBmlr
 f6aRcMMDXotIhDmeYyFEAB5pi6Iz86PN8EJ+LpTKnLFoqu6ai3qVdfQGn
 +CmsYatwnRtkxaKx0SxcejAHeTeIoSaE8SbcQuuz7Dv0zrVtkIlMt3ey7 w==;
X-CSE-ConnectionGUID: rRFpUux/RsGpSiAK+N0sYQ==
X-CSE-MsgGUID: f/nVXg8PRn2ZrlQRrOVADQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64738736"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="64738736"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 07:25:59 -0800
X-CSE-ConnectionGUID: Xeqtz/3YSpCBdShij7SH5Q==
X-CSE-MsgGUID: m+mDsGJpQ0y11aSy7wbtXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119964436"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.116.143])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 07:25:57 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_dp_link_training: Add missing DRIVER_XE
Date: Thu,  6 Mar 2025 16:25:52 +0100
Message-Id: <20250306152552.1620737-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Commit d7bccece44dd ("tests/intel/kms_dp_link_training: Restrict to Intel
GPUs") missed adding DRIVER_XE. Ensure both DRIVER_INTEL and DRIVER_XE
are set to properly restrict the test to Intel GPUs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
---
 tests/intel/kms_dp_link_training.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 7d3848b94..3df7b6562 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -335,7 +335,7 @@ igt_main
 	data_t data = {};
 
 	igt_fixture {
-		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
+		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
-- 
2.31.1

