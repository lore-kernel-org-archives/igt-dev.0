Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6EAC61DFD
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 08:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55FF410F04E;
	Wed,  2 Sep 2026 08:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NR0IkgMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FD610F062
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 08:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788336007; x=1819872007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RYvn3kWJ88S9lMXl1kVo/Xwc64lncGRQ71hPU3/kPz0=;
 b=NR0IkgMsJenRhVPvMh/zxcrJzAHoKXVZpTFST5qKN+s0pnL/cL6llEmb
 g+ziDkDjxBRqt71ud3LWpcd0QrA528z23SIx58hsc/FwCafRzfPri2ziE
 qaY8AIcKkDKfDlwJ3VIzX2G7kRPKv/xL6XVpVzfIu8rcdUW8PdH08AEsC
 YkFYnDpyOxmEJNZXAyHdAurvm/XipWJjAyAvj+TlIqpWOWZxTYmjBmnT7
 ESNXzvMKyJR+PftkH7mOeXk/zNYFHi2OqK1+OxTZCY7fE6BVn17LUl429
 3FNGzuDB6ta9FI0GsVqfD31J+zPGgyFQnPE/fr6m+oJSa+Dq2/7CauWTC A==;
X-CSE-ConnectionGUID: D+4oauGHTa6oxDKk733G8g==
X-CSE-MsgGUID: dvyy5MBZQfWHOPzgZ1MQeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88908509"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="88908509"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 01:00:06 -0700
X-CSE-ConnectionGUID: Ad7sCWIiT/uc6Vq7adagNA==
X-CSE-MsgGUID: 5SC28KAXStOuMYzkmOVE5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; d="scan'208";a="263190165"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa009.fm.intel.com with ESMTP; 02 Sep 2026 01:00:04 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/kms_colorop: Get color pipeline cap only once
Date: Wed,  2 Sep 2026 13:06:29 +0530
Message-ID: <20260902073629.655688-1-chaitanya.kumar.borah@intel.com>
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
after igt_display_require() (which reinitializes the display
state). This avoids calling drmSetClientCap() twice.

While at it, remove the duplicate call to igt_display_require()

v2:
 - Remove duplicate call to igt_display_require (Swati)(Alex)
 - Improve commit message (Kamil)

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_colorop.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 732b9d57f..b1ec4aaaa 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -517,6 +517,7 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 	igt_display_t display;
 	int i, j, ret;
+	int has_plane_color_pipeline = 0;
 
 	igt_fixture() {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -528,15 +529,13 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
 
 		igt_require_f(!ret, "error setting DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
 
-		igt_display_require(&display, display.drm_fd);
 		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			display.has_plane_color_pipeline = 1;
+			has_plane_color_pipeline = 1;
 
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&display, display.drm_fd);
-		if (drmSetClientCap(display.drm_fd, DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-			display.has_plane_color_pipeline = 1;
+		display.has_plane_color_pipeline = has_plane_color_pipeline;
 
 		igt_require(display.is_atomic);
 	}
-- 
2.50.1

