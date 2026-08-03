Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5887C55184
	for <igt-dev@archiver.kernel.org>; Mon,  3 Aug 2026 08:28:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2F810E4B6;
	Mon,  3 Aug 2026 08:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bb3mRj9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9051310E4B6
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Aug 2026 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785745652; x=1817281652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LSEXk7jnauf5NVTDVWQShdeOEE1SBEg2NzERspZ5jAM=;
 b=Bb3mRj9BVSYvDGfsIDVdrYeP9m7Xu1FALBVc12Lx+B1DsMZWsve+fF74
 eQ5osAq6k6+0ciV8SSvHhcMATmSUaQlFgwF0m1wliAdumcwckuIBiFXda
 7CcctKLQj/b3N2+VBDjbQZTxppTh/jM1W4CEWns9bvO/vTPEGc1Rv8zYS
 hjusaWj1vjZqofTpAwc+b4cFBnG6Jg3XI4f2tNM9/bydS1EBpHFVt48k5
 5wOR0ee+OjCoD+bpErDrs6kWuxpa2ukvH2J+9WTD37YoaKeKzLtxrF9Ji
 C1I+O5shUh3f16SyicXX/sSA54uct5B+kgh4tbgUyX47kEz2T3D6N30MW g==;
X-CSE-ConnectionGUID: N75INeFFRY2ZIsV9FahgBg==
X-CSE-MsgGUID: fzMbaJHnQ4iIp6Hj/lA72Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86136686"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86136686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:27:31 -0700
X-CSE-ConnectionGUID: YzFpqYSXQeCmQ6DTNPQWEQ==
X-CSE-MsgGUID: KKZQIFJZSJqbr4ET3dTSqA==
X-ExtLoop1: 1
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa003.fm.intel.com with ESMTP; 03 Aug 2026 01:27:29 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [i-g-t] tests/kms_colorop: Use local variable for color pipeline cap
Date: Mon,  3 Aug 2026 13:33:40 +0530
Message-ID: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

Following the pattern in kms_color_pipeline, set
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
local variable, then propagate it to display->has_plane_color_pipeline
after the final igt_display_require() (which reinitializes the display
state). This avoids calling drmSetClientCap() twice.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_colorop.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 16db0b8ad..d573d2ceb 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 	igt_display_t display;
 	int i, j, ret;
+	int has_plane_color_pipeline = 0;
 
 	igt_fixture() {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
-		igt_display_require(&display, display.drm_fd);
 		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			display.has_plane_color_pipeline = 1;
+			has_plane_color_pipeline = 1;
+
+		igt_display_require(&display, display.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, display.drm_fd);
-		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			display.has_plane_color_pipeline = 1;
+		display.has_plane_color_pipeline = has_plane_color_pipeline;
 
 		igt_require(display.is_atomic);
 	}
-- 
2.50.1

