Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402C5C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 10:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF1610E169;
	Mon, 10 Feb 2025 10:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmlTgwVI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8588710E169
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 10:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739182854; x=1770718854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=h01eqapN8O0HVp4x+qWkFxfl+Hw/SclBBDB3v6EgbBc=;
 b=ZmlTgwVI2ZtSxl8zTzKP3Yyjr+nv1kEDxpm0vBCg0tXg8/Hg0k6yCgPE
 BKrF2zjNCbWnv0dMNdxkqLnZ2OR0VtIhadPZ7VDj41QgHxZf6iki8Eho5
 yXvpPxMDwBt8MSwLZUiPONXgeJN4811Nw053UKosNwtRhe/FlbCu22lnv
 N0sFfD0JK6+t2Kc/m4uxlDl+hmoC5On4Mpi0O9KTSVmiPN8BrJTRVO4d0
 ls7S/xElrCcHwLr/4KsYjwiMEl7Zx9DIVL/rGnRcNrzxGhMXFjNuXZDIY
 uo4HLNyYSywkTJefVmpC4XCieKjWYaesWBh0W7X19bO1XsOoISth3I2UR A==;
X-CSE-ConnectionGUID: ISCmnWdpRNaxoSCSRmNvGw==
X-CSE-MsgGUID: 0FnrtTuOQwmimytR691IuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="40025853"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="40025853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 02:20:53 -0800
X-CSE-ConnectionGUID: ymmv0o7pR1efo9+Vk63CFQ==
X-CSE-MsgGUID: 8N9VIZIzT8qVcvoZYv9HhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111988471"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:20:51 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Ensure eDP detection before
 skipping test
Date: Mon, 10 Feb 2025 16:06:19 +0530
Message-Id: <20250210103619.1235820-1-jeevan.b@intel.com>
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

Ensure all outputs are checked before skipping the test, preventing
premature exits when an eDP is available later.

v2: Optimized eDP detection by merging loops.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 9551cc6b9..bbb29d7d9 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -640,30 +640,38 @@ static void test_deep_pkgc_state(data_t *data)
 	time_t delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
-	bool flip = true;
+	bool flip = true, edp_found = false;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
 	igt_output_t *output = NULL;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
-		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
-			igt_skip("No eDP output found, skipping the test.\n");
-		/* Check VRR capabilities before setting up */
-		if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
-		    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
-			/*
-			 * TODO: Add check for vmin = vmax = flipline if VRR enabled
-			 * when KMD allows for such capability.
-			 */
-			igt_pipe_set_prop_value(display, pipe,
-						IGT_CRTC_VRR_ENABLED, false);
-			igt_assert(igt_display_try_commit_atomic(display,
-								 DRM_MODE_ATOMIC_ALLOW_MODESET,
-								 NULL) == 0);
-			break;
+		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+
+			edp_found = true;
+			/* Check VRR capabilities before setting up */
+			if (igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+			    igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE)) {
+				/*
+				 * TODO: Add check for vmin = vmax = flipline if VRR enabled
+				 * when KMD allows for such capability.
+				 */
+				igt_pipe_set_prop_value(display, pipe,
+							IGT_CRTC_VRR_ENABLED, false);
+				igt_assert(igt_display_try_commit_atomic(display,
+									 DRM_MODE_ATOMIC_ALLOW_MODESET,
+									 NULL) == 0);
+			}
+		break;
 		}
 	}
+
+	if (!edp_found) {
+		igt_skip("No eDP output found, skipping the test.\n");
+		return;
+	}
+
 	igt_display_reset(display);
 
 	igt_output_set_pipe(output, pipe);
-- 
2.25.1

